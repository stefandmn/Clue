PKG_NAME="libaio"
PKG_VERSION="0.3.111"
PKG_SHA256="62cf871ad8fd09eb3418f00aca7a7d449299b8e1de31c65f28bf6a2ef1fa502a"
PKG_URL="http://http.debian.net/debian/pool/main/liba/libaio/${PKG_NAME}_${PKG_VERSION}.orig.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Kernel Asynchronous I/O (AIO) Support for Linux."

make_target() {
	make -C src
}

makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/lib
	cp -PR src/libaio.a $TARGET_SYSROOT/usr/lib

	mkdir -p $TARGET_SYSROOT/usr/include
	cp -PR src/libaio.h $TARGET_SYSROOT/usr/include
}
