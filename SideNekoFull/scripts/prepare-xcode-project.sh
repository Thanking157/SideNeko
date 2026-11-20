#!/bin/bash
# SideNeko
#
# Copyright (C) 2026 thanking157
#
# Original code and integration by thanking157.

# Generate an isolated Xcode project for scripted builds. project.yml remains
# the source of truth, while the tracked SideNeko.xcodeproj and any local Xcode
# changes are left untouched.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENERATED_ROOT="${GENERATED_PROJECT_ROOT:-$ROOT/build/GeneratedProject}"

command -v xcodegen >/dev/null || {
  echo "error: xcodegen isn't installed (brew install xcodegen)" >&2
  exit 1
}

case "$GENERATED_ROOT" in
  "$ROOT"/build/*) ;;
  *) echo "error: generated project must stay under $ROOT/build" >&2; exit 1 ;;
esac

rm -rf "$GENERATED_ROOT"
mkdir -p "$GENERATED_ROOT"

# Xcode resolves file references relative to the generated project. Keep only
# symlinks here; source and framework contents continue to live in the checkout.
for item in ios-app ios-live-activity ios-tests SideNekoFFI.xcframework; do
  [ -e "$ROOT/$item" ] || {
    echo "error: required project input is missing: $ROOT/$item" >&2
    exit 1
  }
  ln -s "$ROOT/$item" "$GENERATED_ROOT/$item"
done

xcodegen generate \
  --spec "$ROOT/project.yml" \
  --project "$GENERATED_ROOT" \
  --project-root "$ROOT" \
  --quiet

PROJECT="$GENERATED_ROOT/SideNeko.xcodeproj"
[ -f "$PROJECT/project.pbxproj" ] || {
  echo "error: xcodegen made no $PROJECT" >&2
  exit 1
}

printf '%s\n' "$PROJECT"
