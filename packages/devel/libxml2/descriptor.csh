PKG_NAME="libxml2"
PKG_VERSION="2.9.9"
PKG_SHA256="94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871"
PKG_URL="ftp://xmlsoft.org/libxml2/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="zlib:host"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_DESCRIPTION="The libxml package contains an XML library, which allows you to manipulate XML files."

PKG_CONFIGURE_OPTS_ALL="ac_cv_header_ansidecl_h=no \
             --enable-static \
             --enable-shared \
             --disable-silent-rules \
             --enable-ipv6 \
             --without-python \
             --with-zlib=$TOOLCHAIN \
             --without-lzma"

PKG_CONFIGURE_OPTS_HOST="$PKG_CONFIGURE_OPTS_ALL --with-zlib=$TOOLCHAIN"

PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_ALL --with-zlib=$TARGET_SYSROOT/usr --with-sysroot=$TARGET_SYSROOT"

post_makeinstall_target() {
	sed -e "s:\(['= ]\)/usr:\\1$TARGET_SYSROOT/usr:g" -i $TARGET_SYSROOT/usr/bin/xml2-config

	rm -rf $INSTALL/usr/bin
	rm -rf $INSTALL/usr/lib/xml2Conf.sh
}
