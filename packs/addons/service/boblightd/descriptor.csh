PKG_NAME="boblightd"
PKG_VERSION="478"
PKG_SHA256="78b82c9b133ce20c3d24aba96abe4a8302ec8dc640460b3b7302aa1d368c543a"
PKG_REV="101"
PKG_ARCH="any"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libusb"
PKG_SECTION="service/multimedia"
PKG_SHORTDESC="Boblight: an AmbiLight controller"
PKG_LONGDESC="Boblight($PKG_VERSION) is an opensource AmbiLight implementation."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Boblight"
PKG_ADDON_TYPE="xbmc.service"
PKG_TOOLCHAIN="autotools"

if [ "$OPENGL_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mesa glu"
fi

if [ "$OPENGL" = "no" ]; then
	EXTRAOPTS="--without-opengl"
fi

PKG_CONFIGURE_OPTS_TARGET="$EXTRAOPTS --without-portaudio"

makeinstall_target() {
	: # nothing to do here
}

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib
	cp -P $PKG_BUILD/.$TARGET_NAME/src/.libs/libboblight.so* ${BUILDER_ADDON}/$PKG_ADDON_ID/lib

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $PKG_BUILD/.$TARGET_NAME/src/boblightd ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $PKG_BUILD/.$TARGET_NAME/src/boblight-constant ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	cp -R $PKG_DIR/config/boblight.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config
}