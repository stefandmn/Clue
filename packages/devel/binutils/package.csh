PKG_NAME="binutils"
PKG_VERSION="2.32"
PKG_SHA256="9b0d97b3d30df184d302bced12f976aa1e5fbf4b0be696cdebc6cca30411a46e"
PKG_URL="http://ftpmirror.gnu.org/binutils/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host bison:host flex:host linux:host"
PKG_DEPENDS_TARGET="toolchain zlib binutils:host"
PKG_DESCRIPTION="A GNU collection of binary utilities."

PKG_CONFIGURE_OPTS_HOST="--target=$TARGET_NAME \
                         --with-sysroot=$TARGET_SYSROOT \
                         --with-lib-path=$TARGET_SYSROOT/lib:$TARGET_SYSROOT/usr/lib \
                         --without-ppl \
                         --without-cloog \
                         --disable-werror \
                         --disable-multilib \
                         --disable-libada \
                         --disable-libssp \
                         --enable-version-specific-runtime-libs \
                         --enable-plugins \
                         --enable-gold \
                         --enable-ld=default \
                         --enable-lto \
                         --disable-nls"

PKG_CONFIGURE_OPTS_TARGET="--target=$TARGET_NAME \
                         --with-sysroot=$TARGET_SYSROOT \
                         --with-lib-path=$TARGET_SYSROOT/lib:$TARGET_SYSROOT/usr/lib \
                         --with-system-zlib \
                         --without-ppl \
                         --without-cloog \
                         --enable-static \
                         --disable-shared \
                         --disable-werror \
                         --disable-multilib \
                         --disable-libada \
                         --disable-libssp \
                         --disable-plugins \
                         --disable-gold \
                         --disable-ld \
                         --disable-lto \
                         --disable-nls"

pre_configure_host() {
	unset CPPFLAGS
	unset CFLAGS
	unset CXXFLAGS
	unset LDFLAGS
}

make_host() {
	make configure-host
	make
}

makeinstall_host() {
	cp -v ../include/libiberty.h $TARGET_SYSROOT/usr/include
	make install
}

make_target() {
	make configure-host
	make -C libiberty
	make -C bfd
	make -C opcodes
	make -C binutils strings
}

makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/lib
	cp libiberty/libiberty.a $TARGET_SYSROOT/usr/lib
	make DESTDIR="$TARGET_SYSROOT" -C bfd install
	make DESTDIR="$TARGET_SYSROOT" -C opcodes install

	mkdir -p ${INSTALL}/usr/bin
	cp binutils/strings ${INSTALL}/usr/bin
}
