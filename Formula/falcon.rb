class Falcon < Formula
  desc "fal.ai image generation CLI with interactive studio mode"
  homepage "https://github.com/howells/falcon"
  url "https://github.com/howells/falcon/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "10e21b7615b29b6e5c68eb4bfdbde00e0c467a9226232b0654c447dc0d598b57"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    libexec.install Dir["*"]
    (bin/"falcon").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" run "#{libexec}/src/index.ts" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use Falcon, set your fal.ai API key:

        export FAL_KEY='your-api-key'

      Or add it to ~/.falcon/config.json:

        {"apiKey": "your-api-key"}

      Get your API key at: https://fal.ai/dashboard/keys
    EOS
  end

  test do
    assert_match "fal.ai image generation CLI", shell_output("#{bin}/falcon --help")
  end
end
