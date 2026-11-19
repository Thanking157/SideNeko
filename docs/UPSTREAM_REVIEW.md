# Upstream review — 2026-11-19

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

`FrizzleM/SideInstaller`'s `LICENSE.md` (copyright 2026 FrizzleM) allows
non-commercial source-code derivatives if the copyright notice and licence are
included and changes are clearly marked. It prohibits distribution of compiled
versions/IPA files without written authorisation. Before copying any upstream
source into SideNeko, preserve that notice, include the complete licence, mark
the changed files, and obtain a maintainer review. This repository currently
contains no copied upstream implementation.

No licence file was found in the reviewed `siboot` tree. Public source visibility
alone is not permission to copy, modify, compile, or redistribute it. SideNeko
therefore uses its documented workflow only as behavioural research and does
not vendor, run, or repackage siboot code or binaries.
