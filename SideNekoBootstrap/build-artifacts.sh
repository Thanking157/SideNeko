#!/bin/bash
# SideNeko
#
# Copyright (C) 2026 thanking157
#
# Original code and integration by thanking157.

# Rebuild SideNeko's two on-device bootstrap artifacts from the locked source:
# an ARM64 musl executable for Open Minis and a WASI module for rootshell.
# The default output stays ignored under SideNekoBootstrap/build/artifacts.
# Set PUBLISH=1 only when intentionally replacing docs/bootstrap/.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$ROOT/.." && pwd)"
OUTPUT_DIR="${OUTPUT_DIR:-$ROOT/build/artifacts}"
PUBLISH="${PUBLISH:-0}"

die() { echo "error: $*" >&2; exit 1; }
case "$OUTPUT_DIR" in "$ROOT"/build/*) ;; *) die "OUTPUT_DIR must stay under $ROOT/build" ;; esac

# Use installed tools first. The repository-local development downloads are a
# fallback only; they are ignored and never shipped.
if ! command -v cargo-zigbuild >/dev/null; then
  [ -x "$REPO/work/toolchain/cargo/bin/cargo-zigbuild" ] || die "cargo-zigbuild 0.24.1 is required"
  PATH="$REPO/work/toolchain/cargo/bin:$PATH"
fi
if ! command -v zig >/dev/null; then
  [ -x "$REPO/work/toolchain/zig/zig" ] || die "Zig 0.17.1 is required"
  PATH="$REPO/work/toolchain/zig:$PATH"
fi
export PATH

command -v cargo >/dev/null || die "Rust 1.100.0 is required"
[ "$(cd "$ROOT" && rustc --version | awk '{ print $2 }')" = 1.100.0 ] || die "rust-toolchain.toml did not select Rust 1.100.0"
[ "$(cargo-zigbuild --version | awk '{ print $2 }')" = 0.24.1 ] || die "cargo-zigbuild 0.24.1 is required"
[ "$(zig version)" = 0.17.1 ] || die "Zig 0.17.1 is required"

# Rust can retain source paths in panic/location strings even in stripped
# releases. Map both this checkout and any remaining home path to stable,
# non-identifying build roots before compiling public files.
export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$HOME=/build/home --remap-path-prefix=$REPO=/build/SideNeko"

echo "==> Building Open Minis bootstrap (aarch64 musl)"
(cd "$ROOT/minis" && cargo zigbuild --release --locked --target aarch64-unknown-linux-musl)

echo "==> Building rootshell pairing module (WASI)"
(cd "$ROOT/rootshell" && cargo build --release --locked --target wasm32-wasip1)

if [ -d "$OUTPUT_DIR" ]; then find "$OUTPUT_DIR" -mindepth 1 -depth -delete; fi
mkdir -p "$OUTPUT_DIR"
install -m 0755 "$ROOT/minis/target/aarch64-unknown-linux-musl/release/sideneko-bootstrap" \
  "$OUTPUT_DIR/sideneko-bootstrap-aarch64"
install -m 0644 "$ROOT/rootshell/target/wasm32-wasip1/release/sideneko-pair.wasm" \
  "$OUTPUT_DIR/sideneko-pair.wasm"

for artifact in sideneko-bootstrap-aarch64 sideneko-pair.wasm; do
  (cd "$OUTPUT_DIR" && shasum -a 256 "$artifact" > "$artifact.sha256")
  if strings "$OUTPUT_DIR/$artifact" | grep -E '/Users/[^/]+/|/private/var/folders/|/var/folders/|/build/home/Downloads/' > "$OUTPUT_DIR/local-paths.txt"; then
    die "$artifact contains a local developer or temporary path"
  fi
done
rm -f "$OUTPUT_DIR/local-paths.txt"

file "$OUTPUT_DIR/sideneko-bootstrap-aarch64" | grep -q 'ELF 64-bit.*ARM aarch64' || die "Open Minis artifact isn't ARM64 ELF"
file "$OUTPUT_DIR/sideneko-pair.wasm" | grep -q 'WebAssembly.*module' || die "rootshell artifact isn't WebAssembly"

if [ "$PUBLISH" = 1 ]; then
  destination="$REPO/docs/bootstrap"
  for artifact in sideneko-bootstrap-aarch64 sideneko-pair.wasm; do
    install -m "$( [ "$artifact" = sideneko-bootstrap-aarch64 ] && echo 0755 || echo 0644 )" \
      "$OUTPUT_DIR/$artifact" "$destination/$artifact"
    install -m 0644 "$OUTPUT_DIR/$artifact.sha256" "$destination/$artifact.sha256"
  done
  echo "==> Published rebuilt artifacts to docs/bootstrap"
else
  echo "==> Built artifacts in $OUTPUT_DIR (set PUBLISH=1 to replace docs/bootstrap)"
fi
