PKG_NAME="autoconf-archive"
PKG_VERSION="2017.09.28"
PKG_SHA256="5c9fb5845b38b28982a3ef12836f76b35f46799ef4a2e46b48e2bd3c6182fa01"
PKG_URL="http://ftpmirror.gnu.org/autoconf-archive/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="ccache:host"
PKG_DESCRIPTION="autoconf-archive is an package of m4 macros"

PKG_CONFIGURE_OPTS_HOST="--target=$TARGET_NAME --prefix=$TOOLCHAIN"

makeinstall_host() {
	# make install
	make prefix=$TARGET_SYSROOT/usr install

	# remove problematic m4 file
	rm -rf $TARGET_SYSROOT/usr/share/aclocal/ax_prog_cc_for_build.m4
}
