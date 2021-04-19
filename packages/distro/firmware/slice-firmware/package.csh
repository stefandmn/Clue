PKG_NAME="slice-firmware"
PKG_VERSION="1.0"
PKG_ARCH="arm"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
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
