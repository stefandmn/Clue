PKG_NAME="sundtek-mediatv"
PKG_VERSION="7.0"
PKG_REV="105"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="xmlstarlet:host p7zip:host"
PKG_SECTION="driver/dvb"
PKG_SHORTDESC="Sundtek MediaTV: a Linux driver to add support for SUNDTEK USB DVB devices"
PKG_LONGDESC="Install this to add support for Sundtek USB DVB devices."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Sundtek MediaTV"
PKG_ADDON_TYPE="xbmc.service"

make_target() {
	mkdir -p $PKG_BUILD
	cd $PKG_BUILD

	INSTALLER_URL="http://sundtek.de/media/netinst/armsysvhf/installer.tar.gz"

	wget -O installer.tar.gz $INSTALLER_URL

	tar -xzf installer.tar.gz

	chmod -R 755 opt/ etc/

	rm -f opt/bin/getinput.sh
	rm -f opt/bin/lirc.sh
	rm -fr opt/lib/pm/

	wget -O version.used http://sundtek.de/media/latest.phtml
}

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/
	cp -P $PKG_DIR/config/* ${BUILDER_ADDON}/$PKG_ADDON_ID/config/
	cp -P $PKG_DIR/settings-default.xml ${BUILDER_ADDON}/$PKG_ADDON_ID/
	cp -Pa $PKG_BUILD/opt/bin ${BUILDER_ADDON}/$PKG_ADDON_ID/
	cp -Pa $PKG_BUILD/opt/lib ${BUILDER_ADDON}/$PKG_ADDON_ID/
	cp $PKG_BUILD/version.used ${BUILDER_ADDON}/$PKG_ADDON_ID/
}