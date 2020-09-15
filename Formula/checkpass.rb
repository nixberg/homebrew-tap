class Checkpass < Formula
  desc "Check passwords against the Pwned Passwords API"
  homepage "https://github.com/nixberg/checkpass-swift"
  url "https://github.com/nixberg/checkpass-swift/archive/0.2.0.tar.gz"
  sha256 "b42b12fa4c38926a33700e6eb235c9ec5da01e9999a4bb387342903d9df30050"
  
  def install
    system "swift", "build",
        "--configuration", "release",
        "--disable-sandbox"
    bin.install '.build/release/checkpass'
  end
end
