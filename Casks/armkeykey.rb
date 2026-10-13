# frozen_string_literal: true

cask "armkeykey" do
  version "0.9.0,17"
  sha256 "4fca0a8eda116d39d3c52a6d6a4b578b6358d5b004d3d0ae18b330837964f2bf"

  url "https://github.com/jr-everstar/ArmKeyKey/releases/download/v#{version.csv.first}-build#{version.csv.second}/ArmKeyKey-#{version.csv.first}-build#{version.csv.second}-mac-arm64.pkg"
  name "ArmKeyKey"
  desc "Cangjie, Quick, Cantonese and Zhuyin input method"
  homepage "https://jr-everstar.github.io/ArmKeyKey/"

  livecheck do
    url :url
    regex(/^v(\d+(?:\.\d+)+)-build(\d+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  pkg "ArmKeyKey-#{version.csv.first}-build#{version.csv.second}-mac-arm64.pkg"

  uninstall pkgutil: "everstar.armkeykey.mac.pkg"

  caveats do
    logout
    <<~EOS
      Save your work, switch to another input source and quit ArmKeyKey in all
      logged-in accounts before installing, upgrading or uninstalling.
      The installer backs up personal copies to ~/Library/ArmKeyKey Installer
      Backup.* and preserves learning data and settings. It does not force-quit
      the input method. Installation requires administrator authorization.
      After installation, log out and back in manually, then add ArmKeyKey
      under System Settings > Keyboard > Text Input > Chinese, Traditional.
      Before uninstalling, also remove ArmKeyKey from your input sources.
    EOS
  end
end
