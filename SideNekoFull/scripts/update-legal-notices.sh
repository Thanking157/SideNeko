#!/bin/bash
# SideNeko
#
# Copyright (C) 2026 thanking157
#
# Original code and integration by thanking157.

# Rebuild the offline legal documents embedded in SideNeko. This script never
# reads credentials and does not modify README.md.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
RUST_ROOT="$ROOT/SideNekoFull/rust-core"
LEGAL_ROOT="$ROOT/SideNekoFull/ios-app/Legal"

command -v cargo-about >/dev/null 2>&1 || {
  echo "error: cargo-about is required (cargo install cargo-about --locked --features cli)" >&2
  exit 1
}

cp "$ROOT/THIRD_PARTY_NOTICES.md" "$LEGAL_ROOT/ThirdPartyNotices.txt"
cargo about generate \
  --manifest-path "$RUST_ROOT/Cargo.toml" \
  --config "$RUST_ROOT/about.toml" \
  --target aarch64-apple-ios \
  --locked \
  --fail \
  --output-file "$LEGAL_ROOT/RustDependencies.txt" \
  "$RUST_ROOT/licenses.hbs"
# Normalise presentation-only whitespace from upstream licence files so the
# checked-in report remains stable and passes the repository's diff checks.
perl -pi -e 's/[ \t]+$//' "$LEGAL_ROOT/RustDependencies.txt"
perl -0pi -e 's/\n+\z/\n/' "$LEGAL_ROOT/RustDependencies.txt"

echo "Updated embedded SideNeko legal notices."
