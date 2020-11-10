PKG_NAME="LibreELEC-settings"
PKG_VERSION="42acf2613927fa93d9d8ec9aa1d3135d101db0e0"
PKG_SHA256="5f904cde29454902ea4da3980e88d38a1432ef8eb91995436d3d6ffbddfd260c"
PKG_URL="https://github.com/LibreELEC/service.libreelec.settings/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 connman pygobject dbus-python"
PKG_LONGDESC="LibreELEC-settings: is a settings dialog for LibreELEC"

PKG_MAKE_OPTS_TARGET="DISTRO_NAME=$DISTRO_NAME ROOT_PASSWORD=$ROOT_PASSWORD"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bkeymaps"

post_makeinstall_target() {
	mkdir -p $INSTALL/usr/lib/clue
	cp $PKG_DIR/scripts/* $INSTALL/usr/lib/clue

	ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/service.libreelec.settings

	$TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/lib/ -f
	rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

	$TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/oe.py -f
	rm -rf $ADDON_INSTALL_DIR/oe.py
}

post_install() {
	enable_service backup-restore.service
	enable_service factory-reset.service
}
