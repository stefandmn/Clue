PKG_NAME="libiconv"
PKG_VERSION="1.15"
PKG_SHA256="ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178"
PKG_URL="http://ftp.gnu.org/pub/gnu/libiconv/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A tool that converts from one character encoding to another through Unicode conversion."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--host=$TARGET_NAME \
            --build=$HOST_NAME \
            --prefix=/usr \
            --includedir=/usr/include/iconv \
            --libdir=/usr/lib/iconv \
            --sysconfdir=/etc \
            --enable-static \
            --disable-shared \
            --disable-nls \
            --disable-extra-encodings \
            --with-gnu-ld"