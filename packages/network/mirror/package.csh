PKG_NAME="mirror"
PKG_VERSION="2.0.1"
PKG_ARCH="arm"
PKG_URL="https://github.com/stefandmn/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvncserver"
PKG_DESCRIPTION="VNC module for Clue environment to display native RPi screen."

make_target() {
	cd $PKG_BUILD/src
	make
}

makeinstall_target() {
	# deploy resources
	mkdir -p $INSTALL/usr/bin
	mkdir -p $INSTALL/etc
	cp -PR $PKG_BUILD/src/obj/$PKG_NAME $INSTALL/usr/bin/$PKG_NAME
	cp -PR $PKG_BUILD/sys/etc/$PKG_NAME.conf $INSTALL/etc/$PKG_NAME.conf
}

post_install() {
	enable_service mirror.service
}
