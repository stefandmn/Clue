PKG_NAME="skin.clue"
PKG_VERSION="2.0.4"
PKG_ARCH="any"
PKG_URL="https://github.com/stefandmn/$PKG_NAME/releases/download/$PKG_VERSION/$PKG_NAME.zip"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="skin"
PKG_SHORTDESC="Clue SKin for Kodi"
PKG_LONGDESC="Clue SKin for Kodi"
PKG_TOOLCHAIN="manual"


makeinstall_target() {
	# deploy resources
	mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_ADDON_ID
	cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_ADDON_ID/

	# update addon manifest
	ADDON_MANIFEST=$INSTALL/usr/share/kodi/system/addon-manifest.xml
	xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "skin.clue" $ADDON_MANIFEST
}