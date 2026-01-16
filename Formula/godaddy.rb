class Godaddy < Formula
  desc "GoDaddy DNS CLI tool"
  homepage "https://github.com/howells/godaddy-cli"
  url "https://github.com/howells/godaddy-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ab9f74549c83cb077fe3dff9aca12450580b6c202a5f6d837c3295eaa543c7a9"
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
