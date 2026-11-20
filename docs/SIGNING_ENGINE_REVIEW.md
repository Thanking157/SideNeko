# Signing engine review — 2026-11-20

## Integrated revision

SideNekoFFI links a locally patched copy of `nab138/isideload` 0.2.22 at commit
`e319d931aa3f9d97fbd132149a3916dcd5c71f09`. The revision is pinned by
Cargo.lock, vendored under `SideNekoFull/rust-core/vendor/isideload`, and shipped
with its MIT notice. The vendored README records SideNeko's compatibility,
signing, provisioning, 2FA, session and safety changes.

`isideload` 0.5.2 at commit
`326e56229d0727cb6e7b34c8cf03e37e2cd3e17d` was also downloaded into the
ignored `work/` directory for comparison only. It is not linked into the App.

For the signing engine, isideload's MIT terms avoid introducing another custom
distribution restriction. Its complete MIT notice and all transitive dependency
notices remain bundled with the App; the exact dependency graph is pinned by
Cargo.lock.

## Security observations

- Apple sign-in uses an SRP flow. The library API receives the password in
  process; the reviewed implementation derives an SRP password value rather
  than placing the plaintext password in an HTTP request.
- The build must never enable `danger_debug`; that option accepts invalid TLS
  certificates.
- The bundled remote Anisette endpoint is `https://new.ani.sidestore.io`. Its
  operator, retention policy, availability, TLS configuration, and exact data
  exchange still require independent review. SideNeko must visibly disclose
  the selected endpoint and cannot claim that the whole operation is local.
- Saved passwords use the iOS Keychain with device-only accessibility.
  Developer tokens, the signing key and Anisette identity remain in the app's
  private Application Support directory, excluded from backups; this residual
  filesystem exposure must be included in the threat model.
- Logs must be allow-listed. Account identifiers, passwords, 2FA codes,
  developer tokens, anisette state, certificates, profiles, pairing files, and
  private keys must never be emitted.
- A Swift/Rust FFI wrapper, cancellation model, memory-zeroing review, and
  dependency audit are required. The upstream crate is a Rust library, not a
  drop-in iOS framework.

## Integration evidence and release gates

The Beta UI can expose Apple Account sign-in for owner-operated testing, but it
must not describe the flow as fully validated until all of these pass:

1. Reproducible Rust toolchain and locked dependency build for arm64 iOS. **A
   fresh local clone rebuilt the locked Rust core, XCFramework and App
   successfully. GitHub CI reproduces Rust tests and linting; an Xcode iOS build
   in CI remains pending.**
2. Device-only Keychain password storage; signing/session material stored only
   in private Application Support, excluded from backups; complete deletion
   flows for both locations.
3. Bundled Anisette endpoints use HTTPS, custom endpoints remain an explicit
   advanced-user choice, normal TLS validation stays enabled, the selected
   third-party endpoint is disclosed, and production code never calls the
   vendored `danger_debug` TLS bypass.
4. Redaction tests for success, failure, cancellation, 2FA, and certificate
   replacement paths.
5. Test Apple Account and physical-device validation with the account owner
   present. No real credentials belong in source, fixtures, screenshots, logs,
   or bug reports.
6. Apple terms/platform review and a user-facing privacy disclosure.

The integration gates above have local build and unit-test coverage. Physical
device validation, independent security review and Apple/platform-policy review
remain required; the Beta must not describe those as completed.
