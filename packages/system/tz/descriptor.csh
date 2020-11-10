PKG_NAME="tz"
PKG_VERSION="2019c"
PKG_SHA256="38b1f7c7a050daa14fb07f6b72cdde1fc895fece40758d4d55736847041ad9e2"
PKG_URL="https://github.com/eggert/tz/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Time zone and daylight-saving time data."

pre_configure_target() {
	PKG_MAKE_OPTS_TARGET="CC=$HOST_CC LDFLAGS="
}

makeinstall_target() {
	make TZDIR="$INSTALL/usr/share/zoneinfo" REDO=posix_only TOPDIR="$INSTALL" install
}

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin $INSTALL/usr/sbin

	rm -rf $INSTALL/etc
	mkdir -p $INSTALL/etc
	ln -sf /var/run/localtime $INSTALL/etc/localtime
}

post_install() {
	enable_service tz-data.service
}
