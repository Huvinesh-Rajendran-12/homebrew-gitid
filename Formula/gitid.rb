class Gitid < Formula
  desc "CLI tool for seamlessly managing multiple Git identities across GitHub and GitLab"
  homepage "https://github.com/huvinesh/gitid"
  url "https://github.com/huvinesh/gitid/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ee9e442174a4f15d2ccdc1714e066bc3874e7eb5f520a2b91c42d297015db515"
  license "MIT"

  depends_on "rust" => :build
  depends_on "git"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    bin.install Dir["#{prefix}/bin/gitid"]

    # Remove cargo metadata
    rm_rf "#{prefix}/lib"
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/gitid --version")
  end
end
