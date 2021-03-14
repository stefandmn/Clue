PKG_NAME="bcm2835-bootloader"
PKG_VERSION="62fc8c01165a80021054a430182b504f7b877c2d"
PKG_SHA256="3587caa082981f007c236c2ca15538f772c20309a00b25d979ce12f346c6f68a"
PKG_ARCH="arm"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux bcmstat"
PKG_DESCRIPTION="bcm2835-bootloader: Tool to create a bootable kernel for RaspberryPi"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	mkdir -p $INSTALL/usr/share/bootloader
	cp -PRv LICENCE* $INSTALL/usr/share/bootloader
	cp -PRv bootcode.bin $INSTALL/usr/share/bootloader
	if [ "$DEVICE" = "RPi4" ]; then
		cp -PRv fixup4x.dat $INSTALL/usr/share/bootloader/fixup.dat
		cp -PRv start4x.elf $INSTALL/usr/share/bootloader/start.elf
	else
		cp -PRv fixup_x.dat $INSTALL/usr/share/bootloader/fixup.dat
		cp -PRv start_x.elf $INSTALL/usr/share/bootloader/start.elf
	fi

	find_file_path config/dt-blob.bin && cp -PRv $FOUND_PATH $INSTALL/usr/share/bootloader

	find_file_path system/update.sh && cp -PRv $FOUND_PATH $INSTALL/usr/share/bootloader
	find_file_path system/canupdate.sh && cp -PRv $FOUND_PATH $INSTALL/usr/share/bootloader

	find_file_path files/3rdparty/bootloader/distroconfig.txt && cp -PRv ${FOUND_PATH} $INSTALL/usr/share/bootloader
	find_file_path files/3rdparty/bootloader/config.txt && cp -PRv ${FOUND_PATH} $INSTALL/usr/share/bootloader
}
