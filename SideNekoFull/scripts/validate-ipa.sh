#!/bin/bash
# SideNeko
#
# Copyright (C) 2026 thanking157
#
# Original code and integration by thanking157.

# Validate an unsigned SideNeko IPA before it is used by the on-device
# bootstrap or attached to a release. This checks the package structure,
# identity, executable architectures, Live Activity and linked Rust/FFI entry
# points. It never signs, uploads or reads Apple account credentials.
set -euo pipefail

IPA="${1:-}"
EXPECTED_BUNDLE_ID="${EXPECTED_BUNDLE_ID:-io.thanking157.sideneko}"
EXPECTED_VERSION="${EXPECTED_VERSION:-1.0.0}"

fail() { echo "error: $*" >&2; exit 1; }
plist() { /usr/libexec/PlistBuddy -c "Print :$1" "$2" 2>/dev/null; }

[ -n "$IPA" ] || fail "usage: $0 /path/to/SideNeko.ipa"
[ -f "$IPA" ] || fail "IPA not found: $IPA"
command -v unzip >/dev/null || fail "unzip is required"
command -v lipo >/dev/null || fail "Xcode command-line tool lipo is required"
command -v nm >/dev/null || fail "Xcode command-line tool nm is required"

unzip -tqq "$IPA" || fail "IPA is not a valid ZIP archive"

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
unzip -qq "$IPA" -d "$stage"

apps=()
while IFS= read -r item; do apps+=("$item"); done < <(
  find "$stage/Payload" -mindepth 1 -maxdepth 1 -type d -name '*.app' -print 2>/dev/null
)
[ "${#apps[@]}" -eq 1 ] || fail "IPA must contain exactly one Payload/*.app (found ${#apps[@]})"
app="${apps[0]}"
info="$app/Info.plist"
[ -f "$info" ] || fail "app has no Info.plist"

executable="$(plist CFBundleExecutable "$info" || true)"
bundle_id="$(plist CFBundleIdentifier "$info" || true)"
version="$(plist CFBundleShortVersionString "$info" || true)"
build="$(plist CFBundleVersion "$info" || true)"
[ -n "$executable" ] || fail "CFBundleExecutable is missing"
[ -x "$app/$executable" ] || fail "main executable is missing or not executable: $executable"
[ "$bundle_id" = "$EXPECTED_BUNDLE_ID" ] || fail "bundle ID is $bundle_id, expected $EXPECTED_BUNDLE_ID"
[ "$version" = "$EXPECTED_VERSION" ] || fail "version is $version, expected $EXPECTED_VERSION"
/usr/bin/lipo -archs "$app/$executable" | tr ' ' '\n' | grep -qx arm64 || fail "main executable has no arm64 slice"

scheme="$(plist 'CFBundleURLTypes:0:CFBundleURLSchemes:0' "$info" || true)"
[ "$scheme" = "sideneko" ] || fail "URL scheme is '$scheme', expected sideneko"

extensions=()
while IFS= read -r item; do extensions+=("$item"); done < <(
  find "$app/PlugIns" "$app/Extensions" -mindepth 1 -maxdepth 1 -type d -name '*.appex' -print 2>/dev/null || true
)
[ "${#extensions[@]}" -gt 0 ] || fail "SideNeko Live Activity extension is missing"
live_found=0
for extension in "${extensions[@]}"; do
  extension_info="$extension/Info.plist"
  extension_executable="$(plist CFBundleExecutable "$extension_info" || true)"
  extension_id="$(plist CFBundleIdentifier "$extension_info" || true)"
  [ -n "$extension_executable" ] || fail "$(basename "$extension") has no CFBundleExecutable"
  [ -x "$extension/$extension_executable" ] || fail "$(basename "$extension") executable is missing"
  /usr/bin/lipo -archs "$extension/$extension_executable" | tr ' ' '\n' | grep -qx arm64 || fail "$(basename "$extension") has no arm64 slice"
  case "$extension_id" in "$bundle_id".*) ;; *) fail "extension bundle ID $extension_id is outside $bundle_id" ;; esac
  case "$(basename "$extension")" in *LiveActivity*) live_found=1 ;; esac
done
[ "$live_found" -eq 1 ] || fail "the packaged extension is not SideNekoLiveActivity"

symbols="$(/usr/bin/nm -gU "$app/$executable" 2>/dev/null || true)"
for symbol in _si_apple_signin _si_sign_ipa _si_pairing_run_host _idevice_pairing_file_read; do
  printf '%s\n' "$symbols" | grep -q " $symbol$" || fail "linked signing/device core is missing $symbol"
done

if find "$app" \( -name 'embedded.mobileprovision' -o -name '*.p12' -o -name '*.pem' -o -name '*.key' -o -name '*.pairing' -o -name 'adi.pb' \) -print -quit | grep -q .; then
  fail "IPA contains provisioning, credential or pairing material"
fi
[ ! -d "$app/_CodeSignature" ] || fail "release input must be unsigned; _CodeSignature is present"

sha="$(/usr/bin/shasum -a 256 "$IPA" | /usr/bin/awk '{print $1}')"
echo "SideNeko IPA validation passed"
echo "  bundle: $bundle_id"
echo "  version: $version ($build)"
echo "  executable: $executable (arm64)"
echo "  extensions: ${#extensions[@]} (Live Activity present)"
echo "  signing/device core: linked"
echo "  credentials/provisioning: none"
echo "  sha256: $sha"
