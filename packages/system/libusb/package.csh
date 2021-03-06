PKG_NAME="libusb"
PKG_VERSION="1.0.22"
PKG_SHA256="75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275518157"
PKG_URL="https://prdownloads.sourceforge.net/libusb/files/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_DESCRIPTION="The libusb project's aim is to create a Library for use by user level applications to USB devices."
#libusb sometimes fails to build if building paralell
PKG_BUILD_FLAGS="-parallel"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared \
            --enable-static \
            --disable-log \
            --disable-debug-log \
            --enable-udev \
            --disable-examples-build"
