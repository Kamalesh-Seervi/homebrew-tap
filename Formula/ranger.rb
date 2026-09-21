# Homebrew formula for ranger.
#
# This is a template. Every tagged release runs .github/workflows/release.yml,
# which fills in the version and per-platform sha256 values and attaches a
# ready-to-use ranger.rb to the GitHub Release. Copy that generated file into
# your Homebrew tap (e.g. Formula/ranger.rb in brew install Kamalesh-Seervi/tap/ranger), then:
#
#   brew install Kamalesh-Seervi/tap/ranger
#
# Note: homebrew-core already ships a "ranger" (the file manager). In your own
# tap the name is fine; if you also use that tool, rename this formula/binary.
class Ranger < Formula
  desc "Wireless survey tool: scans Wi-Fi, BLE, and mDNS into a live dashboard"
  homepage "https://github.com/Kamalesh-Seervi/ranger"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/Kamalesh-Seervi/ranger/releases/download/v1.0.0/ranger_1.0.0_darwin_arm64.tar.gz"
      sha256 "10cde63ae2d1c09b510838e7a43465424a203c67dcb58eb4c3934039586b9f37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Kamalesh-Seervi/ranger/releases/download/v1.0.0/ranger_1.0.0_linux_arm64.tar.gz"
      sha256 "cedf5ca4435dd728e590c82b72c199a71fc555d20e5a1aece1c785b35339280e"
    end
    on_intel do
      url "https://github.com/Kamalesh-Seervi/ranger/releases/download/v1.0.0/ranger_1.0.0_linux_amd64.tar.gz"
      sha256 "5f0f61d8a7bde87579707e09b1d5e75e85e439ea14ddd7c2776b95b382c88e7e"
    end
  end

  def install
    bin.install "ranger"
  end

  test do
    assert_match "-listen", shell_output("#{bin}/ranger -h 2>&1")
  end
end
