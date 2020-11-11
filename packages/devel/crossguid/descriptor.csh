PKG_NAME="crossguid"
PKG_VERSION="8f399e8"
PKG_SHA256="022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99"
PKG_URL="https://github.com/graeme-hill/crossguid/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain util-linux"
PKG_DESCRIPTION="minimal, cross platform, C++ GUID library"
PKG_TOOLCHAIN="manual"

make_target() {
	$CXX -c guid.cpp -o guid.o $CXXFLAGS -std=c++11 -DGUID_LIBUUID
	$AR rvs libcrossguid.a guid.o
}

makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/lib/
	cp libcrossguid.a $TARGET_SYSROOT/usr/lib/
	mkdir -p $TARGET_SYSROOT/usr/include/
	cp guid.h $TARGET_SYSROOT/usr/include
}
