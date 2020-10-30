PKG_NAME="fribidi"
PKG_VERSION="1.0.5"
PKG_SHA256="6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce"
PKG_URL="https://github.com/fribidi/fribidi/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A bidirectional algorithm library."
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --disable-debug \
                           --disable-deprecated \
                           --disable-silent-rules \
                           --with-gnu-ld"

pre_configure_target() {
	export CFLAGS="$CFLAGS -DFRIBIDI_CHUNK_SIZE=4080"
}

post_makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/bin
	cp -f $PKG_DIR/scripts/fribidi-config $TARGET_SYSROOT/usr/bin
	chmod +x $TARGET_SYSROOT/usr/bin/fribidi-config

	rm -rf $INSTALL/usr/bin
}
