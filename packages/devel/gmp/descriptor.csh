PKG_NAME="gmp"
PKG_VERSION="6.1.2"
PKG_SHA256="87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912"
PKG_URL="https://gmplib.org/download/gmp/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="ccache:host m4:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers."
PKG_BUILD_FLAGS="+pic:host"

PKG_CONFIGURE_OPTS_HOST="--enable-cxx --enable-static --disable-shared"

pre_configure_host() {
	export CPPFLAGS="$CPPFLAGS -fexceptions"
}
