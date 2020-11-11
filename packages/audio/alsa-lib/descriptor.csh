PKG_NAME="alsa-lib"
PKG_VERSION="1.1.9"
PKG_SHA256="488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b"
PKG_URL="ftp://ftp.alsa-project.org/pub/lib/alsa-lib-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="ALSA (Advanced Linux Sound Architecture) is the next generation Linux Sound API."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

if build_with_debug; then
	PKG_ALSA_DEBUG=--with-debug
else
	PKG_ALSA_DEBUG=--without-debug
fi

PKG_CONFIGURE_OPTS_TARGET="$PKG_ALSA_DEBUG \
                           --disable-dependency-tracking \
                           --with-plugindir=/usr/lib/alsa \
                           --disable-python"

post_configure_target() {
	sed -i 's/.*PKGLIBDIR.*/#define PKGLIBDIR ""/' include/config.h
}

post_makeinstall_target() {
	rm -rf $INSTALL/usr/bin

	mkdir -p $INSTALL/usr/config
	cp -PR $PKG_DIR/config/modprobe.d $INSTALL/usr/config
}

post_install() {
	add_group audio 63
}
