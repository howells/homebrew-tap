class Godaddy < Formula
  desc "GoDaddy DNS CLI tool"
  homepage "https://github.com/howells/godaddy-cli"
  url "https://github.com/howells/godaddy-cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "faced2b1d083da947be20bcd18603c9f3cf5a587f658407db66cb613e9bf7c7f"
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
