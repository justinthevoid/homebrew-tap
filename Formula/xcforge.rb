class Xcforge < Formula
  desc "MCP server and CLI for iOS development"
  homepage "https://github.com/justinthevoid/xcforge"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justinthevoid/xcforge/releases/download/v1.7.0/xcforge-v1.7.0-macos-arm64.tar.gz"
      sha256 "91cd82e3767568abed0e4ad18c91c16168488d21002e1c78e8d7ff8b7a277e0d"
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
