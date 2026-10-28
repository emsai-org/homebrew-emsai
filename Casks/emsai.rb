cask "emsai" do
  version "0.1.0-beta.3"
  sha256 "cb75570d25722bb884cb6fba24f360e62eaab372f50b7d3572ae18865d3e349a"

  # The release's DMG on GitHub (the license service's counted link,
  # license.emsai.app/download/#{version}?from=brew, once it's deployed;
  # Homebrew 5 checks the URL's host itself: no ).
  url "https://github.com/emsai-org/emsai-releases/releases/download/v#{version}/Emsai-#{version}.dmg"
  name "Emsai"
  desc "Every coding agent in one native window"   # brew style: no platform in it
  homepage "https://emsai.app/"

  livecheck do
    url "https://github.com/emsai-org/emsai-releases/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Emsai updates itself (its updater, signed and notarized releases).
  auto_updates true
  depends_on macos: :tahoe   # Tahoe or later (Homebrew 5: a symbol is the minimum)

  app "Emsai.app"

  uninstall quit:       "app.emsai.Emsai",
            login_item: "Emsai"

  zap trash: [
    "~/Library/Application Support/Emsai",
    "~/Library/Caches/app.emsai.Emsai",
    "~/Library/Preferences/app.emsai.Emsai.agents.plist",
    "~/Library/Preferences/app.emsai.Emsai.chat.plist",
    "~/Library/Preferences/app.emsai.Emsai.plist",
  ]
end
