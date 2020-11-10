PKG_NAME="libaacs"
PKG_VERSION="0.9.0"
PKG_SHA256="47e0bdc9c9f0f6146ed7b4cc78ed1527a04a537012cf540cf5211e06a248bace"
PKG_URL="http://download.videolan.org/pub/videolan/libaacs/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libgcrypt"
PKG_LONGDESC="libaacs is a research project to implement the Advanced Access Content System specification."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-werror \
                           --disable-extra-warnings \
                           --disable-optimizations \
                           --with-libgcrypt-prefix=$TARGET_SYSROOT/usr \
                           --with-libgpg-error-prefix=$TARGET_SYSROOT/usr \
                           --with-gnu-ld"

post_makeinstall_target() {
	mkdir -p $INSTALL/usr/config/aacs
	cp -P ../KEYDB.cfg $INSTALL/usr/config/aacs
}
