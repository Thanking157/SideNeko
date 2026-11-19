# Security and privacy boundary

## Apple Account and Anisette

SideNeko v1.0 Beta implements Apple Account sign-in, 2FA, developer-team
selection, certificate/provisioning operations and on-device IPA signing. The
GitHub Pages website never receives those credentials: sign-in happens inside
SideNeko or the on-device bootstrap.

- A saved password is stored by iOS Keychain under
  `io.thanking157.SideNeko.appleID`, using
  `kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly`. If Keychain rejects the
  write, SideNeko keeps it in memory for that launch and shows a warning.
- The account email and selected developer-team metadata are stored in app
  preferences. Removing an account deletes its Keychain item and saved Apple
  session.
- Apple authentication uses the reviewed SRP implementation. The plaintext
  password is not placed in an HTTP request, but it necessarily exists in the
  app process while the proof is calculated.
- The current bundled Anisette endpoint is
  `https://new.ani.sidestore.io`. Anisette requests do not contain the Apple
  Account password or 2FA code, but the third-party service can see the
  connection IP and provisioning/device-attestation data. SideNeko does not
  operate that server.
- Developer tokens, the signing key, Anisette identity and pairing records are
  kept in the app's Application Support directory and excluded from backups.
  They are not stored by the SideNeko website.
- Release builds do not enable isideload's invalid-certificate debug mode.

The log redactor removes account identifiers, passwords, tokens, Anisette
values, private keys, pairing secrets and device identifiers before a log is
shown, copied or mirrored. This is defence in depth, not a promise that the
Apple/Anisette mechanisms are officially supported or risk-free.

## IPA files

SideNeko handles an IPA the user explicitly imports, an HTTPS URL the user
explicitly chooses, or the official SideStore/LiveContainer quick-install
choices. It does not provide an IPA catalogue and does not silently fetch
arbitrary third-party apps. A local SHA-256 hash identifies an exact file; it
is not a malware verdict.

## Reporting

Never put an Apple Account, password, 2FA code, private key, certificate,
provisioning profile, pairing record or Anisette value into an issue,
screenshot or manually copied log.
