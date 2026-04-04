class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  url "https://github.com/justinthevoid/xcforge/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fbafa287da961e93b7ae8a00cddac97aed1404302115681f3f3cddf1bcc69c16"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xcforge"
  end

  test do
    assert_match "xcforge", shell_output("#{bin}/xcforge --help 2>&1", 0)
  end
end
