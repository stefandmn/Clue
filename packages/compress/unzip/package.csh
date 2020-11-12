PKG_NAME="unzip"
PKG_VERSION="60"
PKG_SHA256="036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
PKG_URL="http://ftp.uk.i-scream.org/sites/www.ibiblio.org/gentoo/distfiles/$PKG_NAME$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="UnZip is an extraction utility for archives compressed in .zip format."
PKG_TOOLCHAIN="manual"

make_target() {
	make CC=$CC RANLIB=$RANLIB AR=$AR STRIP=$STRIP \
		-f unix/Makefile generic LOCAL_UNZIP="$CFLAGS"
}

makeinstall_target() {
	mkdir -p $INSTALL/usr/bin
	cp unzip $INSTALL/usr/bin
	$STRIP $INSTALL/usr/bin/unzip
}
