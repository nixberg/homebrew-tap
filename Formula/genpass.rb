class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift.git",
      tag:      "0.10.0",
      revision: "06b0f537ac94a832ebd23f260b2e4bf201935c0d"
  license "MIT"
  head "https://github.com/nixberg/genpass-swift.git", branch: "main"

  def install
    system "swift", "build", "--configuration=release", "--disable-sandbox", "--product=#{name}"
    bin.install ".build/release/#{name}"
    generate_completions_from_executable bin/name, "--generate-completion-script"
  end
end
