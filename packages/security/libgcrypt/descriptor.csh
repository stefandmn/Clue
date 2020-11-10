PKG_NAME="libgcrypt"
PKG_VERSION="1.8.5"
PKG_SHA256="3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
PKG_URL="https://www.gnupg.org/ftp/gcrypt/libgcrypt/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libgpg-error"
PKG_LONGDESC="A General purpose cryptographic library."
PKG_TOOLCHAIN="autotools"
# libgcrypt-1.7.x fails to build with LTO support
# see for example https://bugs.gentoo.org/show_bug.cgi?id=581114

pre_configure_target() {
	PKG_CONFIGURE_OPTS_TARGET="CC_FOR_BUILD=$HOST_CC \
                             ac_cv_sys_symbol_underscore=no \
                             --enable-asm \
                             --with-gnu-ld \
                             --with-libgpg-error-prefix=$TARGET_SYSROOT/usr \
                             --disable-doc"
}

post_makeinstall_target() {
	sed -e "s:\(['= ]\)\"/usr:\\1\"$TARGET_SYSROOT/usr:g" -i src/$PKG_NAME-config
	cp src/$PKG_NAME-config $TARGET_SYSROOT/usr/bin

	rm -rf $INSTALL/usr/bin
}
