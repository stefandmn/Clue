PKG_NAME="dtc"
PKG_VERSION="1.5.0"
PKG_SHA256="14343cb204aaff386206ea27e39e93d6e35d9a797222e8426f95e57828ca6b94"
PKG_URL="https://git.kernel.org/pub/scm/utils/dtc/dtc.git/snapshot/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="The Device Tree Compiler"

PKG_MAKE_OPTS_TARGET="dtc fdtput fdtget libfdt"

makeinstall_target() {
	mkdir -p $INSTALL/usr/bin
	cp -P $PKG_BUILD/dtc $INSTALL/usr/bin
	cp -P $PKG_BUILD/fdtput $INSTALL/usr/bin/
	cp -P $PKG_BUILD/fdtget $INSTALL/usr/bin/
	mkdir -p $INSTALL/usr/lib
	cp -P $PKG_BUILD/libfdt/libfdt.so $INSTALL/usr/lib/
}
