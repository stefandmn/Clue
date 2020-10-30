PKG_NAME="libnfs"
PKG_VERSION="4.0.0"
PKG_SHA256="6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d"
PKG_URL="https://github.com/sahlberg/libnfs/archive/libnfs-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A client library for accessing NFS shares over a network."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-examples"

pre_configure_target() {
	export CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=64"
}
