PKG_NAME="image"
PKG_DEPENDS_TARGET="toolchain squashfs:host dosfstools:host fakeroot:host kmod:host mtools:host populatefs:host libc gcc linux linux-drivers linux-firmware bcm2835-bootloader busybox util-linux corefonts network misc-packages debug"
PKG_SECTION="virtual"
PKG_LONGDESC="Root package used to build and create complete image"

# Multimedia support
[ ! "$MEDIACENTER" = "no" ] && PKG_DEPENDS_TARGET+=" mediacenter"

# Sound support
[ "$ALSA_SUPPORT" = "yes" ] && PKG_DEPENDS_TARGET+=" alsa"

# Automounter support
[ "$UDEVIL" = "yes" ] && PKG_DEPENDS_TARGET+=" udevil"

# EXFAT support
[ "$EXFAT" = "yes" ] && PKG_DEPENDS_TARGET+=" fuse-exfat"

# NTFS 3G support
[ "$NTFS3G" = "yes" ] && PKG_DEPENDS_TARGET+=" ntfs-3g_ntfsprogs"

true
