class Spielos < Formula
  desc "Markdown-native marketing OS for AI IDEs and agents"
  homepage "https://github.com/ShayanSpiel/SpielOS"
  url "https://github.com/ShayanSpiel/SpielOS/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fc3cac5af2df692d58d8561c19fd46f791f5a5bab0f9a2d369fb8c4ce06e0f51"
  version "0.1.0"
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
