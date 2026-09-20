"""Find the API description that belongs to each provider in the directory.

The directory says who exists and how a request is signed. This says what you can ask them to
do — and it is the harder half, because there is no registry of it. So we resolve a spec from
sources in order of how much they can be trusted:

    1. curated    library/catalog/providers.json — a URL a person checked. Always wins.
    2. vendor     an OpenAPI published by the vendor's own GitHub org.
    3. apis.guru  a mirror, matched on the API's exact domain.

A third party's copy of a vendor's spec is never used. `allengrant/shopify_openapi` may well be
accurate, but nothing about it is verifiable, and a wrong parameter list is worse than an empty
one: an empty catalog says "I cannot do that", while a wrong catalog builds a call that fails
at the vendor, or worse, succeeds and does something else.

Providers that resolve to nothing stay in the directory with no operations. That is an honest
state — a name you can mention, an API we cannot yet describe — and the dashboard says so.

    just update specs            every provider
    just update specs slack ...  only these

Writes library/catalog/specs.json. Needs a GitHub token in GH_TOKEN or `gh auth token`, only to
raise the API rate limit; every repository read is public.
"""

import concurrent.futures as cf
import json
import os
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request

from common import directory as merged_directory

HERE = os.path.dirname(os.path.abspath(__file__))
CATALOG = os.path.join(HERE, "..")
OUT = os.path.join(CATALOG, "specs.json")
GURU = "https://api.apis.guru/v2/list.json"

# A repository that holds an API description, and a file inside it that is one.
SPEC_REPO = re.compile(r"(openapi|api-spec|rest-api|api-schema|swagger|api-description|apispec|api-docs)", re.I)
SPEC_FILE = re.compile(r"(openapi|swagger|api[-_.]spec|spec3)", re.I)
# Fixtures and generator input are not the API.
SKIP_FILE = re.compile(r"(test|example|sample|fixture|node_modules|generator|template|mock|__)", re.I)
SKIP_REPO = re.compile(r"(generator|codegen|client|sdk|example|tutorial|workshop|action)", re.I)

MIN_SPEC = 20_000  # a real description of a real API is not four kilobytes
MAX_SPEC = 40_000_000

_token = None


def token():
    global _token
    if _token is None:
        _token = os.environ.get("GH_TOKEN") or ""
        if not _token:
            try:
                _token = subprocess.run(
                    ["gh", "auth", "token"], capture_output=True, text=True, timeout=10
                ).stdout.strip()
            except Exception:
                _token = ""
    return _token


def gh(path, params="", tries=3):
    headers = {"accept": "application/vnd.github+json", "user-agent": "workbooks-catalog"}
    if token():
        headers["authorization"] = "Bearer " + token()
    req = urllib.request.Request("https://api.github.com" + path + params, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return json.load(r)
    except urllib.error.HTTPError as e:
        if e.code in (403, 429) and tries > 0:
            reset = e.headers.get("x-ratelimit-reset")
            wait = 60
            if reset:
                wait = max(5, min(900, int(reset) - int(time.time()) + 5))
            sys.stderr.write("rate limited, waiting %ss\n" % wait)
            time.sleep(wait)
            return gh(path, params, tries - 1)
        return None
    except Exception:
        return None


def fetch(url, n=None):
    req = urllib.request.Request(url, headers={"user-agent": "workbooks-catalog"})
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return r.read(n) if n else r.read()
    except Exception:
        return None


def is_spec(head):
    """Does this file open like an OpenAPI document? Cheap, and reads only the first bytes."""
    if not head:
        return None
    text = head.decode("utf8", "ignore")
    if re.search(r'"(openapi|swagger)"\s*:\s*"[23]', text):
        return "json"
    if re.search(r'^\s*(openapi|swagger):\s*["\']?[23]', text, re.M):
        return "yaml"
    return None


def orgs_for(provider):
    """The GitHub accounts that could be this vendor. The point is to be narrow: we accept a
    spec only from an account whose name is the vendor's own, so a bad guess finds nothing
    rather than finding someone else's file."""
    host = re.sub(r"^(api|www|app|developer|developers)\.", "", provider["base"].split("//")[-1].split("/")[0])
    host = re.sub(r"\{[^}]*\}\.?", "", host).strip(".")
    root = host.split(".")[0] if host else ""
    names = {provider["slug"], root, re.sub(r"[^a-z0-9]", "", provider["name"].lower())}
    names |= {n.replace("-", "") for n in list(names)}
    return [n for n in names if n and len(n) > 2 and not n.isdigit()]


def names_the_api(repo_name, provider, org):
    """Is this repo the vendor's main API, or a side product of theirs?

    `zendesk/sunshine-conversations-api-spec` is published by Zendesk and is a real OpenAPI,
    but it describes Sunshine Conversations, not the Zendesk API a workbook means by @zendesk.
    So: take the repo name, remove the words that mean "this is a spec", and whatever is left
    must be the vendor's own name — or nothing at all, as in `figma/rest-api-spec`.
    """
    rest = SPEC_REPO.sub("", repo_name.lower())
    rest = re.sub(r"(the|api|spec|docs|public|v\d+)", "", rest)
    rest = re.sub(r"[^a-z0-9]", "", rest)
    if len(rest) < 3:  # a leftover fragment, as "api-schemas" leaves "s"
        return True
    known = {org, provider["slug"], re.sub(r"[^a-z0-9]", "", provider["name"].lower())}
    known |= {k.replace("-", "") for k in list(known)}
    return any(k and (rest == k or rest in k or k in rest) for k in known)


def repos(org):
    out = []
    for page in (1, 2, 3, 4, 5):
        got = gh("/orgs/%s/repos" % org, "?per_page=100&type=public&sort=updated&page=%d" % page)
        if got is None and page == 1:
            got = gh("/users/%s/repos" % org, "?per_page=100&type=public&sort=updated&page=1")
        if not got:
            break
        out += got
        if len(got) < 100:
            break
    return out


def from_vendor(provider):
    for org in orgs_for(provider):
        candidates = [
            r
            for r in repos(org) or []
            if SPEC_REPO.search(r["name"])
            and not SKIP_REPO.search(r["name"])
            and not r.get("archived")
            and names_the_api(r["name"], provider, org)
        ]
        # A repo named for the API beats one named for a side product.
        candidates.sort(key=lambda r: (-r["stargazers_count"], len(r["name"])))
        for r in candidates[:3]:
            tree = gh("/repos/%s/git/trees/%s" % (r["full_name"], r["default_branch"]), "?recursive=1")
            if not tree:
                continue
            files = [
                f
                for f in tree.get("tree", [])
                if f["type"] == "blob"
                and MIN_SPEC < f.get("size", 0) < MAX_SPEC
                and re.search(r"\.(json|ya?ml)$", f["path"])
                and SPEC_FILE.search(f["path"])
                and not SKIP_FILE.search(f["path"])
            ]
            # Shallow beats deep, big beats small: the main description, not a fragment.
            files.sort(key=lambda f: (f["path"].count("/"), -f["size"]))
            for f in files[:3]:
                url = "https://raw.githubusercontent.com/%s/%s/%s" % (
                    r["full_name"],
                    r["default_branch"],
                    f["path"],
                )
                kind = is_spec(fetch(url, 4000))
                if kind:
                    return {
                        "url": url,
                        "format": kind,
                        "source": "vendor",
                        "repo": r["full_name"],
                        "path": f["path"],
                        "bytes": f["size"],
                        "license": (r.get("license") or {}).get("spdx_id"),
                        "about": "Published by %s, the vendor's own GitHub organisation." % r["full_name"].split("/")[0],
                    }
    return None


def guru_index():
    raw = fetch(GURU)
    if not raw:
        return {}
    listing = json.loads(raw)
    by_domain = {}
    for key, api in listing.items():
        domain = key.split(":")[0].lower()
        versions = api.get("versions") or {}
        pref = api.get("preferred") or (list(versions) or [None])[-1]
        v = versions.get(pref) or {}
        url = v.get("swaggerUrl") or v.get("swaggerYamlUrl")
        if not url:
            continue
        # One entry per domain: the one with the most operations is the main API.
        prev = by_domain.get(domain)
        if not prev or len(key) < len(prev[0]):
            by_domain[domain] = (key, url, v.get("updated", ""))
    return by_domain


def from_guru(provider, index):
    host = re.sub(r"\{[^}]*\}\.?", "", provider["base"].split("//")[-1].split("/")[0]).strip(".")
    parts = host.split(".")
    # Exact domain only. api.notion.com -> notion.com, and nothing looser than that.
    for n in (3, 2):
        if len(parts) >= n:
            domain = ".".join(parts[-n:])
            if domain in index:
                key, url, updated = index[domain]
                return {
                    "url": url,
                    "format": "yaml" if url.endswith((".yaml", ".yml")) else "json",
                    "source": "apis.guru",
                    "repo": key,
                    "bytes": 0,
                    "updated": updated,
                    "about": "APIs.guru's mirror, matched on %s. A mirror lags the vendor." % domain,
                }
    return None


def curated():
    path = os.path.join(CATALOG, "overrides.json")
    if not os.path.exists(path):
        return {}
    doc = json.load(open(path))
    out = {}
    for p in doc.get("providers", []):
        spec = p.get("spec")
        if spec and spec.get("url"):
            out[p["slug"]] = {
                "url": spec["url"],
                "format": "yaml" if spec["url"].endswith((".yaml", ".yml")) else "json",
                "source": "curated",
                "about": spec.get("source", "Checked by hand."),
            }
    return out


def save(found):
    doc = {
        "_": [
            "GENERATED — do not edit. `just update specs` rebuilds it.",
            "",
            "Which API description belongs to which provider, and where it came from.",
            "source=curated a person checked it; source=vendor the vendor's own GitHub org",
            "publishes it; source=apis.guru a mirror, matched on the API's exact domain.",
            "",
            "A provider missing here has no operations indexed. It is still in the directory.",
        ],
        "count": len(found),
        "specs": dict(sorted(found.items())),
    }
    tmp = OUT + ".tmp"
    with open(tmp, "w") as f:
        json.dump(doc, f, indent=1)
        f.write("\n")
    os.replace(tmp, OUT)


def main():
    only = set(sys.argv[1:])
    # The merged view, so a provider that exists only in the overrides — the registry calls
    # Gmail `google-mail` — is resolved too, rather than quietly dropped.
    providers = [p for p in merged_directory().values() if not only or p["slug"] in only]

    by_hand = curated()
    index = guru_index()
    sys.stderr.write("apis.guru: %d domains\n" % len(index))

    # Seed with what is already known BEFORE anything is written: this run saves as it goes,
    # so reading the file afterwards would read over its own shoulder and a targeted run
    # would erase every provider it was not asked about.
    found = dict(json.load(open(OUT))["specs"]) if (only and os.path.exists(OUT)) else {}
    done = [0]
    total = len(providers)

    def resolve(p):
        slug = p["slug"]
        if slug in by_hand:
            return slug, by_hand[slug]
        return slug, from_vendor(p) or from_guru(p, index)

    with cf.ThreadPoolExecutor(12) as ex:
        for slug, spec in ex.map(resolve, providers):
            done[0] += 1
            if spec:
                found[slug] = spec
                save(found)  # a rate-limited sweep runs for an hour; keep what it has found
                sys.stderr.write(
                    "[%4d/%d] %-26s %-9s %s\n" % (done[0], total, slug, spec["source"], spec.get("repo", ""))
                )
            elif done[0] % 50 == 0:
                sys.stderr.write("[%4d/%d] …\n" % (done[0], total))

    save(found)

    kinds = {}
    for s in found.values():
        kinds[s["source"]] = kinds.get(s["source"], 0) + 1
    print("\n%d of %d providers have a description" % (len(found), total))
    print("  " + "  ".join("%s %d" % kv for kv in sorted(kinds.items(), key=lambda kv: -kv[1])))
    print("→ %s" % os.path.relpath(OUT, os.getcwd()))


if __name__ == "__main__":
    main()
