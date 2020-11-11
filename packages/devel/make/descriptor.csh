PKG_NAME="make"
PKG_VERSION="4.2.1"
PKG_SHA256="d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589"
PKG_URL="http://ftpmirror.gnu.org/make/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST=""
PKG_DESCRIPTION="Utility to maintain groups of programs."

pre_configure_host() {
	export CC=$LOCAL_CC
}

post_makeinstall_host() {
	ln -sf make $TOOLCHAIN/bin/gmake
}
