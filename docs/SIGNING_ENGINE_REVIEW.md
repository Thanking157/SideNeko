# Signing engine review — 2026-11-19

## Candidate reviewed

`nab138/isideload` 0.5.2, commit
`326e56229d0727cb6e7b34c8cf03e37e2cd3e17d`, was downloaded into the ignored
`work/` directory for review. It is MIT licensed (copyright 2025 nab138), pinned
by Cargo.lock, and now linked into the generated local XCFramework. SideNeko has
not yet exposed credential, signing, or installation FFI entry points.

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
- The default remote Anisette endpoint is `https://ani.iloader.app`. Its
  operator, retention policy, availability, TLS configuration, and exact data
  exchange still require independent review. SideNeko must visibly disclose
  the selected endpoint and cannot claim that the whole operation is local.
- Anisette state and signing identities need an iOS Keychain-backed storage
  implementation with device-only accessibility. The candidate's generic
  desktop keyring or filesystem storage is not accepted as-is.
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

Until the remaining gates pass, SideNeko's UI reports the dependency as linked
but Apple Account, signing, and installation capabilities as unavailable rather
than collecting credentials into an unverified path.
