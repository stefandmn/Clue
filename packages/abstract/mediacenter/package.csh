PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain kodi repository.clue skin.clue module.clue service.clue weather.clue webinterface.clue program.slideshow  program.search"
PKG_SECTION="abstract"
PKG_DESCRIPTION="Metapackage to install kodi and related packages and addons"

# python-based tool for kodi management
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET texturecache.py"

# some python stuff needed for various addons
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow pycryptodome urllib3 certifi chardet idna PySocks pyOpenSSL cryptography"

# other packages
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET xmlstarlet"

get_graphicdrivers
