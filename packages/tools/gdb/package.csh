PKG_NAME="gdb"
PKG_VERSION="8.2.1"
PKG_SHA256="0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
PKG_URL="http://ftpmirror.gnu.org/gdb/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib ncurses expat"
PKG_DESCRIPTION="GNU Project debugger, allows you to see what is going on inside another program while it executes."
# gdb could fail on runtime if build with LTO support

PKG_CONFIGURE_OPTS_TARGET="bash_cv_have_mbstate_t=set \
                           --disable-shared \
                           --enable-static \
                           --with-auto-load-safe-path=/ \
                           --disable-nls \
                           --disable-sim \
                           --without-x \
                           --disable-tui \
                           --disable-libada \
                           --without-lzma \
                           --disable-libquadmath \
                           --disable-libquadmath-support \
                           --enable-libada \
                           --enable-libssp \
                           --disable-werror"

pre_configure_target() {
	CC_FOR_BUILD="$HOST_CC"
	CFLAGS_FOR_BUILD="$HOST_CFLAGS"
}

makeinstall_target() {
	make DESTDIR=$INSTALL install
}

post_makeinstall_target() {
	rm -rf $INSTALL/usr/share/gdb/python
}
