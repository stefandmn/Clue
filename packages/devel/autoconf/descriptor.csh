PKG_NAME="autoconf"
PKG_VERSION="2.69"
PKG_SHA256="64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684"
PKG_URL="http://ftpmirror.gnu.org/autoconf/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="ccache:host m4:host gettext:host"
PKG_DESCRIPTION="A GNU tool for automatically configuring source code."

PKG_CONFIGURE_OPTS_HOST="EMACS=no \
                         ac_cv_path_M4=$TOOLCHAIN/bin/m4 \
                         ac_cv_prog_gnu_m4_gnu=no \
                         --target=$TARGET_NAME"

post_makeinstall_host() {
	make prefix=$TARGET_SYSROOT/usr install
}
