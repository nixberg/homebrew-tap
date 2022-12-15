class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift/archive/0.8.0.tar.gz"
  sha256 "921ff6aed274f658f9fae55fdbc94a24bbeba88447ac9fc1df6b402642738dae"
  head "https://github.com/nixberg/genpass-swift.git", branch: "main"

  def install
    system "swift", "build",
        "--product", "genpass",
        "--configuration", "release",
        "--disable-sandbox"
    bin.install ".build/release/genpass"
    
    generate_completion_script "bash", "genpass.bash"
    bash_completion.install "genpass.bash"
    
    generate_completion_script "fish", "genpass.fish"
    fish_completion.install "genpass.fish"
    
    generate_completion_script "zsh", "_genpass"
    zsh_completion.install "_genpass"
  end
  
  def generate_completion_script (shell, file)
    system "#{bin/"genpass"} --generate-completion-script #{shell} > #{file}"
  end
end
