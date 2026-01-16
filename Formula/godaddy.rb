class Godaddy < Formula
  desc "GoDaddy DNS CLI tool"
  homepage "https://github.com/howells/godaddy-cli"
  url "https://github.com/howells/godaddy-cli/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "9de4d7e4b8942860a1f4d314afb9035d58538d4ed872b07a68598e70bc360c2d"
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
