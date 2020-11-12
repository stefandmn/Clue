PKG_NAME="libunwind"
PKG_VERSION="1.2.1"
PKG_SHA256="3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb"
PKG_URL="http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_DESCRIPTION="library to determine the call-chain of a program"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
			   --disable-shared"

makeinstall_target() {
	make DESTDIR=$TARGET_SYSROOT install
}
