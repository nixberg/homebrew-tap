class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift/archive/0.7.0.tar.gz"
  sha256 "93d2c3ea35690c1ce54bf3de44e4b3109974704388773eea20cb5cbb3d548ba1"
  
  def install
    system "swift", "build",
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
