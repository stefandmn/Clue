PKG_NAME="libcap"
PKG_VERSION="2.27"
PKG_SHA256="dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
PKG_URL="http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="ccache:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A library for getting and setting POSIX.1e capabilities."

post_unpack() {
	mkdir -p $PKG_BUILD/.$HOST_NAME
	cp -r $PKG_BUILD/* $PKG_BUILD/.$HOST_NAME
	mkdir -p $PKG_BUILD/.$TARGET_NAME
	cp -r $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

make_host() {
	cd $PKG_BUILD/.$HOST_NAME
	make CC=$CC \
		AR=$AR \
		RANLIB=$RANLIB \
		CFLAGS="$HOST_CFLAGS" \
		BUILD_CFLAGS="$HOST_CFLAGS -I$PKG_BUILD/libcap/include" \
		PAM_CAP=no \
		lib=/lib \
		BUILD_GPERF=no \
		-C libcap libcap.pc libcap.a
}

make_target() {
	cd $PKG_BUILD/.$TARGET_NAME
	make CC=$CC \
		AR=$AR \
		RANLIB=$RANLIB \
		CFLAGS="$TARGET_CFLAGS" \
		BUILD_CC=$HOST_CC \
		BUILD_CFLAGS="$HOST_CFLAGS -I$PKG_BUILD/libcap/include" \
		PAM_CAP=no \
		lib=/lib \
		BUILD_GPERF=no \
		-C libcap libcap.pc libcap.a
}

makeinstall_host() {
	mkdir -p $TOOLCHAIN/lib
	cp libcap/libcap.a $TOOLCHAIN/lib

	mkdir -p $TOOLCHAIN/lib/pkgconfig
	cp libcap/libcap.pc $TOOLCHAIN/lib/pkgconfig

	mkdir -p $TOOLCHAIN/include/sys
	cp libcap/include/sys/capability.h $TOOLCHAIN/include/sys
}

makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/lib
	cp libcap/libcap.a $TARGET_SYSROOT/usr/lib

	mkdir -p $TARGET_SYSROOT/usr/lib/pkgconfig
	cp libcap/libcap.pc $TARGET_SYSROOT/usr/lib/pkgconfig

	mkdir -p $TARGET_SYSROOT/usr/include/sys
	cp libcap/include/sys/capability.h $TARGET_SYSROOT/usr/include/sys
}
