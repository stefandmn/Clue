PKG_NAME="pcscd"
PKG_VERSION="1.0"
PKG_REV="100"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain pcsc-lite libusb ccid"
PKG_SECTION="service"
PKG_SHORTDESC="Middleware to access a smart card using SCard API (PC/SC)"
PKG_LONGDESC="Middleware to access a smart card using SCard API (PC/SC)"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="PC/SC Smart Card Daemon"
PKG_ADDON_TYPE="xbmc.service"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	cp -Pa $(get_build_dir pcsc-lite)/.install_pkg/usr/sbin/pcscd ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/pcscd.bin

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/drivers/serial
	cp -Pa $(get_build_dir ccid)/.$TARGET_NAME/src/.libs/libccidtwin.so ${BUILDER_ADDON}/$PKG_ADDON_ID/drivers/serial

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/drivers/ifd-ccid.bundle/Contents/Linux/
	cp -Pa $(get_build_dir ccid)/.$TARGET_NAME/src/.libs/libccid.so ${BUILDER_ADDON}/$PKG_ADDON_ID/drivers/ifd-ccid.bundle/Contents/Linux/
	cp -Pa $(get_build_dir ccid)/.$TARGET_NAME/src/Info.plist ${BUILDER_ADDON}/$PKG_ADDON_ID/drivers/ifd-ccid.bundle/Contents

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	cp -Pa $PKG_DIR/config/* ${BUILDER_ADDON}/$PKG_ADDON_ID/config/
}
