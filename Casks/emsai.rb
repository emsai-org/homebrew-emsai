cask "emsai" do
  version "0.1.0-beta.1"
  sha256 "b35870ab794865745473ce7b2a3a97beae65535c8d3aaa606eeb28b9637914e4"

  # The release's DMG on GitHub (the license service's counted link,
  # license.emsai.app/download/#{version}?from=brew, once it's deployed).
  url "https://github.com/emsai-org/emsai-releases/releases/download/v#{version}/Emsai-#{version}.dmg"
  name "Emsai"
  desc "Every coding agent in one native window, and the Mac around them"
  homepage "https://emsai.app/"

  livecheck do
    url "https://github.com/emsai-org/emsai-releases/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Emsai updates itself (its updater, signed and notarized releases).
  auto_updates true
  depends_on macos: :tahoe

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
