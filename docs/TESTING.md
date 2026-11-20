# SideNeko v1.0 Beta test status

## Completed on the development Mac

- The complete Rust signing/device suite passes: 68 SideNeko core, 31 idevice,
  58 isideload and 24 apple-codesign-quick tests (181 total).
- SideNeko bootstrap passes 108 tests with one true-device integration case
  skipped; the rootshell pairing module passes all 16 tests.
- The renamed ARM64 Linux bootstrap and WASI pairing module build from the
  tracked source, and their published SHA-256 files match.
- Xcode 27.2 clean-builds the unsigned SideNeko 1.0.0 Release for a generic
  arm64 iOS device with the SideNekoFFI library and Live Activity extension.
- The Debug app also builds for the generic arm64 iOS Simulator destination.
- The generated IPA is a valid ZIP containing `Payload/SideNeko.app`, bundle ID
  `io.thanking157.sideneko`, version 1.0.0 and an arm64 executable.
- `SideNekoFull/scripts/validate-ipa.sh dist/SideNeko.ipa` additionally checks
  the required Info.plist identity, URL scheme, arm64 main/extension binaries,
  Live Activity, linked Apple sign-in/signing/pairing FFI symbols and absence of
  provisioning profiles, credentials, pairing records or an existing signature.
- The localization checker finds all 807 Traditional Chinese and English keys
  represented; no duplicate keys or placeholder mismatches exist. Some
  non-primary translations remain incomplete.
- The Mac currently has no installed iOS Simulator runtime, so simulator UI
  tests could not run. This is recorded as unverified, not reported as a pass.

## Still required on the intended iPhone/iPad

- Run the complete website → SideNeko bootstrap → sign → install flow on the
  intended iPhone 17 / iOS 27.3, including Apple 2FA and first trust.
- Verify initial pairing, LocalDevVPN reconnect, imported IPA signing,
  refresh, expiry display, SideStore/LiveContainer quick install and account
  deletion with the account owner present.
- Test an iPad, VoiceOver, Dynamic Type, Traditional Chinese and English
  layouts.
- Obtain any permission needed before publicly distributing a compiled
  SideInstaller-derived app. The local IPA is built from the modified source;
  no official SideInstaller IPA is copied.

No test plan can promise success on every device or that a free certificate
will never expire or be revoked.
