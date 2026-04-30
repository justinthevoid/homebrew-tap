class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  url "https://github.com/justinthevoid/xcforge/archive/refs/tags/v1.3.5.tar.gz"
  sha256 "6830e2f4b55ea58c18d3869c6153bbdf114f3d5ac33b1f4ffe0f147e5eec82ee"
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
