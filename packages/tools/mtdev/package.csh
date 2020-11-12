PKG_NAME="mtdev"
PKG_VERSION="1.1.5"
PKG_SHA256="6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f"
PKG_URL="http://bitmath.org/code/mtdev/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="The mtdev is a stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
