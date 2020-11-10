PKG_NAME="crazycat"
PKG_VERSION="532599d255411a24f93b585a92b1b0c49e2012f7"
PKG_SHA256="0e3addc3562057a77edefdde0052a78aec145c4dd5b737b53dd25ce389b95093"
PKG_URL="https://bitbucket.org/CrazyCat/media_build/get/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux media_tree_cc"
PKG_NEED_UNPACK="$LINUX_DEPENDS $(get_pkg_directory media_tree_cc)"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB driver for TBS cards with CrazyCats additions"

PKG_IS_ADDON="embedded"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers for TBS"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}"

pre_make_target() {
	export KERNEL_VER=$(get_module_dir)
	export LDFLAGS=""
}

make_target() {
	cp -RP $(get_build_dir media_tree_cc)/* $PKG_BUILD/linux

	# make config all
	kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path) allyesconfig

	# add menuconfig to edit .config
	kernel_make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
	install_driver_addon_files "$PKG_BUILD/v4l/"
}
