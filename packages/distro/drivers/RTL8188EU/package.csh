PKG_NAME="RTL8188EU"
PKG_VERSION="9a56f32c2a46be5b81f0eedf49ad44ea8f10bfae"
PKG_SHA256="c8f225ff85cdc49e4a043773234e42de38aac0d2c9322829dac21c2ba72fed87"
PKG_URL="https://github.com/lwfinger/rtl8188eu/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_DESCRIPTION="Realtek RTL81xxEU Linux 3.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
	unset LDFLAGS
}

make_target() {
	make V=1 \
		ARCH=$TARGET_KERNEL_ARCH \
		KSRC=$(kernel_path) \
		CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
		CONFIG_POWER_SAVING=n
}

makeinstall_target() {
	mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
	cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
