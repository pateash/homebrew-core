class Hckr < Formula
  include Language::Python::Virtualenv

  desc "hckr - Awesome CLI for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/source/h/hckr/hckr-0.2.4.tar.gz" # Adjust this URL based on the version
  sha256 "21d40e1275e05cf43a6cc0f6f72b15c378c1011fcc4f8577d3658c3a2221fbb9" # Replace with actual SHA-256 hash of the file

  license "MIT"

  depends_on "python@3.9"

  def install
      virtualenv_create(libexec, "python3.9")
      venv.pip_install "pip"
      venv.pip_install "hatch"
      venv.pip_install_and_link buildpath

#       system libexec/"bin/python -m hatch", "shell"

#       Dir.chdir(buildpath) do
#         ohai "Current directory: #{Dir.pwd}"
#         ohai "Directory contents: #{Dir.entries('.').join('\n')}"
#         system libexec/"bin/python -m hatch", "shell"
#       end
#       bin.install_symlink libexec/"bin/hckr"
  end
  test do
    system "#{bin}/hckr", "--version"
  end
end
