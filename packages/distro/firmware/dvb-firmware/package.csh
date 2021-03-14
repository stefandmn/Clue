PKG_NAME="dvb-firmware"
PKG_VERSION="1.3.1"
PKG_SHA256="c800e41f5047c586d3e3184166436f45edb460f71164724250e1e54faf1e0988"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="dvb-firmware: firmwares for various DVB drivers"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	PKG_FW_DIR="$INSTALL/$(get_kernel_overlay_dir)/lib/firmware"
	mkdir -p "$PKG_FW_DIR"
	cp -a "$PKG_BUILD/firmware/"* "$PKG_FW_DIR"
}
