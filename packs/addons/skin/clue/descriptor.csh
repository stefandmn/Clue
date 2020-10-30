PKG_NAME="skin.clue"
PKG_VERSION="1.4.17"
PKG_REV="101"
PKG_ARCH="any"
PKG_URL="https://github.com/stefandmn/$PKG_NAME/releases/download/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="skin"
PKG_SHORTDESC="Kodi skin Clue"
PKG_LONGDESC="Kodi skin Clue"
PKG_TOOLCHAIN="manual"
PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Clue Skin"
PKG_ADDON_TYPE="xbmc.gui.skin"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID
	cp -PR $PKG_BUILD/* ${BUILDER_ADDON}/$PKG_ADDON_ID
	cp $PKG_DIR/changelog.txt ${BUILDER_ADDON}/$PKG_ADDON_ID
	cp $PKG_DIR/icon/icon.png ${BUILDER_ADDON}/$PKG_ADDON_ID/resources
}
