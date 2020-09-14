class Genpass < Formula
  desc "Simple, opinionated password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift/archive/0.3.0.tar.gz"
  sha256 "368c34d7c364eb3a90fd18f44c30cc96ffe61f0c06e47d2e06c60f5fa0b47cd7"
  
  def install
    system "swift", "build",
        "--configuration", "release",
        "--disable-sandbox"
    bin.install '.build/release/genpass'
  end
end
