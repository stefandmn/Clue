PKG_NAME="libgpg-error"
PKG_VERSION="1.37"
PKG_SHA256="b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
PKG_URL="https://www.gnupg.org/ftp/gcrypt/libgpg-error/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A library that defines common error values for all GnuPG components."

pre_configure_target() {
	PKG_CONFIGURE_OPTS_TARGET="CC_FOR_BUILD=$HOST_CC --enable-static --disable-shared --disable-nls --disable-rpath --with-gnu-ld --with-pic"

	# inspired by openembedded
	GPGERROR_TUPLE=arm-unknown-linux-gnueabi
	GPGERROR_TARGET=linux-gnueabi

	cp $PKG_BUILD/src/syscfg/lock-obj-pub.$GPGERROR_TUPLE.h $PKG_BUILD/src/syscfg/lock-obj-pub.$GPGERROR_TARGET.h
}

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
	rm -rf $INSTALL/usr/share

	sed -e "s:\(['= ]\)/usr:\\1$TARGET_SYSROOT/usr:g" -i src/gpg-error-config
	cp src/gpg-error-config $TARGET_SYSROOT/usr/bin
}
