# Homebrew formula for SpielOS (spielos)
class Spielos < Formula
  include Language::Python::Virtualenv
  desc "AI company operating system with durable goals, departments, and approvals"
  homepage "https://spielos.xyz"
  url "https://github.com/ShayanSpiel/SpielOS/archive/refs/tags/v6.3.0.tar.gz"
  sha256 "8aa44be3c4cfde78e2187d94b8c1f93d59c13a2b66ac0da9ad9d385b216d0e30"
  license "MIT"
  head "https://github.com/ShayanSpiel/SpielOS.git", branch: "main"
  depends_on "python@3.12"
  def install
    venv = virtualenv_create(libexec, "python@3.12")
    venv.pip_install buildpath
    (bin/"spielos").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python3" -m company "$@"
    EOS
    chmod 0755, bin/"spielos"
  end
  test do
    assert_match "spielos", shell_output("#{bin}/spielos --version")
  end
end
