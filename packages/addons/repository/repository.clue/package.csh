PKG_NAME="repository.clue"
PKG_VERSION="2.0.1"
PKG_ARCH="any"
PKG_URL="${REPO_ADDONS}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="repository"
PKG_DESCRIPTION="Clue Repository for Kodi"
PKG_TOOLCHAIN="manual"


makeinstall_target() {
	# deploy resources
	mkdir -p $INSTALL/usr/share/kodi/addons/$PKG_NAME
	cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/$PKG_NAME/
}