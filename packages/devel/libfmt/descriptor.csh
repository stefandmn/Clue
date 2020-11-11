PKG_NAME="libfmt"
PKG_VERSION="5.3.0"
PKG_SHA256="defa24a9af4c622a7134076602070b45721a43c51598c8456ec6f2c4dbb51c89"
PKG_URL="https://github.com/fmtlib/fmt/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="fmt is an open-source formatting library for C++. It can be used as a safe alternative to printf or as a fast alternative to IOStreams."

PKG_CMAKE_OPTS_TARGET="-DFMT_DOC=OFF -DFMT_INSTALL=ON -DFMT_TEST=OFF -DFMT_USE_CPP11=ON"
