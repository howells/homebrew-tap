class Godaddy < Formula
  desc "GoDaddy DNS CLI tool"
  homepage "https://github.com/howells/godaddy-cli"
  url "https://github.com/howells/godaddy-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9a8a4c640dfb5d77c3b46a4f52b2514fd1c94f2b67063e88c1d23a01c3784ccb"
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
