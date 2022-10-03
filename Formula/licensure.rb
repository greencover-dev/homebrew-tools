class Licensure < Formula
  desc "FOSS License management tool for your projects"
  homepage "https://github.com/chasinglogic/licensure"
  license "GPL-3.0-only"
  head "https://github.com/chasinglogic/licensure.git", branch: "master"

  stable do
    url "https://github.com/chasinglogic/licensure/archive/refs/tags/0.2.1.tar.gz"
    sha256 "6b070a217643f047fae5cde3fbcdde39afe92e31640d58b66cb7388ac190391d"
  end

  bottle do
    root_url "https://ghcr.io/v2/greencover-dev/tools"
    sha256 cellar: :any_skip_relocation, monterey: "d5e9273401ae0e90d348c231fa48a6f57ff485fd6cf4afcc99af1947454166e9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/licensure --version")
  end
end
