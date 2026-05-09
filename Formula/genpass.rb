class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift.git",
      tag:      "0.10.1",
      revision: "883b9250027bbfecf2430aa68338eecf119bf28d"
  license "MIT"
  head "https://github.com/nixberg/genpass-swift.git", branch: "main"

  def install
    system "swift", "build", "--configuration=release", "--disable-sandbox", "--product=#{name}"
    bin.install ".build/release/#{name}"
    generate_completions_from_executable bin/name, "--generate-completion-script"
  end
end
