class Checkpass < Formula
  desc "Check passwords against the Pwned Passwords API"
  homepage "https://github.com/nixberg/checkpass-swift"
  url "https://github.com/nixberg/checkpass-swift/archive/0.3.0.tar.gz"
  sha256 "9270f4e6f9026cb2918634a40f2834b24e924299c5624e45e0f7fd35cdce7c24"
  
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
