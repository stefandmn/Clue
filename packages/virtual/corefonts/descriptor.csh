PKG_NAME="corefonts"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_DESCRIPTION="Metapackage for installing fonts system and custom resources"

if [ -n "$CUSTOM_FONTS" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $CUSTOM_FONTS"
else
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET liberation-fonts-ttf"
fi
