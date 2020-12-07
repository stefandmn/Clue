PKG_NAME="slice-firmware"
PKG_VERSION="0f463cc05c7e647310abd807c96921ea79073dd6"
PKG_SHA256="27e8bac75d5639ca75d683bb2c9b10398c5d7f54f2cf3337ede6abf98e42f751"
PKG_ARCH="arm"
PKG_URL="${DISTRO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_DESCRIPTION="BCM270x firmware related stuff for Slice"
PKG_TOOLCHAIN="manual"

make_target() {
	if [ "$DEVICE" = "Slice3" ]; then
		$(kernel_path)/scripts/dtc/dtc -O dtb -I dts -o dt-blob.bin slice3-dt-blob.dts
	elif [ "$DEVICE" = "Slice" ]; then
		$(kernel_path)/scripts/dtc/dtc -O dtb -I dts -o dt-blob.bin slice-dt-blob.dts
	fi
}

makeinstall_target() {
	mkdir -p $INSTALL/usr/share/bootloader/
	cp -a $PKG_BUILD/dt-blob.bin $INSTALL/usr/share/bootloader/
}