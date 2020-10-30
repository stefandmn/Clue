PKG_NAME="wireless_tools"
PKG_VERSION="30.pre9"
PKG_SHA256="abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
PKG_URL="https://hewlettpackard.github.io/wireless-tools/$PKG_NAME.$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The Wireless Tools (WT) is a set of tools allowing to manipulate the Wireless Extensions."

make_target() {
	make PREFIX=/usr CC="$CC" AR="$AR" \
		CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" iwmulticall
}

makeinstall_target() {
	:
}
