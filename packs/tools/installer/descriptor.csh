PKG_NAME="installer"
PKG_VERSION="1"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain busybox newt parted e2fsprogs syslinux grub"
PKG_LONGDESC="Clue Install Manager to install the system on any disk"
PKG_TOOLCHAIN="manual"

post_install() {
	mkdir -p $INSTALL/usr/bin
	cp $PKG_DIR/scripts/installer $INSTALL/usr/bin
	sed -e "s/@DISTRO_NAME@/$DISTRO_NAME/g" \
		-i $INSTALL/usr/bin/installer

	mkdir -p $INSTALL/etc
	find_file_path config/installer.conf
	cp ${FOUND_PATH} $INSTALL/etc
	sed -e "s/@SYSTEM_SIZE@/$SYSTEM_SIZE/g" \
		-e "s/@SYSTEM_PART_START@/$SYSTEM_PART_START/g" \
		-e "s/@SYSLINUX_PARAMETERS@/$SYSLINUX_PARAMETERS/g" \
		-i $INSTALL/etc/installer.conf

	enable_service installer.service
}