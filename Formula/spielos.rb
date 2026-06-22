class Spielos < Formula
  desc "Markdown-native marketing OS for AI IDEs and agents"
  homepage "https://github.com/ShayanSpiel/SpielOS"
  url "https://github.com/ShayanSpiel/SpielOS/releases/download/v0.1.2/SpielOS-0.1.2.tar.gz"
  sha256 "0e551efa714f83373500dd9e9267dd7d46ff02fbbd47688790456917cb2d90e3"
  version "0.1.2"
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
