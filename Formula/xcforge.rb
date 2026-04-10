class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  url "https://github.com/justinthevoid/xcforge/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "5778ba4ae2bc68e1f130f7b73ef3c18e96bb747729be309d0ece0decd19d1f3a"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/XCForgeCLI" => "xcforge"
  end

  test do
    assert_match "xcforge", shell_output("#{bin}/xcforge --help 2>&1", 0)
  end
end
