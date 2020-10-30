PKG_NAME="screensaver.asterwave"
PKG_VERSION="3.0.4-Leia"
PKG_SHA256="44fb4189afefec6ab5cff04d205425bed26b127c02625ae176b409cb67207e5f"
PKG_REV="1"
PKG_ARCH="any"
PKG_URL="https://github.com/xbmc/screensaver.asterwave/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform soil glm"
PKG_SECTION=""
PKG_SHORTDESC="screensaver.asterwave"
PKG_LONGDESC="screensaver.asterwave"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.ui.screensaver"

if [ "$OPENGL" = "no" ]; then
	exit 0
fi
