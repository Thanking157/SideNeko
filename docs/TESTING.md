# Test plan

## Completed on development Mac

- `swift test` validates incremental checksum reading, ZIP-signature and
  extension refusal, expiry status, and the no-remote-download policy.
- English and Traditional Chinese resources are compiled into the app bundle.
- `cargo test --locked --features engine` passes three FFI capability and
  secret-surface tests with the pinned isideload dependency linked.
- The SwiftUI shell compiles for both generic iOS Simulator and generic physical
  iOS destinations with code signing disabled under Xcode 27.2.
- The device-only Keychain implementation compiles for both destinations; live
  add/read/delete testing remains part of physical-device verification.
- The static GitHub Pages site keeps its installation action disabled while
  `docs/release.json` reports that no verified release is available.
- UI launch testing was attempted, but this Mac currently has no installed iOS
  Simulator runtime or device entry. This is recorded as unverified rather than
  reported as a pass.

## Still required before any public release

- Build and run on the intended iPhone 17 / iOS 27.3 and an iPad.
- VoiceOver, Dynamic Type, Chinese and English layout checks.
- Verify a document-picked local IPA never leaves the device.
- Independent security review for any Apple-auth, Anisette, signing, pairing,
  VPN, or installation proposal.
- Obtain written permission before any SideInstaller compiled derivative or
  siboot source/binary redistribution is ever proposed. Neither is included.

No test plan can promise that all devices will install successfully or that a
free signing certificate will never expire/revoke.
