class Spielos < Formula
  desc "Markdown-native marketing OS for AI IDEs and agents"
  homepage "https://github.com/ShayanSpiel/SpielOS"
  url "https://github.com/ShayanSpiel/SpielOS/releases/download/v0.1.3/SpielOS-0.1.3.tar.gz"
  sha256 "9091af82b3a2416fbaac7955676424563998e6b68ed150a656de26b2a62986d9"
  version "0.1.3"
  license "MIT"

  depends_on "node"
  depends_on "python@3"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/spiel" => "spiel"
  end

  test do
    assert_match "SpielOS", shell_output("#{bin}/spiel help")
  end
end
