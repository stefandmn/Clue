PKG_NAME="iat"
PKG_VERSION="0.1.7"
PKG_SHA256="fb72c42f4be18107ec1bff8448bd6fac2a3926a574d4950a4d5120f0012d62ca"
PKG_URL="https://sourceforge.net/projects/iat.berlios/files/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Iso9660 Analyzer Tool to detect many structures of image file."

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes"

makeinstall_target() {
	:
}