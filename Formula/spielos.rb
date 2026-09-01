# Homebrew formula for SpielOS (spielos)
#
# Installs the `spielos` Python package into a vendored virtualenv and wraps it
# so the `spielos` command invokes `python3 -m company` from the vendored
# interpreter. This keeps the macOS/Linux `spielos` CLI working through the real
# Python runtime rather than a stub.
class Spielos < Formula
  include Language::Python::Virtualenv

  desc "AI company operating system with durable Goals, Departments, and approvals"
  homepage "https://spielos.xyz"
  # Content-addressed source sdist published by PyPI.
  url "https://files.pythonhosted.org/packages/3f/1b/dda1d8c766269e422a5a698b6af9bca8072b9966d8a6697949e2247a586e/spielos-8.0.2.tar.gz"
  sha256 "ce9b9894b98a44716515e94877a6e04739a0f9f607594debd33eaac175991581"
  license "MIT"
  head "https://github.com/ShayanSpiel/SpielOS.git", branch: "main"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python@3.12")
    venv.pip_install buildpath

    # Thin wrapper: exec the vendored python running `python3 -m company`.
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
