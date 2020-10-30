PKG_NAME="ethmactool"
PKG_VERSION="1.0"
PKG_LONGDESC="ethmactool: udev rule for obtaining real MAC address or creating a persistent MAC from the CPU serial"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	mkdir -p $INSTALL/usr/bin
	cp $PKG_DIR/scripts/ethmactool-config $INSTALL/usr/bin
}

post_install() {
	enable_service ethmactool-config.service
}