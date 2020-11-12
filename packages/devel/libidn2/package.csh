PKG_NAME="libidn2"
PKG_VERSION="2.1.1a"
PKG_SHA256="57666bcf6ecf54230d7bac95c392379561954b57a673903aed4d3336b3048b72"
PKG_URL="http://ftpmirror.gnu.org/gnu/libidn/libidn2-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Free software implementation of IDNA2008, Punycode and TR46."

PKG_CONFIGURE_OPTS_TARGET="--disable-doc \
                           --enable-shared \
                           --disable-static"

post_makeinstall_target() {
	safe_remove ${INSTALL}/usr/bin
}
