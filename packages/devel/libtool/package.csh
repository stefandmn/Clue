PKG_NAME="libtool"
PKG_VERSION="2.4.6"
PKG_SHA256="e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3"
PKG_URL="http://ftpmirror.gnu.org/libtool/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host autoconf:host automake:host intltool:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A generic library support script."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_HOST="--enable-static --disable-shared"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
	rm -rf $INSTALL/usr/share
}
