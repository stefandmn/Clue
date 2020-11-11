PKG_NAME="p8-platform"
PKG_VERSION="1eb12b1b1efa6747c1e190964854e9e267e3a1e2"
PKG_SHA256="94dba139066a332d048486f817736e4cf4962393c9f892d2c7dd40d9d69ca788"
PKG_URL="https://github.com/Pulse-Eight/platform/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_LIBDIR:STRING=lib \
                       -DCMAKE_INSTALL_LIBDIR_NOARCH:STRING=lib \
                       -DCMAKE_INSTALL_PREFIX_TOOLCHAIN=$TARGET_SYSROOT/usr \
                       -DBUILD_SHARED_LIBS=0"

post_makeinstall_target() {
	rm -rf $INSTALL/usr
}
