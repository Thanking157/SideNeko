# Security and privacy boundary

## Apple Account and Anisette

The current SideNeko build does not collect an Apple Account email, password,
app-specific password, 2FA code, session token, anisette identity, certificate,
provisioning profile, or private key. The project does not implement a hidden
web view or a proxy for Apple login.

The app now contains an original generic-password Keychain layer using
`kSecAttrAccessibleWhenUnlockedThisDeviceOnly` with iCloud synchronisation
disabled and complete deletion support. It is not yet connected to Apple login.
Passwords and 2FA codes are expressly excluded from that store. Before enabling
login, the FFI must also redact logs, zero temporary buffers, support
cancellation and disclose the selected Anisette host. No secret may be sent to
a SideNeko-operated service. This does not make the approach Apple-authorised;
that needs separate confirmation.

## Imported IPA files

Only a file explicitly picked by the user may be inspected. The app computes a
local SHA-256 checksum. A hash establishes an exact-file comparison only; it is
not a malware verdict. SideNeko does not fetch executable files or host a
catalogue.

## Reporting

Do not put account details, private keys, certificates, provisioning profiles,
anisette values, or 2FA codes into an issue, screenshot, or log.
