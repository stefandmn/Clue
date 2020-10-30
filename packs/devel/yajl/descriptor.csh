PKG_NAME="yajl"
PKG_VERSION="2.1.0"
PKG_SHA256="020f55a2dfc979ad63dc99b629b3fea7e7e4b9f20d8b10b856cfcb8850f03c61"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A small event-driven (SAX-style) JSON parser."

post_makeinstall_target() {
	mv $TARGET_SYSROOT/usr/lib/libyajl_s.a $TARGET_SYSROOT/usr/lib/libyajl.a
	rm $TARGET_SYSROOT/usr/lib/libyajl.so*

	rm -rf $INSTALL/usr/bin
	rm -rf $INSTALL/usr/lib
}
