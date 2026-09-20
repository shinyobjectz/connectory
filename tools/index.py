"""One file that answers "what is in here?" without opening eight hundred folders.

`index.json` is the directory as a program would search it: every platform, what it is for,
what signs a request, whether we can describe what it does, whether it has a mark, and whether
it offers an MCP server. It is small enough to load whole and keep in memory, which is what a
mention menu or a search box actually needs.

What it deliberately does not contain is operations. Those live per provider, in
`providers/<slug>/index.json`, because all of them together are tens of megabytes and nobody
needs every API's every endpoint at once.

    python3 tools/index.py
"""

import json
import os

from common import directory

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(ROOT, "providers")


def read(path, default=None):
    if not os.path.exists(path):
        return default
    with open(path) as f:
        return json.load(f)


def main():
    providers = list(directory().values())
    specs = read(os.path.join(ROOT, "specs.json"), {"specs": {}})["specs"]
    logos = read(os.path.join(ROOT, "logos.json"), {"logos": {}})["logos"]

    rows, described, with_mcp, with_context = [], 0, 0, 0

    for p in providers:
        slug = p["slug"]
        folder = os.path.join(OUT, slug)
        auth = p.get("auth") or {}

        # A variant points at the pack it shares; it can still be called, through that one.
        alias = read(os.path.join(folder, "alias.json"))
        source = alias["operations_from"] if alias else slug
        ops = read(os.path.join(OUT, source, "index.json"), {"operations": []})["operations"]
        mcp = read(os.path.join(folder, "mcp.json"), {"servers": []})["servers"]
        spec = specs.get(slug)

        if ops:
            described += 1
        if mcp:
            with_mcp += 1
        if os.path.exists(os.path.join(folder, "docs.md")):
            with_context += 1

        rows.append({
            "slug": slug,
            "name": p["name"],
            "categories": p.get("categories") or [],
            "docs": p.get("docs") or "",
            "base": p.get("base"),
            "auth": auth.get("kind"),
            # The NAMES of environment variables. Never a value; there are none in this repo.
            "env": [e for e in [auth.get("env"), auth.get("user_env"), auth.get("pass_env")] if e]
            + [c["env"] for c in p.get("config") or []],
            "spec": spec.get("source") if spec else None,
            "operations": len(ops),
            "operations_from": (alias or {}).get("operations_from"),
            "logo": bool(logos.get(slug)) or os.path.exists(os.path.join(folder, "logo.svg")),
            # Documentation kept for a platform nobody describes. Context to read, never a
            # source of endpoints.
            "context": os.path.exists(os.path.join(folder, "docs.md")),
            "mcp": len(mcp),
            "verify": p.get("verify"),
        })

    doc = {
        "_": [
            "GENERATED — tools/index.py rebuilds it.",
            "",
            "Every platform in the directory, as a program would search it. Operations are not",
            "here: they are in providers/<slug>/index.json, which is where they stay.",
            "",
            "`env` lists the NAMES of environment variables. This repository contains no",
            "credentials, and a pull request that adds one should be closed.",
        ],
        "providers": len(rows),
        "described": described,
        "with_mcp": with_mcp,
        "with_context": with_context,
        "index": rows,
    }

    with open(os.path.join(ROOT, "index.json"), "w") as f:
        json.dump(doc, f, indent=1)
        f.write("\n")

    ops_total = sum(r["operations"] for r in rows)
    logos_total = sum(1 for r in rows if r["logo"])
    print("%d platforms" % len(rows))
    print("  %d with operations indexed (%d operations)" % (described, ops_total))
    print("  %d with a mark (%.0f%%)" % (logos_total, 100 * logos_total / len(rows)))
    print("  %d with an MCP server of their own" % with_mcp)
    print("  %d with documentation kept as context" % with_context)
    print("  %d runnable with a token from the environment" % sum(1 for r in rows if r["auth"] != "manual"))


if __name__ == "__main__":
    main()
