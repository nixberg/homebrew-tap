class Checkpass < Formula
  desc "Check passwords against the Pwned Passwords API"
  homepage "https://github.com/nixberg/checkpass-swift"
  url "https://github.com/nixberg/checkpass-swift/archive/0.4.0.tar.gz"
  sha256 "efff67e3e19ac1aea4302b6d57458d5548486f3b6eaa8ff960acd6d2bf674228"
  
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
