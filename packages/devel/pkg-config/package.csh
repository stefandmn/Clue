PKG_NAME="pkg-config"
PKG_VERSION="0.29.2"
PKG_SHA256="6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591"
PKG_URL="http://pkg-config.freedesktop.org/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host gettext:host"
PKG_DESCRIPTION="A system for managing library compile/link flags that works with automake and autoconf."

PKG_CONFIGURE_OPTS_HOST="--disable-silent-rules \
                         --with-internal-glib --disable-dtrace \
                         --with-gnu-ld"

post_makeinstall_host() {
	mkdir -p $TARGET_SYSROOT/usr/share/aclocal
	cp pkg.m4 $TARGET_SYSROOT/usr/share/aclocal
}
