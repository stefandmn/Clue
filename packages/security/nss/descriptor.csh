PKG_NAME="nss"
PKG_VERSION="3.44"
PKG_SHA256="298d86e18e96660d3c98476274b5857b48c135d809a10d6528d8661bdf834a49"
PKG_URL="http://ftp.mozilla.org/pub/security/nss/releases/NSS_3_44_RTM/src/nss-3.44-with-nspr-4.21.tar.gz"
PKG_DEPENDS_HOST="nspr:host zlib:host"
PKG_DEPENDS_TARGET="toolchain nss:host nspr zlib sqlite"
PKG_DESCRIPTION="The Network Security Services (NSS) package is a set of libraries designed to support cross-platform development of security-enabled client and server applications"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-parallel"

make_host() {
	cd $PKG_BUILD/nss

	make clean || true
	rm -rf $PKG_BUILD/dist

	INCLUDES="-I$TOOLCHAIN/include" \
		make BUILD_OPT=1 USE_64=1 \
		PREFIX=$TOOLCHAIN \
		NSPR_INCLUDE_DIR=$TOOLCHAIN/include/nspr \
		USE_SYSTEM_ZLIB=1 ZLIB_LIBS="-lz -L$TOOLCHAIN/lib" \
		SKIP_SHLIBSIGN=1 \
		NSS_TESTS="dummy" \
		CC=$CC LDFLAGS="$LDFLAGS -L$TOOLCHAIN/lib" \
		V=1
}

makeinstall_host() {
	cd $PKG_BUILD
	$STRIP dist/Linux*/lib/*.so
	cp -L dist/Linux*/lib/*.so $TOOLCHAIN/lib
	cp -L dist/Linux*/lib/libcrmf.a $TOOLCHAIN/lib
	mkdir -p $TOOLCHAIN/include/nss
	cp -RL dist/{public,private}/nss/* $TOOLCHAIN/include/nss
	cp -L dist/Linux*/lib/pkgconfig/nss.pc $TOOLCHAIN/lib/pkgconfig
	cp -L nss/coreconf/nsinstall/*/nsinstall $TOOLCHAIN/bin
}

make_target() {
	cd $PKG_BUILD/nss

	local TARGET_USE_64=""

	make clean || true
	rm -rf $PKG_BUILD/dist

	make BUILD_OPT=1 $TARGET_USE_64 \
		NSS_USE_SYSTEM_SQLITE=1 \
		NSPR_INCLUDE_DIR=$TARGET_SYSROOT/usr/include/nspr \
		NSS_USE_SYSTEM_SQLITE=1 \
		USE_SYSTEM_ZLIB=1 ZLIB_LIBS=-lz \
		SKIP_SHLIBSIGN=1 \
		OS_TEST=$TARGET_ARCH \
		NSS_TESTS="dummy" \
		NSINSTALL=$TOOLCHAIN/bin/nsinstall \
		CPU_ARCH_TAG=$TARGET_ARCH \
		CC=$CC \
		LDFLAGS="$LDFLAGS -L$TARGET_SYSROOT/usr/lib" \
		V=1
}

makeinstall_target() {
	cd $PKG_BUILD
	$STRIP dist/Linux*/lib/*.so
	cp -L dist/Linux*/lib/*.so $TARGET_SYSROOT/usr/lib
	cp -L dist/Linux*/lib/libcrmf.a $TARGET_SYSROOT/usr/lib
	mkdir -p $TARGET_SYSROOT/usr/include/nss
	cp -RL dist/{public,private}/nss/* $TARGET_SYSROOT/usr/include/nss
	cp -L dist/Linux*/lib/pkgconfig/nss.pc $TARGET_SYSROOT/usr/lib/pkgconfig

	mkdir -p .install_pkg/usr/lib
	cp -PL dist/Linux*/lib/*.so .install_pkg/usr/lib
}
