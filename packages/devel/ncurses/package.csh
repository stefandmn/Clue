PKG_NAME="ncurses"
PKG_VERSION="6.1-20181215"
PKG_SHA256="08b07c3e792961f300829512c283d5fefc0b1c421a57b76922c3d13303ed677d"
PKG_URL="http://invisible-mirror.net/archives/ncurses/current/ncurses-$PKG_VERSION.tgz"
PKG_DEPENDS_HOST="gcc:host"
PKG_DEPENDS_TARGET="toolchain zlib ncurses:host"
PKG_DESCRIPTION="A library is a free software emulation of curses in System V Release 4.0, and more."
# causes some segmentation fault's (dialog) when compiled with gcc's link time optimization.
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--without-ada \
                           --without-cxx \
                           --without-cxx-binding \
                           --disable-db-install \
                           --without-manpages \
                           --without-progs \
                           --without-tests \
                           --without-shared \
                           --with-normal \
                           --without-debug \
                           --without-profile \
                           --without-termlib \
                           --without-ticlib \
                           --without-gpm \
                           --without-dbmalloc \
                           --without-dmalloc \
                           --disable-rpath \
                           --disable-database \
                           --with-fallbacks=linux,screen,xterm,xterm-color \
                           --with-termpath=/clue/.config/termcap \
                           --disable-big-core \
                           --enable-termcap \
                           --enable-getcap \
                           --disable-getcap-cache \
                           --enable-symlinks \
                           --disable-bsdpad \
                           --without-rcs-ids \
                           --enable-ext-funcs \
                           --disable-const \
                           --enable-no-padding \
                           --disable-sigwinch \
                           --enable-pc-files \
                           --with-pkg-config-libdir=/usr/lib/pkgconfig \
                           --disable-tcap-names \
                           --without-develop \
                           --disable-hard-tabs \
                           --disable-xmc-glitch \
                           --disable-hashmap \
                           --disable-safe-sprintf \
                           --disable-scroll-hints \
                           --disable-widec \
                           --disable-echo \
                           --disable-warnings \
                           --disable-home-terminfo \
                           --disable-assertions"

post_makeinstall_target() {
	cp misc/ncurses-config $TOOLCHAIN/bin
	chmod +x $TOOLCHAIN/bin/ncurses-config
	sed -e "s:\(['=\" ]\)/usr:\\1$TARGET_SYSROOT/usr:g" -i $TOOLCHAIN/bin/ncurses-config
	rm -rf $INSTALL/usr/bin
}