PKG_NAME="usbutils"
PKG_VERSION="008"
PKG_SHA256="44741af0bae9d402a0ef160a29b2fa700bb656ab5e0a4b3343d51249c2a44c8c"
PKG_URL="http://kernel.org/pub/linux/utils/usb/usbutils/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libusb systemd"
PKG_DESCRIPTION="This package contains various utilities for inspecting and setting of devices connected to the USB bus."

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin/lsusb.py
	rm -rf $INSTALL/usr/bin/usbhid-dump
}
