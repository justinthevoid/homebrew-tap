class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  version "1.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justinthevoid/xcforge/releases/download/v1.4.3/xcforge-v1.4.3-macos-arm64.tar.gz"
      sha256 "e4f234db21e7da58069d36d63370ab75a1c394b17ab39fa4a72248bb6affe70c"
    end
  end

  depends_on :macos

  def install
    bin.install "xcforge"
    (share/"xcforge").install "xcforgeWDA"
  end

  def caveats
    <<~CAVEATS
      xcforgeWDA (UI automation runner source) installed at:
        #{opt_share}/xcforge/xcforgeWDA

      The first UI automation call builds the runner once via xcodebuild,
      so Xcode is required at runtime for UI automation features.
      CLI / build / test / log tools work without Xcode-build of the runner.
    CAVEATS
  end

  test do
    assert_match "xcforge", shell_output("#{bin}/xcforge --help 2>&1", 0)
    assert_predicate share/"xcforge/xcforgeWDA/xcforgeWDA.xcodeproj", :exist?
  end
end
