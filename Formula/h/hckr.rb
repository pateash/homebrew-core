class Hckr < Formula
  include Language::Python::Virtualenv

  desc "hckr - Awesome CLI for developers"
  homepage "https://pypi.org/project/hckr/"
  url "https://files.pythonhosted.org/packages/source/h/hckr/hckr-0.2.4.tar.gz"  # Adjust this URL based on the version
  sha256 "21d40e1275e05cf43a6cc0f6f72b15c378c1011fcc4f8577d3658c3a2221fbb9"  # Replace with actual SHA-256 hash of the file

  license "MIT"

  depends_on "python@3.8"
  depends_on "rust"

  def install
    venv = virtualenv_create(libexec, "python3.8")
    venv.pip_install "pip"  # Ensure pip is upgraded

    # dependencies
    venv.pip_install "click"
    venv.pip_install "click-repl"
    venv.pip_install "croniter"
    venv.pip_install "cron-descriptor"
    venv.pip_install "rich"
    venv.pip_install "cryptography"
    venv.pip_install "Faker"
    venv.pip_install "pandas" #To manage data and save in CSV, Excel, and Parquet formats.
    venv.pip_install "openpyxl" # For handling Excel files with Pandas.
    venv.pip_install "xlrd"
    venv.pip_install "pyarrow" # For saving data in Parquet format.
    venv.pip_install "fastavro" # For handling Avro file format.
    venv.pip_install "requests"
    venv.pip_install "art"

    venv.pip_install_and_link buildpath  # Install and link the package
    # Assuming hckr installs an executable, link it to bin
    bin.install_symlink libexec/"bin/hckr"
  end

  test do
    system "#{bin}/hckr", "--version"
  end
end
