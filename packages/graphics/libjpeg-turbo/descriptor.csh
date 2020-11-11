PKG_NAME="libjpeg-turbo"
PKG_VERSION="2.0.2"
PKG_SHA256="b45255bd476c19c7c6b198c07c0487e8b8536373b82f2b38346b32b4fa7bb942"
PKG_URL="https://github.com/libjpeg-turbo/libjpeg-turbo/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A high-speed version of libjpeg for x86 and x86-64 processors which uses SIMD."
PKG_BUILD_FLAGS="+pic +pic:host"

PKG_CMAKE_OPTS_HOST="-DENABLE_STATIC=ON \
                     -DENABLE_SHARED=OFF \
                     -DWITH_JPEG8=ON \
                     -DWITH_SIMD=OFF"

PKG_CMAKE_OPTS_TARGET="-DENABLE_STATIC=ON \
                       -DENABLE_SHARED=OFF \
                       -DWITH_JPEG8=ON"

if target_has_feature "(neon|sse)"; then
	PKG_CMAKE_OPTS_TARGET+=" -DWITH_SIMD=ON"
else
	PKG_CMAKE_OPTS_TARGET+=" -DWITH_SIMD=OFF"
fi

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
}
