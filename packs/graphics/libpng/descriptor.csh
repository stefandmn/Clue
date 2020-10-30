PKG_NAME="libpng"
PKG_VERSION="1.6.37"
PKG_SHA256="505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
PKG_URL="$SOURCEFORGE_SRC/libpng/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="zlib:host"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_LONGDESC="An extensible file format for the lossless, portable, well-compressed storage of raster images."
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+pic +pic:host"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_lib_z_zlibVersion=yes \
                           --enable-static \
                           --disable-shared"

PKG_CONFIGURE_OPTS_HOST="--enable-static --disable-shared"

pre_configure_host() {
	export CPPFLAGS="$CPPFLAGS -I$TOOLCHAIN/include"
}

pre_configure_target() {
	export CPPFLAGS="$CPPFLAGS -I$TARGET_SYSROOT/usr/include"
}

post_makeinstall_target() {
	sed -e "s:\([\"'= ]\)/usr:\\1$TARGET_SYSROOT/usr:g" \
		-e "s:libs=\"-lpng16\":libs=\"-lpng16 -lz\":g" \
		-i $TARGET_SYSROOT/usr/bin/libpng*-config

	rm -rf $INSTALL/usr/bin
}
