PKG_NAME="brcmfmac_sdio-firmware"
PKG_VERSION="688531da4bcf802a814d9cb0c8b6d62e3b8a3327"
PKG_SHA256="51a33d23127300dffd6ac088f372b83ab862053f5e4dc7130676ebaaa824e626"
PKG_URL="https://github.com/LibreELEC/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Firmware for brcm bluetooth chips used on RaspberryPi devices."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	DESTDIR=$INSTALL/$(get_kernel_overlay_dir) ./install
}

post_makeinstall_target() {
	# Install rpi btuart script to bring up Bluetooth
	mkdir -p $INSTALL/usr/bin
	cp -P $PKG_DIR/scripts/rpi-btuart $INSTALL/usr/bin
}

post_install() {
	enable_service brcmfmac_sdio-firmware.service
}
