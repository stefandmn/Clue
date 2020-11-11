PKG_NAME="expat"
PKG_VERSION="2.2.5"
PKG_SHA256="d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6"
PKG_URL="https://github.com/libexpat/libexpat/releases/download/R_${PKG_VERSION//./_}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Expat is an XML parser library written in C."

PKG_CMAKE_OPTS_TARGET="-DBUILD_doc=OFF -DBUILD_tools=OFF -DBUILD_examples=OFF -DBUILD_tests=OFF -DBUILD_shared=ON"
PKG_CMAKE_OPTS_HOST="-DBUILD_doc=OFF -DBUILD_tools=OFF -DBUILD_examples=OFF -DBUILD_tests=OFF -DBUILD_shared=ON"
