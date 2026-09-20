"""Turn an API's own description into something a program can call.

This is the part that reads OpenAPI 2, OpenAPI 3 and Google discovery documents and produces,
for each provider, two files that are deliberately not the same file:

    providers/<slug>/<slug>.lua   what it takes to MAKE a call — method, URL, where each
                                  argument goes. Plain Lua data, loaded in milliseconds.
    providers/<slug>/index.json   what it takes to FIND a call — names, descriptions, argument
                                  types and which are required.

The second is four times the size of the first and only an authoring tool needs it, so a
program that already knows which operation it wants carries none of it.

Everything here is mechanical. Nothing is invented: if a description does not say an argument
exists, it does not exist, because a guessed parameter produces a call that fails at the vendor
or, worse, succeeds and does something else.

    python3 tools/build.py            every provider with a description
    python3 tools/build.py slack …    only these
"""

import json
import os
import re
import sys
import urllib.parse
import urllib.request

from common import directory

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(ROOT, "providers")
CACHE = os.path.join(ROOT, ".cache", "specs")

# The credential is the environment's business. A model must never be handed a field called
# "token" to fill in, so anything named like one is stripped from the arguments entirely.
AUTH_NAMES = {"token", "access_token", "api_key", "apikey", "key", "secret", "authorization", "auth", "bearer"}

METHODS = ("get", "post", "put", "patch", "delete")


# Reading a description ------------------------------------------------------------------


def fetch(url):
    os.makedirs(CACHE, exist_ok=True)
    cached = os.path.join(CACHE, re.sub(r"[^A-Za-z0-9]+", "_", url)[-180:])
    if os.path.exists(cached):
        return open(cached, "rb").read()
    req = urllib.request.Request(url, headers={"user-agent": "connectory", "accept": "application/json, application/yaml, */*"})
    with urllib.request.urlopen(req, timeout=300) as r:
        body = r.read()
    with open(cached, "wb") as f:
        f.write(body)
    return body


def parse(body, url):
    text = body.decode("utf8", "ignore")
    if not url.endswith((".yaml", ".yml")):
        try:
            return json.loads(text)
        except ValueError:
            pass
    import yaml

    return yaml.safe_load(text)


def resolve(node, spec, depth=0):
    """Follow a $ref one level, and flatten a one-armed allOf.

    One level is enough to see an argument's shape without walking a thirteen-megabyte graph,
    and parameters are very often refs of their own — GitHub keeps `owner` and `repo` that way,
    so a reader that skips them loses the arguments that matter most.
    """
    if not isinstance(node, dict) or depth > 3:
        return node if isinstance(node, dict) else {}
    if "$ref" in node:
        ref = node["$ref"]
        if not ref.startswith("#/"):
            return {}
        target = spec
        for part in ref[2:].split("/"):
            part = part.replace("~1", "/").replace("~0", "~")
            if not isinstance(target, dict) or part not in target:
                return {}
            target = target[part]
        return resolve(target, spec, depth + 1)
    if "allOf" in node and isinstance(node["allOf"], list) and node["allOf"]:
        merged = dict(resolve(node["allOf"][0], spec, depth + 1))
        merged.update({k: v for k, v in node.items() if k != "allOf"})
        return merged
    return node


def clean(text):
    text = re.sub(r"<[^>]+>", "", str(text or ""))
    return re.sub(r"\s+", " ", text).strip()[:400]


def title(s):
    s = re.sub(r"[._/-]+", " ", str(s or ""))
    s = re.sub(r"([a-z0-9])([A-Z])", r"\1 \2", s)
    return s.strip().capitalize()


def is_auth(name):
    return str(name).lower() in AUTH_NAMES


# OpenAPI 2 and 3 ------------------------------------------------------------------------


def base_of(spec, provider):
    """Where the calls actually go — which neither source knows on its own.

    The directory knows the host, including the ones that are per-tenant
    (`https://{subdomain}.zendesk.com`). The description knows the path the API is mounted
    at, which is usually a version: Discord's directory entry says `https://discord.com` and
    its own OpenAPI says `https://discord.com/api/v10`. Taking either alone builds URLs that
    404 at the vendor, so take the host from one and the prefix from the other.
    """
    declared = ""
    servers = spec.get("servers")
    if isinstance(servers, list) and servers and isinstance(servers[0], dict):
        declared = str(servers[0].get("url", "")).rstrip("/")
    elif spec.get("host"):
        declared = "https://" + spec["host"] + (spec.get("basePath") or "")

    base = (provider.get("base") or "").rstrip("/")
    if not base:
        return declared
    if not declared:
        return base

    prefix = urllib.parse.urlparse(declared).path.rstrip("/")
    host = urllib.parse.urlparse(declared).netloc
    templated = "{" in base

    # A per-tenant address stays; only the prefix is borrowed.
    if templated:
        return base + prefix
    # Same host: the description is the more complete of the two.
    if host and host == urllib.parse.urlparse(base).netloc:
        return declared
    # Different hosts — the directory is right about where this account lives, and the
    # description is still right about the prefix.
    return base + prefix


def op_slug(provider_slug, op, method, path):
    given = op.get("operationId")
    if isinstance(given, str) and given:
        name = re.sub(r"[^A-Za-z0-9]+", "_", given)
        # camelCase to snake_case, the way a person would have written it.
        name = re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", name).lower().strip("_")
        return provider_slug + "." + name
    tail = re.sub(r"[^A-Za-z0-9]+", "_", path.replace("{", "").replace("}", "")).strip("_")
    return "%s.%s_%s" % (provider_slug, method, tail)


def request_body(op, spec):
    content = (op.get("requestBody") or {}).get("content") or {}
    schema = None
    for kind in ("application/json", "application/x-www-form-urlencoded", "multipart/form-data"):
        if isinstance(content.get(kind), dict) and content[kind].get("schema"):
            schema = content[kind]["schema"]
            break
    if schema is None:
        for q in op.get("parameters") or []:
            if isinstance(q, dict) and q.get("in") == "body":
                schema = q.get("schema")
                break
    return resolve(schema, spec) if schema else None


def merge_form(body, params, spec):
    """Swagger 2 has no requestBody: its form parameters ARE the body."""
    form = {}
    required = []
    for q in params:
        if q.get("in") != "body" or not q.get("name"):
            continue
        s = resolve(q.get("schema") or q, spec) or {}
        field = dict(s)
        field["description"] = q.get("description") or s.get("description")
        form[q["name"]] = field
        if q.get("required") is True:
            required.append(q["name"])
    if not form:
        return body
    if body is None:
        return {"type": "object", "properties": form, "required": required}
    merged = dict(body)
    props = dict(merged.get("properties") or {})
    props.update(form)
    merged["properties"] = props
    return merged


def from_openapi(spec, provider):
    base = base_of(spec, provider)
    out = []
    for path, item in (spec.get("paths") or {}).items():
        if not isinstance(item, dict):
            continue
        shared = [p for p in (item.get("parameters") or []) if isinstance(p, dict)]
        for method in METHODS:
            op = item.get(method)
            if not isinstance(op, dict) or op.get("deprecated") is True:
                continue

            params = []
            for q in shared + [p for p in (op.get("parameters") or []) if isinstance(p, dict)]:
                q = resolve(q, spec)
                if not isinstance(q, dict) or not q.get("name"):
                    continue
                if q.get("in") == "formData":
                    q = dict(q, **{"in": "body"})
                if is_auth(q["name"]):
                    continue
                params.append(q)

            body = merge_form(request_body(op, spec), params, spec)
            slug = op_slug(provider["slug"], op, method, path)

            properties, required = {}, []
            for q in params:
                if q.get("in") not in ("path", "query", "header"):
                    continue
                s = resolve(q.get("schema") or q, spec) or {}
                properties[q["name"]] = field(s, q.get("description") or s.get("description"))
                if q.get("required") is True:
                    required.append(q["name"])
            for name, s in ((body or {}).get("properties") or {}).items():
                if is_auth(name):
                    continue
                s = resolve(s, spec) or {}
                properties[name] = field(s, s.get("description"))
            for name in (body or {}).get("required") or []:
                if isinstance(name, str) and not is_auth(name):
                    required.append(name)

            said = clean(op.get("description") or op.get("summary") or "")
            entry = {
                "slug": slug,
                "name": title(op.get("summary") or op.get("operationId") or slug),
                "description": said or gloss(method.upper(), path),
                "input": {"type": "object", "properties": properties, "required": sorted(set(required))},
                "request": {
                    "method": method.upper(),
                    "url": base + path,
                    "path": [q["name"] for q in params if q.get("in") == "path"],
                    "query": [q["name"] for q in params if q.get("in") == "query"],
                    "header": [q["name"] for q in params if q.get("in") == "header"],
                    "body": [n for n in ((body or {}).get("properties") or {}) if not is_auth(n)],
                    "body_format": provider.get("body") or "json",
                },
            }
            # Whose words these are stays visible.
            if not said and entry["description"]:
                entry["described"] = "derived"
            out.append(entry)
    return out


# A plural resource named by the last part of a path that is not a placeholder.
def resource_of(path):
    parts = [p for p in path.split("/") if p and not p.startswith("{")]
    if not parts:
        return ""
    word = re.sub(r"\.(json|xml)$", "", parts[-1])
    word = re.sub(r"^v\d+(\.\d+)?$", "", word, flags=re.I)
    if not word:
        word = parts[-2] if len(parts) > 1 else ""
    # ActionTypes -> action types, action_types -> action types
    word = re.sub(r"([a-z0-9])([A-Z])", r"\1 \2", word).replace("_", " ").replace("-", " ")
    return word.strip().lower()


def gloss(method, path):
    """A sentence for an operation whose description the vendor left empty.

    Thousands of operations arrive with a method, a path and nothing else — Autotask alone
    ships three thousand — which leaves them unfindable: a ranker matching words has no words
    to match. So we say what the request plainly is.

    This describes the shape of the call, never its meaning. It is derived from the path the
    vendor published, and it is marked `derived` so it is never mistaken for their words.
    """
    resource = resource_of(path)
    if not resource:
        return ""
    one = bool(re.search(r"\{[^}]+\}/?$", path))
    singular = re.sub(r"ies$", "y", resource) if resource.endswith("ies") else re.sub(r"s$", "", resource)

    if method == "GET":
        return ("Fetches one %s." % singular) if one else ("Lists %s." % resource)
    article = "an " if singular[:1] in "aeiou" else "a "
    if method == "POST":
        return "Creates %s." % (singular if one else article + singular)
    if method in ("PUT", "PATCH"):
        return "Updates %s." % (("this " + singular) if one else article + singular)
    if method == "DELETE":
        return "Deletes %s." % (("this " + singular) if one else article + singular)
    return ""


def field(schema, description):
    out = {"type": schema.get("type") or "string", "description": clean(description or "")}
    if isinstance(schema.get("enum"), list):
        out["enum"] = schema["enum"][:12]
    return out


# Google discovery -----------------------------------------------------------------------


def from_discovery(spec, provider):
    base = (spec.get("rootUrl") or provider.get("base") or "").rstrip("/")
    service = (spec.get("servicePath") or "").strip("/")
    if service:
        base = base + "/" + service
    return walk(spec.get("resources") or {}, spec, provider, base.rstrip("/"))


def walk(resources, spec, provider, base):
    out = []
    for _, resource in resources.items():
        if not isinstance(resource, dict):
            continue
        for _, op in (resource.get("methods") or {}).items():
            params = op.get("parameters") or {}
            body = op.get("request") or {}
            if body.get("$ref"):
                body = (spec.get("schemas") or {}).get(body["$ref"]) or {}

            properties = {}
            for name, q in params.items():
                properties[name] = field(q, q.get("description"))
            for name, s in (body.get("properties") or {}).items():
                properties[name] = field(s, s.get("description"))

            short = re.sub(r"^[^.]+\.", "", op.get("id", ""))
            out.append({
                "slug": provider["slug"] + "." + short,
                "name": title(short),
                "description": clean(op.get("description") or ""),
                "input": {
                    "type": "object",
                    "properties": properties,
                    "required": sorted(n for n, q in params.items() if q.get("required") is True),
                },
                "request": {
                    "method": op.get("httpMethod", "GET"),
                    "url": base + "/" + str(op.get("path", "")).lstrip("/"),
                    "path": [n for n, q in params.items() if q.get("location") == "path"],
                    "query": [n for n, q in params.items() if q.get("location") == "query"],
                    "header": [],
                    "body": list((body.get("properties") or {}).keys()),
                    "body_format": "json",
                },
            })
        out += walk(resource.get("resources") or {}, spec, provider, base)
    return out


# Writing Lua ----------------------------------------------------------------------------


def lua_string(s):
    out = []
    for ch in str(s):
        if ch == "\\":
            out.append("\\\\")
        elif ch == '"':
            out.append('\\"')
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ord(ch) < 32 or ord(ch) == 127:
            out.append("\\%03d" % ord(ch))
        else:
            out.append(ch)
    return '"' + "".join(out) + '"'


def lua_list(name, values):
    # An absent list is absent, not an empty table: a thousand `{}` is a thousand allocations
    # at load time, for nothing.
    if not values:
        return ""
    return ", %s = {%s}" % (name, ", ".join(lua_string(v) for v in values))


def lua_map(pairs):
    if not pairs:
        return "{}"
    return "{ " + ", ".join("[%s] = %s" % (lua_string(k), lua_string(v)) for k, v in pairs.items()) + " }"


def pack(provider, ops, spec_ref):
    a = provider.get("auth") or {}
    lines = [
        "-- %s — every call this API accepts, as data." % provider["name"],
        "--",
        "-- GENERATED from %s" % spec_ref.get("url", "a description"),
        "-- %s" % (spec_ref.get("about") or ""),
        "-- %d operations · do not edit" % len(ops),
        "--",
        "-- The credential is never in here. `auth.env` names an environment variable; the value",
        "-- stays in the environment, which is what makes this file safe to publish.",
        "return {",
        "  provider = %s," % lua_string(provider["slug"]),
        "  name = %s," % lua_string(provider["name"]),
        "  base = %s," % lua_string(provider["base"]),
        "  docs = %s," % lua_string(provider.get("docs") or ""),
        "  auth = {",
        "    kind = %s," % lua_string(a.get("kind") or "key"),
        "    header = %s," % lua_string(a.get("header") or "authorization"),
        "    format = %s," % lua_string(a.get("format") or "Bearer {token}"),
        "    env = %s," % (lua_string(a["env"]) if a.get("env") else "nil"),
        "    user_env = %s," % (lua_string(a["user_env"]) if a.get("user_env") else "nil"),
        "    pass_env = %s," % (lua_string(a["pass_env"]) if a.get("pass_env") else "nil"),
        "    param = %s," % (lua_string(a["param"]) if a.get("param") else "nil"),
        "  },",
        "  config = %s," % lua_map({c["name"]: c["env"] for c in provider.get("config") or []}),
        "  headers = %s," % lua_map({k.lower(): v for k, v in (provider.get("headers") or {}).items()}),
        "  operations = {",
    ]
    for op in sorted(ops, key=lambda o: o["slug"]):
        r = op["request"]
        row = "    [%s] = { method = %s, url = %s" % (lua_string(op["slug"]), lua_string(r["method"]), lua_string(r["url"]))
        row += lua_list("path", r["path"])
        row += lua_list("query", r["query"])
        row += lua_list("header", r["header"])
        row += lua_list("body", r["body"])
        if r.get("body_format") and r["body_format"] != "json":
            row += ", body_format = %s" % lua_string(r["body_format"])
        lines.append(row + " },")
    lines += ["  },", "}", ""]
    return "\n".join(lines)


# ----------------------------------------------------------------------------------------




def specs():
    path = os.path.join(ROOT, "specs.json")
    if not os.path.exists(path):
        return {}
    return json.load(open(path))["specs"]


def build(slug, provider, spec_ref):
    body = fetch(spec_ref["url"])
    spec = parse(body, spec_ref["url"])
    if spec_ref.get("kind") == "google-discovery":
        ops = from_discovery(spec, provider)
    else:
        ops = from_openapi(spec, provider)

    folder = os.path.join(OUT, slug)
    os.makedirs(folder, exist_ok=True)

    with open(os.path.join(folder, "%s.lua" % slug), "w") as f:
        f.write(pack(provider, ops, spec_ref))

    with open(os.path.join(folder, "index.json"), "w") as f:
        json.dump(
            {
                "_": "GENERATED — what an authoring tool needs to FIND an operation. The calling table is the .lua beside it.",
                "provider": slug,
                "source": spec_ref["url"],
                # `request` is here as well as in the .lua: this file is what tools read, and
                # comparing two of them is how we tell an API change from a reformatting.
                "operations": sorted(ops, key=lambda o: o["slug"]),
            },
            f,
            indent=1,
            # YAML turns an unquoted 2024-01-01 in a vendor's example into a date object.
            default=str,
        )
        f.write("\n")

    return ops


def owners(s):
    """One pack per description, not one per credential.

    A registry lists `microsoft`, `microsoft-admin`, `microsoft-ads` and two more because they
    authenticate differently — but they are all Microsoft Graph, and writing the same seventeen
    megabytes five times is eighty-three megabytes of nothing. So the shortest slug owns the
    pack and the rest record where their operations live. The credential that made them
    separate entries is in the directory, where it was all along.
    """
    by_url = {}
    for slug, ref in s.items():
        by_url.setdefault(ref["url"], []).append(slug)

    owner_of = {}
    for url, slugs in by_url.items():
        owner = sorted(slugs, key=lambda x: (len(x), x))[0]
        for slug in slugs:
            owner_of[slug] = owner
    return owner_of


def main():
    only = set(sys.argv[1:])
    d = directory()
    s = specs()
    owner_of = owners(s)
    total = 0

    for slug, spec_ref in sorted(s.items()):
        if only and slug not in only:
            continue
        provider = d.get(slug)
        if not provider:
            continue

        owner = owner_of.get(slug, slug)
        if owner != slug:
            folder = os.path.join(OUT, slug)
            os.makedirs(folder, exist_ok=True)
            for stale in ("%s.lua" % slug, "index.json"):
                path = os.path.join(folder, stale)
                if os.path.exists(path):
                    os.remove(path)
            with open(os.path.join(folder, "alias.json"), "w") as f:
                json.dump({
                    "_": "This platform is the same API as another, reached with a different credential.",
                    "provider": slug,
                    "operations_from": owner,
                }, f, indent=1)
                f.write("\n")
            print("%-26s → %s" % (slug, owner))
            continue
        try:
            ops = build(slug, provider, spec_ref)
            total += len(ops)
            print("%-26s %5d operations" % (slug, len(ops)))
        except Exception as e:
            print("%-26s ! %s: %s" % (slug, type(e).__name__, str(e)[:90]))

    print("\n%d operations across %d providers" % (total, len(os.listdir(OUT)) if os.path.exists(OUT) else 0))


if __name__ == "__main__":
    main()
