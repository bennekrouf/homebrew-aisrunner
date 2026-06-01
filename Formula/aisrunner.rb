# Auto-updated by ais-runner release workflow.
# Users install with:
#   brew tap Bennekrouf/aisrunner
#   brew install aisrunner

class Aisrunner < Formula
  desc "AIS Local Runner — desktop runner for Azure-backed AI services"
  homepage "https://github.com/Bennekrouf/ais-runner"
  version "0.3.25"
  url "https://github.com/Bennekrouf/ais-runner/releases/download/v#{version}/ais-runner-macos-arm64.tar.gz"
  sha256 "c2806f957fdb1df33ea246e7af34a9a02cc7a21208aaa2acac7bbe1689d4392b"

  depends_on arch: :arm64
  depends_on "node"
  depends_on "azure-cli"

  def install
    bin.install "ais-runner"
    system "npm", "install", "-g", "azurite@3.30.0"
    system "npm", "install", "-g", "azure-functions-core-tools@4", "--unsafe-perm", "true"
  end

  test do
    assert_predicate bin/"ais-runner", :executable?
  end
end
