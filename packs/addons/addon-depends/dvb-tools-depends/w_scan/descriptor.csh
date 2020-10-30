PKG_NAME="w_scan"
PKG_VERSION="20170107"
PKG_SHA256="38e0f38a7bf06cff6d6ea01652ad4ee60da2cb0e937360468f936da785b46ffe"
PKG_URL="http://wirbel.htpc-forum.de/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A channel scan tool which generates ATSC, DVB-C, DVB-S/S2 and DVB-T channels.conf files."
PKG_TOOLCHAIN="autotools"

makeinstall_target() {
	:
}
