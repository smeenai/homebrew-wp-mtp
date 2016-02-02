class Libmtp < Formula
  desc "Implementation of Microsoft's Media Transfer Protocol (MTP)"
  homepage "http://libmtp.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/libmtp/libmtp/1.1.10/libmtp-1.1.10.tar.gz"
  sha256 "1eee8d4c052fe29e58a408fedc08a532e28626fa3e232157abd8fca063c90305"

  depends_on "pkg-config" => :build
  depends_on "libusb-compat"

  patch do
    url "https://raw.githubusercontent.com/smeenai/homebrew-wp-mtp/master/wp.diff"
    sha256 "d4d05d998e11c0bfc43f20fa2e819be466f8780c6924eb6d47fe1e325be856f9"
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-mtpz"
    system "make", "install"
  end
end
