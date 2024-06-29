class Hckr < Formula
  include Language::Python::Virtualenv

  desc "hckr - Awesome CLI for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/source/h/hckr/hckr-0.2.4.tar.gz"
  sha256 "21d40e1275e05cf43a6cc0f6f72b15c378c1011fcc4f8577d3658c3a2221fbb9"
  license "MIT"

  depends_on "python@3.8"

  def install
    venv = virtualenv_create(libexec, "python3.8")
    venv.pip_install "pip"
    venv.pip_install "packaging" # TODO: remove it in new releases
    system libexec/"bin/pip", "install", "--verbose", "."  # Install package and dependencies
    bin.install_symlink libexec/"bin/hckr"
  end

  test do
    system "#{bin}/hckr", "--version"
  end
end
