/*
 * Based on SideInstaller by FrizzleM
 * Copyright (C) 2026 FrizzleM
 * Modified and integrated into SideNeko by thanking157.
 * Copyright (C) 2026 thanking157
 * Licensed for non-commercial source distribution under SIDEINSTALLER_LICENSE.md.
 */

import Foundation

/// The language the interface is drawn in; `auto` follows the iPhone's.
enum AppLanguage: String, CaseIterable, Identifiable {
    case auto
    case english
    case traditionalChinese

    var id: String { rawValue }

    /// Picker label, each language named in itself so it can be recognised.
    var displayName: String {
        switch self {
        case .auto:       return L("Auto")
        case .english:    return "English"
        case .traditionalChinese: return "繁體中文"
        }
    }

    /// `auto` resolved against the phone, falling back to English, the source
    /// language; a pinned case returns itself.
    var resolved: AppLanguage {
        guard self == .auto else { return self }
        let preferred = Locale.preferredLanguages.first ?? "en"
        switch preferred.prefix(2) {
        case "zh":
            let normalized = preferred.lowercased()
            return normalized.contains("hant") || normalized.contains("-tw") ||
                normalized.contains("-hk") || normalized.contains("-mo")
                ? .traditionalChinese : .english
        default:   return .english
        }
    }

    /// The copy for this language, or nil for the source language.
    fileprivate var table: [String: String]? {
        switch self {
        case .traditionalChinese: return traditionalChineseStrings
        case .auto, .english: return nil
        }
    }
}

/// Owns and persists the language choice, republishing it so views holding a
/// `@EnvironmentObject var loc: Localizer` redraw. A singleton because `L(_:)`
/// is a free function called from background queues too.
final class Localizer: ObservableObject {

    static let shared = Localizer()

    private static let defaultsKey = "appLanguage"

    @Published var language: AppLanguage {
        didSet {
            guard language != oldValue else { return }
            UserDefaults.standard.set(language.rawValue, forKey: Self.defaultsKey)
            Localizer.effective = language.resolved
        }
    }

    /// `language` with `.auto` resolved, as a static `L(_:)` can read from any
    /// thread. Nil until the singleton has been built.
    fileprivate static var effective: AppLanguage?

    /// Language used by `L(_:)`. Falls back to `shared` (creating it) when `L`
    /// is called before the singleton exists.
    fileprivate static var effectiveLanguage: AppLanguage {
        effective ?? shared.language.resolved
    }

    private init() {
        let stored = UserDefaults.standard.string(forKey: Self.defaultsKey)
            .flatMap(AppLanguage.init(rawValue:)) ?? .auto
        language = stored                       // didSet doesn't run in init, so set `effective` below
        Localizer.effective = stored.resolved
    }
}

extension Localizer {
    /// Locale for dates and numbers, so they match the copy around them.
    static var locale: Locale {
        switch shared.language {
        case .auto:       return phoneLocale
        case .english:    return Locale(identifier: "en_US")
        case .traditionalChinese: return Locale(identifier: "zh_Hant_TW")
        }
    }

    /// The phone's region in the language the copy resolved to. The app's own
    /// current locale takes its language from the bundle, which is English
    /// only, so an Italian phone got "en_IT": Italian copy next to English
    /// unit and month names ("1 min, 30 secs").
    private static var phoneLocale: Locale {
        let language: String
        switch AppLanguage.auto.resolved {
        case .traditionalChinese: language = "zh_Hant"
        case .auto, .english: return .autoupdatingCurrent
        }
        guard let region = Locale.autoupdatingCurrent.region?.identifier else {
            return Locale(identifier: language)
        }
        return Locale(identifier: "\(language)_\(region)")
    }
}

/// Translate one source string, falling back to the English key itself.
func L(_ key: String) -> String {
    Localizer.effectiveLanguage.table?[key] ?? key
}

/// `L` for copy with values in it, as a `String(format:)` pattern.
func L(_ key: String, _ arguments: CVarArg...) -> String {
    String(format: L(key), arguments: arguments)
}
