PKG_NAME="emby4"
PKG_VERSION="4.4.2.0"
PKG_SHA256="36c65cfbd41ec83d415c098384032cd414da4f670e77013da7eb901bd16afe27"
PKG_REV="107"
PKG_ARCH="any"
PKG_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/$PKG_VERSION/embyserver-netcore_$PKG_VERSION.zip"
PKG_SOURCE_DIR="system"
PKG_DEPENDS_TARGET="toolchain imagemagick"
PKG_SECTION="service"
PKG_SHORTDESC="Emby Server: a personal media server"
PKG_LONGDESC="Emby Server ($PKG_VERSION) brings your home videos, music, and photos together, automatically converting and streaming your media on-the-fly to any device."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Emby Server 4"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="tools.ffmpeg-tools:0.0.0 tools.dotnet-runtime:0.0.0"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/emby
	cp -r $PKG_BUILD/* \
		-d ${BUILDER_ADDON}/$PKG_ADDON_ID/emby

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib
	cp -L $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickCore-7.Q16HDRI.so.? \
		${BUILDER_ADDON}/$PKG_ADDON_ID/lib/
	cp -L $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickWand-7.Q16HDRI.so \
		${BUILDER_ADDON}/$PKG_ADDON_ID/lib/CORE_RL_Wand_.so
}