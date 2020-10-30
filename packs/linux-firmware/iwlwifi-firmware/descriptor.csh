PKG_NAME="iwlwifi-firmware"
PKG_VERSION="19ce5372ff369fe90ba70a0b8ef7e4ffa80a068b"
PKG_SHA256="26b09c74ff5bb19eb1891e1f150759cd3cae10dce3a167fc120f3c81276cac95"
PKG_URL="https://github.com/LibreELEC/iwlwifi-firmware/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="iwlwifi-firmware: firmwares for various Intel WLAN drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	DESTDIR=$INSTALL/$(get_kernel_overlay_dir) ./install
}
