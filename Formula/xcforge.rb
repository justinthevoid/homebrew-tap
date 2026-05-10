class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  version "1.4.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justinthevoid/xcforge/releases/download/v1.4.6/xcforge-v1.4.6-macos-arm64.tar.gz"
      sha256 "51ba81e78a821ae0d95052bc80351d7c4d1547c4f969c4cba1fa85821c11c67a"
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
