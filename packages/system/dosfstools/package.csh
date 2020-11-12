PKG_NAME="dosfstools"
PKG_VERSION="4.1"
PKG_SHA256="e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173"
PKG_URL="https://github.com/dosfstools/dosfstools/releases/download/v$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="gcc:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DEPENDS_INIT="toolchain dosfstools"
PKG_DESCRIPTION="dosfstools contains utilities for making and checking MS-DOS FAT filesystems."

PKG_CONFIGURE_OPTS_TARGET="--enable-compat-symlinks"
PKG_MAKE_OPTS_TARGET="PREFIX=/usr"
PKG_MAKEINSTALL_OPTS_TARGET="PREFIX=/usr"

make_init() {
	: # reuse make_target()
}

makeinstall_init() {
	mkdir -p $INSTALL/usr/sbin
	cp ../.install_pkg/usr/sbin/fsck.fat $INSTALL/usr/sbin
	ln -sf fsck.fat $INSTALL/usr/sbin/fsck.msdos
	ln -sf fsck.fat $INSTALL/usr/sbin/fsck.vfat
}

makeinstall_host() {
	mkdir -p $TOOLCHAIN/sbin
	cp src/mkfs.fat $TOOLCHAIN/sbin
	ln -sf mkfs.fat $TOOLCHAIN/sbin/mkfs.vfat
	cp src/fsck.fat $TOOLCHAIN/sbin
	ln -sf fsck.fat $TOOLCHAIN/sbin/fsck.vfat
	cp src/fatlabel $TOOLCHAIN/sbin
}