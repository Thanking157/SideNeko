# SideNeko 帳號與網路隱私

SideNeko 不使用自營伺服器。網站不接收 Apple ID、密碼或驗證碼。

App 內的實際資料流：

- Apple ID 密碼可依使用者選擇存於 iOS Keychain，服務名稱為
  `io.thanking157.SideNeko.appleID`。
- Apple ID、密碼與 2FA 流程直接連線到 Apple 的 `gsa.apple.com`；
  開發團隊、憑證、App ID 與描述檔連線到
  `developerservices2.apple.com`。
- Apple 登入需要 Anisette 裝置證明。SideNeko 預設只使用
  `https://new.ani.sidestore.io` 取得 Anisette 資料，不把 Apple ID
  或密碼放入該伺服器請求。伺服器仍可看見連線 IP 與 Anisette
  provisioning 所需資料。
- 已移除上游內建的不明社群 Anisette 伺服器清單與純 HTTP 端點；
  進階使用者仍可在設定中自行輸入端點。
- GitHub API 僅用於檢查 SideNeko 更新；SideStore、LiveContainer 與
  使用者貼上的 IPA HTTPS 網址只在使用者選擇下載／安裝時連線。
- 匯入的本機 IPA、配對檔、簽署私鑰與憑證不會上傳到 SideNeko 網站。

來源實作與進一步限制請參閱 `ORIGIN.md` 和
`SIDEINSTALLER_LICENSE.md`。
