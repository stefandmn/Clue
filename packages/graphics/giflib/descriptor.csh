PKG_NAME="giflib"
PKG_VERSION="5.1.4"
PKG_SHA256="df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
PKG_URL="$SOURCEFORGE_SRC/giflib/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="zlib:host"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_DESCRIPTION="giflib: giflib service library"

PKG_CONFIGURE_OPTS_HOST="--disable-shared --enable-static"
PKG_CONFIGURE_OPTS_TARGET="--with-sysroot=$TARGET_SYSROOT"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
}
