/*
 * SideNeko
 *
 * Copyright (C) 2026 thanking157
 *
 * Original code and integration by thanking157.
 *
 * Licensed under the GNU General Public License v3.0.
 */

import CryptoKit
import Foundation

public enum SideNekoPolicy {
    public static let projectName = "SideNeko"
    public static let tagline = "Sideloading, the neko way."

    /// Network executables and shared signing infrastructure are intentionally
    /// out of scope. This keeps a user's file and account out of a third-party
    /// distribution channel.
    public static let prohibitedCapabilities: Set<Capability> = [
        .appStore, .remoteIPADownload, .enterpriseCertificate, .sharedSigningIdentity
    ]

    public enum Capability: String, CaseIterable, Sendable {
        case appStore
        case remoteIPADownload
        case enterpriseCertificate
        case sharedSigningIdentity
        case localImport
        case signingExpiryDisplay
        case sideStoreGuide
        case liveContainerGuide
    }
}

public struct LocalIPA: Codable, Sendable, Equatable, Identifiable {
    public let id: UUID
    public let displayName: String
    public let byteCount: Int
    public let sha256: String
    public let importedAt: Date

    public init(
        id: UUID = UUID(),
        displayName: String,
        byteCount: Int,
        sha256: String,
        importedAt: Date = .now
    ) {
        self.id = id
        self.displayName = displayName
        self.byteCount = byteCount
        self.sha256 = sha256.lowercased()
        self.importedAt = importedAt
    }
}

public enum ImportError: LocalizedError, Equatable {
    case notAnIPA
    case emptyFile
    case notZIPArchive
    case unreadableFile

    public var errorDescription: String? {
        switch self {
        case .notAnIPA: "Choose a local .ipa file."
        case .emptyFile: "The chosen file is empty."
        case .notZIPArchive: "The chosen .ipa is not a ZIP archive."
        case .unreadableFile: "The chosen file could not be read."
        }
    }
}

public enum LocalIPAInspector {
    public static func inspect(filename: String, data: Data) throws -> LocalIPA {
        guard filename.lowercased().hasSuffix(".ipa") else { throw ImportError.notAnIPA }
        guard !data.isEmpty else { throw ImportError.emptyFile }
        guard hasZIPSignature(data.prefix(4)) else { throw ImportError.notZIPArchive }
        return LocalIPA(displayName: filename, byteCount: data.count, sha256: sha256(of: data))
    }

    /// Hashes a document-picker URL incrementally so a large IPA does not need
    /// to be held in memory. The caller remains responsible for security-scoped
    /// URL access while this method runs.
    public static func inspect(url: URL) throws -> LocalIPA {
        guard url.pathExtension.lowercased() == "ipa" else { throw ImportError.notAnIPA }
        guard let handle = try? FileHandle(forReadingFrom: url) else { throw ImportError.unreadableFile }
        defer { try? handle.close() }

        guard let firstChunk = try? handle.read(upToCount: 64 * 1024), !firstChunk.isEmpty else {
            throw ImportError.emptyFile
        }
        guard hasZIPSignature(firstChunk.prefix(4)) else { throw ImportError.notZIPArchive }

        var hasher = SHA256()
        hasher.update(data: firstChunk)
        var byteCount = firstChunk.count
        while true {
            do {
                guard let chunk = try handle.read(upToCount: 64 * 1024), !chunk.isEmpty else { break }
                hasher.update(data: chunk)
                byteCount += chunk.count
            } catch {
                throw ImportError.unreadableFile
            }
        }
        let digest = hasher.finalize().map { String(format: "%02x", $0) }.joined()
        return LocalIPA(displayName: url.lastPathComponent, byteCount: byteCount, sha256: digest)
    }

    public static func sha256(of data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }

    private static func hasZIPSignature<C: Collection>(_ bytes: C) -> Bool where C.Element == UInt8 {
        let value = Array(bytes)
        guard value.count == 4 else { return false }
        return value[0] == 0x50 && value[1] == 0x4B && [0x03, 0x05, 0x07].contains(value[2]) && [0x04, 0x06, 0x08].contains(value[3])
    }
}

public struct SigningRecord: Sendable, Equatable, Identifiable {
    public let id: UUID
    public let appName: String
    public let expiry: Date

    public init(id: UUID = UUID(), appName: String, expiry: Date) {
        self.id = id
        self.appName = appName
        self.expiry = expiry
    }

    public func state(now: Date = .now) -> SigningState {
        if expiry <= now { return .expired }
        if expiry.timeIntervalSince(now) < 86_400 * 2 { return .expiringSoon }
        return .active
    }
}

public enum SigningState: String, Sendable { case active, expiringSoon, expired }
