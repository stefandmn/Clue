PKG_NAME="skin.clue"
PKG_VERSION="2.0.1"
PKG_ARCH="any"
PKG_URL="${DISTRO_ADDONS}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="skin"
PKG_DESCRIPTION="Clue SKin for Kodi"
PKG_TOOLCHAIN="manual"


makeinstall_target() {
	# deploy resources
	mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
	cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME/
}