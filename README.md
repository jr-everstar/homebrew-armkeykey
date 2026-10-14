# ArmKeyKey Homebrew tap

一行安裝 [ArmKeyKey](https://github.com/jr-everstar/ArmKeyKey)：

```sh
brew install --cask jr-everstar/armkeykey/armkeykey
```

適用於 Apple Silicon、macOS 26 或以上。Homebrew 會自動加入呢個 tap，下載原專案已簽署及公證嘅 PKG；安裝需要管理員密碼。

安裝或升級前，請儲存工作、切換至其他輸入來源，背景程序重新啟動不會阻擋安裝。0.10.1（build 22）會自動將舊個人版 App 移至 `~/Library/ArmKeyKey Installer Backup.*`，保留學習資料及設定；安裝程式不會強制終止輸入法。共用 App 會備份至 `/Library/ArmKeyKey Installer Backup.*`，再由 PackageKit 原子替換。完成後所有使用者需自行登出再登入。首次安裝會自動開啟鍵盤設定及一次性歡迎指引：文字輸入 → 編輯 → ＋ → 中文（繁體）→ ArmKeyKey → 加入，再從輸入選單選擇 ArmKeyKey。一般升級不會重複顯示，已啟用或看過指引的帳戶會略過。

目前版本為 **0.10.1（build 22）**，提供倉頡三代、Jackchows 五代補完香港版、速成、粵拼、傳統注音及智慧注音。智慧注音支援整句組字、句中改字及本機記住選詞。繁簡、全／半形及聯想詞開關的快捷鍵可自行修改、清除或還原預設；聯想詞開關預設無快捷鍵。切換會顯示帶 App 圖示、跟隨選字表外觀的右上角提示，毋須系統通知權限。

新版 App 的「準備安裝」確認後會自動切換至已啟用的鍵盤來源，再開啟安裝程式；取消不切換，切換失敗會顯示原因。從舊版 App 升級到本版仍使用舊版更新流程。安裝完成後仍需登出再登入。

## 升級

```sh
brew update
brew upgrade --cask --greedy jr-everstar/armkeykey/armkeykey
```

## 移除

先切換至其他輸入來源、關閉 ArmKeyKey，並喺鍵盤設定移除輸入來源，再執行：

```sh
brew uninstall --cask jr-everstar/armkeykey/armkeykey
```

首次登入指引的 LaunchAgent 及安裝狀態目錄會一併清理；學習資料、個人設定及安裝備份會保留。

## 舊 tap 遷移

如果之前用完整 GitHub URL 加入 ArmKeyKey 原始碼 repo，執行一次：

```sh
brew tap --custom-remote jr-everstar/armkeykey https://github.com/jr-everstar/homebrew-armkeykey.git
brew update-reset "$(brew --repository jr-everstar/armkeykey)"
```

呢個步驟會重設此 tap 嘅本機 Git 檔案至新 repo；如有自行修改 cask，請先備份。App 同學習資料不受影響，毋須重新安裝。

## 維護

安裝包及 Release 繼續由 [ArmKeyKey](https://github.com/jr-everstar/ArmKeyKey/releases) 發佈。新版本公開及完成簽署、公證與下載驗證後，更新 `Casks/armkeykey.rb` 嘅 `version`（`APP_VERSION,BUILD`）及最終 PKG `sha256`。

```sh
brew style Casks/armkeykey.rb
brew audit --cask --online jr-everstar/armkeykey/armkeykey
brew livecheck --cask jr-everstar/armkeykey/armkeykey
brew fetch --cask jr-everstar/armkeykey/armkeykey
```
