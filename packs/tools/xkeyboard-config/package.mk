PKG_NAME="xkeyboard-config"
PKG_VERSION="2.27"
PKG_SHA256="690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f"
PKG_LICENSE="MIT"
PKG_SITE="http://www.X.org"
PKG_URL="http://www.x.org/releases/individual/data/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros"
PKG_LONGDESC="X keyboard extension data files."
PKG_TOOLCHAIN="autotools"


pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--without-xsltproc \
                             --enable-compat-rules \
                             --disable-runtime-deps \
                             --enable-nls \
                             --disable-rpath \
                             --with-gnu-ld"
}
