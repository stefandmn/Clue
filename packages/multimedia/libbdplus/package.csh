PKG_NAME="libbdplus"
PKG_VERSION="0.1.2"
PKG_SHA256="a631cae3cd34bf054db040b64edbfc8430936e762eb433b1789358ac3d3dc80a"
PKG_URL="http://download.videolan.org/pub/videolan/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libgcrypt libgpg-error"
PKG_DESCRIPTION="libbdplus is a research project to implement the BD+ System Specifications."

PKG_CONFIGURE_OPTS_TARGET="--disable-werror \
                           --disable-extra-warnings \
                           --disable-optimizations \
                           --with-libgcrypt-prefix=$TARGET_SYSROOT/usr \
                           --with-gpg-error-prefix=$TARGET_SYSROOT/usr \
                           --with-gnu-ld"

if [ "$BLURAY_AACS_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libaacs"
	PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --with-libaacs"
else
	PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --without-libaacs"
fi