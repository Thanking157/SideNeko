/*
 * SideNeko
 *
 * Copyright (C) 2026 thanking157
 *
 * Original code and integration by thanking157.
 *
 * Licensed under the GNU General Public License v3.0.
 */

import SwiftUI

/// Offline copies of the licences and notices shipped inside this exact build.
/// Keeping these in the app means the attribution remains available even if a
/// repository or website later moves.
struct LegalNoticesView: View {
    private struct Document: Identifiable {
        let id: String
        let title: String
        let detail: String
    }

    private static let documents = [
        Document(id: "ThirdPartyNotices", title: "SideNeko & third-party notices",
                 detail: "Project inventory, authors, versions and source links"),
        Document(id: "RustDependencies", title: "Rust dependency licences",
                 detail: "Locked packages and licence texts used by the iOS core"),
        Document(id: "SideNeko-GPL-3.0", title: "SideNeko — GPL-3.0",
                 detail: "Original SideNeko source code"),
        Document(id: "SideInstaller-LICENSE", title: "SideInstaller by FrizzleM",
                 detail: "Licence retained for the incorporated source derivative"),
        Document(id: "Bootstrap-MIT", title: "SideNeko bootstrap — MIT",
                 detail: "Modified minis and rootshell source"),
        Document(id: "idevice-MIT", title: "idevice — MIT",
                 detail: "Device communication library by Jackson Coxson"),
        Document(id: "isideload-MIT", title: "isideload — MIT",
                 detail: "Signing library by nab138"),
        Document(id: "apple-codesign-quick-LGPL-2.1",
                 title: "apple-codesign-quick — LGPL-2.1-or-later",
                 detail: "Code-signing library by Dadoum"),
    ]

    @State private var expanded: String?

    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                NekoSignature(compact: true)
                    .padding(.bottom, 4)
                Text(L("These licence texts are included inside this build and can be read without a network connection."))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(Self.documents) { document in
                    documentCard(document)
                }
            }
            .padding(20)
            .pageColumn()
        }
        .background(AppBackground())
        .navigationTitle(L("Licences & acknowledgements"))
        .navigationBarTitleDisplayMode(.inline)
    }

    private func documentCard(_ document: Document) -> some View {
        let isExpanded = expanded == document.id
        return PanelCard {
            VStack(alignment: .leading, spacing: 12) {
                Button {
                    withAnimation(.smooth(duration: 0.28)) {
                        expanded = isExpanded ? nil : document.id
                    }
                } label: {
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "doc.text")
                            .foregroundStyle(Theme.accent)
                            .frame(width: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(document.title)
                                .font(.subheadline.weight(.semibold))
                            Text(document.detail)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer(minLength: 8)
                        Image(systemName: "chevron.down")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(Theme.muted)
                            .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain, sound: .tick)

                if isExpanded {
                    Divider().overlay(Theme.hairline)
                    Text(text(for: document))
                        .font(.system(.caption2, design: .monospaced))
                        .foregroundStyle(.secondary)
                        .textSelection(.enabled)
                        .fixedSize(horizontal: false, vertical: true)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
        }
    }

    private func text(for document: Document) -> String {
        guard let url = Bundle.main.url(forResource: document.id, withExtension: "txt"),
              let text = try? String(contentsOf: url, encoding: .utf8) else {
            return L("This licence file is missing from the app bundle.")
        }
        return text
    }
}
