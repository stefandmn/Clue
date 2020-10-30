PKG_NAME="pv"
PKG_VERSION="1.6.6"
PKG_SHA256="608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1"
PKG_URL="http://www.ivarch.com/programs/sources/pv-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Pipe Viwer can be inserted into any normal pipeline between two processes."

PKG_CONFIGURE_OPTS_TARGET="--enable-static-nls"

makeinstall_target() {
	:
}
