# Upstream review — 2026-11-20

## Sources checked

- FrizzleM/SideInstaller commit
  `9970bd1965dd9f9485e5db42fcbadf10fd035dc5` (2026-11-18).
- FrizzleM/siboot commit
  `d1f67a9005bfc2b289fbf3e33823c2ec4cef8819` (siboot 0.19.1,
  2026-11-18).
- `sideinstaller.net/install.html`, updated 2026-11-18.

## What we learned

The documented siboot route runs a command in Open Minis on the target iPhone,
with LocalDevVPN, Developer Mode, iOS 27+, and Open Minis 1.16+. That is an
upstream-specific operational dependency, not a general proof that an arbitrary
iPhone/iPad can self-install any app.

SideInstaller's own release notes say its unsigned IPA is published for use in
a signing tool. That statement does **not** grant SideNeko a licence to publish
SideInstaller's compiled IPA.

## Licence / attribution decision

`FrizzleM/SideInstaller`'s live `LICENSE.md` (copyright 2026 FrizzleM) was
checked again on 2026-11-20. It grants non-commercial copying, modification and
incorporation, but grants distribution of the Software or derivative works only
**in source code form**, with the copyright notice, licence and changes kept.
It separately prohibits redistributing the copyright holder's official builds.
No public permission for distributing a compiled derivative IPA was found, so
SideNeko must obtain written authorisation before publishing that IPA. The user
supplied the 2.1.0 source archive; it is incorporated under `SideNekoFull/` with
the upstream licence, attribution, change record and per-file headers on
modified integration files.

No standalone licence file was found in the reviewed `siboot` tree, but both
package manifests explicitly declare `license = "MIT"`. After the user supplied
the source snapshot, SideNeko incorporated and modified those two packages in
`SideNekoBootstrap/`, retained the MIT terms and provenance, and compiled its
own renamed artifacts. No upstream-built siboot binary is copied or rehosted.
