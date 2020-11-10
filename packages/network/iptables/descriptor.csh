PKG_NAME="iptables"
PKG_VERSION="1.8.3"
PKG_SHA256="a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
PKG_URL="http://www.netfilter.org/projects/iptables/files/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain linux libmnl libnftnl"
PKG_LONGDESC="IP packet filter administration."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-kernel=$(kernel_path)"

post_makeinstall_target() {
	mkdir -p $INSTALL/usr/config/iptables/
	cp -PR $PKG_DIR/config/README $INSTALL/usr/config/iptables/

	mkdir -p $INSTALL/etc/iptables/
	cp -PR $PKG_DIR/config/* $INSTALL/etc/iptables/

	mkdir -p $INSTALL/usr/lib/clue
	cp $PKG_DIR/scripts/iptables_helper $INSTALL/usr/lib/clue
}

post_install() {
	enable_service iptables.service
}
