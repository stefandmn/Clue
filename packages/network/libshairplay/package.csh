PKG_NAME="libshairplay"
PKG_VERSION="096b61ad14c90169f438e690d096e3fcf87e504e"
PKG_SHA256="7e2b013ffe75ea2f13fb12b1aa38b8e2e8b1899ac292d57f05d7b352a3a181cf"
PKG_URL="https://github.com/juhovh/shairplay/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain avahi"
PKG_DESCRIPTION="Apple airplay and raop protocol server"
PKG_TOOLCHAIN="autotools"

pre_configure_target() {
	CFLAGS="$CFLAGS -I$(get_build_dir avahi)/avahi-compat-libdns_sd"
}

post_makeinstall_target() {
	mkdir -p $INSTALL/etc/shairplay
	cp -P ../airport.key $INSTALL/etc/shairplay
}
