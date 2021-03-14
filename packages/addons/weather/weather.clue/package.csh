PKG_NAME="weather.clue"
PKG_VERSION="2.0.1"
PKG_ARCH="any"
PKG_URL="${REPO_ADDONS}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain kodi skin.clue module.clue"
PKG_SECTION="weather"
PKG_DESCRIPTION="Clue Weather for Kodi"
PKG_TOOLCHAIN="manual"


makeinstall_target() {
	# deploy resources
	mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
	cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME/
}