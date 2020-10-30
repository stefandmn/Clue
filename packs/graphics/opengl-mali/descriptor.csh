PKG_NAME="opengl-mali"
PKG_VERSION="20130520"
PKG_SHA256="4832c8b56fa2b844ff5ead96185a83e08731767062ed711b86fd70543211a9db"
PKG_ARCH="arm"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="opengl-mali: OpenGL-ES and Mali driver for Mali 400 GPUs"

make_target() {
	: # nothing todo
}

makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/include
	cp -PR src/include/* $TARGET_SYSROOT/usr/include

	mkdir -p $TARGET_SYSROOT/usr/lib
	cp -PR src/lib/*.so* $TARGET_SYSROOT/usr/lib
	ln -sf libEGL.so.1.4 $TARGET_SYSROOT/usr/lib/libEGL.so
	ln -sf libGLESv1_CM.so.1.1 $TARGET_SYSROOT/usr/lib/libGLESv1_CM.so
	ln -sf libGLESv2.so.2.0 $TARGET_SYSROOT/usr/lib/libGLESv2.so

	mkdir -p $INSTALL/usr/lib
	cp -PR src/lib/*.so* $INSTALL/usr/lib
	ln -sf libEGL.so.1.4 $INSTALL/usr/lib/libEGL.so
	ln -sf libGLESv1_CM.so.1.1 $INSTALL/usr/lib/libGLESv1_CM.so
	ln -sf libGLESv2.so.2.0 $INSTALL/usr/lib/libGLESv2.so
}
