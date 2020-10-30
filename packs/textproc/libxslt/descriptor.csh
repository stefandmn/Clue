PKG_NAME="libxslt"
PKG_VERSION="1.1.33"
PKG_SHA256="8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8"
PKG_URL="ftp://xmlsoft.org/libxml2/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="libxml2:host"
PKG_DEPENDS_TARGET="toolchain libxml2"
PKG_LONGDESC="A XSLT C library."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_HOST="  ac_cv_header_ansidecl_h=no \
                           ac_cv_header_xlocale_h=no \
                           --enable-static \
                           --disable-shared \
                           --without-python \
                           --with-libxml-prefix=$TOOLCHAIN \
                           --without-crypto"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_header_ansidecl_h=no \
                           ac_cv_header_xlocale_h=no \
                           --enable-static \
                           --disable-shared \
                           --without-python \
                           --with-libxml-prefix=$TARGET_SYSROOT/usr \
                           --without-crypto"

post_makeinstall_target() {
	sed -e "s:\(['= ]\)/usr:\\1$TARGET_SYSROOT/usr:g" -i $TARGET_SYSROOT/usr/bin/xslt-config

	rm -rf $INSTALL/usr/bin/xsltproc
	rm -rf $INSTALL/usr/lib/xsltConf.sh
}
