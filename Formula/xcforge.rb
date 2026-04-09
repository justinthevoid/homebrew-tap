class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  url "https://github.com/justinthevoid/xcforge/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "86666db226022cc3ff48c9738f1b89e456f940d0788a468086188a21de9fcb4a"
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
