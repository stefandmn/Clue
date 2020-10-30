PKG_NAME="libzip"
PKG_VERSION="0.11.2"
PKG_SHA256="7cfbbc2c540e154b933b6e9ec781e2671086bd8114eb744ae1a1ade34d2bb6bb"
PKG_URL="http://www.nih.at/libzip/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_LONGDESC="A C library for reading, creating, and modifying zip archives."
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
	rm -rf $INSTALL/usr/lib
}