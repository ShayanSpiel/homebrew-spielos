# Homebrew formula for SpielOS (spielos)
#
# Installs the Python package into a vendored virtualenv and exposes the real
# `spielos` CLI.
class Spielos < Formula
  include Language::Python::Virtualenv

  desc "AI company operating system with durable goals, Workgroups, and approvals"
  homepage "https://spielos.xyz"
  url "https://files.pythonhosted.org/packages/source/s/spielos/spielos-7.2.3.tar.gz"
  sha256 "ad699b791a1004422c7435841c8529975a24fb3ad4aadaaf300519f52b2cd674"
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
