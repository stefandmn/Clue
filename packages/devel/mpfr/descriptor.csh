PKG_NAME="mpfr"
PKG_VERSION="4.0.2"
PKG_SHA256="1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a"
PKG_URL="http://ftpmirror.gnu.org/mpfr/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="ccache:host gmp:host"
PKG_LONGDESC="A C library for multiple-precision floating-point computations with exact rounding."

PKG_CONFIGURE_OPTS_HOST="--target=$TARGET_NAME \
                         --enable-static --disable-shared \
                         --prefix=$TOOLCHAIN \
                         --with-gmp-lib=$TOOLCHAIN/lib \
                         --with-gmp-include=$TOOLCHAIN/include"
