PKG_NAME="cxxtools"
PKG_VERSION="2.2.1"
PKG_SHA256="8cebb6d6cda7c93cc4f7c0d552a68d50dd5530b699cf87916bb3b708fdc4e342"
PKG_URL="http://www.tntnet.org/download/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="gcc:host"
PKG_DEPENDS_TARGET="toolchain cxxtools:host"
PKG_LONGDESC="Cxxtools is a collection of general-purpose C++ classes."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_HOST="--disable-demos --with-atomictype=pthread --disable-unittest"
PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --disable-demos --with-atomictype=pthread --disable-unittest"

post_makeinstall_host() {
	rm -rf $TOOLCHAIN/bin/cxxtools-config
}

post_makeinstall_target() {
	sed -e "s:\(['= ]\)/usr:\\1$TARGET_SYSROOT/usr:g" -i $TARGET_SYSROOT/usr/bin/cxxtools-config

	rm -rf $INSTALL/usr/bin
}
