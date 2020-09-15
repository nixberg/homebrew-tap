class Genpass < Formula
  desc "Simple, opinionated password generator"
  homepage "https://github.com/nixberg/genpass-swift"
  url "https://github.com/nixberg/genpass-swift/archive/0.4.0.tar.gz"
  sha256 "42aaaf3ef0dbb0c0debf72656ad1fe9592ca40ba5100b493590ecb9ea516af29"
  
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
