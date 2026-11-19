# SideNeko

> Sideloading, the neko way.
> by Thanking157

SideNeko 是一個免費、非商業、開源的 iOS／iPadOS 免電腦 IPA 側載工具專案。
目標是讓一般使用者只用自己的裝置與 Apple 帳號，就能匯入、簽署、安裝及管理
自己有權使用的 IPA。

Copyright (C) 2026 thanking157。SideNeko 原創程式碼採用
[GNU GPL v3.0](COPYING.md)；第三方元件與研究來源記錄於
[THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

[English README](README.en.md)

- 專案原始碼：<https://github.com/Thanking157/SideNeko>
- 安裝網站：<https://thanking157.github.io/SideNeko/>

## v1.0 目標

- iPhone／iPad 裝置端首次安裝，不依賴 Mac 或 Windows 電腦。
- 使用者自行登入 Apple 帳號，支援雙重驗證。
- 從「檔案」匯入使用者自己的 IPA。
- 在裝置端建立開發簽署、安裝及管理 App。
- 顯示簽署到期日與即將到期提醒。
- 提供 SideStore 與 LiveContainer 的明確快速安裝入口。
- 繁體中文優先，並提供英文。
- 所有秘密資料留在本機；不經過 SideNeko 自營伺服器。

## 明確不做

- App 商店或線上 IPA 資源庫。
- 任意第三方 IPA 的自動搜尋或下載。
- 共享企業憑證、來路不明的已簽署 IPA。
- SideNeko 自營 Apple 帳號、簽署或 Anisette 伺服器。
- 宣稱支援所有 iPhone，或承諾永不掉簽。

## 目前狀態

已完成：

- SwiftUI iPhone／iPad 介面骨架。
- 繁體中文與英文資源。
- 本機 IPA 分段讀取、ZIP 基本檢查與 SHA-256。
- 本機清單保存、檢視及刪除。
- 簽署狀態資料模型與安全界線。
- macOS 核心測試、iOS 模擬器通用編譯、實體 iOS 通用編譯。

開發中：

- Apple 帳號 SRP 登入與雙重驗證。
- Anisette 服務揭露、選擇與本機狀態保護。
- 開發憑證、App ID、Provisioning Profile 與 IPA 簽署。
- iOS 27 自機配對、安裝與更新。
- Open Minis 裝置端首次安裝 bootstrap。
- SideStore／LiveContainer 實際快速安裝流程。
- iPhone 17／iOS 27.3 與 iPad 實機驗證。

「編譯成功」不等於上述未完成項目已在真實帳號與裝置通過。

## 首次安裝設計

SideNeko 參考 SideInstaller／siboot 公開說明所呈現的 iOS 27 自機安裝方法：
在目標裝置使用 Open Minis 與本機 VPN／配對通道，於裝置端完成 Apple 帳號登入、
簽署及安裝。SideNeko 會使用自行撰寫、可稽核的 bootstrap；不會重發
SideInstaller IPA、共享憑證或未獲授權的 siboot 程式碼。

GitHub Pages 安裝網站只負責提供公開原始碼、版本資訊、雜湊與 bootstrap 指引。
網站本身不能繞過 iOS 簽署要求，未簽署 IPA 不能只靠網頁直接安裝。

## 隱私

- Apple 帳號密碼只可短暫存在登入程序記憶體中，不寫入日誌或一般檔案。
- 2FA 驗證碼不保存。
- 開發 token、Anisette 狀態、憑證與私鑰必須使用裝置限定 Keychain。
- 遠端 Anisette 端點必須在登入前清楚顯示；SideNeko 不會將它描述成完全離線。
- IPA 雜湊在本機計算，不上傳 IPA。

詳見 [安全說明](docs/SECURITY.md) 與
[簽署引擎審查](docs/SIGNING_ENGINE_REVIEW.md)。

## 建置與測試

核心測試：

```sh
swift test
```

先執行 `scripts/build-signing-core.sh` 產生本機 XCFramework，再使用 Xcode 開啟
`SideNeko.xcodeproj` 建置 iOS／iPadOS App。目前最低部署版本為 iOS 17；免電腦
自機配對路徑以 iOS 27 為目標。

測試狀態與尚待實機驗證項目請看 [TESTING.md](docs/TESTING.md)。

## 上游與授權

目前正式 App target 尚未編入 SideInstaller 或 siboot 原始碼。原因不是「不用它們的
方法」，而是必須先尊重逐檔授權：SideInstaller 授權只明確允許散布衍生原始碼，
且禁止重發官方 IPA；siboot 倉庫目前未找到授權檔，因此不能直接複製或重發。

Apple 登入與簽署核心已連結固定版本的 MIT `nab138/isideload`；Apple ID、2FA、
簽署和安裝介面仍未開放，待 Keychain、遮罩、取消與實機測試通過。發布時會保留
完整 MIT 聲明並列出所有依賴，不會把第三方程式碼標成 SideNeko 原創。

詳見 [上游審查](docs/UPSTREAM_REVIEW.md)。
