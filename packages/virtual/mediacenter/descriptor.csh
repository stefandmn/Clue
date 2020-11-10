PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain kodi skin.clue"
PKG_SECTION="virtual"
PKG_LONGDESC="Mediacenter: Metapackage"

# python-based tool for kodi management
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET texturecache.py"

# some python stuff needed for various addons
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow simplejson pycryptodome"

# settings addon
if [ -n "$DISTRO_PKG_SETTINGS" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $DISTRO_PKG_SETTINGS"
fi

# other packages
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET xmlstarlet"

# joystick support
if [ "$KODI_JOYSTICK_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET peripheral.joystick"
fi

get_graphicdrivers

