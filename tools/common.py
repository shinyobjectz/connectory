"""The directory, assembled the same way by every tool.

There are two files and one rule. `directory.json` is generated from a provider registry and
says who exists. `overrides.json` is written by hand and wins, field by field, so correcting
one thing is one line rather than a restatement of the provider.

An entry that appears only in the overrides is kept: the registry calls Gmail `google-mail`,
and a page that says @gmail means Gmail.
"""

import json
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PROVIDERS = os.path.join(ROOT, "providers")


def read(path, default=None):
    path = path if os.path.isabs(path) else os.path.join(ROOT, path)
    if not os.path.exists(path):
        return default
    with open(path) as f:
        return json.load(f)


def normalize(p):
    """One shape for authentication, whatever wrote the entry.

    A registry describes a credential as a header template, because that is what APIs actually
    do — `Bearer ${apiKey}`, `Token ${apiKey}`, a bare key under `x-api-key`. A person writes
    `scheme: bearer`. Both become a header name and a format string containing `{token}`.
    """
    a = dict(p.get("auth") or {})
    if not a.get("kind"):
        scheme = a.get("scheme")
        if scheme == "basic":
            a["kind"] = "basic"
        elif scheme == "header":
            a.update({"kind": "key", "header": (a.get("header") or "authorization").lower(), "format": "{token}"})
        else:
            a.update({"kind": "key", "header": "authorization", "format": "Bearer {token}"})
    a.setdefault("header", "authorization")
    a.setdefault("format", "Bearer {token}")
    return {**p, "auth": a}


def directory():
    """Every provider, corrections applied, keyed by slug."""
    entries = {p["slug"]: p for p in (read("directory.json", {"providers": []})["providers"])}

    for fix in (read("overrides.json", {"providers": []}) or {}).get("providers", []):
        base = entries.get(fix["slug"], {})
        merged = dict(base)
        for key, value in fix.items():
            if key in ("auth", "headers") and isinstance(base.get(key), dict) and isinstance(value, dict):
                merged[key] = {**base[key], **value}
            else:
                merged[key] = value
        entries[fix["slug"]] = merged

    return {slug: normalize(p) for slug, p in sorted(entries.items())}


def providers():
    return list(directory().values())


def folder(slug, make=False):
    path = os.path.join(PROVIDERS, slug)
    if make:
        os.makedirs(path, exist_ok=True)
    return path
