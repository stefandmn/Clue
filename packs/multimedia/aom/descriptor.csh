PKG_NAME="aom"
PKG_VERSION="990da97d18a80dcdb0cb291ffb91e284e2e25320"
PKG_SHA256="830cc4b00a5fb747144218f1a6bf48c4ddff49670d95acda61313502520c236b"
PKG_URL="http://repo.or.cz/aom.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="AV1 Codec Library"

PKG_CMAKE_OPTS_TARGET="-DENABLE_CCACHE=1 \
                       -DENABLE_DOCS=0 \
                       -DENABLE_EXAMPLES=0 \
                       -DENABLE_TESTS=0 \
                       -DENABLE_TOOLS=0"

if ! target_has_feature neon; then
	PKG_CMAKE_OPTS_TARGET+=" -DENABLE_NEON=0 -DENABLE_NEON_ASM=0"
fi