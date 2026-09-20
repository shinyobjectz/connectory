"""Build the provider directory from Nango's providers.yaml.

Nango (NangoHQ/nango, packages/providers/providers.yaml) maintains the half of an integration
that no API description contains: where the API lives, what signs a request, where that
credential goes, and which per-tenant values (a subdomain, a region) the URL needs. It is a
thousand providers kept current by people who run them in production.

What it does not contain is operations. Not one path, not one parameter. So this writes the
directory only — who exists, and how a request to them is signed — and `specs.py` resolves the
operations separately from each vendor's own OpenAPI. A provider with no spec is still listed,
still mentionable, and says plainly that it has no operations indexed.

    just update directory

Nothing here is a credential. The directory records the NAME of an environment variable; the
value lives in your environment and nowhere else.
"""

import json
import os
import re
import sys
import urllib.request

SOURCE = "https://raw.githubusercontent.com/NangoHQ/nango/master/packages/providers/providers.yaml"
HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "..", "directory.json")

TPL = re.compile(r"\$\{([^}]+)\}")

# Variants of one product. We want @slack, not @slack-basic and @slack-api-key.
#
# Only credential variants collapse. `notion-scim` and `1password-events` are different APIs
# that happen to share a vendor — they keep their own entries, because the operations behind
# them are not the same operations.
VARIANT = re.compile(
    r"-(pat|oauth2?|oauth2-cc|basic|api-key|apikey|key|token|jwt|dev|sandbox|staging"
    r"|legacy|beta|cc|client-credentials|service-account)$"
)

# "Zendesk (API Token)" names a credential, not a product. The entry is the product now.
DECORATION = re.compile(r"\s*[\(\[][^)\]]*[\)\]]\s*$")

# Which authentication we can actually run with. A workbook signs requests with a token from the
# environment, so a static credential is the whole story; an OAuth token is fine too, it is just
# obtained elsewhere and pasted in. The rest need a handshake we do not do yet.
RUNS = {
    "API_KEY": "key",  # a key the vendor gives you
    "BASIC": "basic",  # a username and password pair
    "OAUTH2": "oauth",  # an access token you bring
    "OAUTH2_CC": "oauth",  # machine-to-machine; a client id and secret, exchanged for a token
    "MCP_OAUTH2": "oauth",
    "None": "open",  # no authentication at all
    "NONE": "open",
}

# The best variant to represent a product, best first. A static key beats a token that expires.
RANK = ["API_KEY", "BASIC", "OAUTH2_CC", "OAUTH2", "MCP_OAUTH2", "None", "NONE"]


def fetch(url):
    req = urllib.request.Request(url, headers={"user-agent": "workbooks-catalog"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read()


def load():
    try:
        import yaml
    except ImportError:
        sys.exit("this needs PyYAML: pip install pyyaml")
    return yaml.safe_load(fetch(SOURCE))


def product(slug):
    """slug without its auth-variant suffix: airtable-pat -> airtable."""
    while True:
        shorter = VARIANT.sub("", slug)
        if shorter == slug or not shorter:
            return slug
        slug = shorter


def env_name(slug, suffix):
    return re.sub(r"[^A-Z0-9]+", "_", slug.upper()) + "_" + suffix


def base_url(raw, slug, config):
    """Nango templates a base URL with per-tenant values, and sometimes offers a fallback:

        https://api.${connectionConfig.region}.intercom.io || https://api.intercom.io

    A fallback means the value is optional, so we take the plain URL. Otherwise the value
    becomes an environment variable the export reads, like ZENDESK_SUBDOMAIN.
    """
    if not raw:
        return None, []
    if "||" in raw:
        left, right = [s.strip() for s in raw.split("||", 1)]
        raw = right if "${" not in right else left
    holes = []
    for name in TPL.findall(raw):
        key = name.split(".")[-1]
        spec = (config or {}).get(key) or {}
        holes.append(
            {
                "name": key,
                "env": env_name(slug, re.sub(r"[^A-Z0-9]+", "_", key.upper())),
                "title": spec.get("title") or key,
                "about": spec.get("description") or "",
                "example": str(spec.get("example") or ""),
            }
        )
    url = TPL.sub(lambda m: "{" + m.group(1).split(".")[-1] + "}", raw)

    # Self-hosted and per-tenant APIs — Salesforce, n8n, Meilisearch — have no fixed address
    # at all: the whole origin is the value. Say so, or the variable looks like a subdomain.
    if not url.startswith("http") and holes and url.startswith("{"):
        holes[0]["origin"] = True
        holes[0]["about"] = (holes[0]["about"] or "").strip() or "Where your instance lives."
        holes[0]["about"] += " The full address, scheme and all — https://example.com."

    return url.rstrip("/"), holes


def auth(slug, p):
    """Where the credential goes, as a template rather than a scheme name.

    Nango places API keys twelve different ways — `Bearer ${apiKey}`, a bare `${apiKey}`,
    `Token token=${apiKey}`, `x-api-key`, `private-token`. A scheme enum would lose most of
    them, so we keep the header name and the format, and substitute the token at call time.
    """
    mode = p.get("auth_mode")
    kind = RUNS.get(mode)
    creds = p.get("credentials") or {}
    proxy = p.get("proxy") or {}

    if kind == "basic":
        user = creds.get("username") or {}
        pw = creds.get("password") or {}
        return {
            "kind": "basic",
            "mode": mode,
            "user_env": env_name(slug, "USER"),
            "pass_env": env_name(slug, "PASS"),
            "about": " ".join(
                x for x in [user.get("title"), "and", pw.get("title")] if x
            ).strip(),
        }

    header, fmt = None, None
    for k, v in (proxy.get("headers") or {}).items():
        if "${" in str(v) and "apiKey" in str(v):
            header = k.lower()
            fmt = TPL.sub("{token}", str(v))
            break

    if kind == "key" and not header:
        # A few place the key in the query string instead.
        params = proxy.get("params") or {}
        for k, v in params.items():
            if "${" in str(v):
                return {
                    "kind": "query",
                    "mode": mode,
                    "param": k,
                    "env": env_name(slug, "API_KEY"),
                    "about": (creds.get("apiKey") or {}).get("description") or "",
                }

    key = creds.get("apiKey") or {}
    out = {
        "kind": kind or "manual",
        "mode": mode,
        "header": header or "authorization",
        "format": fmt or "Bearer {token}",
        "env": env_name(slug, "API_KEY" if kind == "key" else "TOKEN"),
        "about": key.get("description") or "",
        "title": key.get("title") or "",
    }
    if key.get("pattern"):
        out["pattern"] = key["pattern"]
    if kind == "oauth" and not key.get("description"):
        out["about"] = "An OAuth access token for the account. The vendor issues no static key, so it is refreshed outside the workbook."
    if kind is None:
        out["about"] = (
            "This provider authenticates with a handshake a workbook does not do yet (%s)."
            % mode
        )
    return out


def static_headers(p):
    """Headers that are not the credential — API versions, content types."""
    out = {}
    for k, v in ((p.get("proxy") or {}).get("headers") or {}).items():
        if "${" not in str(v) and k.lower() not in ("authorization", "content-type", "accept"):
            out[k] = v
    return out


def verification(p):
    """A cheap read Nango uses to test a credential. Worth having: it answers 'is this token
    good?' without the dashboard guessing at an operation."""
    v = (p.get("proxy") or {}).get("verification") or {}
    endpoints = v.get("endpoints") or ([v["endpoint"]] if v.get("endpoint") else [])
    if not endpoints:
        return None
    return {"method": v.get("method", "GET"), "path": TPL.sub(lambda m: "{" + m.group(1).split(".")[-1] + "}", str(endpoints[0]))}


def icon(slug, name):
    """A Simple Icons slug. The dashboard falls back to a lettered tile when there is none,
    so a wrong guess costs a tile, not a broken image."""
    return re.sub(r"[^a-z0-9]", "", (name or slug).lower())


def build():
    raw = load()
    groups = {}
    for slug, p in raw.items():
        if not isinstance(p, dict):
            continue
        groups.setdefault(product(slug), []).append((slug, p))

    providers = []
    for key, variants in sorted(groups.items()):
        def order(item):
            # The variant whose slug IS the product is the vendor's main API; take it first.
            # Only when there is none do we rank by credential, preferring a static key over
            # a token that expires.
            mode = item[1].get("auth_mode")
            return (
                0 if item[0] == key else 1,
                RANK.index(mode) if mode in RANK else len(RANK),
                len(item[0]),
            )

        slug, p = sorted(variants, key=order)[0]
        url, holes = base_url((p.get("proxy") or {}).get("base_url"), key, p.get("connection_config"))
        if not url:
            continue  # no base URL is no API we can call

        a = auth(key, p)
        name = DECORATION.sub("", p.get("display_name") or key).strip() or key
        entry = {
            "slug": key,
            "name": name,
            "icon": icon(key, name),
            "categories": p.get("categories") or [],
            "docs": p.get("docs") or "",
            "base": url,
            "auth": a,
            "source": {"registry": "nango", "provider": slug},
        }
        if holes:
            entry["config"] = holes
        h = static_headers(p)
        if h:
            entry["headers"] = h
        v = verification(p)
        if v:
            entry["verify"] = v
        providers.append(entry)

    return providers


def main():
    providers = build()
    runnable = [p for p in providers if p["auth"]["kind"] != "manual"]
    doc = {
        "_": [
            "GENERATED — do not edit. `just update directory` rebuilds it.",
            "",
            "Who exists and how a request to them is signed, from NangoHQ/nango's providers.yaml.",
            "Operations are not here: an API description supplies those, and specs.json records",
            "which description belongs to whom. A provider with no spec is still listed.",
            "",
            "auth.env and auth.*_env are the NAMES of environment variables. No value in this",
            "file is a credential, and none ever should be.",
        ],
        "source": SOURCE,
        "count": len(providers),
        "providers": providers,
    }
    with open(OUT, "w") as f:
        json.dump(doc, f, indent=1, sort_keys=False)
        f.write("\n")

    kinds = {}
    for p in providers:
        kinds[p["auth"]["kind"]] = kinds.get(p["auth"]["kind"], 0) + 1
    print("%d providers  (%d runnable with a token from the environment)" % (len(providers), len(runnable)))
    print("  " + "  ".join("%s %d" % kv for kv in sorted(kinds.items(), key=lambda kv: -kv[1])))
    print("  %d need a per-tenant value (a subdomain, a region)" % sum(1 for p in providers if p.get("config")))
    print("  %d carry a verification endpoint" % sum(1 for p in providers if p.get("verify")))
    print("→ %s" % os.path.relpath(OUT, os.getcwd()))


if __name__ == "__main__":
    main()
