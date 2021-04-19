PKG_NAME="brcmfmac_sdio-firmware"
PKG_VERSION="1.1"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Firmware for BRCM bluetooth chips used on Raspberry Pi devices."
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
