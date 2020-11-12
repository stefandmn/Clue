PKG_NAME="libdvdread"
PKG_VERSION="bd6b329"
PKG_SHA256="2d9d6d185dd25a983d6dfc2a00207cafdc396a969c227d5edd84b6215b2fba89"
PKG_URL="https://github.com/xbmc/libdvdread/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="libdvdread is a library which provides a simple foundation for reading DVDs."
PKG_TOOLCHAIN="manual"

if [ "$KODI_DVDCSS_SUPPORT" = yes ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libdvdcss"
fi
