PKG_NAME="game-tools"
PKG_VERSION=""
PKG_REV="101"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of game tools and programs"
PKG_LONGDESC="This bundle currently includes bchunk, ecm-tools, iat, and linuxconsoletools"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Game Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    bchunk \
                    ecm-tools \
                    iat \
                    linuxconsoletools"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	# bchunk
	cp -P $(get_build_dir bchunk)/bchunk ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# ecm-tools
	cp -P $(get_build_dir ecm-tools)/bin2ecm ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	ln -s bin2ecm ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/ecm2bin

	# iat
	cp -P $(get_build_dir iat)/.$TARGET_NAME/src/iat ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# linuxconsoletools
	cp -P $(get_build_dir linuxconsoletools)/utils/fftest ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir linuxconsoletools)/utils/jscal ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir linuxconsoletools)/utils/jstest ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
}
