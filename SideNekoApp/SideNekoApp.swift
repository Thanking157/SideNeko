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
import UniformTypeIdentifiers

private enum SigningCoreBridge {
    static let version: String = String(cString: sideneko_signing_core_version())

    static let capabilities: [String: Bool] = {
        let json = String(cString: sideneko_signing_core_capabilities_json())
        guard let data = json.data(using: .utf8),
              let value = try? JSONDecoder().decode([String: Bool].self, from: data) else { return [:] }
        return value
    }()
}

@main
struct SideNekoApp: App {
    @StateObject private var library = IPALibrary()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(library)
        }
    }
}

@MainActor
private final class IPALibrary: ObservableObject {
    @Published private(set) var items: [LocalIPA] = []

    private let defaultsKey = "io.thanking157.sideneko.local-ipa-library.v1"
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init() {
        guard let data = UserDefaults.standard.data(forKey: defaultsKey),
              let saved = try? decoder.decode([LocalIPA].self, from: data) else { return }
        items = saved.sorted { $0.importedAt > $1.importedAt }
    }

    func add(_ item: LocalIPA) {
        items.removeAll { $0.sha256 == item.sha256 }
        items.insert(item, at: 0)
        save()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    private func save() {
        guard let data = try? encoder.encode(items) else { return }
        UserDefaults.standard.set(data, forKey: defaultsKey)
    }
}

private struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem { Label("首頁", systemImage: "pawprint.fill") }
                .tag(0)
            LibraryView()
                .tabItem { Label("本機 IPA", systemImage: "folder.fill") }
                .tag(1)
            SigningView()
                .tabItem { Label("簽署狀態", systemImage: "calendar") }
                .tag(2)
            SafetyView()
                .tabItem { Label("安全", systemImage: "lock.shield.fill") }
                .tag(3)
        }
        .tint(.indigo)
    }
}

private struct HomeView: View {
    @Binding var selectedTab: Int

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: "cat.fill")
                            .font(.system(size: 44))
                            .foregroundStyle(.indigo)
                        Text("SideNeko")
                            .font(.largeTitle.bold())
                        Text("Sideloading, the neko way.")
                            .foregroundStyle(.secondary)
                        Text("by Thanking157")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.indigo.opacity(0.10), in: RoundedRectangle(cornerRadius: 24))

                    Text("從自己的檔案開始")
                        .font(.title3.bold())
                    Button {
                        selectedTab = 1
                    } label: {
                        Label("選擇本機 IPA", systemImage: "square.and.arrow.down")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    NoticeCard(
                        title: "目前是安全基礎版",
                        detail: "可檢視自己選的 IPA、計算 SHA-256 與記錄簽署期限。簽署與安裝仍在可行性和安全審查中，尚未啟用。",
                        symbol: "shield.lefthalf.filled"
                    )

                    Text("快速選項")
                        .font(.title3.bold())
                    HStack(spacing: 12) {
                        QuickOption(name: "SideStore", symbol: "arrow.triangle.2.circlepath")
                        QuickOption(name: "LiveContainer", symbol: "shippingbox.fill")
                    }
                    Text("這些選項目前只會開啟官方使用說明；SideNeko 不會代為下載或散布 IPA。")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
            .navigationTitle("嗨，ねこ！")
        }
    }
}

private struct LibraryView: View {
    @EnvironmentObject private var library: IPALibrary
    @State private var showImporter = false
    @State private var errorText: String?

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button { showImporter = true } label: {
                        Label("選擇本機 IPA", systemImage: "doc.badge.plus")
                    }
                } footer: {
                    Text("檔案只在本機讀取以計算 SHA-256；不會上傳、下載或執行。")
                }
                if !library.items.isEmpty {
                    Section("已選擇") {
                        ForEach(library.items) { imported in
                            NavigationLink {
                                IPAInfoView(ipa: imported)
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(imported.displayName).font(.headline)
                                    Text(ByteCountFormatter.string(fromByteCount: Int64(imported.byteCount), countStyle: .file))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .onDelete(perform: library.delete)
                    }
                } else {
                    ContentUnavailableView("還沒有選擇 IPA", systemImage: "folder", description: Text("請從「檔案」挑選你已有的 .ipa。"))
                }
            }
            .navigationTitle("本機 IPA")
            .fileImporter(isPresented: $showImporter, allowedContentTypes: [.data], allowsMultipleSelection: false) { result in
                do {
                    let url = try result.get().first!
                    let granted = url.startAccessingSecurityScopedResource()
                    defer { if granted { url.stopAccessingSecurityScopedResource() } }
                    library.add(try LocalIPAInspector.inspect(url: url))
                } catch { errorText = error.localizedDescription }
            }
            .alert("無法讀取檔案", isPresented: Binding(get: { errorText != nil }, set: { if !$0 { errorText = nil } })) {
                Button("好", role: .cancel) {}
            } message: { Text(errorText ?? "") }
        }
    }
}

private struct IPAInfoView: View {
    let ipa: LocalIPA

    var body: some View {
        List {
            Section("檔案資訊") {
                LabeledContent("檔案", value: ipa.displayName)
                LabeledContent("大小", value: ByteCountFormatter.string(fromByteCount: Int64(ipa.byteCount), countStyle: .file))
                LabeledContent("加入日期", value: ipa.importedAt.formatted(date: .abbreviated, time: .shortened))
            }
            Section {
                Text(ipa.sha256)
                    .font(.caption.monospaced())
                    .textSelection(.enabled)
            } header: {
                Text("SHA-256")
            } footer: {
                Text("雜湊只能用來比對檔案是否相同，不代表檔案一定安全。")
            }
            Section {
                Label("尚未簽署", systemImage: "signature")
                    .foregroundStyle(.secondary)
            } footer: {
                Text("目前版本不會要求 Apple 帳號資料，也尚未啟用簽署或安裝。")
            }
        }
        .navigationTitle(ipa.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct SigningView: View {
    @EnvironmentObject private var library: IPALibrary

    var body: some View {
        NavigationStack {
            List {
                if library.items.isEmpty {
                    ContentUnavailableView("沒有可顯示的 App", systemImage: "calendar.badge.exclamationmark", description: Text("加入本機 IPA 後會顯示在這裡。"))
                } else {
                    Section("本機項目") {
                        ForEach(library.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.displayName)
                                    Text("尚未簽署")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Image(systemName: "minus.circle")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                Section { Text("免費帳號常見的短期簽署限制不會因本 App 而消失；SideNeko 不承諾永不掉簽。") }
            }
            .navigationTitle("簽署狀態")
        }
    }
}

private struct SafetyView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("我們不做") {
                    Label("不收集 Apple 帳號密碼或雙重驗證碼", systemImage: "person.crop.circle.badge.xmark")
                    Label("不下載第三方 IPA，也沒有 App 商店", systemImage: "arrow.down.to.line.compact")
                    Label("不用共享企業憑證或自營簽署伺服器", systemImage: "server.rack")
                }
                Section("你可以做") {
                    Label("只從信任的原作者取得 IPA", systemImage: "checkmark.seal")
                    Label("比對原作者提供的 SHA-256", systemImage: "number.square")
                    Label("不要將憑證、私鑰或驗證碼貼進回報", systemImage: "lock")
                }
                Section("授權") {
                    LabeledContent("SideNeko 原創程式碼", value: "GPL-3.0-only")
                    Text("Copyright © 2026 thanking157")
                }
                Section("簽署核心") {
                    LabeledContent("版本", value: SigningCoreBridge.version)
                    LabeledContent("已連結引擎", value: SigningCoreBridge.capabilities["engine"] == true ? "是" : "否")
                }
            }
            .navigationTitle("安全與隱私")
        }
    }
}

private struct NoticeCard: View {
    let title: String; let detail: String; let symbol: String
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: symbol).foregroundStyle(.indigo)
            VStack(alignment: .leading) { Text(title).bold(); Text(detail).font(.footnote).foregroundStyle(.secondary) }
        }.padding().background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

private struct QuickOption: View {
    let name: String; let symbol: String
    var body: some View {
        Link(destination: officialURL) {
            Label(name, systemImage: symbol)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
    }

    private var officialURL: URL {
        if name == "SideStore" {
            URL(string: "https://sidestore.io/")!
        } else {
            URL(string: "https://github.com/LiveContainer/LiveContainer")!
        }
    }
}
