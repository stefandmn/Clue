PKG_NAME="linux"
PKG_DEPENDS_HOST="ccache:host openssl:host"
PKG_DEPENDS_TARGET="toolchain linux:host cpio:host kmod:host xz:host wireless-regdb keyutils"
PKG_DEPENDS_INIT="toolchain"
PKG_NEED_UNPACK="$LINUX_DEPENDS $(get_pkg_directory busybox)"
PKG_LONGDESC="This package contains a precompiled kernel image and the modules."
PKG_IS_KERNEL_PKG="yes"
PKG_STAMP="$KERNEL_TARGET $KERNEL_MAKE_EXTRACMD"
PKG_PATCH_DIRS="$LINUX"
PKG_VERSION="f0e620550b8b422fef4adcabb2d0e8e69f1fec75" # 4.19.122
PKG_SHA256="33601014b658e2257a51c9b474bd590f75193e11cf78ac200fa5e6dea0caf6d8"
PKG_URL="https://github.com/raspberrypi/linux/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_NAME="linux-$LINUX-$PKG_VERSION.tar.gz"

PKG_KERNEL_CFG_FILE=$(kernel_config_path) || die

if [ -n "$KERNEL_TOOLCHAIN" ]; then
	PKG_DEPENDS_HOST="$PKG_DEPENDS_HOST gcc-arm-$KERNEL_TOOLCHAIN:host"
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-arm-$KERNEL_TOOLCHAIN:host"
	HEADERS_ARCH=$TARGET_ARCH
fi

if [ "$PKG_BUILD_PERF" != "no" ] && grep -q ^CONFIG_PERF_EVENTS= $PKG_KERNEL_CFG_FILE; then
	PKG_BUILD_PERF="yes"
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET binutils elfutils libunwind zlib openssl"
fi

if [[ "$KERNEL_TARGET" == uImage* ]]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET u-boot-tools:host"
fi

post_patch() {
	cp $PKG_KERNEL_CFG_FILE $PKG_BUILD/.config

	sed -i -e "s|^CONFIG_INITRAMFS_SOURCE=.*$|CONFIG_INITRAMFS_SOURCE=\"$BUILDER/image/initramfs.cpio\"|" $PKG_BUILD/.config
	sed -i -e '/^CONFIG_INITRAMFS_SOURCE=*./ a CONFIG_INITRAMFS_ROOT_UID=0\nCONFIG_INITRAMFS_ROOT_GID=0' $PKG_BUILD/.config

	# set default hostname based on $DISTRO_NAME
	sed -i -e "s|@DISTRO_NAME@|$DISTRO_NAME|g" $PKG_BUILD/.config

	# disable swap support if not enabled
	if [ ! "$SWAP_SUPPORT" = yes ]; then
		sed -i -e "s|^CONFIG_SWAP=.*$|# CONFIG_SWAP is not set|" $PKG_BUILD/.config
	fi

	# disable nfs support if not enabled
	if [ ! "$NFS_SUPPORT" = yes ]; then
		sed -i -e "s|^CONFIG_NFS_FS=.*$|# CONFIG_NFS_FS is not set|" $PKG_BUILD/.config
	fi

	# disable cifs support if not enabled
	if [ ! "$SAMBA_SUPPORT" = yes ]; then
		sed -i -e "s|^CONFIG_CIFS=.*$|# CONFIG_CIFS is not set|" $PKG_BUILD/.config
	fi

	# disable iscsi support if not enabled
	if [ ! "$ISCSI_SUPPORT" = yes ]; then
		sed -i -e "s|^CONFIG_SCSI_ISCSI_ATTRS=.*$|# CONFIG_SCSI_ISCSI_ATTRS is not set|" $PKG_BUILD/.config
		sed -i -e "s|^CONFIG_ISCSI_TCP=.*$|# CONFIG_ISCSI_TCP is not set|" $PKG_BUILD/.config
		sed -i -e "s|^CONFIG_ISCSI_BOOT_SYSFS=.*$|# CONFIG_ISCSI_BOOT_SYSFS is not set|" $PKG_BUILD/.config
		sed -i -e "s|^CONFIG_ISCSI_IBFT_FIND=.*$|# CONFIG_ISCSI_IBFT_FIND is not set|" $PKG_BUILD/.config
		sed -i -e "s|^CONFIG_ISCSI_IBFT=.*$|# CONFIG_ISCSI_IBFT is not set|" $PKG_BUILD/.config
	fi

	# install extra dts files
	for f in ${ROOT}/basis/config/*-overlay.dts; do
		[ -f "$f" ] && cp -v $f $PKG_BUILD/arch/$TARGET_KERNEL_ARCH/boot/dts/overlays || true
	done
	if [ -n "${DEVICE}" ]; then
		for f in ${ROOT}/devices/${DEVICE}/config/*-overlay.dts; do
			[ -f "$f" ] && cp -v $f $PKG_BUILD/arch/$TARGET_KERNEL_ARCH/boot/dts/overlays || true
		done
	fi
}

make_host() {
	make \
		ARCH=${HEADERS_ARCH:-$TARGET_KERNEL_ARCH} \
		HOSTCC="$TOOLCHAIN/bin/host-gcc" \
		HOSTCXX="$TOOLCHAIN/bin/host-g++" \
		HOSTCFLAGS="$HOST_CFLAGS" \
		HOSTCXXFLAGS="$HOST_CXXFLAGS" \
		HOSTLDFLAGS="$HOST_LDFLAGS" \
		headers_check
}

makeinstall_host() {
	make \
		ARCH=${HEADERS_ARCH:-$TARGET_KERNEL_ARCH} \
		HOSTCC="$TOOLCHAIN/bin/host-gcc" \
		HOSTCXX="$TOOLCHAIN/bin/host-g++" \
		HOSTCFLAGS="$HOST_CFLAGS" \
		HOSTCXXFLAGS="$HOST_CXXFLAGS" \
		HOSTLDFLAGS="$HOST_LDFLAGS" \
		INSTALL_HDR_PATH=dest \
		headers_install
	mkdir -p $TARGET_SYSROOT/usr/include
	cp -R dest/include/* $TARGET_SYSROOT/usr/include
}

pre_make_target() {
	kernel_make oldconfig

	# regdb (backward compatability with pre-4.15 kernels)
	if grep -q ^CONFIG_CFG80211_INTERNAL_REGDB= $PKG_BUILD/.config; then
		cp $(get_build_dir wireless-regdb)/db.txt $PKG_BUILD/net/wireless/db.txt
	fi
}

make_target() {
	kernel_make modules
	kernel_make INSTALL_MOD_PATH=$INSTALL/$(get_kernel_overlay_dir) modules_install
	rm -f $INSTALL/$(get_kernel_overlay_dir)/lib/modules/*/build
	rm -f $INSTALL/$(get_kernel_overlay_dir)/lib/modules/*/source

	if [ "$PKG_BUILD_PERF" = "yes" ]; then
		(
			cd tools/perf

			# arch specific perf build args
			PERF_BUILD_ARGS="ARCH=$TARGET_ARCH"

			WERROR=0 \
				NO_LIBPERL=1 \
				NO_LIBPYTHON=1 \
				NO_SLANG=1 \
				NO_GTK2=1 \
				NO_LIBNUMA=1 \
				NO_LIBAUDIT=1 \
				NO_LZMA=1 \
				NO_SDT=1 \
				CROSS_COMPILE="$TARGET_PREFIX" \
				JOBS="$CONCURRENCY_MAKE_LEVEL" \
				make $PERF_BUILD_ARGS
			mkdir -p $INSTALL/usr/bin
			cp perf $INSTALL/usr/bin
		)
	fi

	(
		cd $ROOT
		rm -rf ${BUILDER}/initramfs
		${CONFIG}/install initramfs
	)

	pkg_lock_status "ACTIVE" "linux:target" "build"
	echo "**** INIT ****"

	# arm64 target does not support creating uImage.
	# Build Image first, then wrap it using u-boot's mkimage.
	if [[ "$TARGET_KERNEL_ARCH" == "arm64" && "$KERNEL_TARGET" == uImage* ]]; then
		if [ -z "$KERNEL_UIMAGE_LOADADDR" -o -z "$KERNEL_UIMAGE_ENTRYADDR" ]; then
			die "ERROR: KERNEL_UIMAGE_LOADADDR and KERNEL_UIMAGE_ENTRYADDR have to be set to build uImage - aborting"
		fi
		KERNEL_UIMAGE_TARGET="$KERNEL_TARGET"
		KERNEL_TARGET="${KERNEL_TARGET/uImage/Image}"
	fi

	# the modules target is required to get a proper Module.symvers
	# file with symbols from built-in and external modules.
	# Without that it'll contain only the symbols from the kernel
	kernel_make $KERNEL_TARGET $KERNEL_MAKE_EXTRACMD modules

	if [ -n "$KERNEL_UIMAGE_TARGET" ]; then
		# determine compression used for kernel image
		KERNEL_UIMAGE_COMP=${KERNEL_UIMAGE_TARGET:7}
		KERNEL_UIMAGE_COMP=${KERNEL_UIMAGE_COMP:-none}

		# calculate new load address to make kernel Image unpack to memory area after compressed image
		if [ "$KERNEL_UIMAGE_COMP" != "none" ]; then
			COMPRESSED_SIZE=$(stat -t "arch/$TARGET_KERNEL_ARCH/boot/$KERNEL_TARGET" | awk '{print $2}')
			# align to 1 MiB
			COMPRESSED_SIZE=$(((($COMPRESSED_SIZE - 1 >> 20) + 1) << 20))
			PKG_KERNEL_UIMAGE_LOADADDR=$(printf '%X' "$(($KERNEL_UIMAGE_LOADADDR + $COMPRESSED_SIZE))")
			PKG_KERNEL_UIMAGE_ENTRYADDR=$(printf '%X' "$(($KERNEL_UIMAGE_ENTRYADDR + $COMPRESSED_SIZE))")
		else
			PKG_KERNEL_UIMAGE_LOADADDR=${KERNEL_UIMAGE_LOADADDR}
			PKG_KERNEL_UIMAGE_ENTRYADDR=${KERNEL_UIMAGE_ENTRYADDR}
		fi

		mkimage -A $TARGET_KERNEL_ARCH \
			-O linux \
			-T kernel \
			-C $KERNEL_UIMAGE_COMP \
			-a $PKG_KERNEL_UIMAGE_LOADADDR \
			-e $PKG_KERNEL_UIMAGE_ENTRYADDR \
			-d arch/$TARGET_KERNEL_ARCH/boot/$KERNEL_TARGET \
			arch/$TARGET_KERNEL_ARCH/boot/$KERNEL_UIMAGE_TARGET

		KERNEL_TARGET="${KERNEL_UIMAGE_TARGET}"
	fi
}

makeinstall_target() {
	mkdir -p $INSTALL/usr/share/bootloader/overlays

	# install platform dtbs, but remove upstream kernel dtbs (i.e. without downstream
	# drivers and decent USB support) as these are not required by Clue
	cp -p arch/$TARGET_KERNEL_ARCH/boot/dts/*.dtb $INSTALL/usr/share/bootloader
	rm -f $INSTALL/usr/share/bootloader/bcm283*.dtb

	# install overlay dtbs
	for dtb in arch/$TARGET_KERNEL_ARCH/boot/dts/overlays/*.dtbo; do
		cp $dtb $INSTALL/usr/share/bootloader/overlays 2>/dev/null || :
	done

	cp -p arch/$TARGET_KERNEL_ARCH/boot/dts/overlays/README $INSTALL/usr/share/bootloader/overlays
}

make_init() {
	: # reuse make_target()
}

makeinstall_init() {
	if [ -n "$INITRAMFS_MODULES" ]; then
		mkdir -p $INSTALL/etc
		mkdir -p $INSTALL/usr/lib/modules

		for i in $INITRAMFS_MODULES; do
			module=$(find .install_pkg/$(get_full_module_dir)/kernel -name $i.ko)
			if [ -n "$module" ]; then
				echo $i >>$INSTALL/etc/modules
				cp $module $INSTALL/usr/lib/modules/$(basename $module)
			fi
		done
	fi

	if [ "$UVESAFB_SUPPORT" = yes ]; then
		mkdir -p $INSTALL/usr/lib/modules
		uvesafb=$(find .install_pkg/$(get_full_module_dir)/kernel -name uvesafb.ko)
		cp $uvesafb $INSTALL/usr/lib/modules/$(basename $uvesafb)
	fi
}

post_install() {
	mkdir -p $INSTALL/$(get_full_firmware_dir)/

	# regdb and signature is now loaded as firmware by 4.15+
	if grep -q ^CONFIG_CFG80211_REQUIRE_SIGNED_REGDB= $PKG_BUILD/.config; then
		cp $(get_build_dir wireless-regdb)/regulatory.db{,.p7s} $INSTALL/$(get_full_firmware_dir)
	fi
}
