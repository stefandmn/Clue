PKG_NAME="fuse"
PKG_VERSION="2.9.9"
PKG_SHA256="d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
PKG_URL="https://github.com/libfuse/libfuse/releases/download/$PKG_NAME-$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="FUSE provides a simple interface for userspace programs to export a virtual filesystem to the Linux kernel."
# fuse fails to build with GOLD linker on gcc-4.9
PKG_BUILD_FLAGS="-gold"

PKG_CONFIGURE_OPTS_TARGET="MOUNT_FUSE_PATH=/usr/sbin \
                           --enable-lib \
                           --enable-util \
                           --disable-example \
                           --enable-mtab \
                           --disable-rpath \
                           --with-gnu-ld"

post_makeinstall_target() {
	rm -rf $INSTALL/etc/init.d
	rm -rf $INSTALL/etc/udev
}
