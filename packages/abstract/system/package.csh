PKG_NAME="system"
PKG_DEPENDS_TARGET="toolchain squashfs:host dosfstools:host fakeroot:host kmod:host mtools:host populatefs:host glibc tz libidn2 arm-mem gcc linux drivers firmware bcm2835-bootloader busybox util-linux network gdb edid-decode memtester"
PKG_SECTION="abstract"
PKG_DESCRIPTION="Root package used to build and create complete OS system image"

# Multimedia support
PKG_DEPENDS_TARGET+=" mediacenter"

# Core fonts support
if [ -n "$CUSTOM_FONTS" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $CUSTOM_FONTS"
else
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET liberation-fonts-ttf"
fi

# Sound support
[ "$ALSA_SUPPORT" = "yes" ] && PKG_DEPENDS_TARGET+=" alsa-lib alsa-utils"

# Automounter support
[ "$UDEVIL" = "yes" ] && PKG_DEPENDS_TARGET+=" udevil"

# EXFAT support
[ "$EXFAT" = "yes" ] && PKG_DEPENDS_TARGET+=" fuse-exfat"

# NTFS 3G support
[ "$NTFS3G" = "yes" ] && PKG_DEPENDS_TARGET+=" ntfs-3g_ntfsprogs"

# configure GPU drivers and dependencies:
get_graphicdrivers

if [ "$VAAPI_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libva-utils"
fi

if build_with_debug && [ "$VALGRIND" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET valgrind"
fi

true
