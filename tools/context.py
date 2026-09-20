"""For the platforms nobody describes: their documentation, as markdown.

Some companies publish no machine-readable description anywhere. A pack cannot be built for
them and never will be by guessing — but leaving the entry blank is not the only alternative.
What they do publish is documentation, and a growing number of them publish it as markdown on
purpose, at `/llms.txt`, precisely so that programs can read it.

So this collects that, and only that:

    providers/<slug>/docs.md   the vendor's own API documentation index, in markdown,
                               with where it came from and when written at the top.

It is **context, not operations**. Nothing downstream may turn a line of this into a call: an
endpoint inferred from prose is a guess wearing the costume of a fact, and the whole directory
is built on not doing that. What it is good for is a person or an agent knowing what a platform
can do, what its API is called, and where to read the rest.

Most `/llms.txt` files are marketing — a site description, or a Yoast plugin's idea of one — so
a file has to look like API documentation before it is kept, and a rejection is recorded as
plainly as a hit.

    python3 tools/context.py          every platform with no description
    python3 tools/context.py slack …  only these
"""

import concurrent.futures as cf
import json
import os
import re
import sys
import urllib.error
import urllib.request

from common import PROVIDERS, ROOT, directory, folder, read

# Read like documentation for a programmer, not a brochure.
TECHNICAL = re.compile(
    r"\b(api|endpoint|authentication|authorization|oauth|webhook|request|response|"
    r"rate limit|pagination|sdk|bearer|curl|json)\b",
    re.I,
)
CALLS = re.compile(r"\b(GET|POST|PUT|PATCH|DELETE)\s+/|https?://[^\s)]*/(v\d|api)/", re.I)

# Somebody's plugin generated this from a marketing site.
GENERATED_MARKETING = re.compile(r"yoast seo|this is the \[sitemap\]|all-in-one website", re.I)

# Links worth keeping in an index of documentation.
RELEVANT_LINK = re.compile(r"\b(api|endpoint|reference|developer|integration|webhook|auth|guide|rest|graphql)\b", re.I)

MAX_BYTES = 60_000

# Documentation sometimes contains something credential-shaped — an example key, a signed URL,
# occasionally a real key somebody pasted and never rotated. This text is being mirrored into a
# public repository, so it is scrubbed on the way in. We do not have to know whether it was
# live to know we should not republish it.
CREDENTIAL = re.compile(
    r"(AKIA[0-9A-Z]{16}"
    r"|gh[pousr]_[A-Za-z0-9]{16,}"
    r"|github_pat_[A-Za-z0-9_]{20,}"
    r"|xox[abprs]-[A-Za-z0-9-]{10,}"
    r"|sk_live_[A-Za-z0-9]{16,}"
    r"|sk-[A-Za-z0-9]{32,}"
    r"|-----BEGIN [A-Z ]*PRIVATE KEY-----)"
)


def redact(text):
    return CREDENTIAL.subn("[redacted by connectory]", text)


def get(url, limit=400_000, timeout=12):
    try:
        req = urllib.request.Request(url, headers={"user-agent": "connectory"})
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.status, r.headers.get("content-type", ""), r.read(limit), r.headers.get("etag")
    except urllib.error.HTTPError as e:
        return e.code, "", b"", None
    except Exception:
        return 0, "", b"", None


def root_of(base):
    host = re.sub(r"\{[^}]*\}\.?", "", (base or "").split("//")[-1].split("/")[0]).strip(".")
    parts = [p for p in host.split(".") if p]
    if len(parts) >= 3 and parts[-2] in ("co", "com", "org", "net", "gov", "ac"):
        return ".".join(parts[-3:])
    return ".".join(parts[-2:]) if len(parts) >= 2 else host


def is_documentation(text):
    """Is this the vendor's API documentation, or the front of their website?"""
    if not text.strip() or GENERATED_MARKETING.search(text[:1500]):
        return False
    if re.search(r"<!doctype|<html", text[:600], re.I):
        return False
    technical = len(set(m.group(0).lower() for m in TECHNICAL.finditer(text)))
    return technical >= 4 or bool(CALLS.search(text))


def relevant(text):
    """Keep the parts about the API; drop the careers page.

    An llms.txt is a markdown index of a documentation site, so its useful shape is headings
    and links. Anything that is neither, or that links to a blog post, is not context for
    calling an API.
    """
    kept, section_is_relevant = [], True
    for line in text.splitlines():
        stripped = line.strip()

        if stripped.startswith("#"):
            section_is_relevant = bool(RELEVANT_LINK.search(stripped)) or len(stripped.strip("# ")) < 40
            if section_is_relevant:
                kept.append(line)
            continue

        if not stripped:
            if kept and kept[-1].strip():
                kept.append("")
            continue

        if not section_is_relevant:
            continue

        is_link = stripped.startswith(("-", "*")) and "](" in stripped
        if is_link and not RELEVANT_LINK.search(stripped):
            continue
        kept.append(line)

    out = "\n".join(kept).strip()
    return out[:MAX_BYTES]


def find(provider):
    """The vendor's documentation, if they publish it in a form a program can read."""
    root = root_of(provider.get("base"))
    if not root or "." not in root:
        return provider["slug"], None

    for sub in ("docs", "developer", "developers", ""):
        host = "https://%s.%s" % (sub, root) if sub else "https://%s" % root
        for path in ("/llms.txt", "/llms-full.txt"):
            status, _ctype, body, etag = get(host + path, 500_000)
            if status != 200 or not body:
                continue
            text = body.decode("utf8", "ignore").lstrip("﻿")
            if not is_documentation(text):
                continue
            kept = relevant(text)
            if len(kept) < 200:
                continue
            kept, scrubbed = redact(kept)
            return provider["slug"], {"url": host + path, "etag": etag, "markdown": kept, "redacted": scrubbed}
    return provider["slug"], None


def write(provider, hit):
    path = os.path.join(folder(provider["slug"], make=True), "docs.md")
    auth = provider.get("auth") or {}
    env = auth.get("env") or auth.get("user_env") or "—"

    header = [
        "<!-- GENERATED by tools/context.py from %s — do not edit. -->" % hit["url"],
        "",
        "# %s" % provider["name"],
        "",
        "Nobody publishes a machine-readable description of this API, so there is no pack for it",
        "and no operation in this directory can be called. What follows is the vendor's own",
        "documentation index, kept as context. **Nothing here is an endpoint this directory",
        "vouches for**: read it, then read their reference.",
        "",
        "- API: `%s`" % (provider.get("base") or "—"),
        "- Credential: `%s` (%s)" % (env, auth.get("kind") or "unknown"),
        "- Source: %s" % hit["url"],
        "",
        "---",
        "",
    ]
    with open(path, "w") as f:
        f.write("\n".join(header) + hit["markdown"] + "\n")
    return path


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    d = directory()
    specs = (read("specs.json", {"specs": {}}) or {})["specs"]

    if args:
        todo = [d[s] for s in args if s in d]
    else:
        todo = [p for slug, p in d.items() if slug not in specs and (p.get("base") or "").startswith("http")]

    print("looking for documentation on %d platforms with no description\n" % len(todo))

    found, done = {}, [0]
    with cf.ThreadPoolExecutor(16) as ex:
        for slug, hit in ex.map(find, todo):
            done[0] += 1
            if hit:
                write(d[slug], hit)
                found[slug] = {"url": hit["url"], "etag": hit["etag"], "bytes": len(hit["markdown"])}
                if hit["redacted"]:
                    found[slug]["redacted"] = hit["redacted"]
                note = ("  (%d credential-shaped string(s) redacted)" % hit["redacted"]) if hit["redacted"] else ""
                print("[%4d/%d] %-26s %6d bytes  %s%s" % (done[0], len(todo), slug, len(hit["markdown"]), hit["url"], note), flush=True)
            elif done[0] % 50 == 0:
                print("[%4d/%d] …" % (done[0], len(todo)), flush=True)

    known = (read("context.json", {"context": {}}) or {}).get("context", {})
    known.update(found)
    with open(os.path.join(ROOT, "context.json"), "w") as f:
        json.dump(
            {
                "_": [
                    "GENERATED — tools/context.py rebuilds it.",
                    "",
                    "Documentation for platforms nobody publishes a description of. This is context",
                    "for a reader, never a source of endpoints: an endpoint inferred from prose is a",
                    "guess wearing the costume of a fact.",
                ],
                "count": len(known),
                "context": dict(sorted(known.items())),
            },
            f,
            indent=1,
        )
        f.write("\n")

    print("\n%d of %d publish documentation a program can read" % (len(found), len(todo)))


if __name__ == "__main__":
    main()
