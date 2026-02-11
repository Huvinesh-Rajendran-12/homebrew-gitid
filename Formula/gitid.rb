class Gitid < Formula
  desc "CLI tool for seamlessly managing multiple Git identities across GitHub and GitLab"
  homepage "https://github.com/huvinesh/gitid"
  url "https://github.com/huvinesh/gitid/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
