# SideNeko bootstrap provenance

This directory contains a modified source derivative of the `minis` and
`rootshell` packages from [FrizzleM/siboot](https://github.com/FrizzleM/siboot).

- Upstream snapshot: `d1f67a9005bfc2b289fbf3e33823c2ec4cef8819`
- Upstream package versions: minis 0.19.1; rootshell 0.4.0
- Source supplied by the user on 2026-11-19
- Both upstream Cargo manifests declare `license = "MIT"`

SideNeko renamed the packages, binaries, environment variables, protocol
labels, state paths, pairing labels, bundle identity and release endpoints;
integrated SideNeko's pinned signing/device libraries; changed the default IPA
to SideNeko; and rebuilt the ARM64 Linux and WASI artifacts from this modified
source. No upstream-built binary is included.

The MIT terms are retained in `LICENSE-MIT`. User-facing screens identify the
product as SideNeko; upstream attribution remains here and in the repository's
third-party notices.
