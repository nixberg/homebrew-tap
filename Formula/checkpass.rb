class Checkpass < Formula
  desc "Check passwords against the Pwned Passwords API"
  homepage "https://github.com/nixberg/checkpass-swift"
  url "https://github.com/nixberg/checkpass-swift.git",
      tag:      "0.5.0",
      revision: "916cb46099bd4066673c72b7d1b4ff5d43f54854"
  license "MIT"
  head "https://github.com/nixberg/checkpass-swift.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  uses_from_macos "swift"

  def install
    system "swift", "build",
           "--configuration", "release",
           "--disable-sandbox",
           "--product", "checkpass"

    bin.install ".build/release/checkpass"

    generate_completions_from_executable bin/"checkpass", "--generate-completion-script"
  end
end
