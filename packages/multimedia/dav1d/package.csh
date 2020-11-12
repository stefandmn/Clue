PKG_NAME="dav1d"
PKG_VERSION="0.3.1"
PKG_SHA256="be511d465223cc74aab507fe3a6e4e764501662ebf1a5e233854ed064a7ae204"
PKG_URL="https://code.videolan.org/videolan/dav1d/-/archive/${PKG_VERSION}/dav1d-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="dav1d is an AV1 decoder :)"

PKG_MESON_OPTS_TARGET="-Dbuild_tools=false \
                       -Dbuild_tests=false"
