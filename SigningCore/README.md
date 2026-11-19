# SideNeko SigningCore

這是 SideNeko 自行撰寫的 Swift／Rust FFI 邊界。Rust 靜態函式庫預計承載 Apple
帳號 SRP 登入、雙重驗證、開發者服務、簽署及裝置通訊。

目前 FFI 只公開版本與編譯能力，不接受帳號、密碼或 2FA。這是刻意的安全閘門：
Keychain、日誌遮罩、取消、端點 allow-list 與記憶體處理完成測試前，不會把未驗證
的 credential API 接到 SwiftUI。

啟用 `engine` feature 會連結 MIT 授權的 `isideload` 0.5.2。正式發行必須一併提供
其完整 MIT 授權及所有 transitive dependency notices。
