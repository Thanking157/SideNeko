# Signing engine review — 2026-11-19

## Candidate reviewed

`nab138/isideload` 0.5.2, commit
`326e56229d0727cb6e7b34c8cf03e37e2cd3e17d`, was downloaded into the ignored
`work/` directory for review. It is MIT licensed (copyright 2025 nab138), pinned
by Cargo.lock, vendored with its notice, and linked into SideNekoFFI. SideNeko
now exposes the credential, signing and provisioning entry points used by the
v1.0 Beta UI.

This is a cleaner candidate than copying SideInstaller because MIT permits
combination with GPLv3 when its copyright and permission notice are retained.
Its complete MIT notice and all transitive dependency notices must be shipped
with releases; the exact dependency graph remains pinned by Cargo.lock.

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

## Integration gate

Do not present Apple Account sign-in in the released UI until all of these pass:

1. Reproducible Rust toolchain and locked dependency build for arm64 iOS. **Done
   locally; CI reproduction remains pending.**
2. Keychain-only secret storage and complete deletion flow.
3. Host allow-list and TLS validation tests; debug TLS bypass impossible in a
   release build.
4. Redaction tests for success, failure, cancellation, 2FA, and certificate
   replacement paths.
5. Test Apple Account and physical-device validation with the account owner
   present. No real credentials belong in source, fixtures, screenshots, logs,
   or bug reports.
6. Apple terms/platform review and a user-facing privacy disclosure.

The integration gates above have local build and unit-test coverage. Physical
device validation, independent security review and Apple/platform-policy review
remain required; the Beta must not describe those as completed.
