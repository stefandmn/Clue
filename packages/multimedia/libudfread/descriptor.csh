PKG_NAME="libudfread"
PKG_VERSION="1.1.0"
PKG_SHA256="5ad9f95c53e8f29853c1fefa0a20a301be4045e2c7ae49d1164bc74d94155627"
PKG_URL="https://code.videolan.org/videolan/$PKG_NAME/-/archive/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="UDF reader"
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
