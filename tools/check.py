"""What has to be true before any of this is published.

The packs are files other people's programs will `require`, so this runs them rather than
reading them: if Lua is on the machine, every pack is loaded and its operations counted. It
also refuses to let a credential into a repository whose whole premise is that it never holds
one.

    python3 tools/check.py
"""

import json
import os
import re
import subprocess
import sys

from common import PROVIDERS, ROOT, directory, read

# Shapes that mean somebody pasted a real credential. The repository names environment
# variables; it never holds a value, and a pull request that adds one should be closed.
SECRETS = [
    (r"gh[pousr]_[A-Za-z0-9]{16,}", "a GitHub token"),
    (r"github_pat_[A-Za-z0-9_]{20,}", "a GitHub token"),
    (r"xox[abprs]-[A-Za-z0-9-]{10,}", "a Slack token"),
    (r"sk_live_[A-Za-z0-9]{16,}", "a live Stripe key"),
    (r"sk-[A-Za-z0-9]{32,}", "an OpenAI key"),
    (r"AKIA[0-9A-Z]{16}", "an AWS access key"),
    (r"-----BEGIN [A-Z ]*PRIVATE KEY-----", "a private key"),
]

LUA = None
for candidate in ("lua", "lua5.4", "lua5.3", "luajit"):
    if subprocess.run(["which", candidate], capture_output=True).returncode == 0:
        LUA = candidate
        break


def fail(problems, message):
    problems.append(message)
    print("  FAIL " + message)


def check_packs(problems):
    """Every pack loads, and every operation in it could actually be called."""
    packs = sorted(
        os.path.join(PROVIDERS, slug, "%s.lua" % slug)
        for slug in os.listdir(PROVIDERS)
        if os.path.exists(os.path.join(PROVIDERS, slug, "%s.lua" % slug))
    )
    if not packs:
        print("  no packs yet")
        return

    if not LUA:
        print("  ! no lua on this machine, so the packs were not executed")
        return

    script = """
    local total, files = 0, 0
    for path in io.lines(LISTING) do
      local pack = dofile(path)
      assert(pack.provider and pack.base and pack.auth, path .. ": missing provider, base or auth")
      assert(pack.auth.env or pack.auth.user_env or pack.auth.kind == "open",
             path .. ": nothing says what signs a request")
      for name, op in pairs(pack.operations) do
        assert(op.method and op.url, path .. ": " .. name .. " has no method or url")
        assert(op.url:match("^https?://") or op.url:match("^{"), path .. ": " .. name .. " has no address")
        total = total + 1
      end
      files = files + 1
    end
    print(files .. " packs, " .. total .. " operations")
    """
    listing = os.path.join(ROOT, ".cache", "packs.txt")
    os.makedirs(os.path.dirname(listing), exist_ok=True)
    with open(listing, "w") as f:
        f.write("\n".join(packs) + "\n")

    # The listing goes in the chunk rather than through `arg`, which -e does not populate.
    script = "local LISTING = " + json.dumps(listing) + "\n" + script
    result = subprocess.run([LUA, "-e", script], capture_output=True, text=True)
    if result.returncode != 0:
        fail(problems, "a pack did not load: " + (result.stderr or result.stdout).strip()[:300])
    else:
        print("  " + result.stdout.strip() + ", all loaded by " + LUA)


def check_secrets(problems):
    looked = 0
    for folder, _, names in os.walk(ROOT):
        if any(part in folder for part in (".git", ".cache", "__pycache__")):
            continue
        for name in names:
            path = os.path.join(folder, name)
            if os.path.getsize(path) > 8_000_000:
                continue
            try:
                with open(path, "r", errors="ignore") as f:
                    body = f.read()
            except OSError:
                continue
            looked += 1
            for pattern, what in SECRETS:
                m = re.search(pattern, body)
                if m:
                    # tools/check.py itself holds the patterns, which is not a leak.
                    if os.path.abspath(path) == os.path.abspath(__file__):
                        continue
                    fail(problems, "%s looks like %s in %s" % (m.group()[:12] + "…", what, os.path.relpath(path, ROOT)))
    print("  %d files carry no credential" % looked)


def check_index(problems):
    index = read("index.json")
    if not index:
        print("  no index yet")
        return

    listed = {r["slug"] for r in index["index"]}
    known = set(directory())
    missing = known - listed
    extra = listed - known
    if missing:
        fail(problems, "%d providers are in the directory but not the index (run tools/index.py)" % len(missing))
    if extra:
        fail(problems, "%d providers are in the index but not the directory" % len(extra))

    for row in index["index"]:
        owner = row.get("operations_from") or row["slug"]
        if row["operations"] and not os.path.exists(os.path.join(PROVIDERS, owner, "%s.lua" % owner)):
            fail(problems, "%s claims %d operations but %s has no pack" % (row["slug"], row["operations"], owner))

    if not missing and not extra:
        print("  %d platforms, index agrees with the directory" % len(listed))


def main():
    problems = []
    print("packs")
    check_packs(problems)
    print("credentials")
    check_secrets(problems)
    print("index")
    check_index(problems)

    if problems:
        print("\n%d problem(s)" % len(problems))
        sys.exit(1)
    print("\ngreen")


if __name__ == "__main__":
    main()
