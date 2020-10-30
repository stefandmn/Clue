PKG_NAME="libssh"
PKG_VERSION="0.8.7"
PKG_SHA256="43304ca22f0ba0b654e14b574a39816bc70212fdea5858a6637cc26cade3d592"
PKG_URL="https://www.libssh.org/files/${PKG_VERSION%.*}/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib openssl"
PKG_LONGDESC="Library for accessing ssh client services through C libraries."

PKG_CMAKE_OPTS_TARGET="-DWITH_STATIC_LIB=1 \
                       -DWITH_SERVER=OFF \
                       -DWITH_GCRYPT=OFF \
                       -DWITH_GSSAPI=OFF \
                       -DWITH_INTERNAL_DOC=OFF"

makeinstall_target() {
	# install static library only
	mkdir -p $TARGET_SYSROOT/usr/lib
	cp src/libssh.a $TARGET_SYSROOT/usr/lib

	mkdir -p $TARGET_SYSROOT/usr/lib/pkgconfig
	cp libssh.pc $TARGET_SYSROOT/usr/lib/pkgconfig

	mkdir -p $TARGET_SYSROOT/usr/include/libssh
	cp ../include/libssh/callbacks.h $TARGET_SYSROOT/usr/include/libssh
	cp ../include/libssh/legacy.h $TARGET_SYSROOT/usr/include/libssh
	cp ../include/libssh/libssh.h $TARGET_SYSROOT/usr/include/libssh
	cp ../include/libssh/server.h $TARGET_SYSROOT/usr/include/libssh
	cp ../include/libssh/sftp.h $TARGET_SYSROOT/usr/include/libssh
	cp ../include/libssh/ssh2.h $TARGET_SYSROOT/usr/include/libssh
}
