PKG_NAME="x264"
PKG_VERSION="d4099dd4c722f52c4f3c14575d7d39eb8fadb97f"
PKG_SHA256="9b6688b81e13cf342fc9b6b7adf1759eebd300c243c0707566ffe7ea9f0ccc7e"
PKG_URL="http://repo.or.cz/x264.git/snapshot/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="x264 codec"

pre_configure_target() {
	cd $PKG_BUILD
	rm -rf .$TARGET_NAME

	PKG_X264_ASM="--disable-asm"
}

configure_target() {
	./configure \
		--cross-prefix="$TARGET_PREFIX" \
		--extra-cflags="$CFLAGS" \
		--extra-ldflags="$LDFLAGS" \
		--host="$TARGET_NAME" \
		--prefix="/usr" \
		--sysroot="$TARGET_SYSROOT" \
		$PKG_X264_ASM \
		--disable-cli \
		--enable-lto \
		--enable-pic \
		--enable-static \
		--enable-strip
}
