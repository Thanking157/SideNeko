# Third-party notices

## Current code inventory

As of 2026-11-19, **no SideInstaller or siboot source code is copied, vendored,
or compiled into SideNeko**. SideNeko's Swift source files and FFI integration
code are original project code and carry the thanking157 header.

The project documentation refers to these upstream projects for research and
compatibility planning only:

- SideInstaller by FrizzleM: <https://github.com/FrizzleM/SideInstaller>
- siboot by FrizzleM: <https://github.com/FrizzleM/siboot>

Before adding any third-party source, record the exact repository, commit,
file, copyright holder, license, local modifications, and compatibility finding
here. Non-commercial use alone does not erase attribution, redistribution, or
license-combination requirements.

## Integrated dependency

`nab138/isideload` 0.5.2, resolved from commit
`326e56229d0727cb6e7b34c8cf03e37e2cd3e17d`, is pinned by
`SigningCore/Cargo.lock` and linked into the locally generated
`SideNekoSigningCore.xcframework`. It is copyright 2025 nab138 and MIT licensed.
Its public API is not represented as SideNeko original work. Release packaging
must include the MIT licence text and the notices for every locked transitive
dependency. See `docs/SIGNING_ENGINE_REVIEW.md`.
