/*
 * Based on SideInstaller by FrizzleM
 * Copyright (C) 2026 FrizzleM
 * Modified and integrated into SideNeko by thanking157.
 * Copyright (C) 2026 thanking157
 * Licensed for non-commercial source distribution under SIDEINSTALLER_LICENSE.md.
 */

import Foundation

/// Traditional Chinese translations (same rules as `spanishStrings`). Uses Apple's
/// zh-Hant wording for Settings paths and "tap", full-width punctuation, 吊銷 for
/// "revoke", and 你 for "you".

let traditionalChineseStrings: [String: String] = [

    // MARK: - Shared

    "Licences & acknowledgements": "授權與致謝",
    "Read the open-source licences included with this build.": "閱讀此版本內附的開源授權條款。",
    "These licence texts are included inside this build and can be read without a network connection.":
        "這些授權文字已包含在此版本中，沒有網路也可以閱讀。",
    "This licence file is missing from the app bundle.": "App 內缺少這份授權檔案。",

    "Cancel": "取消",
    "Copy": "複製",
    "Copy logs": "複製日誌",
    "Email": "電子郵件",
    "Password": "密碼",
    "Install": "安裝",
    "Installing": "正在安裝",
    "Cancelling": "正在取消",
    "Installed": "已安裝",
    "Something went wrong": "出了點問題",
    "device": "設備",

    // MARK: - Welcome

    "I have accepted the": "我已接受",
    "Start": "開始",

    // Pre-iOS 27: the pairing file has to be imported

    "You'll need a pairing file": "你需要一個配對文件",
    "This iPhone runs iOS %@. Only iOS %@ can pair with itself, so you'll have to make a pairing file on a computer — with jitterbugpair or pymobiledevice3 — and import it in the app. SideNeko walks you through it.":
        "本機運行 iOS %@。只有 iOS %@ 能與自身配對，因此你需要在電腦上用 jitterbugpair 或 pymobiledevice3 生成配對文件，再導入到 App 中。SideNeko 會逐步引導你。",

    // iOS 27 runs on this iPhone: recommended at setup

    "Update to iOS %@": "更新到 iOS %@",
    "This iPhone can run iOS %@, where SideNeko works without a computer: the iPhone pairs with itself, so there's no pairing file to make. Update in Settings › General › Software Update.":
        "此 iPhone 可以運行 iOS %@。在該版本上，SideNeko 無需電腦即可使用：iPhone 會與自身配對，因此無需生成配對文件。請在 設置 › 通用 › 軟件更新 中更新。",
    "OK": "好",

    // MARK: - Account setup & Settings › Account

    "Sign in with your Apple ID": "使用你的 Apple ID 登錄",
    "Don't worry, these are stored locally":
        "別擔心，這些信息只保存在本機",
    "Saved in this iPhone's keychain, and sent only to Apple when signing in.":
        "保存在本機的鑰匙串中，僅在登錄時發送給 Apple。",
    "Continue": "繼續",
    "Set this up later": "稍後設置",
    "Add Apple ID": "添加 Apple ID",
    "Edit Apple ID": "編輯 Apple ID",
    "Save": "存儲",
    "Enter the password again to save this Apple ID.": "請再次輸入密碼以保存此 Apple ID。",
    "Account": "賬戶",
    "In use": "使用中",
    "Edit": "編輯",
    "Remove": "移除",
    "No Apple ID saved yet. Add one and SideNeko will use it for every sign-in.":
        "尚未保存 Apple ID。添加一個後，SideNeko 每次登錄都會使用它。",
    "Saved in this iPhone's keychain, and sent only to Apple when signing in. Swipe a row to edit its password or remove it.":
        "保存在本機的鑰匙串中，僅在登錄時發送給 Apple。左滑某一行可修改其密碼或將其移除。",
    "Remove this Apple ID?": "移除此 Apple ID？",
    "“%@” and its saved password will be deleted from this iPhone. Nothing changes on your Apple account.":
        "“%@”及其保存的密碼將從本機刪除。你的 Apple 賬戶不會有任何變化。",
    "This iPhone's keychain refused to store the password (error %d), so it's kept only until SideNeko quits.":
        "本機鑰匙串拒絕保存該密碼（錯誤 %d），因此密碼只會保留到 SideNeko 退出為止。",
    "No Apple ID saved. Add one in Settings › Account.": "尚未保存 Apple ID。請在“設置 › 賬戶”中添加一個。",

    "Add your Apple ID": "添加你的 Apple ID",
    "Open Settings with the gear at the top right.": "點按右上角的齒輪打開設置。",
    "Under Account, tap “Add Apple ID” and enter your email and password.":
        "在“賬戶”一節中點按“添加 Apple ID”，然後輸入你的電子郵件和密碼。",

    // MARK: - Tabs, Tools menu & two-factor prompt

    "Tools": "工具",

    // MARK: - Tabs & two-factor prompt

    "Pairing": "配對",
    "Certificates": "證書",
    "Two-Factor Code": "雙重認證驗證碼",
    "6-digit code": "6 位驗證碼",
    "Submit": "提交",
    "Enter the code Apple just sent to your trusted device.":
        "請輸入 Apple 剛剛發送到你受信任設備的驗證碼。",
    "Enter the code Apple texted to %@.":
        "輸入 Apple 通過短信發送到 %@ 的驗證碼。",
    "Enter the code Apple texted to your phone.":
        "輸入 Apple 通過短信發送到你手機的驗證碼。",
    "Apple is calling %@. Enter the code you hear.":
        "Apple 正在撥打 %@。請輸入你聽到的驗證碼。",
    "Apple is calling your phone. Enter the code you hear.":
        "Apple 正在撥打你的電話。請輸入你聽到的驗證碼。",
    "Choose how Apple should send your verification code.":
        "選擇 Apple 發送驗證碼的方式。",
    "Choose How to Get a Code":
        "選擇獲取驗證碼的方式",
    "Verify":
        "驗證",
    "Didn't get it?":
        "沒有收到？",
    "Send a new code to my devices":
        "向我的設備發送新驗證碼",
    "Text me a new code":
        "通過短信給我發送新驗證碼",
    "Call me again":
        "再次給我打電話",
    "Send a code to my Apple devices":
        "向我的 Apple 設備發送驗證碼",
    "Text %@":
        "發短信到 %@",
    "Call %@":
        "撥打 %@",
    "Checking the code…":
        "正在驗證驗證碼…",
    "Requesting a new code…":
        "正在請求新驗證碼…",
    "Sending a code to your devices…":
        "正在向你的設備發送驗證碼…",
    "Texting a code to %@…":
        "正在通過短信將驗證碼發送到 %@…",
    "Calling %@…":
        "正在撥打 %@…",

    // MARK: - Install tab

    "Tunnel connected": "隧道已連接",
    "Tunnel off": "隧道已關閉",
    "Update available": "有可用更新",
    "SideNeko %@ is available — you're on %@.":
        "SideNeko %@ 已發佈 —— 你當前使用的是 %@。",
    "Get the latest version": "獲取最新版本",
    "From the website": "從網站安裝",
    "Sign it with your Apple ID": "用你的 Apple ID 簽名",
    "Install it in LiveContainer": "安裝到 LiveContainer",
    "LiveContainer isn't installed on this iPhone.": "這台 iPhone 上沒有安裝 LiveContainer。",
    "Release": "渠道",
    "Reinstall": "重新安裝",
    "Install %@": "安裝 %@",
    "Custom .ipa": "自定義 .ipa",
    "Import .ipa": "導入 .ipa",
    "Importing…": "正在導入…",
    "Replace": "更換",
    "or": "或",
    "Paste a download link": "粘貼下載鏈接",
    "SideNeko recognizes this as %@ and sets it up just like its own download.":
        "SideNeko 識別出這是 %@，會像它自己下載的版本一樣完成設置。",
    "Downloading… %d%%": "正在下載… %d%%",
    "iOS %@ required": "需要 iOS %@",
    "This iPhone runs iOS %@, which SideNeko can't install on. Update to iOS %@ or later in Settings › General › Software Update.":
        "此 iPhone 運行的是 iOS %@，SideNeko 無法在該版本上安裝。請在 設置 › 通用 › 軟件更新 中更新到 iOS %@ 或更高版本。",
    "Wi-Fi required": "需要 Wi-Fi",
    "Pairing code": "配對碼",
    "Type this into the prompt in Settings.":
        "將它輸入到 設置 中的提示框內。",
    "Install stopped": "安裝已停止",
    "Close": "關閉",
    "Yes": "是",
    "No": "否",
    "Closing this popup will end the process. Are you sure?":
        "關閉此彈窗將終止當前流程。確定要關閉嗎？",
    "Cancel the install?": "要取消安裝嗎？",
    "%@ is installed. Finish the trust step above to open it.":
        "%@ 已安裝。完成上面的信任步驟即可打開。",
    "%@ is installed. Finish the trust step below to open it.":
        "%@ 已安裝。完成下面的信任步驟即可打開。",
    "Success: last steps": "成功：最後幾步",
    "Action needed": "需要操作",
    "Step %@ of %@": "第 %@ 步，共 %@ 步",
    "Show all steps": "顯示所有步驟",
    "Show fewer steps": "收起步驟",

    // MARK: - LocalDevVPN

    "LocalDevVPN required": "需要 LocalDevVPN",
    "Install LocalDevVPN and connect it. The install runs over its tunnel.":
        "安裝 LocalDevVPN 並連接。安裝過程走它的隧道。",
    "Connect LocalDevVPN to scan and install. The write runs over its tunnel.":
        "連接 LocalDevVPN 以掃描和安裝。寫入走它的隧道。",
    "Connect LocalDevVPN. Spoofing runs over its tunnel, like everything else here.":
        "連接 LocalDevVPN。和這裡的其他功能一樣，模擬也走它的隧道。",
    "LocalDevVPN isn't connected. Connect it, then try again.": "LocalDevVPN 未連接。請先連接，然後重試。",
    "Connect LocalDevVPN": "連接 LocalDevVPN",
    "Install LocalDevVPN from the App Store and open it.": "從 App Store 安裝 LocalDevVPN 並打開它。",
    "If GitHub is blocked where you are, use a VPN that can proxy your traffic too: iOS runs one VPN at a time, so a local-only tunnel leaves nothing to download SideStore through.":
        "如果你所在的地區無法訪問 GitHub，請使用同時能代理流量的 VPN：iOS 一次只能運行一個 VPN，僅限本地的隧道會讓 SideStore 無法下載。",

    // MARK: - Install steps

    "Connect the VPN": "連接 VPN",
    "Get pairing file": "獲取配對文件",
    "Open the device link": "打開設備連接",
    "Sign in to Apple ID": "登錄 Apple ID",
    "Download %@": "下載 %@",
    "Use your imported IPA": "使用已導入的 IPA",
    "Use a custom .ipa instead": "改用自定義 .ipa",
    "Pick an .ipa to install.": "請選擇要安裝的 .ipa。",
    "Signed with the Apple ID and installed as it is, without a pairing file.": "用該 Apple ID 簽名後原樣安裝，不附帶配對文件。",
    "Open %@.": "打開 %@。",
    "Sign the app": "為應用簽名",
    "Finish setup": "完成設置",

    // MARK: - Pairing tab

    "Pairing file ready": "配對文件已就緒",
    "No pairing file": "沒有配對文件",
    "Pairing file": "配對文件",
    "Pairing…": "正在配對…",
    "Regenerate": "重新生成",
    "Generate pairing file": "生成配對文件",
    "Export pairing file": "導出配對文件",
    "Pair in Settings": "在 設置 中配對",
    "Install into an app": "安裝到應用",
    "Scanning": "正在掃描",
    "Rescan apps": "重新掃描應用",
    "Scan installed apps": "掃描已安裝的應用",
    "%d supported app installed": "已安裝 %d 個受支持的應用",
    "%d supported apps installed": "已安裝 %d 個受支持的應用",
    "No supported apps found": "未找到受支持的應用",
    "Install an app like SideStore, StikDebug, or Feather first, then rescan.":
        "請先安裝 SideStore、StikDebug 或 Feather 之類的應用，然後重新掃描。",
    "Install pairing": "安裝配對文件",
    "Pairing file ready. You can export it or install it into an app below.":
        "配對文件已就緒。你可以導出，或安裝到下面的某個應用中。",
    "Pairing file installed into %@.": "配對文件已安裝到 %@。",
    "Install pairing into all apps": "將配對文件安裝到所有應用",
    "Installing into all apps": "正在安裝到所有應用",
    "Pairing file installed into all %d apps.": "配對文件已安裝到全部 %d 個應用。",
    "Couldn't write into %@.": "無法寫入 %@。",
    "The %@ record isn't a plist dictionary.": "%@ 記錄不是 plist 字典。",

    // Importing a pairing file (required below iOS 27, under Advanced from 27)

    "Import pairing file": "導入配對文件",
    "How do I make one?": "怎麼生成？",
    "(Optional)": "（可選）",
    "imported pairing file": "已導入配對文件",
    "No pairing file yet — tap “Import pairing file” first.": "還沒有配對文件 — 請先點按“導入配對文件”。",
    "Pairing file missing — import it first.": "缺少配對文件 — 請先導入。",
    "%@ isn't a pairing file. Pick the file your computer made — a .mobiledevicepairing or .plist holding this iPhone's pair record.":
        "%@ 不是配對文件。請選擇電腦生成的文件 — 包含本機配對記錄的 .mobiledevicepairing 或 .plist。",
    "iOS %@ can't create its own pairing file — that needs iOS %@. Import one made on a computer under “Pairing file”, then try again.":
        "iOS %@ 無法自行生成配對文件，那需要 iOS %@。請在“配對文件”中導入一個在電腦上生成的文件，然後重試。",

    // MARK: - Pairing service status

    "not paired": "未配對",
    "connected": "已連接",
    "requesting Local Network…": "正在請求本地網絡權限…",
    "Local Network denied": "本地網絡權限被拒絕",
    "waiting for device…": "正在等待設備…",
    "advertising — open Settings › Privacy & Security › Developer Mode":
        "正在廣播 —— 打開 設置 › 隱私與安全性 › 開發者模式",
    "enter PIN %@ in Settings": "在 設置 中輸入 PIN 碼 %@",
    "paired: %@ (%dB)": "已配對：%@（%d B）",
    "failed: empty pairing file": "失敗：配對文件為空",
    "failed: %@": "失敗：%@",
    "Pairing is already in progress.": "配對已在進行中。",
    "Local Network permission is off. Enable it in Settings › SideNeko › Local Network, then try again.":
        "本地網絡權限已關閉。請在 設置 › SideNeko › 本地網絡 中開啓，然後重試。",
    "Pairing produced an empty file. Make sure you approved the pairing request, then try again.":
        "配對生成了一個空文件。請確認你已同意配對請求，然後重試。",

    // MARK: - Certificates tab

    "Revoke this certificate?": "吊銷此證書？",
    "Revoke": "吊銷",
    "Revoking": "正在吊銷",
    "“%@” will be revoked. Apps already signed with it will stop launching on every device. This can't be undone.":
        "“%@”將被吊銷。已用它簽名的應用將無法在任何設備上啓動。此操作無法撤銷。",
    "Refreshing": "正在刷新",
    "Signing in": "正在登錄",
    "Refresh": "刷新",
    "Load certificates": "加載證書",
    "%d certificate(s)": "%d 個證書",
    "No certificates": "沒有證書",
    "This Apple ID has no development certificates to revoke.":
        "此 Apple ID 沒有可吊銷的開發證書。",
    "Expired": "已過期",
    "Expires %@": "%@ 到期",
    "Unnamed certificate": "未命名的證書",
    "This certificate has no serial number, so it can't be revoked.":
        "此證書沒有序列號，因此無法吊銷。",

    // Export: the certificate SideNeko signs with, as a .p12
    "This certificate has no serial number, so it can't be exported.": "此證書沒有序列號，因此無法導出。",
    "Only the certificate SideNeko signs with can be exported: the private key of any other stays on the device that asked Apple for it.":
        "只能導出 SideNeko 用來簽名的證書：其他證書的私鑰只保存在向 Apple 申請它的設備上。",
    "Couldn't export the certificate: %@": "無法導出證書：%@",
    "Export certificate": "導出證書",
    "Password (optional)": "密碼（可選）",
    "Export": "導出",
    "Exporting": "正在導出",
    "Saves this certificate and its private key as a .p12 file, for another signing app or a computer to sign with. Choose a password, which you'll need to import the file, or leave it empty: signing apps import it without one, but a Mac won't. Keep the file to yourself.":
        "將此證書及其私鑰存為 .p12 文件，供其他簽名 App 或電腦簽名使用。可以為它設置密碼（導入文件時需要輸入），也可以留空：簽名 App 無需密碼即可導入，但 Mac 不行。請勿將文件交給他人。",
    "SideNeko can export only the certificate it signs with, and none of these is it: a certificate's private key stays on the device that asked Apple for it.":
        "SideNeko 只能導出它用來簽名的證書，而這裡沒有：證書的私鑰只保存在向 Apple 申請它的設備上。",
    "SideNeko signs with this one": "SideNeko 用此證書簽名",

    // MARK: - SideStore's certificate (sidestore://certificate)

    "Use SideStore's certificate": "使用 SideStore 的證書",
    "Checking the certificate": "正在檢查證書",
    "SideStore opens and sends back its certificate. SideNeko then signs with it too, so on a free Apple ID neither app has to revoke the other's.":
        "SideStore 會打開併發回它的證書。之後 SideNeko 也用它簽名，這樣在免費 Apple ID 上兩個 App 都不必吊銷對方的證書。",
    "Apple won't issue a second signing certificate for this Apple ID. If SideStore made the one it has, SideNeko can sign with that one too, and nothing is revoked. Revoking it lets the install continue as well — but it can't be undone.":
        "Apple 不會為此 Apple ID 簽發第二個簽名證書。如果已有的證書是 SideStore 創建的，SideNeko 也可以用它簽名，無需吊銷任何證書。吊銷它同樣可以讓安裝繼續——但此操作無法撤回。",
    "If SideStore made it, tap “Use SideStore's certificate” above: SideNeko signs with that one too, and nothing is revoked.":
        "如果它是 SideStore 創建的，請點按上方的“使用 SideStore 的證書”：SideNeko 也會用它簽名，不會吊銷任何證書。",
    "SideNeko signs with “%@” from now on. Nothing was revoked, so the apps already signed with it keep working.":
        "從現在起 SideNeko 使用“%@”簽名。沒有吊銷任何證書，因此已用它簽名的 App 會繼續正常運行。",
    "SideNeko already signs with “%@”.": "SideNeko 已經在使用“%@”簽名。",
    "That certificate isn't one of this Apple ID's: it has been revoked, or it belongs to another Apple ID (SideStore may be signed in with a different one). Nothing was changed.":
        "該證書不屬於此 Apple ID：它已被吊銷，或屬於另一個 Apple ID（SideStore 可能登錄了其他 Apple ID）。未做任何更改。",
    "Couldn't use that certificate: %@": "無法使用該證書：%@",
    "SideStore isn't installed on this iPhone, so there's no certificate to get from it.":
        "這台 iPhone 上沒有安裝 SideStore，因此無法從中獲取證書。",
    "Inside LiveContainer, SideStore can't send its certificate back to SideNeko, and LiveContainer doesn't hold one yet. In LiveContainer's Settings, tap “Import Certificate From SideStore” (sign in to SideStore first if it has no certificate), then try again here.":
        "在 LiveContainer 中，SideStore 無法把證書發回 SideNeko，而 LiveContainer 里也還沒有證書。請在 LiveContainer 的 Settings 中輕點“Import Certificate From SideStore”（如果 SideStore 還沒有證書，請先登錄 SideStore），然後回到這裡重試。",
    "The certificate LiveContainer holds for SideStore isn't one of this Apple ID's: it has been revoked, or it belongs to another Apple ID. Nothing was changed. If SideStore has made a new one since, tap “Refresh Certificate from SideStore” in LiveContainer's Settings, then try again here.":
        "LiveContainer 為 SideStore 保存的證書不屬於此 Apple ID：它已被吊銷，或屬於另一個 Apple ID。未做任何更改。如果 SideStore 之後生成了新證書，請在 LiveContainer 的 Settings 中輕點“Refresh Certificate from SideStore”，然後回到這裡重試。",
    "SideNeko takes SideStore's certificate from LiveContainer and signs with it too, so on a free Apple ID neither app has to revoke the other's.":
        "SideNeko 會從 LiveContainer 取得 SideStore 的證書，並也用它簽名，這樣在免費 Apple ID 上兩個 App 都不必吊銷對方的證書。",
    "Sign with this certificate?": "使用此證書簽名？",
    "A link sent SideNeko a signing certificate. Only use it if you asked for one: SideNeko will sign apps with it from now on, in place of its own. It's used only if it's one of your Apple ID's certificates.":
        "某個鏈接向 SideNeko 發送了簽名證書。只有在你主動請求時才使用：從現在起 SideNeko 將用它代替自己的證書為 App 簽名。只有當它是你 Apple ID 的證書時才會被使用。",
    "Use it": "使用",
    "That link was meant to carry a signing certificate, but what it holds can't be read.":
        "該鏈接本應包含簽名證書，但其內容無法讀取。",

    // MARK: - Location tab

    "Location spoofing": "位置模擬",
    "Not simulating": "未模擬",
    "Simulated": "模擬位置",
    "Pick a place": "選擇地點",
    "Search for a place": "搜索地點",
    "Nothing found for “%@”.": "找不到“%@”的結果。",
    "Set location": "設置位置",
    "Setting": "正在設置",
    "Reset to real location": "恢復真實位置",
    "Location set to %@.": "位置已設為 %@。",
    "Location reset. The device is using its own again.": "位置已恢復。設備重新使用自己的位置。",
    "That isn't a valid coordinate.": "該坐標無效。",
    "Location session closed — set it up again.": "位置會話已關閉 — 請重新設置。",
    "Downloading %@ failed (HTTP %d).": "下載 %@ 失敗（HTTP %d）。",
    "Couldn't build the download URL for %@.": "無法為 %@ 構建下載鏈接。",

    // Location › saved places and GPX routes.
    "Saved places": "已存儲的地點",
    "Save this place": "存儲此地點",
    "Name": "名稱",
    "Show on map": "在地圖上顯示",
    "Tap Save under the map to keep the spot under the pin. Tapping a saved place sets it straight away.":
        "輕點地圖下方的“存儲”即可保留圖釘下的位置。輕點已存儲的地點會立即設置該位置。",
    "Play a GPX route": "播放 GPX 路線",
    "Import a .gpx file and the device moves along it at the speed you pick, then stays at its last point.":
        "導入 .gpx 文件後，設備會按你選擇的速度沿路線移動，結束後停在最後一個點。",
    "Import GPX file": "導入 GPX 文件",
    "Couldn't read %@ as a GPX file.": "無法將 %@ 讀取為 GPX 文件。",
    "%@ has no track, route or waypoints in it.": "%@ 中沒有軌跡、路線或航點。",
    "As recorded": "按記錄時間",
    "Walk": "步行",
    "Cycle": "騎行",
    "Drive": "駕車",
    "Speed": "速度",
    "Play route": "播放路線",
    "Playing route · %d%%": "正在播放路線 · %d%%",
    "Stop here": "停在此處",
    "%@ of %@": "%@ / %@",
    "Route finished. The device stays at its last point.": "路線已結束。設備停留在最後一個點。",
    "Route stopped. The device stays where it got to.": "路線已停止。設備停留在當前所到位置。",
    "Route playback stopped: %@": "路線播放已停止：%@",
    // Location › planned routes (OpenStreetMap).
    "Add stop": "添加停靠點",
    "Add as stop": "添加為停靠點",
    "Plan a route": "規劃路線",
    "Travel by": "出行方式",
    "Goes along each street at its speed limit, from OpenStreetMap. A street without one mapped gets the usual limit for its kind of road.":
        "按 OpenStreetMap 中每條街道的限速行駛。未標注限速的街道採用該類道路的常見限速。",
    "Rides streets and paths a bike can take, at a cycling pace.": "沿自行車可通行的街道和小路，以騎行速度前進。",
    "Walks streets and paths at a walking pace.": "沿街道和小路，以步行速度前進。",
    "Start where the device is": "從設備所在位置出發",
    "Move the map so the pin is on a place, then tap Add stop. Add as many as you like: the route goes to each in order.":
        "移動地圖，讓圖釘落在某個地點上，然後輕點“添加停靠點”。想加多少個都可以：路線會按順序經過每一個。",
    "The device's location": "設備位置",
    "Stop %d": "停靠點 %d",
    "Clear stops": "清除停靠點",
    "Move up": "上移",
    "Move down": "下移",
    "Find route": "查找路線",
    "Finding route": "正在查找路線",
    "Add one more stop to plan a route.": "再添加一個停靠點即可規劃路線。",
    "Routes from OpenStreetMap, © OpenStreetMap contributors":
        "路線來自 OpenStreetMap，© OpenStreetMap 貢獻者",
    "Speed limits are mapped for all of it.": "全程均已標注限速。",
    "Speed limits are mapped for %d%% of it; the rest is estimated.": "%d%% 的路段已標注限速，其餘為估算值。",
    "Average %@": "平均 %@",
    "Speed limit %@": "限速 %@",
    "No speed limit · going %@": "不限速 · 當前 %@",
    "No limit mapped · going %@": "未標注限速 · 當前 %@",
    "Going %@": "當前 %@",
    "No street name": "無名道路",
    "Estimated speed limit %@": "估算限速 %@",
    "No speed limit": "不限速",
    "No route found between these stops. Move them onto roads or paths, or travel another way.":
        "未找到這些停靠點之間的路線。請將它們移到道路或小路上，或換一種出行方式。",
    "A stop is too far from any road or path. Move it closer and try again.":
        "有一個停靠點離道路或小路太遠。請將它移近一些後重試。",
    "Too many stops for the route server. Take some out and try again.":
        "停靠點太多，路線服務器無法處理。請刪除一些後重試。",
    "That route is too long for the route server. Make it shorter, or split it up.":
        "這條路線對路線服務器來說太長了。請縮短或分段。",
    "The route server is busy. Try again in a minute.": "路線服務器繁忙。請一分鐘後重試。",
    "The route server couldn't plan this route (%@).": "路線服務器無法規劃這條路線（%@）。",

    // MARK: - Entitlements tab

    "Entitlements": "權限",
    "Load apps": "加載應用",
    "%d App ID": "%d 個 App ID",
    "%d App IDs": "%d 個 App ID",
    "No App IDs": "沒有 App ID",
    "This Apple ID hasn't registered any apps yet. Install something with SideNeko first, then come back.":
        "此 Apple ID 還沒有註冊任何應用。請先用 SideNeko 安裝一個，然後再回來。",
    "Memory and performance": "內存與性能",
    "Other free capabilities": "其他免費能力",
    "Beta": "測試版",
    "Recommended": "推薦",
    "Select all": "全選",
    "None": "全不選",
    "Enable %d selected": "啓用所選的 %d 項",
    "Asking Apple": "正在詢問 Apple",
    "%d of %d enabled": "已啓用 %d/%d",
    "Install the app again for these to take effect.": "重新安裝應用後這些權限才會生效。",

    // MARK: - Sideloaded apps tab

    "Sideloaded apps": "側載應用",
    "Reading the device": "正在讀取設備",

    // Refresh all: signing the installed apps again.
    "iOS %@ isn't supported — SideNeko needs iOS %@ or later.":
        "不支持 iOS %@：SideNeko 需要 iOS %@ 或更高版本。",
    "Apple won't issue a signing certificate for this Apple ID: it reports that one already exists (error 7460). Under Tools › Certificates, use SideStore's certificate or revoke that one, then refresh again.":
        "Apple 不會為此 Apple ID 簽發簽名證書：它報告已經存在一個（錯誤 7460）。請在“工具 › 證書”中使用 SideStore 的證書或吊銷該證書，然後重新續簽。",
    "An install is already running. Wait for it to finish, then refresh.":
        "已有安裝正在進行。請等它完成後再續簽。",
    "Getting ready": "正在準備",
    "Stopping after this app": "將在這個應用之後停止",
    "Refreshing %@": "正在續簽 %@",
    "Signed by team %@, not the one you're signed in as — refreshing it here would install a second copy.":
        "由團隊 %@ 簽名，與你登錄的團隊不同：在這裡續簽會另外安裝一個副本。",
    "Refreshed. Its seven days start again now.": "已續簽。七天從現在重新開始。",
    "Nothing was refreshed.": "沒有續簽任何應用。",
    "Refreshed %d of %d apps.": "已續簽 %d 個應用，共 %d 個。",
    "Refresh all apps?": "續簽所有應用？",
    "Refresh all": "全部續簽",
    "%@ will be signed again with your Apple ID and installed over the copy on this device. It keeps its data, and its seven days start over.":
        "%@ 將用你的 Apple ID 重新簽名，並覆蓋安裝到本設備上的副本。數據會保留，七天重新開始計算。",
    "%d apps will be signed again with your Apple ID and installed over the copies on this device. They keep their data, and their seven days start over.":
        "%d 個應用將用你的 Apple ID 重新簽名，並覆蓋安裝到本設備上的副本。數據會保留，七天重新開始計算。",
    "%d app can be signed again from an IPA already on this iPhone.":
        "有 %d 個應用可以用這台 iPhone 上已有的 IPA 重新簽名。",
    "%d apps can be signed again from IPAs already on this iPhone.":
        "有 %d 個應用可以用這台 iPhone 上已有的 IPA 重新簽名。",
    "Reload": "重新讀取",
    "Waiting": "等待中",
    "In progress": "進行中",
    "Failed": "失敗",
    "%d app here has no IPA in SideNeko, so it can't be refreshed from this page. Refresh it in whatever installed it, or import its .ipa first.":
        "這裡有 %d 個應用在 SideNeko 中沒有對應的 IPA，因此無法從本頁續簽。請在安裝它的應用里續簽，或先導入它的 .ipa。",
    "%d apps here have no IPA in SideNeko, so they can't be refreshed from this page. Refresh them in whatever installed them, or import their .ipa first.":
        "這裡有 %d 個應用在 SideNeko 中沒有對應的 IPA，因此無法從本頁續簽。請在安裝它們的應用里續簽，或先導入它們的 .ipa。",
    "%d app": "%d 個應用",
    "%d apps": "%d 個應用",
    "%d app needs refreshing": "%d 個應用需要續簽",
    "%d apps need refreshing": "%d 個應用需要續簽",
    "No sideloaded apps": "沒有側載應用",
    "Nothing on this device was installed with a provisioning profile. App Store apps don't expire, so they aren't listed here.":
        "這台設備上沒有任何應用是用描述文件安裝的。App Store 的應用不會過期，因此不會列在這裡。",
    "No matching profile": "沒有匹配的描述文件",
    "Expires today": "今天過期",
    "Expires tomorrow": "明天過期",
    "Expires in %d days — %@": "%d 天後過期 — %@",
    "Expired %@": "已於 %@ 過期",
    "Unused profiles": "未使用的描述文件",
    "Issued to App IDs no installed app is running on.":
        "簽發給了沒有任何已安裝應用在使用的 App ID。",
    "Older profiles": "較舊的描述文件",
    "Bundle identifier": "Bundle 標識符",
    "App ID": "App ID",
    "Version": "版本",
    "Profile name": "描述文件名稱",
    "Team": "團隊",
    "Team ID": "團隊 ID",
    "Issued": "簽發時間",
    "Profile UUID": "描述文件 UUID",
    "Capabilities": "功能",
    "Wildcard App ID — it covers any bundle id under it, and can't carry app-specific capabilities.":
        "通配符 App ID：它涵蓋其下的任意 bundle id，因此無法攜帶針對單個應用的功能。",
    "The device has no provisioning profile for this App ID. The app may already have stopped launching — install it again to fix that.":
        "設備上沒有這個 App ID 的描述文件。該應用可能已經無法啓動——重新安裝一次即可解決。",

    // MARK: - Side by Side tool

    // The tool's name is left in English everywhere, as SideStore's is.
    "Side by Side": "Side by Side",
    "Pair with their iPhone": "與對方的 iPhone 配對",
    "Install on their iPhone": "安裝到對方的 iPhone",
    "The iPhone that paired was this one. Pair from their iPhone's Settings instead. To install on this iPhone, use the Install tab.":
        "完成配對的是這台 iPhone。請在對方 iPhone 的“設置”中配對。要安裝到這台 iPhone，請使用“安裝”標籤頁。",
    "Enter the Apple ID to sign with, and its password.": "請輸入用於簽名的 Apple ID 及其密碼。",
    "Wi-Fi is off. Both iPhones have to be on the same Wi-Fi network for this to work.":
        "無線局域網已關閉。兩台 iPhone 必須連接同一個 Wi-Fi 網絡才能使用。",
    "The release download wasn't an IPA. GitHub may be returning an error page, so try again in a minute.":
        "下載到的發行版不是 IPA 文件。GitHub 可能返回了錯誤頁面，請過一分鐘再試。",
    "Couldn't download the latest SideNeko release: %@":
        "無法下載最新的 SideNeko 發行版：%@",
    "No SideNeko IPA downloaded.": "尚未下載 SideNeko 的 IPA。",
    "Apple won't issue a signing certificate for this Apple ID: it reports that one already exists (error 7460). One has to be revoked first. Use the Certificates tool if this is the Apple ID saved in Settings › Account, or developer.apple.com signed in as it otherwise.":
        "Apple 不會為此 Apple ID 簽發簽名證書：它報告已經存在一個（錯誤 7460）。必須先吊銷一個：如果這就是“設置 › 賬戶”中保存的 Apple ID，可用“證書”工具；否則請用該賬戶登錄 developer.apple.com 吊銷。",
    "Apple wouldn't register their iPhone with this Apple ID's developer team, so it won't issue a provisioning profile. %@":
        "Apple 未能將對方的 iPhone 註冊到此 Apple ID 的開發團隊，因此不會簽發描述文件。%@",
    "No pair record for their iPhone.": "沒有對方 iPhone 的配對記錄。",
    "The link to their iPhone dropped. Start again.": "與對方 iPhone 的連接已斷開，請重新開始。",
    "Set up someone else's iPhone": "為別人的 iPhone 完成設置",
    "Same Wi-Fi network": "同一個 Wi-Fi 網絡",
    "Apple ID to sign with": "用於簽名的 Apple ID",
    "Waiting for them to pair in Settings…":
        "等待對方在 設置 中配對…",
    "Waiting for them to enter the code…":
        "等待對方輸入驗證碼…",
    "Pair their iPhone in Settings":
        "在 設置 中配對對方的 iPhone",
    "Their iPhone won't ask by itself. Pairing starts from its Settings.":
        "對方的 iPhone 不會自己彈出提示，配對要從它的 設置 開始。",
    "On their iPhone, open Settings › Privacy & Security › Developer Mode.":
        "在對方的 iPhone 上，打開 設置 › 隱私與安全性 › 開發者模式。",
    "Tap “Pair with %@”.":
        "輕點“與 %@ 配對”。",
    "Enter their iPhone’s passcode if it asks for it.":
        "如果系統要求，請輸入對方 iPhone 的密碼。",
    "Type the code that appears here into the prompt on their iPhone.":
        "把這裡顯示的驗證碼輸入到對方 iPhone 上的提示框內。",
    "Type this into the prompt on their iPhone.":
        "將它輸入到對方 iPhone 上的提示框內。",
    "SideNeko is already waiting for an iPhone to pair with it, from the Install tab, the Pairing page, or an earlier attempt here. Finish that pairing, or close and reopen SideNeko, then try again.":
        "SideNeko 已在等待某台 iPhone 與它配對，來自“安裝”標籤頁、“配對”頁面，或這裡之前的一次嘗試。請先完成那次配對，或關閉後重新打開 SideNeko，然後重試。",
    "Pairing with their iPhone didn't finish: %@":
        "與對方 iPhone 的配對未完成：%@",
    "Their iPhone at %@ refused the connection. It only accepts one while Developer Mode is on, and iOS asks to confirm Developer Mode again after every restart: on their iPhone, turn it on under Settings › Privacy & Security › Developer Mode, then try again.":
        "對方位於 %@ 的 iPhone 拒絕了連接。只有開啓開發者模式時它才接受連接，而且每次重啓後 iOS 都會要求再次確認：請在對方 iPhone 的 設置 › 隱私與安全性 › 開發者模式 中打開它，然後重試。",
    "Couldn't reach their iPhone at %@. Check that both iPhones are on the same Wi-Fi network, and that Local Network is on for SideNeko in this iPhone's Settings. Guest and public networks often keep devices from reaching each other.":
        "無法連接到位於 %@ 的對方 iPhone。請確認兩台 iPhone 連接的是同一個 Wi-Fi 網絡，並確認已在這台 iPhone 的 設置 中為 SideNeko 打開本地網絡。訪客網絡和公共網絡通常會阻止設備之間互相連接。",
    "The link to their iPhone didn't come up: %@":
        "未能建立與對方 iPhone 的連接：%@",
    "%d%% downloaded": "已下載 %d%%",
    "%d%% uploaded": "已上傳 %d%%",
    "Start the install": "開始安裝",
    "Clear their details": "清除對方的信息",
    "This iPhone is still paired with theirs. Clearing forgets it.":
        "這台 iPhone 仍與對方的 iPhone 配對。清除後會忘記這次配對。",
    "On their iPhone: Settings › General › VPN & Device Management.":
        "在對方的 iPhone 上：設置 › 通用 › VPN 與設備管理。",
    "Tap the Apple ID under “Developer App”, then tap Trust.":
        "在“開發者 App”下輕點該 Apple ID，然後輕點“信任”。",

    // MARK: - Side by Side, step by step

    "Needs LocalDevVPN on their iPhone": "對方的 iPhone 需要 LocalDevVPN",
    "Couldn't download %@: %@": "無法下載 %@：%@",
    "Their iPhone already has three apps signed with a free Apple ID, the most iOS allows, counting expired ones. They need to delete one, then you can try again.":
        "對方的 iPhone 上已有三個用免費 Apple ID 簽名的 App（已過期的也算），這是 iOS 允許的上限。請對方先刪除一個，然後再試。",
    "%@ is on their iPhone, but its pairing file couldn't be added (%@). Run Side by Side again, or import a pairing file in %@.":
        "%@ 已在對方的 iPhone 上，但無法放入它的配對文件（%@）。請再運行一次 Side by Side，或在 %@ 中導入配對文件。",
    "Get started": "開始",
    "What should go on their iPhone?": "要在對方的 iPhone 上安裝什麼？",
    "Pick one. You can come back for another one later.": "選擇一個。之後可以回來再裝另一個。",
    "Which Apple ID signs it?": "用哪個 Apple ID 簽名？",
    "The app is signed with it, and needs it again every 7 days to keep opening. Use the iPhone owner's.":
        "App 會用這個 Apple ID 簽名，並且每 7 天需要再次用它才能繼續打開。請使用 iPhone 機主的 Apple ID。",
    "Their Apple ID": "對方的 Apple ID",
    "Recommended: they keep their apps signed with it.": "推薦：對方可以用它讓自己的 App 保持簽名。",
    "My Apple ID": "我的 Apple ID",
    "Only if you'll keep their apps signed yourself: they won't have this Apple ID's password.":
        "僅當你會親自為對方的 App 續簽時才選：對方不會有這個 Apple ID 的密碼。",
    "Used for this install only, and never saved.": "只用於這次安裝，絕不保存。",
    "Apple may send a code to their devices, so keep their iPhone close.":
        "Apple 可能會向對方的設備發送驗證碼，請把對方的 iPhone 放在身邊。",
    "Get their iPhone ready": "準備好對方的 iPhone",
    "Do this on their iPhone, then start.": "在對方的 iPhone 上完成以下步驟，然後開始。",
    "Connect their iPhone to the same Wi-Fi network as this one.":
        "將對方的 iPhone 連接到與這台 iPhone 相同的 Wi-Fi 網絡。",
    "Turn on Developer Mode under Settings › Privacy & Security › Developer Mode, and confirm it after the restart.":
        "在 設置 › 隱私與安全性 › 開發者模式 中打開開發者模式，並在重啓後確認。",
    "Unlock their iPhone and keep it next to this one.": "解鎖對方的 iPhone，並放在這台 iPhone 旁邊。",
    "Installing %@ on their iPhone": "正在將 %@ 安裝到對方的 iPhone",
    "Waiting for their iPhone…": "正在等待對方的 iPhone…",
    "Looking for their iPhone…": "正在查找對方的 iPhone…",
    "Handing over the pairing file…": "正在交付配對文件…",
    "Change details": "更改信息",
    "%@ is on their iPhone": "%@ 已安裝到對方的 iPhone",
    "Finish on their iPhone": "在對方的 iPhone 上完成",
    "This iPhone no longer keeps a pairing with theirs.": "這台 iPhone 不再保留與對方 iPhone 的配對。",
    "Install another app": "安裝另一個 App",
    "Get LocalDevVPN from the App Store and connect it: SideStore works through it.":
        "從 App Store 獲取 LocalDevVPN 並連接：SideStore 要通過它工作。",
    "Open SideStore and sign in with the same Apple ID. Its pairing file is already in place.":
        "打開 SideStore，用同一個 Apple ID 登錄。它的配對文件已經放好了。",
    "Open LiveContainer, go to its Settings tab, and tap “Import Certificate From SideStore”.":
        "打開 LiveContainer，進入它的 Settings 標籤頁，輕點“Import Certificate From SideStore”。",

    // MARK: - Settings

    "Settings": "設置",
    "Done": "完成",
    "Language": "語言",
    "App language": "應用語言",
    "Sounds": "聲音",
    "Sound effects": "音效",
    "Auto": "自動",
    // The Tunnel section: starting LocalDevVPN from here.
    "Tunnel": "隧道",
    "Something at %@:%d refused the connection, so the tunnel is carrying traffic — the device just isn't listening on its pairing port. That port only opens while Developer Mode is on, and iOS asks for it again after every restart: turn it on under Settings › Privacy & Security › Developer Mode, then try again. If it's already on, pair this iPhone again under “Pairing file”.":
        "%@:%d 上有東西拒絕了連接，說明隧道是通的，只是設備沒有在它的配對端口上監聽。該端口只有在開啓開發者模式時才會打開，而且每次重啓後 iOS 都會再次要求確認：請在 設置 › 隱私與安全性 › 開發者模式 中打開它，然後重試。如果已經打開，請在“配對文件”中重新配對這台 iPhone。",
    "Something at %@:%d refused the connection, so the tunnel is carrying traffic, but this iPhone isn't listening on its pairing port: Developer Mode is off. Turn it on under Settings › Privacy & Security › Developer Mode (the iPhone restarts), then try again.":
        "%@:%d 上有東西拒絕了連接，說明隧道是通的，但這台 iPhone 沒有在配對端口上監聽：開發者模式已關閉。請在 設置 › 隱私與安全性 › 開發者模式 中打開它（iPhone 會重啓），然後重試。",
    "Something at %@:%d refused the connection, so the tunnel is carrying traffic, but this iPhone isn't listening on its pairing port, although Developer Mode is on. Pair this iPhone again under “Pairing file”, then try again. If it still fails, restart the iPhone.":
        "%@:%d 上有東西拒絕了連接，說明隧道是通的，但儘管開發者模式已打開，這台 iPhone 仍沒有在配對端口上監聽。請在“配對文件”中重新配對這台 iPhone，然後重試。如果仍然失敗，請重啓 iPhone。",
    "Something at %@:%d took the connection but didn't answer as this iPhone's pairing port, and no other port answered as one either. Check that LocalDevVPN is the VPN that's on and that Developer Mode is on (Settings › Privacy & Security › Developer Mode), then try again. If it still fails, restart the iPhone.":
        "%@:%d 上有東西接受了連接，但沒有像這台 iPhone 的配對端口那樣應答，其他端口也沒有。請確認當前打開的 VPN 是 LocalDevVPN，並且開發者模式已打開（設置 › 隱私與安全性 › 開發者模式），然後重試。如果仍然失敗，請重啓 iPhone。",
    "Start LocalDevVPN when needed": "需要時打開 LocalDevVPN",
    "Start LocalDevVPN now": "立即啓動 LocalDevVPN",
    "LocalDevVPN isn't installed. Get it from the App Store, and this can start it for you.":
        "未安裝 LocalDevVPN。請從 App Store 獲取，SideNeko 就能為你啓動它。",

    "Downloaded IPAs": "已下載的 IPA",
    "%@ used": "已用 %@",
    "imported": "已導入",
    "No downloaded IPAs. Ones you install from the Install tab are cached here.":
        "還沒有已下載的 IPA。你從“安裝”標籤頁安裝的 IPA 會緩存在這裡。",
    "Downloaded %@": "下載於 %@",
    "Added %@": "添加於 %@",
    "Delete this download?": "刪除此下載項？",
    "Delete": "刪除",
    "“%@” (%@) will be removed. You can download it again any time from the Install tab.":
        "“%@”（%@）將被移除。你隨時可以從“安裝”標籤頁重新下載。",
    "Couldn't delete %@: %@": "無法刪除 %@：%@",
    "Server": "服務器",
    "Custom…": "自定義…",
    "Server URL": "服務器 URL",
    "Anisette Server": "Anisette 服務器",
    "Starts with %@": "從 %@ 開始",
    "Auto starts with the server that signed in last, then tries the others, the ones most likely to work first.":
        "“自動”會先使用上次成功登錄的服務器，然後按成功可能性從高到低嘗試其他服務器。",
    "Only this server is tried. If it fails, so does sign-in: choose Auto to have SideNeko try the others.":
        "只會嘗試這個服務器。它失敗時登錄也會失敗：選擇“自動”，讓 SideNeko 嘗試其他服務器。",
    "Only the server picked in Settings › Anisette Server was tried. Choose Auto there to let SideNeko try the others when one fails.":
        "只嘗試了在“設置 › Anisette 服務器”中選擇的服務器。在那裡選擇“自動”，SideNeko 就會在一個服務器失敗時嘗試其他服務器。",
    "Device IP": "設備 IP",
    "Advanced": "高級",
    "Clear": "清除",
    "Activity Log (%d)": "活動日誌（%d）",
    "Verbose logging": "詳細日誌",
    "Adds the messages exchanged with iOS to the log, for tracking down a connection problem. Leave it off otherwise, as they quickly fill the log.":
        "將與 iOS 往來的消息寫入日誌，用於排查連接問題。其他時候請保持關閉，因為這些消息很快就會佔滿日誌。",

    // Settings › Developer Mode: AMFI requests over the device link.
    "Developer Mode": "開發者模式",
    "Show Developer Mode in Settings": "在設置中顯示開發者模式",
    "Turn on Developer Mode": "打開開發者模式",
    "Asking this iPhone…": "正在詢問這台 iPhone…",
    "Both need a link to this iPhone that already works: LocalDevVPN plus a pairing file, such as one imported on iOS 17.4 to 26. On iOS 27 the link itself needs Developer Mode, so they can't bring back a missing option there.":
        "這兩項都需要一條已經可用、通往這台 iPhone 的連接：LocalDevVPN 加上配對文件，例如在 iOS 17.4 至 26 上導入的配對文件。在 iOS 27 上，連接本身就需要開發者模式，因此無法找回已經消失的選項。",
    "Turn on Developer Mode?": "要打開開發者模式嗎？",
    "Turn On and Restart": "打開並重新啓動",
    "This iPhone restarts right away. Once you unlock it, tap Turn On in the alert that appears. iOS allows this only while the iPhone has no passcode.":
        "這台 iPhone 會立即重新啓動。解鎖後，在彈出的提示中點按“打開”。只有在 iPhone 未設置密碼時，iOS 才允許這樣做。",
    "Developer Mode is already on.": "開發者模式已經打開。",
    "Developer Mode now shows under Settings › Privacy & Security, near the bottom. Turn it on there, and iOS restarts to finish.":
        "開發者模式現在顯示在 設置 › 隱私與安全性 的底部附近。在那裡打開它，iOS 會重新啓動以完成設置。",
    "Developer Mode is set to turn on, and this iPhone restarts now. Once you unlock it, tap Turn On.":
        "開發者模式即將打開，這台 iPhone 現在會重新啓動。解鎖後，點按“打開”。",
    "An install is already running. Wait for it to finish, then try again.": "已有安裝正在進行。請等它完成後再試一次。",
    "iOS turns Developer Mode on from here only while this iPhone has no passcode. Tap “Show Developer Mode in Settings” and turn it on there instead.":
        "只有在這台 iPhone 未設置密碼時，iOS 才能從這裡打開開發者模式。請點按“在設置中顯示開發者模式”，然後在設置里打開它。",
    "This iPhone didn't take the Developer Mode request: %@": "這台 iPhone 沒有接受開發者模式請求：%@",

    // MARK: - Release channels & downloads

    "Stable": "穩定版",
    "Nightly": "Nightly",

    // Version picker (Advanced)

    "%@ version": "%@ 版本",
    "Latest": "最新",
    "Latest (%@)": "最新（%@）",
    "Couldn't load the other versions: %@": "無法加載其他版本：%@",
    "Try again": "重試",

    "couldn't find the IPA in the %@ %@ release":
        "在 %@ 渠道的 %@ 發行版中找不到 IPA 文件",
    "%@ has no %@ release right now": "%@ 目前沒有任何 %@ 發行版",
    "bad asset URL": "下載資源的 URL 無效",
    "GitHub is rate-limiting this network — it isn't blocked, and the limit clears itself. Try again %@.":
        "GitHub 正在限制此網絡的請求頻率 —— 它沒有被屏蔽，限制會自動解除。請在%@重試。",
    "GitHub answered HTTP %d%@": "GitHub 返回了 HTTP %d%@",
    "GitHub isn't serving %@ right now — the repository has been taken down, moved or made private, so there's nothing to download. Nothing is wrong with this iPhone or its network.":
        "GitHub 目前無法提供 %@ —— 該代碼倉庫已被下架、遷移或設為私有，因此沒有可下載的內容。這台 iPhone 及其網絡沒有任何問題。",
    "couldn't reach GitHub: %@": "無法連接到 GitHub：%@",
    "GitHub's answer wasn't release information (%@) — something on this network may have replaced it.":
        "GitHub 的響應不是發行版信息（%@）—— 此網絡上的某個環節可能替換了它。",
    "what downloaded as %@ isn't an IPA — something on this network returned a page instead, or the transfer stopped partway.":
        "以 %@ 為名下載到的文件不是 IPA —— 此網絡上的某個環節可能返回了一個網頁，或者傳輸中斷了。",
    "that link answered HTTP %d — it isn't a direct download, or it needs a sign-in.":
        "該鏈接返回 HTTP %d — 它不是直接下載鏈接，或者需要登錄。",
    "GitHub has no build of %@'s %@ branch to download right now.":
        "GitHub 目前沒有 %1$@ 的 %2$@ 分支構建版本可供下載。",
    "couldn't download %@ through nightly.link, which passes on GitHub's builds: %@":
        "無法通過 nightly.link（轉交 GitHub 構建版本的服務）下載 %@：%@",
    "the %@ build that arrived isn't the file GitHub recorded, so it isn't installed. Try again later.":
        "收到的 %@ 構建版本不是 GitHub 記錄的文件，因此不會安裝。請稍後重試。",

    // MARK: - Engine failures

    "Two-factor verification was cancelled.": "雙重認證驗證已取消。",
    "Incorrect Apple ID or password. Check your Apple Account email and password, then try again.":
        "Apple ID 或密碼不正確。請檢查你的 Apple 賬戶電子郵件和密碼，然後重試。",
    "Apple ID sign-in failed on %@. Error: %@":
        "在 %@ 上登錄 Apple ID 失敗。錯誤：%@",
    "Apple ID sign-in failed on %@. Error via %@: %@":
        "在 %@ 上登錄 Apple ID 失敗。經由 %@ 的錯誤：%@",
    "Apple's sign-in server refused the request (HTTP 503). It isn't your password or the anisette server, so trying more servers won't help. Try again later, or update SideNeko.":
        "Apple 登錄服務器拒絕了請求（HTTP 503）。這不是你的密碼或 anisette 服務器的問題，換用其他服務器也無濟於事。請稍後重試，或更新 SideNeko。",
    "“%@” makes its anisette data with Apple's Android library, and Apple now refuses to finish signing in through those servers (error -80046), after your password and code. In Settings › Anisette Server, choose Auto or a Mac server such as “SideStore (New)”.":
        "“%@”使用 Apple 的 Android 庫生成 anisette 數據，而 Apple 現在會在你輸入密碼和驗證碼之後，拒絕完成通過這類服務器的登錄（錯誤 -80046）。請在“設置 › Anisette 服務器”中選擇“自動”，或選擇 Mac 服務器，例如“SideStore (New)”。",
    "Apple refused to finish signing in (error -80046), even through a Mac anisette server, the kind it still accepted. Try again later, or check for a SideNeko update.":
        "Apple 拒絕完成登錄（錯誤 -80046），即使通過的是它此前仍接受的 Mac anisette 服務器。請稍後重試，或檢查 SideNeko 是否有更新。",
    "Apple refused to finish signing in through “%@” (error -80046). It now only accepts sign-ins through anisette servers on its macOS library: in Settings › Anisette Server, choose Auto or a Mac server such as “SideStore (New)”.":
        "Apple 拒絕完成通過“%@”的登錄（錯誤 -80046）。它現在只接受通過使用其 macOS 庫的 anisette 服務器登錄：請在“設置 › Anisette 服務器”中選擇“自動”，或選擇 Mac 服務器，例如“SideStore (New)”。",
    "Apple won't send a code by text or call to this sign-in, so it was sent to your Apple devices.":
        "Apple 不會為此次登錄通過短信或電話發送驗證碼，因此已將驗證碼發送到你的 Apple 設備。",
    "Apple didn't confirm sending a code to your Apple devices. If one arrived, enter it; if not, try another way.":
        "Apple 未確認已向你的 Apple 設備發送驗證碼。如果收到了，請輸入；如果沒有，請換一種方式。",
    "SideNeko can't reach Apple's sign-in server (gsa.apple.com), though this iPhone has an internet connection. Something is blocking it: a firewall, a DNS filter or ad blocker, Screen Time content restrictions, or another VPN app. Turn it off or try another network, then try again.":
        "SideNeko 無法連接 Apple 登錄服務器（gsa.apple.com），但這台 iPhone 已連接互聯網。有東西在攔截它：防火牆、DNS 過濾或廣告攔截工具、屏幕使用時間的內容限制，或其他 VPN App。請將其關閉或換一個網絡，然後重試。",
    "SideNeko can't reach Apple: Cellular Data is turned off for it. Turn SideNeko on in Settings › Cellular, or join a Wi-Fi network with internet access, then try again.":
        "SideNeko 無法連接 Apple：它的蜂窩數據已被關閉。請在 設置 › 蜂窩網絡 中打開 SideNeko，或連接可以上網的無線局域網，然後重試。",
    "SideNeko can't reach Apple: iOS isn't letting it use Wi-Fi. In Settings › Apps › SideNeko › Wireless Data, choose WLAN & Cellular Data, then try again.":
        "SideNeko 無法連接 Apple：iOS 不允許它使用無線局域網。請在 設置 › App › SideNeko › 無線數據 中選擇“無線局域網與蜂窩網絡”，然後重試。",
    "SideNeko can't reach Apple: a VPN set to carry all traffic is disconnected, so iOS is holding traffic back. Reconnect it, or turn off its kill switch or Connect On Demand, then try again.":
        "SideNeko 無法連接 Apple：一個設為承載所有流量的 VPN 已斷開，因此 iOS 暫停了網絡流量。請重新連接它，或關閉它的斷網保護（kill switch）或按需連接，然後重試。",
    "SideNeko can't reach Apple: this iPhone has no internet connection. Connect to Wi-Fi or turn on cellular data, then try again.":
        "SideNeko 無法連接 Apple：這台 iPhone 沒有連接互聯網。請連接無線局域網或打開蜂窩數據，然後重試。",
    "Apple is temporarily limiting sign-ins for this Apple ID or network (HTTP 429). Trying other servers won't help, and every attempt can extend the wait, so leave it a while before signing in again.":
        "Apple 正在暫時限制此 Apple ID 或此網絡的登錄（HTTP 429）。換用其他服務器無濟於事，每次嘗試還可能延長等待時間，請過一段時間再登錄。",
    "If you're sure the password is right, Apple may be limiting sign-in attempts: wait a while before trying again.":
        "如果你確定密碼正確，可能是 Apple 正在限制登錄嘗試：請過一段時間再試。",
    "Apple has locked this Apple Account for security reasons (error -20209), so every sign-in fails until it's unlocked. Reset its password at iforgot.apple.com, then sign in again with the new password.":
        "出於安全原因，Apple 已鎖定此 Apple 賬戶（錯誤 -20209），在解鎖之前每次登錄都會失敗。請在 iforgot.apple.com 重設其密碼，然後用新密碼重新登錄。",
    "the anisette server": "anisette 服務器",
    "all %d anisette servers": "全部 %d 個 anisette 服務器",
    "%d anisette servers (%d skipped)": "%d 個 anisette 服務器（跳過 %d 個）",
    "Not signed in.": "尚未登錄。",
    "No SideStore IPA downloaded.": "尚未下載 SideStore 的 IPA。",
    "Signing failed: %@": "簽名失敗：%@",
    "No signed bundle to install.": "沒有可安裝的已簽名程序包。",
    "Device link dropped — reconnect.":
        "與設備的連接已斷開 —— 請重新連接。",
    "Pairing didn't finish — no pairing file yet.":
        "配對未完成 —— 還沒有配對文件。",
    "Pairing file missing — pairing must run first.":
        "缺少配對文件 —— 必須先進行配對。",
    "Pairing file missing — generate it first.":
        "缺少配對文件 —— 請先生成。",
    "No pairing file yet — tap “Generate pairing file” first.":
        "還沒有配對文件 —— 請先輕點“生成配對文件”。",
    "%@ isn't installed yet — install must run first.":
        "%@ 尚未安裝 —— 必須先進行安裝。",
    "%@ isn't a valid IPA — the download it came from probably returned an error page, or the copy stopped partway. Replace it and tap Install again.":
        "%@ 不是有效的 IPA —— 多半是下載時返回了一個錯誤頁面，或者複製中途中斷。請替換它，然後再次輕點“安裝”。",
    "%@ isn't an IPA. Pick the .ipa file itself — if it looks right, the download may have saved an error page instead, or stopped partway.":
        "%@ 不是 IPA。請選擇 .ipa 文件本身；如果看起來沒錯，可能是下載時保存的是錯誤頁面，或者中途中斷了。",
    "No IPA imported yet. Tap “Import .ipa” and pick one.":
        "還沒有導入任何 IPA。請輕點“導入 .ipa”並選擇一個文件。",
    "Couldn't import %@: %@": "無法導入 %@：%@",
    "That isn't a link SideNeko can download. Paste the whole https:// address the .ipa downloads from.":
        "SideNeko 無法下載該鏈接。請粘貼 .ipa 的完整 https:// 下載地址。",
    "That link didn't return an IPA. It has to download the file itself — a page that only links to the .ipa, or one that asks you to sign in first, arrives here as a web page.":
        "該鏈接返回的不是 IPA。它必須直接下載文件——只是指向 .ipa 的網頁，或先要求登錄的網頁，到這裡都只是一個網頁。",
    "Couldn't download that link: %@": "無法下載該鏈接：%@",
    "there's nothing to download for a custom IPA — import one first":
        "自定義 IPA 沒有可下載的內容 —— 請先導入一個文件",
    "your app": "你的應用",
    "Apple won't issue a signing certificate for this Apple ID: it reports that one already exists, or that a request for one is still pending (error 7460). SideNeko couldn't reuse the certificate that's already there, so it stopped instead of replacing it. See the steps above.":
        "Apple 不會為此 Apple ID 簽發簽名證書：它報告已經存在一個證書，或者仍有一個申請在處理中（錯誤 7460）。SideNeko 無法復用已有的證書，因此停止了操作，而不是替換它。請參見上面的步驟。",
    " (UDID %@)": " (UDID %@)",
    "Couldn't register this iPhone%@ with your Apple ID's developer team, so Apple won't issue a provisioning profile. %@ — see the steps above.":
        "無法將此 iPhone%@ 註冊到你 Apple ID 的開發者團隊，因此 Apple 不會簽發描述文件。%@ —— 請參見上面的步驟。",
    "Connect to Wi-Fi": "連接 Wi-Fi",
    "Open Settings › Wi-Fi and join a network.": "打開 設置 › Wi-Fi 並加入一個網絡。",
    "Then come back here — this continues automatically.": "然後回到這裡 —— 接下來會自動繼續。",
    "Tap Connect so the toggle turns on.": "輕點 Connect，讓開關打開。",
    "Keep Wi-Fi on, then come back here — this continues automatically.":
        "保持 Wi-Fi 開啓，然後回到這裡 —— 接下來會自動繼續。",
    "Get LocalDevVPN": "獲取 LocalDevVPN",
    "Import an .ipa first": "請先導入一個 .ipa",
    "Tap “Import .ipa” above and pick the file — it can live anywhere the Files app can reach, including iCloud Drive or a USB drive.":
        "輕點上方的“導入 .ipa”並選擇文件 —— 文件可以放在“文件”App 能訪問的任何位置，包括 iCloud 雲盤或 U 盤。",
    "Or paste a direct download link under that button, and SideNeko fetches the .ipa itself.":
        "或者在該按鈕下方粘貼直接下載鏈接，SideNeko 會自己把 .ipa 取回來。",
    "Or open the Files app, press and hold the .ipa, tap Share, and pick SideNeko — that hands the file over without the picker.":
        "或者打開“文件”App，長按該 .ipa，點按“共享”並選擇 SideNeko——這樣文件不經過選擇器就能交過來。",
    "Or copy it into Files › On My iPhone › SideNeko, where SideNeko also finds it.":
        "也可以把它複製到 文件 › 我的 iPhone › SideNeko，SideNeko 同樣能找到。",
    "This is the way in where GitHub is blocked: fetch the IPA on any device, bring it over, and install it here.":
        "在 GitHub 被封鎖的地區，這就是可行的辦法：在任何設備上取得 IPA，帶過來，然後在這裡安裝。",
    "Bring the .ipa yourself": "自行提供 .ipa",
    "%@ can't be downloaded while its GitHub repository is offline. The other apps still install as usual.":
        "%@ 的 GitHub 代碼倉庫下線期間無法下載。其他 App 仍可照常安裝。",
    "To install it anyway, get its .ipa from somewhere you trust, name it %@, and copy it into Files › On My iPhone › SideNeko.":
        "如果仍想安裝，請從你信任的來源取得它的 .ipa，命名為 %@，然後複製到 文件 › 我的 iPhone › SideNeko。",
    "Then tap Install again — SideNeko uses your file instead of downloading one.":
        "然後再次輕點“安裝”—— SideNeko 會使用你的文件，而不再下載。",
    "If you reach GitHub through a VPN or proxy app, turn off LocalDevVPN and turn that one on: iOS runs only one VPN at a time.":
        "如果你需要通過 VPN 或代理 App 才能訪問 GitHub，請關閉 LocalDevVPN，再打開那個 App：iOS 一次只能運行一個 VPN。",
    "Tap “Get the .ipa” below and save the file, or download it on another device and bring it over.":
        "輕點下方的“獲取 .ipa”並保存文件，或者在另一台設備上下載後再傳到這台 iPhone。",
    "Back in SideNeko, pick Custom .ipa under Install, tap “Import .ipa” and choose the file. SideNeko recognizes %@ and sets it up just like its own download.":
        "回到 SideNeko，在“安裝”下選擇“自定義 .ipa”，輕點“導入 .ipa”並選取該文件。SideNeko 會識別出 %@，並像它自己下載的版本一樣完成設置。",
    "Turn LocalDevVPN back on, then tap Install.": "重新打開 LocalDevVPN，然後輕點“安裝”。",
    "Get the .ipa": "獲取 .ipa",
    "Pair this iPhone in Settings": "在 設置 中配對此 iPhone",
    "Open the Settings app, then go to Privacy & Security › Developer Mode.":
        "打開 設置 應用，然後進入 隱私與安全性 › 開發者模式。",
    "Tap “Pair with SideNeko”.": "輕點“與 SideNeko 配對”。",
    "Enter your iPhone’s passcode if it asks for it.": "如果系統要求，請輸入你的 iPhone 密碼。",
    "Come back to SideNeko, read the code it shows you, then type that same code into the prompt in Settings.":
        "回到 SideNeko，查看它顯示給你的驗證碼，然後把相同的驗證碼輸入到 設置 中的提示框內。",
    "Type the code that appears at the top of the screen into the prompt in Settings. If none appears, come back to SideNeko to read it.":
        "將屏幕頂部顯示的驗證碼輸入到 設置 中的提示框內。如果沒有顯示，請回到 SideNeko 查看。",
    "Allow notifications when SideNeko asks: that's how the pairing code reaches you in Settings.":
        "當 SideNeko 詢問時，請允許通知：配對碼會通過通知顯示在 設置 中。",

    // The pairing Live Activity
    "Privacy & Security › Developer Mode › Pair with SideNeko":
        "隱私與安全性 › 開發者模式 › 與 SideNeko 配對",
    "Paired": "已配對",
    "Tap to return to SideNeko.": "輕點以返回 SideNeko。",

    // The install's progress outside the app
    "Installing %@": "正在安裝 %@",
    "Paused": "已暫停",
    "Open SideNeko to finish the install.":
        "打開 SideNeko 以完成安裝。",
    "Check the App IDs it needs, then tap Install.":
        "查看所需的 App ID，然後輕點“安裝”。",
    "Tap Trust": "輕點“信任”",
    "Unlock this iPhone and tap Trust when it asks.":
        "解鎖此 iPhone，並在詢問時輕點“信任”。",

    "A signing certificate already exists": "已存在簽名證書",
    "Apple returned error 7460: this Apple ID already has an iOS development certificate, or a request for one is still pending.":
        "Apple 返回錯誤 7460：此 Apple ID 已有一個 iOS 開發證書，或者有一個申請仍在處理中。",
    "SideNeko couldn't reuse it. That happens when the certificate was issued somewhere else — AltStore, SideStore, Sideloadly or Xcode on another device — so the private key it needs isn't on this iPhone.":
        "SideNeko 無法復用它。當證書是在別處簽發時就會這樣——另一台設備上的 AltStore、SideStore、Sideloadly 或 Xcode——所需的私鑰並不在這台 iPhone 上。",
    "Use “Revoke and retry” above, or open Certificates in the Tools tab, tap “Load certificates”, and revoke it there.":
        "使用上方的“吊銷並重試”，或在“工具”標籤頁中打開“證書”，點按“加載證書”，在那裡吊銷它。",
    "Revoking is permanent: every app already signed with that certificate stops launching, on every device.":
        "吊銷不可撤回：所有已用該證書簽名的 App 都將無法啓動，在所有設備上都是如此。",
    "Alternatively, sign in with a different (or spare) Apple ID above, then tap Install again.":
        "或者，在上面用另一個（或備用的）Apple ID 登錄，然後再次輕點“安裝”。",

    // MARK: - Guide cards

    // Guide: reset a locked Apple Account

    "Reset your Apple Account password": "重設你的 Apple 賬戶密碼",
    "Apple has locked this Apple Account for security reasons, often after too many sign-in attempts. Every sign-in fails until it's unlocked, so tapping Install again won't help yet.":
        "出於安全原因，Apple 已鎖定此 Apple 賬戶，通常是因為登錄嘗試次數過多。在解鎖之前每次登錄都會失敗，所以現在再次輕點“安裝”也沒有用。",
    "Open iForgot, enter this Apple Account's email, and follow Apple's steps to unlock it and reset its password.":
        "打開 iForgot，輸入此 Apple 賬戶的電子郵件，然後按照 Apple 的步驟解鎖並重設密碼。",
    "Back in SideNeko, open Settings › Account, swipe left on this Apple ID, tap Edit, and enter the new password.":
        "回到 SideNeko，打開“設置 › 賬戶”，在此 Apple ID 上向左輕掃，輕點“編輯”，然後輸入新密碼。",
    "Then tap Install again.": "然後再次輕點“安裝”。",
    "Open iForgot": "打開 iForgot",
    "Apple won't let this Apple Account use developer services because of its owner's age (error 1102). Sign in with an adult's Apple Account instead.":
        "由於賬戶持有人的年齡，Apple 不允許此 Apple 賬戶使用開發者服務（錯誤 1102）。請改用成年人的 Apple 賬戶登錄。",
    "This Apple ID has no App IDs left (error 9120). A free Apple ID can register 10 a week, and each one counts for 7 days, so wait for some to expire or sign in with another Apple ID.":
        "此 Apple ID 已沒有可用的 App ID（錯誤 9120）。免費 Apple ID 每周可註冊 10 個，每個會佔用 7 天，所以請等一些過期，或用另一個 Apple ID 登錄。",
    "This iPhone already has three apps signed with a free Apple ID, the most iOS allows, counting expired ones. Delete one of them, then try again.":
        "此 iPhone 上已有三個用免費 Apple ID 簽名的 App，這是 iOS 允許的上限，已過期的也算在內。刪除其中一個後再試一次。",
    "This Apple Account can't sign apps": "此 Apple 賬戶無法簽名 App",
    "Apple only lets adults use the developer services SideNeko signs apps with, and it reports that this Apple Account belongs to someone younger (error 1102).":
        "Apple 只允許成年人使用 SideNeko 用來簽名 App 的開發者服務，而它顯示此 Apple 賬戶屬於未成年人（錯誤 1102）。",
    "Sign in with an adult's Apple Account instead: open Settings › Account and add it there.":
        "請改用成年人的 Apple 賬戶登錄：打開“設置 › 賬戶”並在那裡添加。",
    "Apple won't let this Apple Account use developer services until its email address is verified (error 2160). Verify it at account.apple.com, then try again.":
        "在電子郵件地址通過驗證之前，Apple 不允許此 Apple 賬戶使用開發者服務（錯誤 2160）。請在 account.apple.com 驗證後再試。",
    "Verify your Apple Account's email":
        "驗證你的 Apple 賬戶電子郵件",
    "Apple won't let this Apple Account sign apps until its email address is verified (error 2160). Signing in again or through another anisette server won't change that.":
        "在電子郵件地址通過驗證之前，Apple 不允許此 Apple 賬戶簽名 App（錯誤 2160）。重新登錄或換用其他 anisette 服務器都無法改變這一點。",
    "Sign in at account.apple.com with this Apple Account and verify its email address when Apple asks. Apple sends the code or link to that address, so check its spam folder too.":
        "用此 Apple 賬戶登錄 account.apple.com，並在 Apple 提示時驗證電子郵件地址。Apple 會把驗證碼或鏈接發送到該地址，也請檢查垃圾郵件文件夾。",
    "Open Apple Account":
        "打開 Apple 賬戶",
    "No App IDs left this week": "本週已沒有可用的 App ID",
    "Every app SideNeko signs needs an App ID, which its extensions share. A free Apple ID can register 10 a week, and each one counts for 7 days.":
        "SideNeko 簽名的每個 App 都需要一個 App ID，其擴展共用這個 App ID。免費 Apple ID 每周可註冊 10 個，每個會佔用 7 天。",
    "They can't be deleted sooner. Wait until some expire, then tap Install again.":
        "它們無法提前刪除。等一些過期後，再次輕點“安裝”。",
    "Or sign in with a different (or spare) Apple ID in Settings › Account, then tap Install again.":
        "或者在“設置 › 賬戶”中用另一個（或備用的）Apple ID 登錄，然後再次輕點“安裝”。",
    "Three sideloaded apps already": "已有三個側載應用",
    "iOS allows three apps signed with a free Apple ID on an iPhone at a time, and it refused a fourth.":
        "iOS 只允許一台 iPhone 同時安裝三個用免費 Apple ID 簽名的 App，因此拒絕了第四個。",
    "Expired apps count too. Delete one you no longer need from the Home Screen.":
        "已過期的 App 也算在內。從主屏幕刪除一個不再需要的 App。",

    // Guide: import a pairing file

    "Import a pairing file": "導入配對文件",
    "iOS %@ is the first version an iPhone can pair with itself on. On this one the pairing file has to be made on a computer.":
        "iOS %@ 是 iPhone 能與自身配對的第一個版本。在本機上，配對文件必須在電腦上生成。",
    "On a Mac, Windows PC or Linux box, plug this iPhone in, trust the computer, and run jitterbugpair (or “pymobiledevice3 lockdown pair”).":
        "在 Mac、Windows 電腦或 Linux 上插上本機，選擇信任該電腦，然後運行 jitterbugpair（或“pymobiledevice3 lockdown pair”）。",
    "Send the file it writes — a .mobiledevicepairing or .plist — to this iPhone, by AirDrop, iCloud Drive or a cable.":
        "通過隔空投送、iCloud 雲盤或數據線，把生成的文件（.mobiledevicepairing 或 .plist）傳到本機。",
    "Come back here, tap “Import pairing file”, and pick it. Everything after that works as it does on iOS %@.":
        "回到這裡，點按“導入配對文件”並選中它。之後的步驟與 iOS %@ 上完全一致。",
    "Get jitterbugpair": "獲取 jitterbugpair",
    "From iOS 26.4 on it has to be a remote pairing file: this iPhone hangs up on lockdown ones, like jitterbugpair's, when they come through LocalDevVPN.":
        "從 iOS 26.4 起，必須使用“Remote pairing”配對文件：通過 LocalDevVPN 連接時，這台 iPhone 會斷開 lockdown 配對文件（例如 jitterbugpair 生成的）的連接。",
    "Get idevice_pair": "獲取 idevice_pair",
    "Make a remote pairing file": "生成“Remote pairing”配對文件",
    "The pairing file you imported is a lockdown one. Since iOS 26.4, this iPhone hangs up on those when they come through LocalDevVPN, so it can't connect, and a new one of the same kind won't either.":
        "你導入的配對文件是 lockdown 類型。從 iOS 26.4 起，這類文件通過 LocalDevVPN 連接時，這台 iPhone 會斷開連接，所以它無法連接，重新生成一個同類文件也一樣。",
    "Come back here, tap “Replace” on the Pairing file card, and pick it.":
        "回到這裡，在“配對文件”卡片上輕點“更換”，然後選中它。",
    "On a Mac, Windows PC or Linux box, open idevice_pair, plug this iPhone in, and tap Trust if it asks. Pick it, choose “Remote pairing”, click “Create”, and keep this iPhone unlocked until it's done.":
        "在 Mac、Windows 電腦或 Linux 上打開 idevice_pair，插上本機，如有提示就輕點“信任”。選中本機，選擇“Remote pairing”，點擊“Create”，在完成前保持本機解鎖。",
    "Click “Save to file…” and send the file to this iPhone, by AirDrop, iCloud Drive or a cable. A pairing file exported from iLoader works too.":
        "點擊“Save to file…”，再通過隔空投送、iCloud 雲盤或數據線把文件傳到本機。從 iLoader 導出的配對文件也可以用。",

    // MARK: - Revoke-and-retry (Apple error 7460)

    "A certificate already exists": "已存在證書",
    "Apple won't issue a second signing certificate for this Apple ID. Revoking the one it already has lets the install continue — but it can't be undone.":
        "Apple 不會為此 Apple ID 簽發第二個簽名證書。吊銷已有的那個可以讓安裝繼續——但此操作無法撤回。",
    "Loading certificates": "正在加載證書",
    "Revoke and retry": "吊銷並重試",
    "Which certificate should be revoked?": "要吊銷哪個證書？",
    "Apple reports a certificate on this Apple ID, but none came back in the list. It may be a request that's still pending — wait a few minutes and tap Install again.":
        "Apple 報告此 Apple ID 上有證書，但列表返回為空。可能是仍在處理中的申請——請等幾分鐘後再次點按“安裝”。",
    "Every app already signed with the certificate you pick will stop launching, on every device — including apps installed by AltStore, SideStore, or a computer. This can't be undone. The install retries straight afterwards.":
        "所有已用你選擇的證書簽名的 App 都將無法啓動，在所有設備上都是如此——包括通過 AltStore、SideStore 或電腦安裝的 App。此操作無法撤回。安裝會緊接著重試。",
    " (expired)": "（已過期）",

    "Couldn't register this device": "無法註冊此設備",
    "Your Apple ID has hit its limit of registered devices. Free accounts can only register a handful of devices per year and can't remove old ones until the year resets.":
        "你的 Apple ID 已達到註冊設備數量的上限。免費賬戶每年只能註冊少量設備，並且在年度重置之前無法移除舊設備。",
    "Easiest fix: put a different (or spare) Apple ID in the fields above, then tap Install again.":
        "最簡單的解決辦法：在上面的輸入框中填入另一個（或備用的）Apple ID，然後再次輕點“安裝”。",
    "SideNeko couldn't add this iPhone to your Apple ID's developer team automatically. Tapping Install again often works — Apple's developer service is sometimes briefly unavailable.":
        "SideNeko 無法自動將此 iPhone 添加到你 Apple ID 的開發者團隊。再次輕點“安裝”通常就能成功 —— Apple 的開發者服務有時會短暫不可用。",
    "If it keeps failing, add the device by hand. Its UDID is:":
        "如果一直失敗，請手動添加該設備。它的 UDID 是：",
    "Paste that into the “Register a Device” form in the Apple Developer portal (this requires a paid Apple Developer account), then tap Install again.":
        "把它粘貼到 Apple Developer 門戶中的“Register a Device”表單里（這需要付費的 Apple Developer 賬戶），然後再次輕點“安裝”。",
    "Open device list": "打開設備列表",

    "Last step: trust %@": "最後一步：信任 %@",
    "Open Settings › General › VPN & Device Management.":
        "打開 設置 › 通用 › VPN 與設備管理。",
    "Tap your Apple ID under “Developer App”, then tap Trust.":
        "在“開發者 App”下輕點你的 Apple ID，然後輕點“信任”。",
    "Open %@ from your Home Screen — you're done.":
        "從主屏幕打開 %@ —— 就大功告成了。",

    "Import the certificate into LiveContainer": "將證書導入 LiveContainer",
    "Open LiveContainer from your Home Screen.": "從主屏幕打開 LiveContainer。",
    "Tap the Settings tab.": "輕點 Settings 標籤頁。",
    "Tap “Import Certificate From SideStore”.":
        "輕點“Import Certificate From SideStore”。",
    "Wrong device IP": "設備 IP 有誤",
    "The address in Settings › Advanced › Device IP is one this iPhone already holds, so there's nothing at the other end to connect to.":
        "“設置 › 高級 › 設備 IP”中填的地址是本機已有的地址，另一端沒有可連接的對象。",
    "Set it back to 10.7.0.1, the default. In LocalDevVPN that's the value under Settings › Device IP — not the address on its main screen, which is the tunnel's own end.":
        "改回默認值 10.7.0.1。在 LocalDevVPN 中，它是“設置 › Device IP”里的值，而不是主界面上顯示的地址——那是隧道自己的一端。",
    "If you changed LocalDevVPN's addresses, copy its Device IP here — including the /32, if it shows one.":
        "若你改過 LocalDevVPN 的地址，請把它的 Device IP 複製到這裡——如果末尾帶 /32，一並保留即可。",
    "Device IP is %@, one of this iPhone's own addresses, and iOS won't let an app connect to those. In Settings › Advanced, set Device IP to the address under LocalDevVPN's Settings › Device IP: 10.7.0.1 by default, not the “Connected to” address on its main screen.":
        "設備 IP 填的是 %@，這是本機自己的地址之一，iOS 不允許 App 連接到這類地址。請在“設置 › 高級”中，把設備 IP 改為 LocalDevVPN“設置 › Device IP”里的地址（默認是 10.7.0.1），而不是它主界面上“Connected to”（或“已連接至”）後面的地址。",
    "iOS refused the connection to %@ on this iPhone, before anything was sent. It does that for this iPhone's own addresses, like the “Connected to” address on LocalDevVPN's main screen. Device IP, in Settings › Advanced, has to be the address under LocalDevVPN's Settings › Device IP: 10.7.0.1 by default. If it already is, turn LocalDevVPN off and on again, then try again.":
        "iOS 在本機上拒絕了到 %@ 的連接，還沒有發出任何數據。iOS 會拒絕連接本機自己的地址，比如 LocalDevVPN 主界面上“Connected to”（或“已連接至”）後面的那個地址。“設置 › 高級”中的設備 IP 必須是 LocalDevVPN“設置 › Device IP”里的地址（默認是 10.7.0.1）。如果已經是了，請把 LocalDevVPN 關掉再打開，然後重試。",
    "This iPhone hung up on the connection as soon as it opened. From iOS 26.4 on it does that to lockdown pairing files, like this one, when they come through LocalDevVPN. Pair this iPhone with itself instead: tap “Regenerate” under Tools › Pairing, or tap Install, which pairs it first.":
        "這台 iPhone 在連接剛建立時就把它斷開了。從 iOS 26.4 起，通過 LocalDevVPN 連接的 lockdown 配對文件（比如這個）都會被這樣斷開。請改為讓這台 iPhone 與自身配對：在 工具 › 配對 中輕點“重新生成”，或者輕點“安裝”，它會先完成配對。",
    "This iPhone hung up on the connection as soon as it opened. Since iOS 26.4 it does that to lockdown pairing files, like this one, when they come through LocalDevVPN, so a new one of the same kind won't help. A remote pairing file still works: on a computer, open idevice_pair, choose “Remote pairing”, click “Create”, then “Save to file…”, and import the file under “Pairing file”.":
        "這台 iPhone 在連接剛建立時就把它斷開了。從 iOS 26.4 起，通過 LocalDevVPN 連接的 lockdown 配對文件（比如這個）都會被這樣斷開，所以重新生成一個同類文件也沒用。“Remote pairing”配對文件仍然可用：在電腦上打開 idevice_pair，選擇“Remote pairing”，點擊“Create”，再點擊“Save to file…”，然後在“配對文件”中導入這個文件。",
    "This iPhone hung up on the connection: from iOS 26.4 on, it does that to lockdown pairing files like this one when they come through LocalDevVPN. See the steps above.":
        "這台 iPhone 斷開了連接：從 iOS 26.4 起，通過 LocalDevVPN 連接的 lockdown 配對文件（比如這個）都會被這樣斷開。請參見上面的步驟。",
    "Pairing this iPhone needs it: SideNeko advertises itself on the local network for Settings to find.":
        "配對這台 iPhone 需要它：SideNeko 會在本地網絡上廣播自己，供“設置”發現。",
    "Connect to a Wi-Fi network. Pairing this iPhone needs it — SideNeko has to be findable on the local network.":
        "請連接到 Wi-Fi 網絡。配對這台 iPhone 需要它——SideNeko 必須能在本地網絡上被找到。",

    // MARK: - About

    "About": "關於",
    "Version %@ (%@)": "版本 %@ (%@)",
    "SideNeko signs and installs your apps right on this iPhone — no computer needed, nice and easy :3":
        "SideNeko 直接在這台 iPhone 上簽署並安裝你的 App，不用電腦，輕鬆搞定 :3",

    "Links": "鏈接",
    "Source code": "源代碼",
    "Support the project": "支持這個項目",
    "Crypto": "加密貨幣",
    "Donation wallets for Bitcoin, Ethereum and Solana.": "比特幣、以太坊和 Solana 的捐贈錢包。",
    "Crypto donations": "加密貨幣捐贈",
    "Donations are entirely optional. They don't buy anything, unlock any feature or get you anything in return; they're just a way to say thanks if SideNeko has helped you.":
        "捐贈完全自願。捐贈不會購買任何東西，不會解鎖任何功能，也不會帶來任何回報；這只是在 SideNeko 幫到你時表達感謝的一種方式。",
    "Coin": "幣種",
    "Network: %@": "網絡：%@",
    "QR code for the %@ address": "%@ 地址的二維碼",
    "Copied": "已複製",
    "Send each coin only on the network shown. Crypto sent on another network can't be recovered.":
        "每種幣請只通過所示網絡發送。通過其他網絡發送的加密貨幣將無法找回。",

    "Special thanks": "特別感謝",
    "For creating SideInstaller and siboot, which gave SideNeko an important technical reference for its computer-free installation flow and made sideloading with only an iPhone much easier :3":
        "感謝開發 SideInstaller 與 siboot，為 SideNeko 的免電腦安裝流程提供重要的技術參考，讓只用 iPhone 側載 App 變得更方便 :3",
    "For idevice, the library SideNeko talks to your iPhone through. None of this exists without it.":
        "感謝 idevice——SideNeko 正是通過這個庫與你的 iPhone 通信的。沒有它，這一切都不會存在。",
    "For the support, and for spotting the bugs that got fixed because of it.":
        "感謝一路以來的支持，以及發現了那些因此得到修復的問題。",
    "For the Japanese translation.": "感謝提供日語翻譯。",
    "For the Korean translation.": "感謝提供韓語翻譯。",
    "For the Turkish translation.": "感謝提供土耳其語翻譯。",

    "Built with": "基於以下項目",
    "SideNeko's computer-free installation design takes inspiration from SideInstaller.":
        "SideNeko 的免電腦安裝設計參考 SideInstaller。",
    "Signs and performs the first installation right on the iPhone with the user's own Apple Account — no computer needed w":
        "透過使用者自己的 Apple 帳號，在 iPhone 上完成簽署與初次安裝，不需要電腦 w",
    "SideNeko is happily built with these lovely open-source projects w": "SideNeko 開心地使用了這些可愛的開源項目 w",
    "Pairing, the tunnel and the install itself. By jkcoxson, MIT.":
        "配對、隧道以及安裝本身，由 jkcoxson 開發，MIT 許可證。",
    "Apple ID sign in, certificates and signing on the device. By nab138, MIT.":
        "Apple ID 登錄、證書與本機簽名，由 nab138 開發，MIT 許可證。",
    "The code signer isideload uses for each app. By Dadoum, LGPL-2.1.":
        "isideload 用來為每個 App 簽名的代碼簽名工具，由 Dadoum 開發，LGPL-2.1 許可證。",
    "The sideloading app this installs for you.":
        "本應用為你安裝的側載應用。",
    "Runs sideloaded apps without spending an app slot on each one.":
        "運行側載應用，而不必為每個應用佔用一個名額。",

    "Where to get it": "從哪裡獲取",
    "Only the builds on the official install page and repository are mine. Anyone can fork the source, add a credential stealer and ship it under the same name and icon — so don't trust your Apple ID to a copy from anywhere else.":
        "只有官方安裝頁面和代碼倉庫上的構建版本才是我發佈的。任何人都可以 fork 源代碼，加入竊取憑據的代碼，再用同樣的名稱和圖標發佈——所以不要把你的 Apple ID 交給來自其他地方的副本。",
    "Install page": "安裝頁面",
    "Terms": "條款",

    "%@ needs iOS %d or later. This iPhone runs iOS %@.": "%@ 需要 iOS %d 或更高版本。這台 iPhone 運行的是 iOS %@。",

    // MARK: - App ID cost

    "App IDs for this app": "此 App 所需的 App ID",
    "Cost": "消耗",
    "Left now": "當前剩餘",
    "Left after": "安裝後剩餘",
    "New App IDs": "新 App ID",
    "This Apple ID doesn't have enough App IDs left: this app needs %d, and %d are left. Each one counts for 7 days, so wait for some to expire or sign in with another Apple ID.":
        "此 Apple ID 剩餘的 App ID 不夠：此 App 需要 %d 個，只剩 %d 個。每個會佔用 7 天，請等一些過期，或改用其他 Apple ID 登錄。",
    "The next one frees up on %@.": "下一個將於 %@ 釋放。",
    "Your Apple ID already has every App ID this app needs, so installing it uses none.":
        "你的 Apple ID 已擁有此 App 需要的所有 App ID，安裝它不會消耗任何 App ID。",
    "Signing registers one App ID for the app, and its extensions share it. It counts for 7 days.":
        "簽名時只為 App 註冊一個 App ID，其擴展共用它。它會佔用 7 天。",
    "This Apple ID can register %d a week.": "此 Apple ID 每周可註冊 %d 個。",

    // MARK: - Links (sideneko://install, sideneko://pairingFile)

    "Install from a link?": "從鏈接安裝？",
    "Download and install": "下載並安裝",
    "SideNeko will download this .ipa, then sign it with your Apple ID and install it. Only go ahead if you trust where the link came from.":
        "SideNeko 將下載此 .ipa，用你的 Apple ID 簽名後安裝。只有在你信任該鏈接來源時才繼續。",
    "It replaces %@, the custom .ipa you have now.": "它會替換你當前的自定義 .ipa %@。",
    "Use SideStore's pairing file?": "使用 SideStore 的配對文件？",
    "Import this pairing file?": "導入此配對文件？",
    "Import": "導入",
    "SideStore sent back the pairing file it has. SideNeko will connect to this iPhone with it.":
        "SideStore 已發回它現有的配對文件。SideNeko 將用它連接這台 iPhone。",
    "A link sent SideNeko a pairing file. Only import it if you asked for one: SideNeko will connect to this iPhone with it.":
        "某個鏈接向 SideNeko 發送了配對文件。只有在你主動請求時才導入：SideNeko 將用它連接這台 iPhone。",
    "It replaces %@.": "它會替換 %@。",
    "It replaces the pairing file in use now.": "它會替換當前使用的配對文件。",
    "Get it from SideStore": "從 SideStore 獲取",
    "SideStore opens and sends back the pairing file it has.": "SideStore 會打開併發回它現有的配對文件。",
    "SideStore isn't installed on this iPhone, so there's no pairing file to get from it.":
        "這台 iPhone 上沒有安裝 SideStore，因此無法從中獲取配對文件。",
    "SideNeko takes the pairing file LiveContainer's built-in SideStore has.":
        "SideNeko 會讀取 LiveContainer 內置 SideStore 現有的配對文件。",
    "This is the pairing file LiveContainer's built-in SideStore has. SideNeko will connect to this iPhone with it.":
        "這是 LiveContainer 內置 SideStore 現有的配對文件。SideNeko 將用它連接這台 iPhone。",
    "In LiveContainer's Multitask Mode, SideNeko can't open the built-in SideStore's files. Open SideNeko in LiveContainer without Multitask Mode, then try again, or tap “Import pairing file” and pick the file your computer made.":
        "在 LiveContainer 的多任務模式下，SideNeko 無法打開內置 SideStore 的文件。請在 LiveContainer 中不使用多任務模式打開 SideNeko，然後重試；或者點按“導入配對文件”，選擇電腦生成的文件。",
    "Inside LiveContainer, SideStore can't send its pairing file back to SideNeko, and LiveContainer's built-in SideStore has none that SideNeko can use. Tap “Import pairing file” and pick the file your computer made, or import one into SideStore first, then try again here.":
        "在 LiveContainer 中，SideStore 無法把配對文件發回給 SideNeko，而 LiveContainer 內置的 SideStore 也沒有 SideNeko 能用的配對文件。請點按“導入配對文件”，選擇電腦生成的文件；或者先把配對文件導入 SideStore，然後回到這裡重試。",
    "That install link has no .ipa in it. It needs ?url= followed by the https:// address the .ipa downloads from.":
        "該安裝鏈接中沒有 .ipa。它需要 ?url= 後跟下載 .ipa 的 https:// 地址。",
    "That link was meant to carry a pairing file, but what it holds can't be read.": "該鏈接本應包含配對文件，但其內容無法讀取。",
    "That link carries a file, but it isn't a pairing file.": "該鏈接包含一個文件，但不是配對文件。",

    // MARK: - Report a problem

    "Report a problem": "報告問題",
    "Report this problem": "報告此問題",
    "Opens a GitHub issue with this app's details, its log and crash logs.":
        "在 GitHub 上新建 Issue，附帶本應用的詳細信息、日誌和崩潰日誌。",
    "What happened?": "發生了什麼？",
    "What were you doing, and what went wrong?": "你當時在做什麼，出了什麼問題？",
    "Say what you tapped, what you expected and what happened instead. English is best, but any language is fine.":
        "請說明你點了什麼、預期會發生什麼、實際發生了什麼。最好用英文，但任何語言都可以。",
    "Included": "包含內容",
    "Device": "設備",
    "App": "應用",
    "Stopped at": "停止於",
    "not connected": "未連接",
    "none": "無",
    "made on this iPhone": "在此 iPhone 上生成",
    "Runs inside LiveContainer": "在 LiveContainer 中運行",
    "on": "已開啓",
    "off": "已關閉",
    "unknown": "未知",
    "yes": "是",
    "no": "否",
    "latest": "最新",
    "custom server": "自定義服務器",
    "Auto, starts with %@": "自動，從 %@ 開始",
    "Error": "錯誤",
    "Activity log": "活動日誌",
    "%d lines": "%d 行",
    "Your Apple ID, device name, serial numbers and keys are taken out of the log first.":
        "Apple ID、設備名稱、序列號和密鑰會先從日誌中移除。",
    "Crash logs": "崩潰日誌",
    "Looking for crash logs …": "正在查找崩潰日誌 …",
    "Look for crash logs on this iPhone": "在此 iPhone 上查找崩潰日誌",
    "Look again": "重新查找",
    "No crash logs from SideStore or LiveContainer in the last %d days.":
        "最近 %d 天內沒有 SideStore 或 LiveContainer 的崩潰紀錄。",
    "iOS hands SideNeko its own crashes the next time it opens. Crash logs from SideStore and LiveContainer are read from this iPhone through LocalDevVPN.":
        "SideNeko 下次開啟時，iOS 會把它自己的崩潰紀錄交回來；SideStore 與 LiveContainer 的紀錄則會透過 LocalDevVPN 讀取。",
    "Open a GitHub issue": "在 GitHub 上新建 Issue",
    "Share the report": "分享報告",
    "Preview the report": "預覽報告",
    "Report": "報告",
    "The issue opens filled in. When the log is too long for that, SideNeko copies it for you to paste at the end of the issue. The whole report is also saved in %@.":
        "Issue 會自動填好。如果日誌太長、無法自動填入，SideNeko 會把它複製下來，供你粘貼到 Issue 末尾。完整報告也保存在 %@。",
    "Files › On My iPhone": "“文件” › 我的 iPhone",
    "Copy the full log": "複製完整日誌",
    "Paste the log into the issue": "把日誌粘貼到 Issue 中",
    "Open GitHub": "打開 GitHub",
    "The full log is too long to fill in, so SideNeko copied it. On GitHub, tap the end of the text, choose Paste, then submit the issue.":
        "完整日誌太長，無法自動填入，所以 SideNeko 已將其複製。在 GitHub 上輕點文本末尾，選擇“粘貼”，然後提交 Issue。",
    "Describe the problem above first.": "請先在上方描述問題。",
    "Couldn't save the report: %@": "無法保存報告：%@",

    // MARK: - Official download check

    "Did you download SideNeko from thanking157.github.io/SideNeko?":
        "你是從 thanking157.github.io/SideNeko 下載的 SideNeko 嗎？",
    "SideNeko is open source, so anyone can publish a modified copy that steals the Apple ID typed into it. Only thanking157.github.io/SideNeko is official.":
        "SideNeko 是開源的，任何人都可以發佈經過修改、會竊取所輸入 Apple ID 的副本。只有 thanking157.github.io/SideNeko 是官方來源。",
    "Yes, from thanking157.github.io/SideNeko":
        "是，來自 thanking157.github.io/SideNeko",
    "No, or I'm not sure":
        "不是，或不確定",
    "Don't sign in with this copy":
        "請勿用此副本登錄",
    "Copies from anywhere other than thanking157.github.io/SideNeko are unofficial and may have been changed to steal your Apple ID. Delete this one and install SideNeko from thanking157.github.io/SideNeko, then sign in there.":
        "來自 thanking157.github.io/SideNeko 以外的副本均非官方，可能已被修改以竊取你的 Apple ID。請刪除此副本，從 thanking157.github.io/SideNeko 安裝 SideNeko，然後在那裡登錄。",
    "Open thanking157.github.io/SideNeko":
        "打開 thanking157.github.io/SideNeko",
    "Back":
        "返回",
    "I understand the risks":
        "我瞭解風險",
    "Use an unofficial copy?":
        "使用非官方副本？",
    "If this copy was changed, it can send your Apple ID and password to someone else. Continue only if you trust where it came from.":
        "如果此副本被修改過，它可能會把你的 Apple ID 和密碼發送給他人。只有在你信任其來源時才繼續。",

    // MARK: - Side by Side: their address, and the pairing file SideNeko gets

    "Couldn't reach their iPhone at %@. Check the address (Settings › Wi-Fi › ⓘ on their iPhone), that both iPhones are on the same Wi-Fi network, and that Local Network is on for SideNeko in this iPhone's Settings. Guest and public networks often keep devices from reaching each other.":
        "無法連接到位於 %@ 的對方 iPhone。請檢查地址（在對方 iPhone 的 設置 › 無線局域網 › ⓘ 中），確認兩台 iPhone 連接的是同一個 Wi-Fi 網絡，並確認已在這台 iPhone 的 設置 中為 SideNeko 打開本地網絡。訪客網絡和公共網絡通常會阻止設備之間互相連接。",
    "Their iPhone": "對方的 iPhone",
    "They tapped “Don't Trust” on their iPhone. Start again, and have them tap Trust.":
        "對方在 iPhone 上輕點了“不信任”。請重新開始，並讓對方輕點“信任”。",
    "Pairs from its Settings": "在其設置中配對",
    "Waiting for them to tap Trust…": "等待對方輕點“信任”…",
    "Tap Trust on their iPhone": "在對方的 iPhone 上輕點“信任”",
    "On their iPhone: Settings › Wi-Fi › ⓘ next to the network, then “IP Address”.":
        "在對方的 iPhone 上：設置 › 無線局域網 › 網絡旁的 ⓘ，然後查看“IP 地址”。",
    "Unlock their iPhone, then tap Trust in the prompt that comes up.": "解鎖對方的 iPhone，然後在彈出的提示中輕點“信任”。",
    "This iPhone is %@, so theirs will look similar.": "這台 iPhone 是 %@，對方的地址會與之相近。",
    "“%@” isn't an IPv4 address. It should look like 192.168.1.42.": "“%@”不是 IPv4 地址。它應該形如 192.168.1.42。",
    "Do you have the device's IP?": "你知道對方設備的 IP 地址嗎？",
    "Optional": "可選",
    "SideNeko asks their iPhone to pair directly. Needed below iOS 27.":
        "SideNeko 直接請求對方的 iPhone 配對。iOS 27 以下需要這樣做。",
    "Their iPhone pairs from its own Settings, which needs iOS 27.": "對方的 iPhone 在自己的 設置 中配對，這需要 iOS 27。",
    "IP address": "IP 地址",
    "Their iPhone runs iOS %@. From iOS 26.4 on, SideNeko can't use the pairing their iPhone gives over Wi-Fi, so it needs a pairing file made on a computer.":
        "對方的 iPhone 運行 iOS %@。從 iOS 26.4 起，SideNeko 無法使用對方 iPhone 通過 Wi-Fi 給出的配對，所以需要用電腦製作的配對文件。",
    "Get LocalDevVPN from the App Store and connect it: SideNeko works through it.":
        "從 App Store 獲取 LocalDevVPN 並連接：SideNeko 要通過它工作。",
    "Open SideNeko. Its pairing file is already in place.": "打開 SideNeko。它的配對文件已經放好了。",
    "Open SideNeko and import a pairing file made on a computer.": "打開 SideNeko，導入用電腦製作的配對文件。",
    "%@ is an address this iPhone already holds. Side by Side installs onto someone else's iPhone, so use theirs. To install on this one, use the Install tab.":
        "%@ 是這台 iPhone 自己的地址。Side by Side 用於安裝到別人的 iPhone 上，請填對方的地址。要安裝到這台設備，請使用“安裝”標籤頁。",
    "Their iPhone runs iOS %@. From iOS 26.4 on, %@ can't use the pairing their iPhone gives over Wi-Fi. iOS 27 pairs from its own Settings instead, which works: update their iPhone, then try again and answer No when asked for its IP.":
        "對方的 iPhone 運行 iOS %@。從 iOS 26.4 起，%@ 無法使用對方 iPhone 通過 Wi-Fi 給出的配對。iOS 27 改為在自己的設置中配對，這樣可行：請先更新對方的 iPhone，再重試，並在詢問 IP 時選擇“否”。",

    // MARK: - AltStore

    "couldn't reach %@: %@":
        "無法連接到 %@：%@",
    "%@ answered HTTP %d":
        "%@ 返回了 HTTP %d",
    "%@'s list of apps couldn't be read (%@). Something on this network may have replaced it.":
        "無法讀取 %@ 的應用列表（%@）。此網絡上的某個環節可能替換了它。",
    "the %@ that arrived isn't the file %@ lists, so it isn't installed. Try again later.":
        "收到的 %@ 不是 %@ 列出的文件，因此不會安裝。請稍後重試。",
    "%@ lists no version of %@ that runs on iOS %@.":
        "%@ 沒有列出 %@ 可在 iOS %@ 上運行的版本。",
    "Open AltStore from your Home Screen and sign in with your Apple ID.":
        "從主屏幕打開 AltStore，並用你的 Apple ID 登錄。",
    "To install and refresh apps without a computer, tap “Set up Remote AltServer” in AltStore's Settings. Its pairing file is already in place, so the setup skips pairing.":
        "如需在沒有電腦的情況下安裝和續簽應用，請在 AltStore 的設置中輕點“Set up Remote AltServer”。它的配對文件已經放好了，所以設置時會跳過配對。",
    "To install and refresh apps without a computer, tap “Set up Remote AltServer” in AltStore's Settings and follow its steps.":
        "如需在沒有電腦的情況下安裝和續簽應用，請在 AltStore 的設置中輕點“Set up Remote AltServer”，然後按步驟操作。",
    "Open AltStore and sign in with the same Apple ID.":
        "打開 AltStore，用同一個 Apple ID 登錄。",

    // MARK: - Developer team

    "Free · %@": "免費 · %@",
    "Paid · %@": "付費 · %@",
    "This Apple Account is on %d developer teams. Pick the one that signs.":
        "此 Apple 賬戶屬於 %d 個開發團隊。請選擇用來簽名的團隊。",
    "Which Team?": "哪個團隊？",
    "Signed this copy of SideNeko": "簽名了這份 SideNeko",
    "A free team's apps last 7 days; a paid team's last a year.": "免費團隊簽名的應用可用 7 天；付費團隊簽名的可用一年。",
    "An app installed with another team isn't replaced: signing it with this one installs a second copy.":
        "用其他團隊安裝的應用不會被替換：用此團隊簽名會另外安裝一個副本。",
    "SideNeko remembers the pick for this Apple ID. To pick again, open Settings › Account, swipe the Apple ID left and tap Team.":
        "SideNeko 會為此 Apple ID 記住這個選擇。如需重新選擇，請打開“設置 › 賬戶”，在該 Apple ID 上向左輕掃，然後輕點“團隊”。",
    "No developer team was picked, so the sign-in stopped.": "未選擇開發團隊，因此登錄已停止。",
    "Your Apple Account is on more than one developer team. Open SideNeko and pick the one that signs.":
        "你的 Apple 賬戶屬於多個開發團隊。請打開 SideNeko，選擇用來簽名的團隊。",
    "Pick the team again?": "重新選擇團隊？",
    "Pick Again": "重新選擇",
    "The next sign-in with “%@” asks which developer team signs.": "下次用“%@”登錄時，會詢問用哪個開發團隊簽名。",
]
