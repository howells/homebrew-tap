cask "monogrove" do
  version "0.1.0"
  sha256 "f560ed998bba85acc6bd6cd232d427e14d9adcdefe8315e176499ae35c8ba84d"

  url "https://github.com/howells/monogrove-releases/releases/download/v#{version}/Monogrove-#{version}.dmg"
  name "Monogrove"
  desc "Dependency health for monorepos"
  homepage "https://monogrove.com/"

  # Monogrove ships its own Sparkle-format appcast feed; brew livecheck
  # parses it to detect new versions. The :sparkle strategy is the
  # canonical way to track Sparkle-using apps in homebrew-cask.
  livecheck do
    url "https://monogrove.com/appcast.xml"
    strategy :sparkle
  end

  # auto_updates true tells brew that the app handles its own update
  # mechanism (via the in-app Sparkle banner). Without this flag, brew
  # would try to manage updates itself and fight with the in-app flow.
  auto_updates true

  app "Monogrove.app"

  # `brew uninstall --zap monogrove` removes these too. We explicitly list
  # the legacy `grove` cache locations as well — early adopters who tried
  # the pre-rename builds would otherwise have orphaned files.
  zap trash: [
    "~/Library/Application Support/Monogrove",
    "~/Library/Caches/Monogrove",
    "~/Library/Caches/grove",
    "~/Library/Caches/monogrove",
    "~/Library/Preferences/com.danielhowells.monogrove.plist",
    "~/Library/Preferences/com.wails.grove.plist",
    "~/Library/Saved Application State/com.danielhowells.monogrove.savedState",
  ]
end
