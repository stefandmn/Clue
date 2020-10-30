PKG_NAME="libdvbcsa"
PKG_VERSION="aae3d0c"
PKG_SHA256="2c0b69a5ca70c5032f9375a57bcec449ecdf93b5459f60f087f5fa06c605c7c1"
PKG_URL="https://github.com/glenvt18/libdvbcsa/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A implementation of DVB/CSA, with encryption and decryption capabilities."
PKG_TOOLCHAIN="autotools"
# libdvbcsa is a bit faster without LTO, and tests will fail with gcc-5.x
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --with-sysroot=$TARGET_SYSROOT"

if target_has_feature neon; then
	PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-neon"
fi
