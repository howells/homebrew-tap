cask "monogrove" do
  version "0.1.8"
  sha256 "89bb43379f14df8bdebeb21a6e611d6c125f9e5ab9275ef5412bbf5537903147"

  url "https://github.com/howells/monogrove-releases/releases/download/v#{version}/Monogrove-#{version}.dmg",
      verified: "github.com/howells/monogrove-releases/"
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

  # Expose the standalone CLI/TUI binary on PATH. The Wails binary at
  # Contents/MacOS is the GUI entry — it can't be safely run from a terminal.
  # The release build script (script/build-release.sh) builds a separate
  # `monogrove` binary from cmd/monogrove and drops it into the bundle's
  # Contents/Resources/. Symlinking from there means
  # `brew install --cask monogrove` installs both surfaces in one step:
  #
  #   /Applications/Monogrove.app           — the GUI
  #   /opt/homebrew/bin/monogrove (symlink) — the CLI/TUI
  binary "#{appdir}/Monogrove.app/Contents/Resources/monogrove"

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
