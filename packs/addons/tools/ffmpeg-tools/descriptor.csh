PKG_NAME="ffmpeg-tools"
PKG_VERSION="1.0"
PKG_REV="110"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain ffmpegx"
PKG_SECTION="tools"
PKG_SHORTDESC="FFmpeg binary for transcoding and audio/video manipulating."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="FFmpeg Tools"
PKG_ADDON_TYPE="xbmc.python.script"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	cp -L $(get_build_dir ffmpegx)/.INSTALL_PKG/usr/local/bin/* ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# copy gnutls lib that is needed for ffmpeg
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib
	cp -PL $(get_build_dir gmp)/.install_pkg/usr/lib/libgmp.so.10 \
		$(get_build_dir gnutls)/.INSTALL_PKG/usr/lib/libgnutls.so.30 \
		$(get_build_dir nettle)/.install_pkg/usr/lib/{libhogweed.so.4,libnettle.so.6} \
		${BUILDER_ADDON}/$PKG_ADDON_ID/lib
}
