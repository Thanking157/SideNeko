/*
 * SideNeko
 *
 * Copyright (C) 2026 thanking157
 *
 * Original code and integration by thanking157.
 *
 * Licensed under the GNU General Public License v3.0.
 */

import Foundation
import Testing
@testable import SideNekoCore

@Test func importedIPAHasPinnedLocalChecksum() throws {
    let bytes = Data([0x50, 0x4B, 0x03, 0x04]) + Data("meow".utf8)
    let ipa = try LocalIPAInspector.inspect(filename: "Neko.ipa", data: bytes)
    #expect(ipa.sha256 == LocalIPAInspector.sha256(of: bytes))
}

@Test func refusesNonLocalPackageShape() {
    #expect(throws: ImportError.notAnIPA) {
        try LocalIPAInspector.inspect(filename: "download.pkg", data: Data([1]))
    }
}

@Test func refusesRenamedNonArchive() {
    #expect(throws: ImportError.notZIPArchive) {
        try LocalIPAInspector.inspect(filename: "fake.ipa", data: Data("not a zip".utf8))
    }
}

@Test func streamsAFileWithoutLoadingItAllAtOnce() throws {
    let url = FileManager.default.temporaryDirectory
        .appendingPathComponent(UUID().uuidString)
        .appendingPathExtension("ipa")
    let bytes = Data([0x50, 0x4B, 0x03, 0x04]) + Data(repeating: 0x6E, count: 160_000)
    try bytes.write(to: url, options: .atomic)
    defer { try? FileManager.default.removeItem(at: url) }

    let result = try LocalIPAInspector.inspect(url: url)
    #expect(result.byteCount == bytes.count)
    #expect(result.sha256 == LocalIPAInspector.sha256(of: bytes))
}

@Test func flagsSoonToExpireRecord() {
    let now = Date(timeIntervalSince1970: 1000)
    let record = SigningRecord(appName: "Test", expiry: now.addingTimeInterval(3600))
    #expect(record.state(now: now) == .expiringSoon)
}

@Test func policyHasNoRemoteExecutableFeature() {
    #expect(SideNekoPolicy.prohibitedCapabilities.contains(.remoteIPADownload))
    #expect(!SideNekoPolicy.prohibitedCapabilities.contains(.localImport))
}
