PKG_NAME="lshw"
PKG_VERSION="B.02.18"
PKG_SHA256="ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f"
PKG_URL="http://ezix.org/software/files/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A small tool to provide detailed information on the hardware configuration of the machine."

make_target() {
	make CXX=$CXX -C src/
}

makeinstall_target() {
	: # nop
}
