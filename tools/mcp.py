"""Which of these platforms runs an MCP server, and where.

An API description says what a program can ask a platform to do. An MCP server is the same
platform offering itself to an agent directly — usually a smaller, opinionated surface, often
hosted by the vendor. When one exists it is the better door for an agent, and a workbook should
know it is there rather than rebuilding it out of REST calls.

Two sources, and the same rule as everywhere else: only the vendor's own.

    registry  registry.modelcontextprotocol.io, the official one. Its names are reverse-DNS,
              so `com.stripe/mcp` is Stripe's and `io.github.someone/stripe-mcp` is not, and
              that distinction is the whole reason the namespace exists.
    nango     the registry this directory is built from carries `<provider>-mcp` entries whose
              base URL is the vendor's hosted MCP endpoint.

A server published by someone other than the vendor is ignored. It may be excellent, but a
directory that says "official" has to mean it.

    python3 tools/mcp.py
"""

import json
import os
import re
import urllib.request

from common import directory

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(ROOT, "providers")
REGISTRY = "https://registry.modelcontextprotocol.io/v0/servers"


def registry():
    """Every server the official registry lists, newest version of each."""
    servers, cursor = {}, None
    while True:
        url = REGISTRY + "?limit=100" + ("&cursor=" + urllib.parse.quote(cursor) if cursor else "")
        req = urllib.request.Request(url, headers={"user-agent": "connectory"})
        with urllib.request.urlopen(req, timeout=60) as r:
            page = json.load(r)
        for entry in page.get("servers", []):
            s = entry.get("server") or {}
            meta = (entry.get("_meta") or {}).get("io.modelcontextprotocol.registry/official") or {}
            if meta.get("status") and meta["status"] != "active":
                continue
            if s.get("name"):
                servers[s["name"]] = {**s, "_published": meta.get("publishedAt")}
        cursor = (page.get("metadata") or {}).get("nextCursor")
        if not cursor:
            return servers


def namespaces(base_url):
    """The reverse-DNS names a vendor at this address would publish under.

    api.stripe.com -> com.stripe, and also com.stripe.api for vendors who keep the subdomain.
    """
    host = re.sub(r"\{[^}]*\}\.?", "", (base_url or "").split("//")[-1].split("/")[0]).strip(".")
    if not host:
        return set()
    parts = [p for p in host.split(".") if p]
    out = set()
    for n in (2, 3):
        if len(parts) >= n:
            out.add(".".join(reversed(parts[-n:])))
    # drop a leading api./www. before reversing, which is how most vendors register
    lead = [p for p in parts if p not in ("api", "www", "app")]
    if len(lead) >= 2:
        out.add(".".join(reversed(lead[-2:])))
    return out


def endpoints(server):
    out = []
    for remote in server.get("remotes") or []:
        if remote.get("url"):
            out.append({"transport": remote.get("type", "streamable-http"), "url": remote["url"]})
    for pkg in server.get("packages") or []:
        if pkg.get("identifier"):
            out.append({"transport": "stdio", "registry": pkg.get("registryType"), "package": pkg["identifier"]})
    return out


def main():
    providers = list(directory().values())
    by_slug = {p["slug"]: p for p in providers}

    print("reading the official registry…")
    servers = registry()
    print("  %d active servers" % len(servers))

    # Index the registry by the namespace its name starts with.
    by_namespace = {}
    for name, s in servers.items():
        if name.startswith(("io.github.", "io.gitlab.")):
            continue  # an individual's publication, not the vendor's
        ns = name.split("/")[0]
        by_namespace.setdefault(ns, []).append(s)

    found = {}
    for p in providers:
        hits = []

        for ns in namespaces(p.get("base")):
            for s in by_namespace.get(ns, []):
                hits.append({
                    "source": "registry",
                    "name": s["name"],
                    "title": s.get("title") or s.get("name"),
                    "description": s.get("description"),
                    "endpoints": endpoints(s),
                })

        # The provider registry's own `<slug>-mcp` sibling: a URL the vendor hosts.
        sibling = by_slug.get(p["slug"] + "-mcp")
        if sibling and sibling.get("base"):
            hits.append({
                "source": "nango",
                "name": sibling["slug"],
                "title": sibling.get("name"),
                "description": "Hosted by the vendor; authenticates like the rest of this provider.",
                "endpoints": [{"transport": "streamable-http", "url": sibling["base"]}],
            })

        if not hits:
            continue

        # De-duplicate on the endpoint, since a vendor may appear in both sources.
        seen, unique = set(), []
        for h in hits:
            key = json.dumps(h["endpoints"], sort_keys=True)
            if key not in seen:
                seen.add(key)
                unique.append(h)

        found[p["slug"]] = unique
        folder = os.path.join(OUT, p["slug"])
        os.makedirs(folder, exist_ok=True)
        with open(os.path.join(folder, "mcp.json"), "w") as f:
            json.dump({
                "_": "GENERATED — tools/mcp.py. Only servers published by the vendor themselves.",
                "provider": p["slug"],
                "servers": unique,
            }, f, indent=1)
            f.write("\n")

    print("\n%d providers offer an MCP server of their own" % len(found))
    by_source = {}
    for hits in found.values():
        for h in hits:
            by_source[h["source"]] = by_source.get(h["source"], 0) + 1
    print("  " + ", ".join("%s %d" % kv for kv in sorted(by_source.items(), key=lambda kv: -kv[1])))
    for slug in sorted(found)[:20]:
        print("    %-24s %s" % (slug, found[slug][0]["name"]))


if __name__ == "__main__":
    import urllib.parse  # noqa: E402  (used by registry())

    main()
