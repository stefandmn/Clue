PKG_NAME="bitstream"
PKG_VERSION="1.4"
PKG_SHA256="b2484940d3b8733bec9dd1ec1731de428261dff31c9f95874264be9dc9ce786b"
PKG_URL="http://download.videolan.org/pub/videolan/bitstream/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="biTStream is a set of C headers allowing a simpler access to binary structures such as specified by MPEG, DVB, IETF."

PKG_MAKEINSTALL_OPTS_TARGET="PREFIX=/usr"