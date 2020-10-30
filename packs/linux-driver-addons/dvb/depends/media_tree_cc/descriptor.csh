PKG_NAME="media_tree_cc"
PKG_VERSION="2019-05-12"
PKG_SHA256="55bd8b54c83110a30d8ad44761e888a4bad4745f1ae4765dcf44f2752fc96419"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Source of Linux Kernel media_tree subsystem to build with media_build."
PKG_TOOLCHAIN="manual"

unpack() {
	mkdir -p $PKG_BUILD/
	tar -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2 -C $PKG_BUILD/
}

post_unpack() {
	# hack/workaround for borked upstream kernel/media_build
	# without removing atomisp there a lot additional includes that
	# slowdown build process after modpost from 3min to 6min
	# even if atomisp is disabled via kernel.conf
	rm -rf $PKG_BUILD/drivers/staging/media/atomisp
	sed -i 's|^.*drivers/staging/media/atomisp.*$||' \
		$PKG_BUILD/drivers/staging/media/Kconfig
}