"""Keep the packs level with the APIs they describe.

Vendors change their descriptions constantly — GitHub regenerates theirs from source, Stripe
ships one per release — and a pack that has drifted is worse than no pack, because it is
confidently wrong.

So the first question is asked with an HTTP conditional request: send the etag we saw last time
and let the server answer 304, which is the usual answer and costs nothing. Only when the bytes
really differ is anything rebuilt, and then the answer is given **in operations, not lines**,
because a vendor reformatting their JSON is not an API change and an operation disappearing
very much is.

    python3 tools/packs.py            every provider with a description
    python3 tools/packs.py github …   only these
"""

import concurrent.futures as cf
import hashlib
import json
import os
import sys
import urllib.error
import urllib.request

import build
from common import ROOT, directory, read

LOCK = os.path.join(ROOT, "packs.lock.json")


def lock():
    return (read(LOCK, {"providers": {}}) or {}).get("providers", {})


def save(entries):
    with open(LOCK, "w") as f:
        json.dump(
            {
                "_": [
                    "GENERATED — tools/packs.py writes it.",
                    "",
                    "What each provider's description looked like when its pack was built. The etag",
                    "makes the daily check a 304 for almost everyone; the hash catches a vendor who",
                    "does not send one. A pack is rebuilt only when these stop matching.",
                ],
                "providers": dict(sorted(entries.items())),
            },
            f,
            indent=1,
        )
        f.write("\n")


def shape(ops):
    """What a change is measured against: what you call, and what you must pass.

    Names and prose move constantly and mean nothing to a caller, so they are not part of it.
    """
    return {
        o["slug"]: {
            "method": o["request"]["method"],
            "url": o["request"]["url"],
            "path": sorted(o["request"]["path"]),
            "required": sorted(o["input"]["required"]),
        }
        for o in ops
    }


def diff(before, now):
    gone = sorted(set(before) - set(now))
    added = sorted(set(now) - set(before))
    changed = sorted(s for s in set(before) & set(now) if before[s] != now[s])
    return {"removed": gone, "added": added, "changed": changed, "breaking": bool(gone or changed)}


def fetch_if_moved(url, etag):
    """Returns (body, etag) or (None, etag) when the description has not moved."""
    headers = {"user-agent": "connectory", "accept": "application/json, application/yaml, */*"}
    if etag:
        headers["if-none-match"] = etag
    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=300) as r:
            return r.read(), r.headers.get("etag")
    except urllib.error.HTTPError as e:
        if e.code == 304:
            return None, etag
        raise


def refresh(slug, provider, spec_ref, was):
    body, etag = fetch_if_moved(spec_ref["url"], was.get("etag"))
    if body is None:
        return slug, None, was

    digest = hashlib.sha256(body).hexdigest()
    if digest == was.get("sha256"):
        return slug, None, {**was, "etag": etag or was.get("etag")}

    # Read what we had, then rebuild from what they publish now.
    previous = shape((read(os.path.join(ROOT, "providers", slug, "index.json"), {"operations": []}) or {})["operations"])

    cached = os.path.join(build.CACHE, __import__("re").sub(r"[^A-Za-z0-9]+", "_", spec_ref["url"])[-180:])
    os.makedirs(build.CACHE, exist_ok=True)
    with open(cached, "wb") as f:
        f.write(body)

    build.build(slug, provider, spec_ref)
    now = shape((read(os.path.join(ROOT, "providers", slug, "index.json"), {"operations": []}) or {})["operations"])

    entry = {"spec": spec_ref["url"], "sha256": digest, "etag": etag, "operations": len(now)}
    return slug, diff(previous, now), entry


def main():
    only = set(sys.argv[1:])
    d = directory()
    specs = (read("specs.json", {"specs": {}}) or {})["specs"]
    entries = lock()

    todo = [(slug, ref) for slug, ref in sorted(specs.items()) if (not only or slug in only) and slug in d]
    print("checking %d description(s)\n" % len(todo))

    updated, breaking = 0, 0

    def work(item):
        slug, ref = item
        try:
            return refresh(slug, d[slug], ref, entries.get(slug, {}))
        except Exception as e:
            return slug, {"error": "%s: %s" % (type(e).__name__, str(e)[:100])}, None

    with cf.ThreadPoolExecutor(6) as ex:
        for slug, change, entry in ex.map(work, todo):
            if entry:
                entries[slug] = entry
            if not change:
                continue
            if change.get("error"):
                print("  ! %s %s" % (slug, change["error"]))
                continue

            # The bytes moved but the API did not — Google reissues its discovery documents,
            # vendors reformat their JSON. Nothing to tell anyone, and nothing to open a pull
            # request about.
            if not (change["added"] or change["removed"] or change["changed"]):
                continue

            updated += 1
            breaking += 1 if change["breaking"] else 0
            print("%s: %d added, %d removed, %d changed"
                  % (slug, len(change["added"]), len(change["removed"]), len(change["changed"])))
            for s in change["removed"][:5]:
                print("    gone: %s" % s)
            for s in change["changed"][:3]:
                print("    arguments moved: %s" % s)

    save(entries)
    print("\n%d unchanged, %d rebuilt, %d with operations removed or moved"
          % (len(todo) - updated, updated, breaking))


if __name__ == "__main__":
    main()
