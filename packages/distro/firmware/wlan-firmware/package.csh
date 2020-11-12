PKG_NAME="wlan-firmware"
PKG_VERSION="214272780dc4c4850ec30aebbc93edd8f410e7fd"
PKG_SHA256="d03e3108ef18ec10774b601d06d8445aebbd3c39f8ea3ab2b20a26c62af3500f"
PKG_URL="${DISTRO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="wlan-firmware: firmwares for various WLAN drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	DESTDIR=$INSTALL/$(get_kernel_overlay_dir) ./install
}