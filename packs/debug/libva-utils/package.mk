PKG_NAME="libva-utils"
PKG_VERSION="2.4.1"
PKG_SHA256="4ab6faa6592ffe2d4817450f5453f3974b47441650e8f49e1a12497ce2a794ac"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/01org/libva-utils"
PKG_URL="https://github.com/intel/libva-utils/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="Libva-utils is a collection of tests for VA-API (VIdeo Acceleration API)"
PKG_TOOLCHAIN="autotools"

PKG_DEPENDS_TARGET="toolchain libva libdrm"

PKG_CONFIGURE_OPTS_TARGET="--disable-silent-rules \
                           --enable-drm \
                           --disable-x11 \
                           --disable-wayland \
                           --disable-tests"
