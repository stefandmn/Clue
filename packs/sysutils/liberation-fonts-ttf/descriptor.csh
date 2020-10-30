PKG_NAME="liberation-fonts-ttf"
PKG_VERSION="2.00.1"
PKG_SHA256="7890278a6cd17873c57d9cd785c2d230d9abdea837e96516019c5885dd271504"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain util-macros"
PKG_LONGDESC="This packages included the high-quality and open-sourced TrueType vector fonts."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	mkdir -p $INSTALL/usr/share/fonts/liberation
	cp *.ttf $INSTALL/usr/share/fonts/liberation
}

post_install() {
	mkfontdir $INSTALL/usr/share/fonts/liberation
	mkfontscale $INSTALL/usr/share/fonts/liberation
}
