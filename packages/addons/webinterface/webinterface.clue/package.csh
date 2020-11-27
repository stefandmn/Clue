PKG_NAME="webinterface.clue"
PKG_VERSION="2.0.1"
PKG_ARCH="any"
PKG_URL="${DISTRO_ADDONS}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain kodi skin.clue"
PKG_SECTION="webinterface"
PKG_DESCRIPTION="Clue Web Interface for Kodi"
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
	xmlstarlet ed --inplace -u '//settings/section[@id="services"]/category[@id="control"]/group[@id="1"]/setting[@id="services.webserver"]/default' -v "true" $SETTINGS
	xmlstarlet ed --inplace -u '//settings/section[@id="services"]/category[@id="control"]/group[@id="1"]/setting[@id="services.webserverport"]/default' -v "80" $SETTINGS
	xmlstarlet ed --inplace -u '//settings/section[@id="services"]/category[@id="control"]/group[@id="1"]/setting[@id="services.webserverusername"]/default' -v "" $SETTINGS
	xmlstarlet ed --inplace -u '//settings/section[@id="services"]/category[@id="control"]/group[@id="1"]/setting[@id="services.webskin"]/default' -v "webinterface.clue" $SETTINGS

	# remove default webinterface addon
	rm -rf $(get_build_dir kodi)/.install_pkg/usr/share/kodi/addons/webinterface.default
	rm -rf ${BUILDER}/image/system/usr/share/kodi/addons/webinterface.default

	# remoe default addon registration from manifest
	xmlstarlet ed -L -d "/addons/addon[text()='webinterface.default']" $MANIFEST
}