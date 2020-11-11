PKG_NAME="entropy"
PKG_VERSION="0"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A simple way to add entropy at boot"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	mkdir -p $INSTALL/usr/lib/entropy
	cp add-entropy $INSTALL/usr/lib/entropy
	cp add-random-at-shutdown $INSTALL/usr/lib/entropy

	chmod +x $INSTALL/usr/lib/entropy/*
}

post_install() {
	enable_service add-entropy.service
	enable_service add-random-at-shutdown.service
}
