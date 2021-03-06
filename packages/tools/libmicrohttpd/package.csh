PKG_NAME="libmicrohttpd"
PKG_VERSION="0.9.64"
PKG_SHA256="e792d8ed5990823a0baadea0adf94365999e702f6f1314ef9c555018dafc350e"
PKG_URL="http://ftpmirror.gnu.org/libmicrohttpd/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A small C library that is supposed to make it easy to run an HTTP server as part of another application."

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --disable-curl \
                           --disable-https \
                           --with-libgcrypt-prefix=$TARGET_SYSROOT/usr"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
}
