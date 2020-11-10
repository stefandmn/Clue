PKG_NAME="parted"
PKG_VERSION="3.2"
PKG_SHA256="858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
PKG_URL="http://ftpmirror.gnu.org/parted/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="toolchain util-linux:host"
PKG_DEPENDS_TARGET="toolchain util-linux parted:host"
PKG_DEPENDS_INIT="toolchain util-linux:init parted"
PKG_LONGDESC="GNU Parted is a program for creating, destroying, resizing, checking and copying partitions."

PKG_CONFIGURE_OPTS_TARGET="--disable-device-mapper \
                           --disable-shared \
                           --without-readline \
                           --disable-rpath \
                           --with-gnu-ld"

PKG_CONFIGURE_OPTS_HOST="$PKG_CONFIGURE_OPTS_TARGET"

configure_init() {
	: # reuse configure_target()
}

make_init() {
	: # reuse make_target()
}

makeinstall_init() {
	mkdir -p $INSTALL/sbin
	cp ../.$TARGET_NAME/parted/parted $INSTALL/sbin
	cp ../.$TARGET_NAME/partprobe/partprobe $INSTALL/sbin
}
