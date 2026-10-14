# frozen_string_literal: true

cask "armkeykey" do
  version "0.10.1,22"
  sha256 "81a1e0840730d8f730c8bb797145d02dafaad843d4b6c5ccf656291875bcb450"

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

  uninstall launchctl: "everstar.armkeykey.first-login",
            pkgutil:   "everstar.armkeykey.mac.pkg",
            delete:    [
              "/Library/ArmKeyKey Setup",
              "/Library/LaunchAgents/everstar.armkeykey.first-login.plist",
            ]

  caveats do
    logout
    <<~EOS
      Save your work and switch to another input source before installing or
      upgrading. Background input-method relaunches do not block installation.
      Quit ArmKeyKey in all logged-in accounts before uninstalling.
      The installer backs up personal copies to ~/Library/ArmKeyKey Installer
      Backup.* and preserves learning data and settings. It does not force-quit
      the input method. Installation requires administrator authorization.
      The shared App is backed up to /Library/ArmKeyKey Installer Backup.*.
      After installation, all users must log out and back in. First-time PKG
      installs open Keyboard Settings and a one-time guide to add ArmKeyKey:
      Text Input > Edit > + > Chinese, Traditional > ArmKeyKey > Add.
      Then select ArmKeyKey from the input menu. Ordinary upgrades skip this
      guide. Uninstall also removes the setup login agent, keeping user data.
      Before uninstalling, also remove ArmKeyKey from your input sources.
    EOS
  end
end
