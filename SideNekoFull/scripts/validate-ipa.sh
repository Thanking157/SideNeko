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
EXPECTED_MIN_IOS="${EXPECTED_MIN_IOS:-17.4}"
MIN_IOS_SDK="${MIN_IOS_SDK:-27.1}"

fail() { echo "error: $*" >&2; exit 1; }
plist() { /usr/libexec/PlistBuddy -c "Print :$1" "$2" 2>/dev/null; }

[ -n "$IPA" ] || fail "usage: $0 /path/to/SideNeko.ipa"
[ -f "$IPA" ] || fail "IPA not found: $IPA"
command -v unzip >/dev/null || fail "unzip is required"
command -v lipo >/dev/null || fail "Xcode command-line tool lipo is required"
command -v nm >/dev/null || fail "Xcode command-line tool nm is required"
command -v otool >/dev/null || fail "Xcode command-line tool otool is required"
command -v xcrun >/dev/null || fail "Xcode command-line tool xcrun is required"
command -v strings >/dev/null || fail "the strings command is required"

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
minimum_ios="$(plist MinimumOSVersion "$info" || true)"
[ -n "$executable" ] || fail "CFBundleExecutable is missing"
[ -x "$app/$executable" ] || fail "main executable is missing or not executable: $executable"
[ "$bundle_id" = "$EXPECTED_BUNDLE_ID" ] || fail "bundle ID is $bundle_id, expected $EXPECTED_BUNDLE_ID"
[ "$version" = "$EXPECTED_VERSION" ] || fail "version is $version, expected $EXPECTED_VERSION"
[ "$minimum_ios" = "$EXPECTED_MIN_IOS" ] || fail "minimum iOS is $minimum_ios, expected $EXPECTED_MIN_IOS"
/usr/bin/lipo -archs "$app/$executable" | tr ' ' '\n' | grep -qx arm64 || fail "main executable has no arm64 slice"
binaries=("$app/$executable")

[ -s "$app/Assets.car" ] || fail "compiled asset catalogue is missing"
find "$app" -maxdepth 1 -type f -name 'AppIcon*.png' -print -quit | grep -q . || fail "compiled App icon is missing"

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
  extension_version="$(plist CFBundleShortVersionString "$extension_info" || true)"
  extension_minimum_ios="$(plist MinimumOSVersion "$extension_info" || true)"
  [ -n "$extension_executable" ] || fail "$(basename "$extension") has no CFBundleExecutable"
  [ -x "$extension/$extension_executable" ] || fail "$(basename "$extension") executable is missing"
  binaries+=("$extension/$extension_executable")
  /usr/bin/lipo -archs "$extension/$extension_executable" | tr ' ' '\n' | grep -qx arm64 || fail "$(basename "$extension") has no arm64 slice"
  case "$extension_id" in "$bundle_id".*) ;; *) fail "extension bundle ID $extension_id is outside $bundle_id" ;; esac
  [ "$extension_version" = "$version" ] || fail "$(basename "$extension") version is $extension_version, app is $version"
  [ "$extension_minimum_ios" = "$minimum_ios" ] || fail "$(basename "$extension") minimum iOS is $extension_minimum_ios, app is $minimum_ios"
  case "$(basename "$extension")" in *LiveActivity*) live_found=1 ;; esac
done
[ "$live_found" -eq 1 ] || fail "the packaged extension is not SideNekoLiveActivity"

sdk_seen=""
for binary in "${binaries[@]}"; do
  if strings "$binary" | grep -E '/Users/[^/]+/|/private/var/folders/|/var/folders/' > "$stage/local-paths.txt"; then
    fail "$(basename "$binary") contains a local developer or temporary path"
  fi

  build_info="$(xcrun vtool -show-build "$binary" 2>/dev/null)" || fail "couldn't read $(basename "$binary") build metadata"
  platform="$(printf '%s\n' "$build_info" | awk '$1 == "platform" { print $2; exit }')"
  binary_minimum="$(printf '%s\n' "$build_info" | awk '$1 == "minos" { print $2; exit }')"
  binary_sdk="$(printf '%s\n' "$build_info" | awk '$1 == "sdk" { print $2; exit }')"
  [ "$platform" = IOS ] || fail "$(basename "$binary") platform is $platform, expected IOS"
  [ "$binary_minimum" = "$minimum_ios" ] || fail "$(basename "$binary") minimum iOS is $binary_minimum, expected $minimum_ios"
  [ -n "$binary_sdk" ] || fail "$(basename "$binary") has no iOS SDK version"
  [ "$(printf '%s\n' "$MIN_IOS_SDK" "$binary_sdk" | sort -V | head -1)" = "$MIN_IOS_SDK" ] ||
    fail "$(basename "$binary") uses iOS SDK $binary_sdk, expected $MIN_IOS_SDK or later"
  sdk_seen="${sdk_seen:-$binary_sdk}"

  binary_dir="$(dirname "$binary")"
  while IFS= read -r dependency; do
    [ -n "$dependency" ] || continue
    case "$dependency" in
      /System/Library/*|/usr/lib/*) ;;
      @rpath/*)
        relative="${dependency#@rpath/}"
        [ -e "$binary_dir/Frameworks/$relative" ] || [ -e "$app/Frameworks/$relative" ] ||
          fail "$(basename "$binary") has a missing @rpath dependency: $dependency"
        ;;
      @executable_path/*)
        relative="${dependency#@executable_path/}"
        [ -e "$binary_dir/$relative" ] || fail "$(basename "$binary") has a missing executable-path dependency: $dependency"
        ;;
      @loader_path/*)
        relative="${dependency#@loader_path/}"
        [ -e "$binary_dir/$relative" ] || fail "$(basename "$binary") has a missing loader-path dependency: $dependency"
        ;;
      *) fail "$(basename "$binary") has an unexpected dependency: $dependency" ;;
    esac
  done < <(otool -L "$binary" | tail -n +2 | awk '{ print $1 }')
done

for legal_file in \
  ThirdPartyNotices.txt \
  RustDependencies.txt \
  SideNeko-GPL-3.0.txt \
  SideInstaller-LICENSE.txt \
  Bootstrap-MIT.txt \
  idevice-MIT.txt \
  isideload-MIT.txt \
  apple-codesign-quick-LGPL-2.1.txt; do
  [ -s "$app/$legal_file" ] || fail "offline legal notice is missing or empty: $legal_file"
done

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
echo "  deployment: iOS $minimum_ios+, built with SDK $sdk_seen"
echo "  extensions: ${#extensions[@]} (Live Activity present)"
echo "  runtime dependencies: complete"
echo "  App icon/assets: complete"
echo "  signing/device core: linked"
echo "  offline legal notices: complete"
echo "  credentials/provisioning: none"
echo "  local build paths: none"
echo "  sha256: $sha"
