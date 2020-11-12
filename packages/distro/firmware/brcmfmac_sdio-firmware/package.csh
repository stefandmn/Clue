PKG_NAME="brcmfmac_sdio-firmware"
PKG_VERSION="34aaf208f983cefc1d3188d43510c4dc4a35238b"
PKG_SHA256="51a33d23127300dffd6ac088f372b83ab862053f5e4dc7130676ebaaa824e626"
PKG_URL="${DISTRO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
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
