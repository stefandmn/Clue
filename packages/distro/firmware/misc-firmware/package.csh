PKG_NAME="misc-firmware"
PKG_VERSION="1.0"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain kernel-firmware"
PKG_DESCRIPTION="Firmwares for various drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	DESTDIR=$INSTALL/$(get_kernel_overlay_dir) ./install
}
