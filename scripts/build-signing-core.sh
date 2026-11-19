#!/bin/sh
#
# SideNeko
#
# Copyright (C) 2026 thanking157
#
# Original code and integration by thanking157.
#
# Licensed under the GNU General Public License v3.0.

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cargo_home="$project_dir/work/cargo"
rustup_home="$project_dir/work/rustup"
cargo="$cargo_home/bin/cargo"

if [ ! -x "$cargo" ]; then
    echo "SideNeko Rust toolchain is missing from work/." >&2
    exit 1
fi

export CARGO_HOME="$cargo_home"
export RUSTUP_HOME="$rustup_home"

"$cargo" test --manifest-path "$project_dir/SigningCore/Cargo.toml"
"$cargo" build --release --locked --manifest-path "$project_dir/SigningCore/Cargo.toml" --target aarch64-apple-ios --features engine
"$cargo" build --release --locked --manifest-path "$project_dir/SigningCore/Cargo.toml" --target aarch64-apple-ios-sim --features engine
"$cargo" build --release --locked --manifest-path "$project_dir/SigningCore/Cargo.toml" --target x86_64-apple-ios --features engine

framework_dir="$project_dir/SigningCore/build/SideNekoSigningCore.xcframework"
sim_library="$project_dir/SigningCore/build/libsideneko_signing_core-sim.a"
mkdir -p "$project_dir/SigningCore/build"

lipo -create \
    "$project_dir/SigningCore/target/aarch64-apple-ios-sim/release/libsideneko_signing_core.a" \
    "$project_dir/SigningCore/target/x86_64-apple-ios/release/libsideneko_signing_core.a" \
    -output "$sim_library"

rm -rf "$framework_dir"
xcodebuild -create-xcframework \
    -library "$project_dir/SigningCore/target/aarch64-apple-ios/release/libsideneko_signing_core.a" \
    -headers "$project_dir/SigningCore/include" \
    -library "$sim_library" \
    -headers "$project_dir/SigningCore/include" \
    -output "$framework_dir"
