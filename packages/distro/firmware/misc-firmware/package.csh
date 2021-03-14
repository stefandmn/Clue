PKG_NAME="misc-firmware"
PKG_VERSION="9dd2a255e23dda9146e02d25bd98a8afa0d1ece0"
PKG_SHA256="8788d153cbee0bfd9998aed4cf2e015b373529d4b9c2c35325a08ef390855ec6"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kernel-firmware"
PKG_DESCRIPTION="misc-firmware: firmwares for various drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	DESTDIR=$INSTALL/$(get_kernel_overlay_dir) ./install
}
