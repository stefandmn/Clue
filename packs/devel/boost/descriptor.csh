PKG_NAME="boost"
PKG_VERSION="1_65_1"
PKG_SHA256="9807a5d16566c57fd74fb522764e0b134a8bbe6b6e8967b83afefd30dcd3be81"
PKG_URL="$SOURCEFORGE_SRC/boost/boost/1.65.1/${PKG_NAME}_${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain boost:host Python2 zlib bzip2"
PKG_LONGDESC="boost: Peer-reviewed STL style libraries for C++"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="+pic"

make_host() {
	cd tools/build/src/engine
	sh build.sh
}

makeinstall_host() {
	mkdir -p $TOOLCHAIN/bin
	cp bin.*/bjam $TOOLCHAIN/bin
}

pre_configure_target() {
	export CFLAGS="$CFLAGS -I$TARGET_SYSROOT/usr/include/$PKG_PYTHON_VERSION"
	export CXXFLAGS="$CXXFLAGS -I$TARGET_SYSROOT/usr/include/$PKG_PYTHON_VERSION"
}

configure_target() {
	sh bootstrap.sh --prefix=/usr \
		--with-bjam=$TOOLCHAIN/bin/bjam \
		--with-python=$TOOLCHAIN/bin/python \
		--with-python-root=$TARGET_SYSROOT/usr

	echo "using gcc : $($CC -v 2>&1 | tail -n 1 | awk '{print $3}') : $CC  : <compileflags>\"$CFLAGS\" <linkflags>\"$LDFLAGS\" ;" \
		>tools/build/src/user-config.jam
	echo "using python : ${PKG_PYTHON_VERSION/#python/} : $TOOLCHAIN : $TARGET_SYSROOT/usr/include : $TARGET_SYSROOT/usr/lib ;" \
		>>tools/build/src/user-config.jam
}

makeinstall_target() {
	$TOOLCHAIN/bin/bjam -d2 --ignore-site-config \
		--layout=system \
		--prefix=$TARGET_SYSROOT/usr \
		--toolset=gcc link=static \
		--with-chrono \
		--with-date_time \
		--with-filesystem \
		--with-iostreams \
		--with-python \
		--with-random \
		--with-regex -sICU_PATH="$TARGET_SYSROOT/usr" \
		--with-serialization \
		--with-system \
		--with-thread \
		install
}
