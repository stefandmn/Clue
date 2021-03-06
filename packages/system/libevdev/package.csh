PKG_NAME="libevdev"
PKG_VERSION="1.7.0"
PKG_SHA256="11dbe1f2b1d03a51f3e9a196757a75c3a999042ce34cf1fdc00a2363e5a2e369"
PKG_URL="http://www.freedesktop.org/software/libevdev/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="libevdev is a wrapper library for evdev devices."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared --disable-static"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
}
