# SideNeko v1.0.0 Beta 發佈準備

這份文件是 v1.0 Beta 的實際發佈清單。它不代表真機流程已經通過，
也不會讓網站在 IPA 尚未公開時顯示成可安裝。

## 目前候選產物

- 版本：`1.0.0 (1)`
- Bundle ID：`io.thanking157.sideneko`
- URL Scheme：`sideneko`
- 架構：主程式與 Live Activity 都是 `arm64`
- 本機檔名：`dist/SideNeko.ipa`（Git 忽略，不提交進原始碼）
- SHA-256：`e863d1b00f5d9bfe4eba19af3313bd34e377fa876170dd128ad24195a646a3fd`

候選 IPA 已由目前的 SideNeko 原始碼建置，不是重新封裝的 SideInstaller
官方 IPA。以下指令已通過：

```sh
SideNekoFull/scripts/validate-ipa.sh dist/SideNeko.ipa
```

驗證器會拒絕缺少主程式識別、arm64、Live Activity、SideNeko URL Scheme、
Apple 登入／簽署／配對 FFI 的包，也會拒絕含簽署描述檔、帳密、配對資料或
既有簽章的包。舊 `v0.1.0-beta` IPA 會因缺少 `CFBundleExecutable` 被拒絕。

## 發佈關卡

- [x] 完整簽署與裝置 Rust 核心測試通過（181 項）。
- [x] SideNeko bootstrap 測試通過（Open Minis 108 項；rootshell 16 項）。
- [x] Swift 核心、翻譯完整性與 Rust Clippy 嚴格檢查通過。
- [x] Xcode 27.2 建置 generic iOS device 與 generic iOS Simulator 成功。
- [x] App 已套用 SideNeko 自有暖橘貓系視覺；畫面不顯示上游專案名稱，
  必要來源歸屬保留在授權文件與衍生原始碼標頭。
- [x] 自有 bootstrap 與配對 WASM 已由追蹤的 SideNeko 原始碼建置並部署。
- [x] 網站、bootstrap 與公開二進位均由 `thanking157.github.io/SideNeko` 提供。
- [ ] 取得 SideInstaller 著作權人的書面允許，可公開散布編譯後的 SideNeko
  衍生 IPA；現行授權只明文授予衍生原始碼散布。
- [ ] 在 iPhone 17 / iOS 27.3 完整跑過網站 → rootshell 配對 → Open Minis
  bootstrap → Apple ID/2FA → 簽署 → 安裝 → 首次開啟。

未通過最後兩個關卡前，`docs/release.json` 必須保持 `available: false`，
不得把本機候選 IPA 冒充成已驗證的公開 Beta。

## 關卡通過後的固定發佈格式

1. 從乾淨 checkout 重新執行 `SideNekoFull/scripts/build-ipa.sh`。
2. 再執行 `SideNekoFull/scripts/validate-ipa.sh <IPA>`。
3. GitHub prerelease 標籤使用 `v1.0.0-beta`。
4. Release 資產必須命名為 `SideNeko.ipa`；bootstrap 的固定網址為：

   `https://github.com/Thanking157/SideNeko/releases/latest/download/SideNeko.ipa`

5. 將新產物的 SHA-256 寫入 `docs/release.json`，並設定：

   - `available: true`
   - `channel: beta`
   - `version: v1.0.0-beta`
   - `installURL: https://thanking157.github.io/SideNeko/#guide`
   - `downloadURL`: 上述 GitHub Release 資產網址

6. 部署網站後，從公開網址重新下載 IPA，再跑一次驗證器並比對 SHA-256。
7. 只有公開檔與真機測試都通過，才把版本說明改成「可測試」；不宣稱所有
   iPhone 都能成功，也不承諾免費簽署永不過期或撤銷。

## v1.0.0 Beta Release 說明草稿

SideNeko v1.0.0 Beta ฅ^•ﻌ•^ฅ

- 自己的 Apple ID 登入與雙重驗證
- 免費 Apple ID 簽署、IPA 匯入與安裝
- 裝置配對、配對檔管理與 LocalDevVPN 流程
- 已安裝 App、描述檔與簽署期限管理
- SideStore 與 LiveContainer 官方版本快速安裝
- SideNeko 自己維護的 Open Minis／rootshell bootstrap
- 繁體中文、英文與暖橘色貓咪介面

這是未簽署的 arm64 測試 IPA，會在目標 iPhone 上使用測試者自己的 Apple
帳號簽署。Beta 尚不能保證所有裝置或未來 iOS 版本都能成功，免費帳號的
描述檔通常有期限，Apple 也可能撤銷憑證或改變服務行為。
