class GameOfLife < Formula
  desc "Game of Life"
  homepage "https://github.com/nixberg/game-of-life-swift"
  url "https://github.com/nixberg/game-of-life-swift/archive/0.1.0.tar.gz"
  sha256 "950da7fb9361b9f24ffa62be035ba4b390243d2c0717a8798e8fd2fd14400560"
  
  def install
    system "swift", "build",
        "--configuration", "release",
        "--disable-sandbox"
    bin.install ".build/release/game-of-life"
    
    generate_completion_script "bash", "game-of-life.bash"
    bash_completion.install "game-of-life.bash"
    
    generate_completion_script "fish", "game-of-life.fish"
    fish_completion.install "game-of-life.fish"
    
    generate_completion_script "zsh", "_game-of-life"
    zsh_completion.install "_game-of-life"
  end
  
  def generate_completion_script (shell, file)
    system "#{bin/"game-of-life"} --generate-completion-script #{shell} > #{file}"
  end
end
