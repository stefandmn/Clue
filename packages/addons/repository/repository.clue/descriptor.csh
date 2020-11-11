PKG_NAME="repository.clue"
PKG_VERSION="2.0.2"
PKG_ARCH="any"
PKG_URL="https://github.com/stefandmn/$PKG_NAME/releases/download/$PKG_VERSION/$PKG_NAME.zip"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="repository"
PKG_DESCRIPTION="Clue Repository for Kodi"
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
}