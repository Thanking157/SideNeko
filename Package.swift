// swift-tools-version: 6.0
/*
 * SideNeko
 *
 * Copyright (C) 2026 thanking157
 *
 * Original code and integration by thanking157.
 *
 * Licensed under the GNU General Public License v3.0.
 */
import PackageDescription

let package = Package(
    name: "SideNekoCore",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [.library(name: "SideNekoCore", targets: ["SideNekoCore"])],
    targets: [
        .target(name: "SideNekoCore"),
        .testTarget(name: "SideNekoCoreTests", dependencies: ["SideNekoCore"])
    ]
)
