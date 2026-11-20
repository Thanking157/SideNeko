#!/usr/bin/env python3
"""
SideNeko

Copyright (C) 2026 thanking157

Original code and integration by thanking157.
"""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
PAGES = "https://thanking157.github.io/SideNeko"
RELEASE_IPA = "https://github.com/Thanking157/SideNeko/releases/latest/download/SideNeko.ipa"
BOOTSTRAP_COMMAND = f"wget -qO- {PAGES}/bootstrap.sh | sh"
FORBIDDEN_PUBLIC_TEXT = (
    "sideinstaller.net",
    "github.com/FrizzleM/SideInstaller",
    "github.com/FrizzleM/siboot",
    "SideNeko-v0.1.0-beta.ipa",
    "/releases/download/v0.1.0-beta/",
)


def fail(message: str) -> None:
    print(f"error: {message}", file=sys.stderr)
    raise SystemExit(1)


def text(path: str) -> str:
    file = ROOT / path
    if not file.is_file():
        fail(f"missing {path}")
    return file.read_text(encoding="utf-8")


def require_public_text_is_ours(path: str) -> str:
    value = text(path)
    lowered = value.lower()
    for forbidden in FORBIDDEN_PUBLIC_TEXT:
        if forbidden.lower() in lowered:
            fail(f"{path} still points at forbidden legacy/upstream content: {forbidden}")
    return value


def verify_hash(artifact: str) -> None:
    path = ROOT / "docs/bootstrap" / artifact
    sum_path = path.with_name(path.name + ".sha256")
    if not path.is_file() or not sum_path.is_file():
        fail(f"missing published bootstrap artifact or checksum: {artifact}")
    fields = sum_path.read_text(encoding="utf-8").split()
    if len(fields) != 2 or fields[1] != artifact or not re.fullmatch(r"[0-9a-f]{64}", fields[0]):
        fail(f"invalid checksum file: {sum_path.relative_to(ROOT)}")
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != fields[0]:
        fail(f"checksum mismatch for {path.relative_to(ROOT)}")


def main() -> None:
    try:
        release = json.loads(text("docs/release.json"))
    except json.JSONDecodeError as error:
        fail(f"docs/release.json isn't valid JSON: {error}")

    required = {
        "available", "channel", "version", "installURL", "bootstrapCommand",
        "downloadURL", "sha256", "minimumOS", "updatedAt",
    }
    if set(release) != required:
        fail(f"docs/release.json keys differ from the release contract: {sorted(set(release) ^ required)}")
    if not isinstance(release["available"], bool):
        fail("release available must be true or false")
    if release["bootstrapCommand"] != BOOTSTRAP_COMMAND:
        fail("release bootstrapCommand isn't SideNeko's own GitHub Pages command")
    if not re.fullmatch(r"v\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?", release["version"]):
        fail("release version isn't a v-prefixed semantic version")
    if not re.fullmatch(r"\d+\.\d+(?:\.\d+)?", release["minimumOS"]):
        fail("release minimumOS isn't a numeric iOS version")

    if release["available"]:
        if release["channel"] not in {"beta", "stable"}:
            fail("an available release must be beta or stable")
        if release["installURL"] != f"{PAGES}/#guide":
            fail("available release installURL must stay on SideNeko's own guide")
        if release["downloadURL"] != RELEASE_IPA:
            fail("available release downloadURL must be the fixed SideNeko.ipa asset")
        if not isinstance(release["sha256"], str) or not re.fullmatch(r"[0-9a-f]{64}", release["sha256"]):
            fail("available release must publish a lowercase SHA-256")
    else:
        if release["channel"] != "development":
            fail("an unavailable release must remain on the development channel")
        for key in ("installURL", "downloadURL", "sha256"):
            if release[key] is not None:
                fail(f"unavailable release must keep {key} null")

    page = require_public_text_is_ours("docs/index.html")
    site = require_public_text_is_ours("docs/assets/site.js")
    bootstrap = require_public_text_is_ours("docs/bootstrap.sh")
    source_bootstrap = require_public_text_is_ours("SideNekoBootstrap/minis/install.sh")
    sign_source = require_public_text_is_ours("SideNekoBootstrap/minis/src/sign.rs")

    if f"{PAGES}/bootstrap.sh" not in page or "./sideneko-pair.wasm" not in page:
        fail("website guide no longer points at SideNeko's bootstrap and pairing tool")
    if 'fetch("release.json", { cache: "no-store" })' not in site:
        fail("website no longer reads the no-cache release gate")
    if "release.available && release.installURL" not in site:
        fail("website can bypass the release availability gate")
    for path, value in (("docs/bootstrap.sh", bootstrap),
                        ("SideNekoBootstrap/minis/install.sh", source_bootstrap)):
        if f"{PAGES}/bootstrap" not in value or RELEASE_IPA not in value:
            fail(f"{path} doesn't use SideNeko's own bootstrap and IPA locations")
    if RELEASE_IPA not in sign_source:
        fail("compiled bootstrap default IPA isn't SideNeko.ipa from this repository")

    verify_hash("sideneko-bootstrap-aarch64")
    verify_hash("sideneko-pair.wasm")

    tracked_ipas = subprocess.run(
        ["git", "ls-files", "*.ipa"], cwd=ROOT, check=True,
        text=True, capture_output=True,
    ).stdout.splitlines()
    if tracked_ipas:
        fail(f"compiled IPA must not be committed to source: {', '.join(tracked_ipas)}")

    print("SideNeko release safety check passed")
    print(f"  release: {release['version']} ({'available' if release['available'] else 'gated'})")
    print("  public URLs: SideNeko-owned")
    print("  bootstrap checksums: valid")
    print("  legacy/upstream install redirects: none")
    print("  tracked IPA files: none")


if __name__ == "__main__":
    main()
