PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain kodi repository.clue skin.clue"
PKG_SECTION="virtual"
PKG_DESCRIPTION="Mediacenter: Metapackage"

# python-based tool for kodi management
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET texturecache.py"

# some python stuff needed for various addons
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow simplejson pycryptodome"

# other packages
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET xmlstarlet"

get_graphicdrivers

