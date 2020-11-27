PKG_NAME="weather.clue"
PKG_VERSION="2.0.1"
PKG_ARCH="any"
PKG_URL="${DISTRO_ADDONS}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain kodi skin.clue module.clue"
PKG_SECTION="weather"
PKG_DESCRIPTION="Clue Weather for Kodi"
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
	xmlstarlet ed --inplace -u '//settings/section[@id="services"]/category[@id="weather"]/group[@id="1"]/setting[@id="weather.addon"]/default' -v "weather.clue" $SETTINGS
}