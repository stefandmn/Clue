PKG_NAME="nss-mdns"
PKG_VERSION="0.14.1"
PKG_SHA256="4fe54bffd20e410fc41382dc6c4708cdfa3a65f50c3753f262dc4c78fd864a6e"
PKG_URL="https://github.com/lathiat/nss-mdns/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain avahi"
PKG_DESCRIPTION="A plugin for nss to allow name resolution via Multicast DNS."
PKG_TOOLCHAIN="autotools"

post_makeinstall_target() {
	mkdir -p $INSTALL/etc
	cp $PKG_DIR/config/nsswitch.conf $INSTALL/etc/nsswitch.conf
}
