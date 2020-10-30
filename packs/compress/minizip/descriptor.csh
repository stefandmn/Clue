PKG_NAME="minizip"
PKG_VERSION="2.8.8"
PKG_SHA256="a551063636ae4f989baefc6a20870f5b28246052a372a2ce124ebf3f66018db0"
PKG_URL="https://github.com/nmoinvaz/minizip/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="zlib"
PKG_LONGDESC="Minizip zlib contribution fork with latest bug fixes"

PKG_CMAKE_OPTS_TARGET="-DUSE_AES=OFF \
                       -DBUILD_TEST=ON"

makeinstall_target() {
	cp -v miniunz_exec $TARGET_SYSROOT/usr/bin/miniunz
	cp -v minizip_exec $TARGET_SYSROOT/usr/bin/minizip
}