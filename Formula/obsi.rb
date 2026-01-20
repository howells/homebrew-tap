class Obsi < Formula
  desc "Interactive Obsidian vault CLI with TUI and Claude Code integration"
  homepage "https://github.com/howells/obsi"
  url "https://github.com/howells/obsi/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "38e460cc60673cc23b3fddffb6f280a1cb812269fca67cab4f24166ee697a352"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install"
    libexec.install Dir["*"]
    (bin/"obsi").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" run "#{libexec}/src/index.tsx" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use obsi, set your Obsidian vault path (optional):

        export OBSIDIAN_VAULT='~/path/to/vault'

      Default vault location: ~/Obsi

      For AI-powered commands, install Claude Code:
        npm install -g @anthropic-ai/claude-code
    EOS
  end

  test do
    assert_match "obsi", shell_output("#{bin}/obsi --help 2>&1")
  end
end
