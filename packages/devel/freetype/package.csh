PKG_NAME="freetype"
PKG_VERSION="2.10.0"
PKG_SHA256="fccc62928c65192fff6c98847233b28eb7ce05f12d2fea3f6cc90e8b4e5fbe06"
PKG_URL="http://download.savannah.gnu.org/releases/freetype/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="gcc:host"
PKG_DEPENDS_TARGET="toolchain zlib libpng"
PKG_DESCRIPTION="The FreeType engine is a free and portable TrueType font rendering engine."
PKG_TOOLCHAIN="configure"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="LIBPNG_CFLAGS=-I$TARGET_SYSROOT/usr/include \
                           LIBPNG_LDFLAGS=-L$TARGET_SYSROOT/usr/lib \
                           --with-zlib"

pre_configure_target() {
	# unset LIBTOOL because freetype uses its own
	(
		cd ..
		unset LIBTOOL
		sh autogen.sh
	)
}

post_makeinstall_target() {
	sed -e "s#prefix=/usr#prefix=${TARGET_SYSROOT}/usr#" -i "${TARGET_SYSROOT}/usr/lib/pkgconfig/freetype2.pc"

	cp -P "${PKG_BUILD}/.${TARGET_NAME}/freetype-config" "${TARGET_SYSROOT}/usr/bin"
}
