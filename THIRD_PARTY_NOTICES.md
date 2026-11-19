# Third-party notices

## Current code inventory

As of 2026-11-19, SideNeko incorporates a modified source snapshot of
SideInstaller 2.1.0 under `SideNekoFull/`. The complete upstream custom
license is preserved as `SideNekoFull/SIDEINSTALLER_LICENSE.md`, provenance
and changes are recorded in `SideNekoFull/ORIGIN.md`, and modified files
carry a SideInstaller/FrizzleM derivative header.

Upstream projects:

- SideInstaller by FrizzleM: <https://github.com/FrizzleM/SideInstaller>
- siboot by FrizzleM: <https://github.com/FrizzleM/siboot>

No SideInstaller official IPA is included or mirrored.

`SideNekoBootstrap/` incorporates and modifies the `minis` and `rootshell`
source from the supplied siboot 0.19.1 snapshot. Its two Cargo package
manifests identify the source as MIT licensed. The exact source provenance,
changes and retained MIT terms are recorded in `SideNekoBootstrap/ORIGIN.md`
and `SideNekoBootstrap/LICENSE-MIT`. SideNeko builds and publishes its own
renamed bootstrap artifacts; it does not copy or rehost upstream-built
binaries.

## Integrated dependency

The full implementation under `SideNekoFull/rust-core/vendor/` includes pinned,
locally modified copies of `idevice` 0.1.63 (MIT), `isideload` 0.2.22 (MIT)
and `apple-codesign-quick` 0.1.0 (LGPL-2.1-or-later). Their package manifests,
README provenance and source-level change notes are retained. Their APIs and
implementation are not represented as original SideNeko work. A compiled
release must preserve the applicable licence texts and notices for these and
their locked transitive dependencies. See `docs/SIGNING_ENGINE_REVIEW.md`.
