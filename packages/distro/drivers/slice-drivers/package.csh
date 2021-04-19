PKG_NAME="slice-drivers"
PKG_VERSION="1.0"
PKG_ARCH="arm"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_DESCRIPTION="linux kernel modules for the Slice box"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
	unset LDFLAGS
}

make_target() {
	kernel_make KDIR=$(kernel_path)
}

makeinstall_target() {
	mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
	cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
