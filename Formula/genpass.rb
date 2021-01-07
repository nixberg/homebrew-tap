class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift/archive/0.5.0.tar.gz"
  sha256 "06ce0e2322297a8b469597057835fde90b46e44ec234e1bf7eb6eba5b581839a"
  
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
