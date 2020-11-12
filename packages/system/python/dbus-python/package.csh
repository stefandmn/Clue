PKG_NAME="dbus-python"
PKG_VERSION="1.2.8"
PKG_SHA256="abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f"
PKG_URL="https://dbus.freedesktop.org/releases/dbus-python/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 dbus dbus-glib"
PKG_DESCRIPTION="D-BUS is a message bus, used for sending messages between applications."
PKG_BUILD_FLAGS="+lto"

pre_configure_target() {
	export PYTHON_CONFIG="$TARGET_SYSROOT/usr/bin/python2-config"
	export PYTHON_INCLUDES="$($TARGET_SYSROOT/usr/bin/python2-config --includes)"
	export PYTHON_LIBS="$($TARGET_SYSROOT/usr/bin/python2-config --ldflags)"
}

post_makeinstall_target() {
	find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
	find $INSTALL/usr/lib -name "*.pyc" -exec rm -rf "{}" ";"
}