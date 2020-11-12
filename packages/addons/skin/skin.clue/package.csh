PKG_NAME="skin.clue"
PKG_VERSION="2.0.4"
PKG_ARCH="any"
PKG_URL="${DISTRO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="skin"
PKG_SHORTDESC="Clue SKin for Kodi"
PKG_DESCRIPTION="Clue SKin for Kodi"
PKG_TOOLCHAIN="manual"


makeinstall_target() {
	# deploy resources
	mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
	cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME/

	# update kodi manifest
	MANIFEST=$(get_build_dir kodi)/.install_pkg/usr/share/kodi/system/addon-manifest.xml
	if [ $(more $MANIFEST | grep "$PKG_NAME" | wc -l) -eq 0 ]; then
		xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "$PKG_NAME" $MANIFEST
	fi

	# change default skin and device name in the global configuration
	SETTINGS=$(get_build_dir kodi)/.install_pkg/usr/share/kodi/system/settings/settings.xml
	xmlstarlet ed --inplace -u '//settings/section[@id="interface"]/category[@id="skin"]/group[@id="1"]/setting[@id="lookandfeel.skin"]/default' -v "$PKG_NAME" $SETTINGS
	xmlstarlet ed --inplace -u '//settings/section[@id="services"]/category[@id="general"]/group[@id="1"]/setting[@id="services.devicename"]/default' -v "$DISTRO_NAME" $SETTINGS

	xmlstarlet ed --inplace -u '//settings/section[@id="interface"]/category[@id="regional"]/group[@id="2"]/setting[@id="locale.country"]/default' -v "Central Europe" $SETTINGS
}