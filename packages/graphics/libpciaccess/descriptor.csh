PKG_NAME="libpciaccess"
PKG_VERSION="0.14"
PKG_SHA256="3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4"
PKG_URL="http://xorg.freedesktop.org/archive/individual/lib/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros zlib"
PKG_LONGDESC="X.org libpciaccess library."

PKG_CONFIGURE_OPTS_TARGET="ac_cv_header_asm_mtrr_h=set \
                           --with-pciids-path=/usr/share \
                           --with-zlib "

pre_configure_target() {
	CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
}
