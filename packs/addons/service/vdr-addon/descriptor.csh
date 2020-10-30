PKG_NAME="vdr-addon"
PKG_VERSION="2.4.1"
PKG_REV="111"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain vdr vdr-plugin-ddci2 vdr-plugin-dummydevice vdr-plugin-dvbapi vdr-plugin-eepg vdr-plugin-epgfixer \
                    vdr-plugin-epgsearch vdr-plugin-iptv vdr-plugin-live vdr-plugin-restfulapi vdr-plugin-robotv vdr-plugin-satip \
                    vdr-plugin-streamdev vdr-plugin-vnsiserver vdr-plugin-wirbelscan vdr-plugin-wirbelscancontrol vdr-plugin-xmltv2vdr"
PKG_SECTION="service.multimedia"
PKG_SHORTDESC="VDR: a TV streaming server for Linux"
PKG_LONGDESC="VDR (2.4.x) is a TV streaming server for Linux supporting DVB-S/S2, DVB-C, DVB-T/T2, IPTV and SAT>IP"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="VDR PVR Backend"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="pvr.vdr.vnsi:0.0.0 script.config.vdr:0.0.0"

addon() {
	VDR_DIR="$(get_build_dir vdr)"
	VDR_PLUGIN_LIVE_DIR="$(get_build_dir vdr-plugin-live)"
	VDR_PLUGIN_VNSISERVER_DIR="$(get_build_dir vdr-plugin-vnsiserver)"
	VDR_PLUGIN_STREAMVEV_DIR="$(get_build_dir vdr-plugin-streamdev)"
	VDR_PLUGIN_XMLTV2VDR="$(get_build_dir vdr-plugin-xmltv2vdr)"
	VDR_PLUGIN_EPGFIXER_DIR="$(get_build_dir vdr-plugin-epgfixer)"
	VDR_PLUGIN_RESTFULAPI_DIR="$(get_build_dir vdr-plugin-restfulapi)"

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	touch ${BUILDER_ADDON}/$PKG_ADDON_ID/config/channels.conf
	cp $VDR_DIR/diseqc.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	cp $VDR_DIR/keymacros.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	cp $VDR_DIR/scr.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	cp $VDR_DIR/sources.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	cp $VDR_DIR/svdrphosts.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config
	echo '0.0.0.0/0' >>${BUILDER_ADDON}/$PKG_ADDON_ID/config/svdrphosts.conf

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/epgsearch

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/res/plugins/live
	cp -PR $VDR_PLUGIN_LIVE_DIR/live/* ${BUILDER_ADDON}/$PKG_ADDON_ID/res/plugins/live

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/epgsources/
	cp $VDR_PLUGIN_XMLTV2VDR/dist/epgdata2xmltv/epgdata2xmltv.dist ${BUILDER_ADDON}/$PKG_ADDON_ID/config/epgsources/epgdata2xmltv

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_VNSISERVER_DIR/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-iptv)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-wirbelscan)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-wirbelscancontrol)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-dvbapi)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-eepg)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_STREAMVEV_DIR/server/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_STREAMVEV_DIR/client/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_LIVE_DIR/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-epgsearch)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_XMLTV2VDR/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-dummydevice)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-satip)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_EPGFIXER_DIR/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $VDR_PLUGIN_RESTFULAPI_DIR/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-robotv)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin
	cp -PR $(get_build_dir vdr-plugin-ddci2)/libvdr*.so.* ${BUILDER_ADDON}/$PKG_ADDON_ID/plugin

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/eepg

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/vnsiserver
	cp -PR $VDR_PLUGIN_VNSISERVER_DIR/vnsiserver/allowed_hosts.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/vnsiserver

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $VDR_DIR/vdr ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/vdr.bin
	cp -P $VDR_PLUGIN_XMLTV2VDR/dist/epgdata2xmltv/epgdata2xmltv ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib
	cp -PL $(get_build_dir tntnet)/.install_pkg/usr/lib/libtntnet.so.12 ${BUILDER_ADDON}/$PKG_ADDON_ID/lib

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/streamdev-server
	cp -PR $VDR_PLUGIN_STREAMVEV_DIR/streamdev-server/streamdevhosts.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/streamdev-server

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/epgfixer
	cp -PR $VDR_PLUGIN_EPGFIXER_DIR/epgfixer/*.conf ${BUILDER_ADDON}/$PKG_ADDON_ID/config/plugins/epgfixer

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/res/plugins/restfulapi
	cp -P $VDR_PLUGIN_RESTFULAPI_DIR/web/* ${BUILDER_ADDON}/$PKG_ADDON_ID/res/plugins/restfulapi
	cp -P $VDR_PLUGIN_RESTFULAPI_DIR/API.html ${BUILDER_ADDON}/$PKG_ADDON_ID/res/plugins/restfulapi
}
