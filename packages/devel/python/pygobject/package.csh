PKG_NAME="pygobject"
PKG_VERSION="2.28.7"
PKG_SHA256="bb9d25a3442ca7511385a7c01b057492095c263784ef31231ffe589d83a96a5a"
PKG_URL="http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.28/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain Python2 glib libffi"
PKG_DESCRIPTION="A convenient wrapper for the GObject+ library for use in Python programs."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-thread --disable-introspection"

pre_configure_target() {
	export PYTHON_INCLUDES="$($TARGET_SYSROOT/usr/bin/python2-config --includes)"
}

post_makeinstall_target() {
	find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
	find $INSTALL/usr/lib -name "*.pyc" -exec rm -rf "{}" ";"

	rm -rf $INSTALL/usr/bin
	rm -rf $INSTALL/usr/share/pygobject
}
