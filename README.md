# connectory

A directory of the platforms a program might want to talk to, and what it takes to talk to
them: where the API lives, what signs a request, what you can ask it to do, what it looks like,
and whether it runs an MCP server of its own.

Every API is also one Lua file. GitHub's entire REST API is 1,201 operations in 249 KB that
stock Lua loads in under two milliseconds. With the runtime and the port in `lua/`, that file
is a complete client — no SDK, no service in the middle, no C modules.

```lua
local port = require "port_http" {
  catalog = require "providers.github.github",
  request = function (r) return your_http(r) end,   -- whatever your host already has
}

port.execute("github.issues_create", { owner = "you", repo = "yours", title = "it works" })
```

    853 platforms
    842 with a mark (99%)
    79 with an MCP server the vendor publishes
    758 callable with a token from the environment

## Why it is built this way

**Authentication is an environment variable and nothing else.** There is no OAuth dance here
and no service holding your tokens. `auth.env` names a variable; the value stays in your
environment. That is what lets an exported program run anywhere, and it is why this repository
can be public: there is nothing in it to leak.

**Only the vendor's own description is used.** Fuzzy matching finds `klarna.com:openai` for
OpenAI and Sunshine Conversations for Zendesk — right organisation, wrong product. A wrong
parameter list is worse than an empty one: an empty catalog says "I cannot do that", while a
wrong one builds a call that fails at the vendor or, worse, succeeds and does something else.
So a description is accepted from the vendor's own repository, from an exact domain match, or
from a person who checked it. Nowhere else.

**A platform nobody describes is still listed.** It has a name, a logo, a base URL and a
credential — everything except operations. Saying so is honest; inventing endpoints is not.
That is why the number of platforms and the number with operations are different numbers, and
both are printed.

**Nothing here is invented.** Every operation comes from a machine-readable description the
vendor publishes. No hand-written endpoints, because a hand-written endpoint is a guess that
looks like a fact.

## What is in a provider

    providers/github/
      github.lua     every call it accepts: method, URL, where each argument goes
      index.json     names, descriptions and argument types — what you need to FIND a call
      logo.svg
      mcp.json       the MCP server the vendor publishes, if there is one

The split between `github.lua` and `index.json` is deliberate. For GitHub the calling table is
317 KB and the prose and schemas around it are 1.3 MB. A program that already knows which
operation it wants should not carry the half that only helps a person choose.

`index.json` at the root is the whole directory as one searchable file, small enough to hold
in memory. Operations are not in it, on purpose.

## Keeping up

APIs move. `tools/packs.py` asks each vendor whether their description changed using an HTTP
conditional request, so the usual answer is 304 and costs nothing. When the bytes do differ the
pack is rebuilt and the change is reported **in operations, not lines** — a vendor reformatting
their JSON is not an API change, and an operation disappearing very much is. A scheduled job
runs it and opens a pull request when something moved.

    python3 tools/directory.py   who exists, and how a request to them is signed
    python3 tools/specs.py       whose description belongs to whom, and who published it
    python3 tools/build.py       the packs, from those descriptions
    python3 tools/logos.py       a mark for every platform
    python3 tools/mcp.py         which of them run an MCP server
    python3 tools/index.py       the searchable index

## Where the facts come from

The directory of who-exists-and-how-they-authenticate is generated from
[NangoHQ/nango][nango]'s provider registry, which maintains the half of an integration that no
API description contains — base URL, credential, which header carries it and in what format,
and the per-tenant values a URL needs. It contains no operations at all; those come from each
vendor's own OpenAPI or Google discovery document.

Marks come from [Simple Icons][icons] (CC0) where they have one, and from Nango's provider
logos otherwise. They are trademarks of the companies they belong to, used to identify the
vendor whose API it is, unaltered.

MCP servers come from the [official registry][mcp] and are matched on the reverse-DNS namespace
a vendor publishes under, which is the distinction that namespace exists to make.

[nango]: https://github.com/NangoHQ/nango
[icons]: https://simpleicons.org
[mcp]: https://registry.modelcontextprotocol.io
