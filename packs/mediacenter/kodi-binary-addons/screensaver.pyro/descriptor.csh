PKG_NAME="screensaver.pyro"
PKG_VERSION="3.0.1-Leia"
PKG_SHA256="cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd"
PKG_REV="1"
PKG_ARCH="any"
PKG_URL="https://github.com/xbmc/screensaver.pyro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION=""
PKG_SHORTDESC="screensaver.pyro"
PKG_LONGDESC="screensaver.pyro"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.ui.screensaver"

if [ "$OPENGL" = "no" ]; then
	exit 0
fi
