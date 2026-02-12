class Gitid < Formula
  desc "CLI tool for seamlessly managing multiple Git identities across GitHub and GitLab"
  homepage "https://github.com/Huvinesh-Rajendran-12/gitid"
  url "https://github.com/Huvinesh-Rajendran-12/gitid/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "957435c9e8302c237603cf2e8ddc78987fcf704c3ab2e06b32c4556254ed1db0"
  license "MIT"

  depends_on "rust" => :build
  depends_on "git"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Remove cargo metadata
    rm_rf "#{prefix}/.crates.toml"
    rm_rf "#{prefix}/.crates2.json"
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/gitid --version")
  end
end
