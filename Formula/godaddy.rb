class Godaddy < Formula
  desc "GoDaddy DNS CLI tool"
  homepage "https://github.com/howells/godaddy-cli"
  url "https://github.com/howells/godaddy-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "a1edc2fda88dac26f824105bfff66366489e53eaa2b9299f72f46228c51d34d7"
  license "MIT"

  def install
    bin.install "godaddy"
  end

  def caveats
    <<~EOS
      To use this tool, set your GoDaddy API credentials:

        export GODADDY_KEY='your-key'
        export GODADDY_SECRET='your-secret'

      Get your API keys at: https://developer.godaddy.com/keys
    EOS
  end

  test do
    assert_match "GoDaddy DNS CLI", shell_output("#{bin}/godaddy 2>&1", 1)
  end
end
