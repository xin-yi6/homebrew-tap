class Zotty < Formula
  desc "Zotero in your terminal, with saves from Chrome while Zotero is closed"
  homepage "https://github.com/xin-yi6/zotty"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/xin-yi6/zotty/releases/download/v0.1.0/zotty_darwin_arm64.tar.gz"
    sha256 "399e91f377134e7feb70633831c6071deae76c858c9cb9fb038672ea8e77763e"
  else
    url "https://github.com/xin-yi6/zotty/releases/download/v0.1.0/zotty_darwin_x86_64.tar.gz"
    sha256 "34e5e178f62a8a8b26c12820855b53a4932e4de2b2aaa3c2ec9e73073839ee86"
  end

  def install
    bin.install "zotty"
  end

  def caveats
    <<~EOS
      To save from Chrome while Zotero is closed, start the receiver:
        zotty service install
      Run it again after each upgrade, then check everything with:
        zotty doctor
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/zotty version").strip
  end
end
