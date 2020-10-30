PKG_NAME="faad2"
PKG_VERSION="2.8.8"
PKG_SHA256="985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"
PKG_URL="https://downloads.sourceforge.net/sourceforge/faac/faad2-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="An MPEG-4 AAC decoder."

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --without-drm \
                           --with-gnu-ld \
                           --without-mpeg4ip \
                           --without-xmms"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
}
