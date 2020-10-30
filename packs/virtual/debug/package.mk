PKG_NAME="debug"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE="http://www.openelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain gdb edid-decode memtester"
PKG_SECTION="virtual"
PKG_LONGDESC="debug is a Metapackage for installing debugging tools"

# configure GPU drivers and dependencies:
  get_graphicdrivers

if [ "$VAAPI_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libva-utils"
fi

if build_with_debug && [ "$VALGRIND" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET valgrind"
fi
