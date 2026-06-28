# typed: false
# frozen_string_literal: true

# Homebrew formula for sopsy — installs a prebuilt binary (no Rust toolchain
# required) plus the runtime tools sopsy orchestrates.
#
# The version and per-platform sha256 values below are maintained automatically
# by .github/workflows/update-formula.yml when a new sopsy release is published.
class Sopsy < Formula
  desc "The missing developer experience for SOPS"
  homepage "https://github.com/kigster/sopsy"
  version "1.0.2"
  license "MIT"

  depends_on "age"
  depends_on "sops"

  on_macos do
    depends_on "age-plugin-se"

    on_arm do
      url "https://github.com/kigster/sopsy/releases/download/v1.0.2/sopsy-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/kigster/sopsy/releases/download/v1.0.2/sopsy-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kigster/sopsy/releases/download/v1.0.2/sopsy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/kigster/sopsy/releases/download/v1.0.2/sopsy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "sopsy"
    generate_completions_from_executable(bin/"sopsy", "completion")
  end

  test do
    assert_match "sopsy #{version}", shell_output("#{bin}/sopsy --version")
  end
end
