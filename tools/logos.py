"""A mark for every connection.

A directory of eight hundred APIs with sixty logos in it looks broken, so this tries two
sources and records which one answered:

    simple-icons  CC0, so the file can be redistributed without a thought. Covers the brands
                  everyone has heard of, and about half of the long tail.
    nango         an SVG per provider, keyed by the same slug this directory uses, which is
                  where the obscure ones come from — Attio, Ramp, Paylocity.

A logo is a trademark either way. These are used to identify the vendor whose API it is, which
is what trademarks are for; none of them are ours and none are altered.

Anything neither source has gets no file, and the dashboard draws a lettered tile. That is a
better answer than a broken image, and it makes the gap countable.

    python3 tools/logos.py           every provider missing one
    python3 tools/logos.py --force   fetch them all again
"""

import concurrent.futures as cf
import json
import os
import re
import sys
import urllib.error
import urllib.request

from common import directory

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(ROOT, "providers")

SIMPLE = "https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/%s.svg"
NANGO = "https://raw.githubusercontent.com/NangoHQ/nango/master/packages/webapp/public/images/template-logos/%s.svg"


def get(url):
    try:
        req = urllib.request.Request(url, headers={"user-agent": "connectory"})
        with urllib.request.urlopen(req, timeout=20) as r:
            if r.status != 200:
                return None
            body = r.read(400_000)
            return body if b"<svg" in body[:600].lower() else None
    except Exception:
        return None


def candidates(p):
    """Names either source might file this provider under."""
    slug = p["slug"]
    name = p.get("name", "").lower()
    plain = re.sub(r"[^a-z0-9]", "", name)
    names = [slug, plain, slug.replace("-", ""), slug.split("-")[0]]
    if p.get("icon"):
        names.insert(0, p["icon"])
    if p.get("source", {}).get("provider"):
        names.append(p["source"]["provider"])  # the registry's own slug, before variants merged

    # Simple Icons spells a dot in a brand name out: cal.com is "caldotcom".
    if "." in name:
        names.append(re.sub(r"[^a-z0-9]", "", name.replace(".", "dot")))

    # A deployment is not a brand. `one-drive-personal` and `sharepoint-online-v1` are OneDrive
    # and SharePoint, and Microsoft files both under its own name.
    trimmed = re.sub(r"-(v\d+|public|private|personal|online|mcp|saas-backup|ropc|enterprise|generic)$", "", slug)
    while trimmed != slug:
        slug, names = trimmed, names + [trimmed, trimmed.replace("-", "")]
        trimmed = re.sub(r"-(v\d+|public|private|personal|online|mcp|saas-backup|ropc|enterprise|generic)$", "", slug)
    names.append("microsoft" + re.sub(r"[^a-z0-9]", "", name))

    # The domain is often the brand: api.namely.com is Namely.
    host = re.sub(r"\{[^}]*\}\.?", "", p.get("base", "").split("//")[-1].split("/")[0])
    root = host.replace("api.", "").split(".")[0]
    if root:
        names.append(root)
    seen, out = set(), []
    for n in names:
        if n and n not in seen and len(n) > 1:
            seen.add(n)
            out.append(n)
    return out


def find(p):
    for name in candidates(p):
        svg = get(SIMPLE % name)
        if svg:
            return svg, "simple-icons", "CC0-1.0"
    for name in candidates(p):
        svg = get(NANGO % name)
        if svg:
            return svg, "nango", None
    return None, None, None


def main():
    force = "--force" in sys.argv
    providers = list(directory().values())

    todo = []
    for p in providers:
        path = os.path.join(OUT, p["slug"], "logo.svg")
        if force or not os.path.exists(path):
            todo.append(p)

    print("looking for %d logos" % len(todo))
    found = {}

    def work(p):
        svg, source, license_ = find(p)
        return p["slug"], svg, source, license_

    with cf.ThreadPoolExecutor(16) as ex:
        for i, (slug, svg, source, license_) in enumerate(ex.map(work, todo), 1):
            if svg:
                folder = os.path.join(OUT, slug)
                os.makedirs(folder, exist_ok=True)
                with open(os.path.join(folder, "logo.svg"), "wb") as f:
                    f.write(svg)
                found[slug] = {"source": source, "license": license_}
            if i % 100 == 0:
                print("  %d/%d checked, %d found" % (i, len(todo), len(found)))

    have = sum(1 for p in providers if os.path.exists(os.path.join(OUT, p["slug"], "logo.svg")))
    by_source = {}
    for v in found.values():
        by_source[v["source"]] = by_source.get(v["source"], 0) + 1

    print("\n%d of %d providers have a mark (%.0f%%)" % (have, len(providers), 100 * have / len(providers)))
    print("  this run: " + ", ".join("%s %d" % kv for kv in sorted(by_source.items(), key=lambda kv: -kv[1])))

    # Record where each came from, because one of the two sources is CC0 and the other is not.
    path = os.path.join(ROOT, "logos.json")
    known = json.load(open(path))["logos"] if os.path.exists(path) else {}
    known.update(found)
    with open(path, "w") as f:
        json.dump(
            {
                "_": [
                    "GENERATED — tools/logos.py rebuilds it.",
                    "Where each mark came from. simple-icons is CC0; the rest are the vendor's own",
                    "trademark, used to identify the vendor whose API it is.",
                ],
                "count": len(known),
                "logos": dict(sorted(known.items())),
            },
            f,
            indent=1,
        )
        f.write("\n")


if __name__ == "__main__":
    main()
