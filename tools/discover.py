"""Look for a description on the vendor's own documentation site.

`specs.py` asks two places: the vendor's GitHub organisation, and APIs.guru. Most companies
publish neither, and still have a perfectly good OpenAPI document — it is just sitting behind
their documentation, because that is what generated the documentation.

Modern documentation platforms all leave it fetchable. Mintlify names it in `docs.json`, and
most of the rest serve it at a predictable path on the docs host. So this walks a small number
of candidate hosts, tries a small number of paths, and keeps only what parses as OpenAPI.

Found here, a description is exactly as trustworthy as one found anywhere else: it is the
vendor's own machine-readable account of their own API, fetched from their own domain. It is
recorded as `source: docs` so that where it came from stays visible.

    python3 tools/discover.py            every platform with no description yet
    python3 tools/discover.py slack …    only these
    python3 tools/discover.py --all      every platform, even ones already resolved
"""

import concurrent.futures as cf
import json
import os
import re
import sys
import urllib.error
import urllib.request

from common import ROOT, directory, read

OUT = os.path.join(ROOT, "specs.json")

# Where a company's API documentation lives, in the order it is usually found.
SUBDOMAINS = ("docs", "developer", "developers", "api", "")

# Mintlify and its relatives name their description in a manifest.
MANIFESTS = ("/docs.json", "/mint.json")

# Everyone else serves it at a path like one of these.
PATHS = (
    "/openapi.json",
    "/openapi.yaml",
    "/swagger.json",
    "/api-reference/openapi.json",
    "/api/openapi.json",
    "/spec/openapi.json",
    "/v1/openapi.json",
    "/swagger/v1/swagger.json",
    "/.well-known/openapi.json",
)

MIN_SPEC = 2_000


def get(url, limit=400_000, timeout=12):
    """Status and body. A 404 still means somebody answered — only 0 means nobody is there.

    That distinction decides whether a documentation host is worth searching: plenty of them
    answer 404 at `/` and serve a perfectly good openapi.yaml one path along.
    """
    try:
        req = urllib.request.Request(url, headers={"user-agent": "connectory"})
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.status, r.read(limit)
    except urllib.error.HTTPError as e:
        return e.code, b""
    except Exception:
        return 0, b""


def is_spec(body):
    """Does this parse as an API description, and describe at least one call?"""
    if not body or len(body) < MIN_SPEC:
        return None
    head = body[:6000].decode("utf8", "ignore")
    if re.search(r'"(openapi|swagger)"\s*:\s*"[23]', head):
        kind = "json"
    elif re.search(r'^\s*(openapi|swagger):\s*["\']?[23]', head, re.M):
        kind = "yaml"
    else:
        return None
    # A description with no paths in it describes nothing.
    return kind if (b'"paths"' in body or re.search(rb"^paths:", body, re.M)) else None


def root_of(base):
    host = re.sub(r"\{[^}]*\}\.?", "", (base or "").split("//")[-1].split("/")[0]).strip(".")
    parts = [p for p in host.split(".") if p]
    if len(parts) >= 3 and parts[-2] in ("co", "com", "org", "net", "gov", "ac"):
        return ".".join(parts[-3:])
    return ".".join(parts[-2:]) if len(parts) >= 2 else host


def manifest_spec(host, body):
    """Mintlify's docs.json points at the OpenAPI it renders, in one of several shapes."""
    try:
        doc = json.loads(body)
    except Exception:
        return None

    found = doc.get("openapi")
    candidates = []
    if isinstance(found, str):
        candidates = [found]
    elif isinstance(found, list):
        for item in found:
            if isinstance(item, str):
                candidates.append(item)
            elif isinstance(item, dict) and isinstance(item.get("source"), str):
                candidates.append(item["source"])
    elif isinstance(found, dict) and isinstance(found.get("source"), str):
        candidates = [found["source"]]

    for c in candidates[:3]:
        url = c if c.startswith("http") else host + "/" + c.lstrip("/")
        status, body = get(url)
        if status == 200 and is_spec(body):
            return url
    return None


def discover(provider):
    """A bounded search: a few hosts, a few paths, and stop at the first real description."""
    root = root_of(provider.get("base"))
    if not root or "." not in root:
        return provider["slug"], None

    for sub in SUBDOMAINS:
        host = "https://%s.%s" % (sub, root) if sub else "https://%s" % root

        # Is there anything here at all? One request decides whether to spend more.
        status, _ = get(host + "/", 2_000, timeout=8)
        if status == 0:
            continue

        for m in MANIFESTS:
            status, body = get(host + m, 300_000)
            if status == 200 and body[:1] == b"{":
                url = manifest_spec(host, body)
                if url:
                    return provider["slug"], {"url": url, "via": host + m}

        for path in PATHS:
            status, body = get(host + path)
            if status == 200 and is_spec(body):
                return provider["slug"], {"url": host + path, "via": host}

    return provider["slug"], None


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    everything = "--all" in sys.argv

    d = directory()
    specs = (read("specs.json", {"specs": {}}) or {})["specs"]

    if args:
        todo = [d[s] for s in args if s in d]
    else:
        todo = [p for slug, p in d.items() if everything or slug not in specs]
        todo = [p for p in todo if (p.get("base") or "").startswith("http")]

    print("looking for a description on %d documentation sites\n" % len(todo))

    found, done = {}, [0]

    # Read the header BEFORE anything opens the file for writing: opening truncates, so a
    # read inside the write reads the hole it just made.
    header = (read("specs.json", {}) or {}).get("_", ["GENERATED — tools/specs.py and tools/discover.py."])

    def save():
        specs.update(found)
        tmp = OUT + ".tmp"
        with open(tmp, "w") as f:
            json.dump(
                {
                    "_": header,
                    "count": len(specs),
                    "specs": dict(sorted(specs.items())),
                },
                f,
                indent=1,
            )
            f.write("\n")
        os.replace(tmp, OUT)

    with cf.ThreadPoolExecutor(16) as ex:
        for slug, hit in ex.map(discover, todo):
            done[0] += 1
            if hit:
                found[slug] = {
                    "url": hit["url"],
                    "format": "yaml" if hit["url"].endswith((".yaml", ".yml")) else "json",
                    "source": "docs",
                    "repo": hit["via"],
                    "about": "Published on the vendor's own documentation site (%s)." % hit["via"],
                }
                print("[%4d/%d] %-26s %s" % (done[0], len(todo), slug, hit["url"]), flush=True)
                save()
            elif done[0] % 50 == 0:
                print("[%4d/%d] …" % (done[0], len(todo)), flush=True)

    save()
    print("\n%d of %d documentation sites published a description" % (len(found), len(todo)))


if __name__ == "__main__":
    main()
