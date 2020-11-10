PKG_NAME="readline"
PKG_VERSION="8.0"
PKG_SHA256="e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461"
PKG_URL="http://ftpmirror.gnu.org/readline/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_LONGDESC="The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are typed in."
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="bash_cv_wcwidth_broken=no \
                           --disable-shared \
                           --enable-static \
                           --with-curses"

post_makeinstall_target() {
	rm -rf $INSTALL/usr/share/readline
}
