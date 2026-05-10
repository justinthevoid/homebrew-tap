class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  url "https://github.com/justinthevoid/xcforge/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "3e42093fc4a099947e4f534bcba6d1c9528df5a2e3b7dc6c1f15658beb93f990"
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
