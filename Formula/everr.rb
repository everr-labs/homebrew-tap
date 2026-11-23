class Everr < Formula
  desc "Local telemetry, agent skills, and observability as code"
  homepage "https://everr.dev"
  license "AGPL-3.0-only"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://everr.dev/everr-app/v0.12.0/everr"
      sha256 "dc4c0a3adb2810410f966ecf36b49aa2a2f2c16ffd044d7431d92c894378d37c"
    end
  end

  on_linux do
    on_arm do
      url "https://everr.dev/everr-app/v0.12.0/everr-linux-arm64"
      sha256 "8e526fbcf00afcc149f76b842e518491d669949ea7d7f17205cf0dc0fa2434cb"
    end
    on_intel do
      url "https://everr.dev/everr-app/v0.12.0/everr-linux-x86_64"
      sha256 "4908be26d2857b7bd47c3f908c441ec388aff9590d7540016e46b7498caad3cc"
    end
  end

  def install
    binary = if OS.mac?
      "everr"
    elsif Hardware::CPU.arm?
      "everr-linux-arm64"
    else
      "everr-linux-x86_64"
    end
    bin.install binary => "everr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/everr --version")
  end
end
