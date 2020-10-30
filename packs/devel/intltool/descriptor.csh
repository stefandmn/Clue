PKG_NAME="intltool"
PKG_VERSION="0.51.0"
PKG_SHA256="67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
PKG_URL="http://launchpad.net/intltool/trunk/$PKG_VERSION/+download/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="Tools to translate strings from various source files (.xml.in, .glade, .desktop.in, .server.in, .oaf.in)."

post_makeinstall_host() {
	mkdir -p $TARGET_SYSROOT/usr/share/aclocal
	cp ../intltool.m4 $TARGET_SYSROOT/usr/share/aclocal
}
