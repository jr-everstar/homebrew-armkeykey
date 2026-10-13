# ArmKeyKey Homebrew tap

一行安裝 [ArmKeyKey](https://github.com/jr-everstar/ArmKeyKey)：

```sh
brew install --cask jr-everstar/armkeykey/armkeykey
```

適用於 Apple Silicon、macOS 26 或以上。Homebrew 會自動加入呢個 tap，下載原專案已簽署及公證嘅 PKG；安裝需要管理員密碼。

安裝或升級前，請儲存工作、切換至其他輸入來源，並關閉所有登入帳戶嘅 ArmKeyKey。如有 `~/Library/Input Methods/ArmKeyKey.app` 個人安裝，請先移走舊 App，保留學習資料。完成後請自行登出再登入，並喺鍵盤設定加入 ArmKeyKey。

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

學習資料及個人設定會保留。

## 舊 tap 遷移

如果之前用完整 GitHub URL 加入 ArmKeyKey 原始碼 repo，執行一次：

```sh
brew tap --custom-remote jr-everstar/armkeykey https://github.com/jr-everstar/homebrew-armkeykey.git
brew update
```

毋須重新安裝 App。

## 維護

安裝包及 Release 繼續由 [ArmKeyKey](https://github.com/jr-everstar/ArmKeyKey/releases) 發佈。新版本公開及完成簽署、公證與下載驗證後，更新 `Casks/armkeykey.rb` 嘅 `version`（`APP_VERSION,BUILD`）及最終 PKG `sha256`。

```sh
brew style Casks/armkeykey.rb
brew audit --cask --online jr-everstar/armkeykey/armkeykey
brew livecheck --cask jr-everstar/armkeykey/armkeykey
brew fetch --cask jr-everstar/armkeykey/armkeykey
```
