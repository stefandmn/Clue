PKG_NAME="program.clue"
PKG_VERSION="2.0.5"
PKG_ARCH="any"
PKG_URL="${DISTRO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain Python2 connman pygobject dbus-python"
PKG_SECTION="program"
PKG_DESCRIPTION="Clue Setup Program for Kodi"
PKG_TOOLCHAIN="manual"

PKG_MAKE_OPTS_TARGET="DISTRO_NAME=$DISTRO_NAME ROOT_PASSWORD=$ROOT_PASSWORD"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bkeymaps"

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

post_makeinstall_target() {
	mkdir -p $INSTALL/usr/lib/clue
	cp $PKG_DIR/scripts/* $INSTALL/usr/lib/clue

	ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/program.clue

	$TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/lib/ -f
	rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

	$TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/oe.py -f
	rm -rf $ADDON_INSTALL_DIR/oe.py
}

post_install() {
	enable_service backup-restore.service
	enable_service factory-reset.service
}
