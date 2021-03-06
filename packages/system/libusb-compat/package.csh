PKG_NAME="libusb-compat"
PKG_VERSION="0.1.5"
PKG_SHA256="404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
PKG_URL="https://prdownloads.sourceforge.net/libusb/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libusb"
PKG_DESCRIPTION="The libusb project's aim is to create a Library for use by user level applications to USB devices."

PKG_CONFIGURE_OPTS_TARGET="--disable-log --disable-debug-log --disable-examples-build"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin
	sed -e "s:\(['= ]\)/usr:\\1$TARGET_SYSROOT/usr:g" -i $TARGET_SYSROOT/usr/bin/libusb-config
}
