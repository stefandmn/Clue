PKG_NAME="tiff"
PKG_VERSION="4.0.10"
PKG_SHA256="2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
PKG_URL="http://download.osgeo.org/libtiff/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo zlib"
PKG_LONGDESC="libtiff is a library for reading and writing TIFF files."
PKG_BUILD_FLAGS="+pic"
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --disable-mdi \
                           --enable-cxx \
                           --with-jpeg-lib-dir=$TARGET_SYSROOT/usr/lib \
                           --with-jpeg-include-dir=$TARGET_SYSROOT/usr/include \
                           --without-x"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
}
