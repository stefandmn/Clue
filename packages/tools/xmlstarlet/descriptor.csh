PKG_NAME="xmlstarlet"
PKG_VERSION="1.6.1"
PKG_SHA256="15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca"
PKG_URL="http://netcologne.dl.sourceforge.net/project/xmlstar/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="libxml2:host libxslt:host"
PKG_DEPENDS_TARGET="toolchain libxml2 libxslt"
PKG_LONGDESC="XMLStarlet is a command-line XML utility which allows the modification and validation of XML documents."

PKG_CONFIGURE_OPTS_HOST="  ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes \
                           --enable-static-libs \
                           LIBXML_CONFIG=$TOOLCHAIN/bin/xml2-config \
                           LIBXSLT_CONFIG=$TOOLCHAIN/bin/xslt-config \
                           --with-libxml-include-prefix=$TOOLCHAIN/include/libxml2 \
                           --with-libxml-libs-prefix=$TOOLCHAIN/lib \
                           --with-libxslt-include-prefix=$TOOLCHAIN/include \
                           --with-libxslt-libs-prefix=$TOOLCHAIN/lib"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes \
                           --enable-static-libs \
                           LIBXML_CONFIG=$TARGET_SYSROOT/usr/bin/xml2-config \
                           LIBXSLT_CONFIG=$TARGET_SYSROOT/usr/bin/xslt-config \
                           --with-libxml-include-prefix=$TARGET_SYSROOT/usr/include/libxml2 \
                           --with-libxml-libs-prefix=$TARGET_SYSROOT/usr/lib \
                           --with-libxslt-include-prefix=$TARGET_SYSROOT/usr/include \
                           --with-libxslt-libs-prefix=$TARGET_SYSROOT/usr/lib"

post_makeinstall_host() {
	ln -sf xml $TOOLCHAIN/bin/xmlstarlet
}

post_makeinstall_target() {
	ln -sf xml $INSTALL/usr/bin/xmlstarlet
}
