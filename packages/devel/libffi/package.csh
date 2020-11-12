PKG_NAME="libffi"
PKG_VERSION="3.2.1"
PKG_SHA256="d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37"
PKG_URL="ftp://sourceware.org/pub/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="gcc:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Foreign Function Interface Library."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-debug \
                           --enable-static --disable-shared \
                           --with-pic \
                           --enable-structs \
                           --enable-raw-api \
                           --disable-purify-safety \
                           --with-gnu-ld"
