PKG_NAME="visualization.shadertoy"
PKG_VERSION="1.2.3-Leia"
PKG_SHA256="7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f"
PKG_REV="1"
PKG_ARCH="any"
PKG_URL="https://github.com/xbmc/visualization.shadertoy/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION=""
PKG_SHORTDESC="visualization.shadertoy"
PKG_LONGDESC="visualization.shadertoy"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.player.musicviz"

if [ ! "$OPENGL" = "no" ]; then
	# for OpenGL (GLX) support
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL"
fi

if [ "$OPENGLES_SUPPORT" = yes ]; then
	# for OpenGL-ES support
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGLES"
fi
