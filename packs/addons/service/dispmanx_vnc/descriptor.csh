PKG_NAME="dispmanx_vnc"
PKG_VERSION="5bde54b5a43a2e6f65994f3b9c665db90c45923f"
PKG_SHA256="1f096cd70d86620596db947757486064fe37dc2766ad33530318c35b279472aa"
PKG_VERSION_DATE="2018-08-18"
PKG_REV="106"
PKG_ARCH="arm"
PKG_ADDON_DEVICES="RPi"
PKG_URL="https://github.com/patrikolausson/dispmanx_vnc/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvncserver bcm2835-bootloader bcm2835-driver libconfig openssl"
PKG_SECTION="service/system"
PKG_SHORTDESC="Raspberry Pi VNC: a Virtual Network Computing server for Raspberry Pi"
PKG_LONGDESC="Raspberry Pi VNC ($PKG_VERSION_DATE) is a Virtual Network Computing (VNC) server for Raspberry Pi using dispmanx"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Raspberry Pi VNC"
PKG_ADDON_TYPE="xbmc.service"

pre_make_target() {
	export TARGET_SYSROOT
}

makeinstall_target() {
	:
}

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -p $PKG_BUILD/dispmanx_vncserver ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
}
