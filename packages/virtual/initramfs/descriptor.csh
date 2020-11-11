PKG_NAME="initramfs"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain libc:init busybox:init linux:init plymouth-lite:init util-linux:init e2fsprogs:init dosfstools:init fakeroot:host terminus-font:init"
PKG_SECTION="virtual"
PKG_DESCRIPTION="debug is a Metapackage for installing initramfs"

if [ "$ISCSI_SUPPORT" = yes ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET open-iscsi:init"
fi

if [ "$INITRAMFS_PARTED_SUPPORT" = yes ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET parted:init"
fi

post_install() {
	(
		cd ${BUILDER}/initramfs

		ln -sfn /usr/lib ${BUILDER}/initramfs/lib
		ln -sfn /usr/bin ${BUILDER}/initramfs/bin
		ln -sfn /usr/sbin ${BUILDER}/initramfs/sbin

		mkdir -p ${BUILDER}/image/
		fakeroot -- sh -c \
			"mkdir -p dev; mknod -m 600 dev/console c 5 1; find . | cpio -H newc -ov -R 0:0 > $BUILDER/image/initramfs.cpio"
	)
}
