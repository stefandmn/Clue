PKG_NAME="multimedia-tools"
PKG_VERSION="1.0"
PKG_REV="109"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of multimedia tools and programs"
PKG_LONGDESC="This bundle currently includes alsamixer, mediainfo, mesa-demos, mpg123, opencaster, squeezelite, tsdecrypt and tstools."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Multimedia Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    alsa-utils \
                    mediainfo \
                    mpg123 \
                    opencaster \
                    squeezelite \
                    tsdecrypt \
                    tstools"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	# alsamixer
	cp -P $(get_build_dir alsa-utils)/.$TARGET_NAME/alsamixer/alsamixer ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	# mediainfo
	cp -P $(get_build_dir mediainfo)/Project/GNU/CLI/mediainfo ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# mesa-demos
	cp -P $(get_build_dir mesa-demos)/.$TARGET_NAME/src/xdemos/glxdemo ${BUILDER_ADDON}/$PKG_ADDON_ID/bin 2>/dev/null || :
	cp -P $(get_build_dir mesa-demos)/.$TARGET_NAME/src/xdemos/glxgears ${BUILDER_ADDON}/$PKG_ADDON_ID/bin 2>/dev/null || :
	cp -P $(get_build_dir mesa-demos)/.$TARGET_NAME/src/xdemos/glxinfo ${BUILDER_ADDON}/$PKG_ADDON_ID/bin 2>/dev/null || :

	# mpg123
	cp -P $(get_build_dir mpg123)/.install_pkg/usr/bin/* ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	# opencaster
	cp -P $(get_build_dir opencaster)/.install_pkg/* ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	# squeezelite
	cp -P $(get_build_dir squeezelite)/squeezelite ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	# tsdecrypt
	cp -P $(get_build_dir tsdecrypt)/tsdecrypt ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# tstools
	cp -P $(get_build_dir tstools)/bin/* ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
}
