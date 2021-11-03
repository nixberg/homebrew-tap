class Genpass < Formula
  desc "Simple password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift/archive/0.6.1.tar.gz"
  sha256 "c203475cdf336e6589f441a711bc5e6464600a588ca8ffaa3a61eb5eba674b5c"
  
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
