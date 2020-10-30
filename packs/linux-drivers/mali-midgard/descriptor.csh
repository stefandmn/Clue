PKG_NAME="mali-midgard"
PKG_VERSION="9ce33e456c9320b90f7ce8770262c852a77e4b81" # TX011-SW-99002-r28p0-01rel0
PKG_SHA256="ef8808d0d0535449cd23410832bcb7433e35568afcbb75683608a7df9dd536bc"
PKG_ARCH="arm aarch64"
PKG_URL="https://github.com/LibreELEC/mali-midgard/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="mali-midgard: Linux drivers for Mali Midgard GPUs"
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

post_patch() {
	# rename kernel module to not clash with mali-bifrost
	find $PKG_BUILD -name Kbuild -exec sed -i 's/mali_kbase.o/mali_midgard.o/g; s/mali_kbase-/mali_midgard-/g' {} \;
}

make_target() {
	kernel_make -C $(kernel_path) M=$PKG_BUILD/driver/product/kernel/drivers/gpu/arm/midgard \
		EXTRA_CFLAGS="${PKG_EXTRA_CFLAGS}" \
		CONFIG_MALI_MIDGARD=m ${PKG_CONFIGS}
}

makeinstall_target() {
	kernel_make -C $(kernel_path) M=$PKG_BUILD/driver/product/kernel/drivers/gpu/arm/midgard \
		INSTALL_MOD_PATH=$INSTALL/$(get_kernel_overlay_dir) INSTALL_MOD_STRIP=1 DEPMOD=: \
		modules_install
}
