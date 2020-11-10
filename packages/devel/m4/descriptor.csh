PKG_NAME="m4"
PKG_VERSION="1.4.18"
PKG_SHA256="6640d76b043bc658139c8903e293d5978309bf0f408107146505eca701e67cf6"
PKG_URL="http://ftpmirror.gnu.org/m4/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="The m4 macro processor."

PKG_CONFIGURE_OPTS_HOST="gl_cv_func_gettimeofday_clobber=no --target=$TARGET_NAME"

post_makeinstall_host() {
	make prefix=$TARGET_SYSROOT/usr install
}
