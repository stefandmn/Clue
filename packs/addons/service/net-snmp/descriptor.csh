PKG_NAME="net-snmp"
PKG_VERSION="5.8"
PKG_SHA256="b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
PKG_REV="106"
PKG_ARCH="any"
PKG_URL="https://sourceforge.net/projects/net-snmp/files/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libnl openssl"
PKG_SECTION="service"
PKG_SHORTDESC="Simple Network Management Protocol utilities."
PKG_LONGDESC="Simple Network Management Protocol (SNMP) is a widely used protocol for monitoring the health and welfare of network equipment."
PKG_TOOLCHAIN="autotools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Net-SNMP"
PKG_ADDON_TYPE="xbmc.service"

configure_package() {
	PKG_CONFIGURE_OPTS_TARGET="--with-defaults \
        --disable-applications \
        --disable-manuals \
        --disable-debugging \
        --disable-deprecated \
        --disable-snmptrapd-subagent \
        --disable-scripts \
        --enable-static=yes \
        --enable-shared=no \
        --with-nl \
        --with-logfile=/clue/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
        --with-persistent-directory=/clue/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
        --sysconfdir=/clue/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
        --prefix=/clue/.kodi/addons/${PKG_ADDON_ID} \
        --exec-prefix=/clue/.kodi/addons/${PKG_ADDON_ID} \
        --datarootdir=/clue/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share \
        --bindir=/clue/.kodi/addons/${PKG_ADDON_ID}/bin \
        --sbindir=/clue/.kodi/addons/${PKG_ADDON_ID}/bin \
        --libdir=/clue/.kodi/addons/${PKG_ADDON_ID}/lib \
        --disable-embedded-perl \
        --with-sysroot=$TARGET_SYSROOT"
}

make_target() {
	make
}

makeinstall_target() {
	make install INSTALL_PREFIX=$PKG_BUILD/.$TARGET_NAME
}

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib
	cp -r $PKG_BUILD/.$TARGET_NAME/clue/.kodi/addons/${PKG_ADDON_ID}/bin $PKG_BUILD/.$TARGET_NAME/clue/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share ${BUILDER_ADDON}/$PKG_ADDON_ID/
}