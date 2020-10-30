PKG_NAME="encfs"
PKG_VERSION="1.9.5"
PKG_SHA256="4709f05395ccbad6c0a5b40a4619d60aafe3473b1a79bafb3aa700b1f756fd63"
PKG_URL="https://github.com/vgough/encfs/releases/download/v$PKG_VERSION/encfs-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain fuse openssl"
PKG_LONGDESC="A Encrypted Filesystem for FUSE."

PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_PREFIX=/usr \
                       -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES=$TARGET_SYSROOT/usr/include \
                       -DBUILD_UNIT_TESTS=OFF"

makeinstall_target() {
	:
}
