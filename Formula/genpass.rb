class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift.git",
      tag:      "0.8.0",
      revision: "33c510166279e223a5396430a761067e0f1353a2"
  license "MIT"
  head "https://github.com/nixberg/genpass-swift.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  uses_from_macos "swift"

  def install
    system "swift", "build",
           "--configuration", "release",
           "--disable-sandbox",
           "--product", "genpass"

    bin.install ".build/release/genpass"

    generate_completions_from_executable bin/"genpass", "--generate-completion-script"
  end
end
