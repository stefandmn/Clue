PKG_NAME="estouchy"
PKG_VERSION="1.0"
PKG_REV="101"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="skin"
PKG_SHORTDESC="Kodi skin Estouchy"
PKG_LONGDESC="Kodi skin Estouchy"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Estouchy"
PKG_ADDON_TYPE="xbmc.gui.skin"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID
	cp -a $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.estouchy/* ${BUILDER_ADDON}/$PKG_ADDON_ID
}
