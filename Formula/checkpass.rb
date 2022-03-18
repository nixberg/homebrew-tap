class Checkpass < Formula
  desc "Check passwords against the Pwned Passwords API"
  homepage "https://github.com/nixberg/checkpass-swift"
  url "https://github.com/nixberg/checkpass-swift/archive/0.5.0.tar.gz"
  sha256 "649eea3e26214f87be7c9c187615fc4446444b5c8c16d236cb05da146b90240a"
  
  def install
    system "swift", "build",
        "--configuration", "release",
        "--disable-sandbox"
    bin.install ".build/release/checkpass"
    
    generate_completion_script "bash", "checkpass.bash"
    bash_completion.install "checkpass.bash"
    
    generate_completion_script "fish", "checkpass.fish"
    fish_completion.install "checkpass.fish"
    
    generate_completion_script "zsh", "_checkpass"
    zsh_completion.install "_checkpass"
  end
  
  def generate_completion_script (shell, file)
    system "#{bin/"checkpass"} --generate-completion-script #{shell} > #{file}"
  end
end
