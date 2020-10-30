PKG_NAME="vdr"
PKG_VERSION="2.4.1"
PKG_SHA256="25c3f835c4f3ff92cd2db10c004439ef22c2e895193c77fbe8cc7eac4858a1dc"
PKG_URL="http://ftp.tvdr.de/vdr-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain bzip2 fontconfig freetype libcap libiconv libjpeg-turbo"
PKG_LONGDESC="A DVB TV server application."
PKG_TOOLCHAIN="manual"

post_unpack() {
	rm -rf $PKG_BUILD/PLUGINS/src/skincurses
}

pre_configure_target() {
	export LDFLAGS="$(echo $LDFLAGS | sed -e "s|-Wl,--as-needed||") -L$TARGET_SYSROOT/usr/lib/iconv"
}

pre_make_target() {
	cat >Make.config <<EOF
  PLUGINLIBDIR = /usr/lib/vdr
  PREFIX = /usr
  VIDEODIR = /clue/videos
  CONFDIR = /clue/.config/vdr
  LOCDIR = /usr/share/locale
  LIBS += -liconv
  NO_KBD=yes
  VDR_USER=root
EOF
}

make_target() {
	make vdr vdr.pc
	make include-dir
}
