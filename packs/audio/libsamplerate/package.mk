PKG_NAME="libsamplerate"
PKG_VERSION="0.1.9"
PKG_SHA256="0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
PKG_LICENSE="GPL"
PKG_SITE="http://www.mega-nerd.com/SRC/"
PKG_URL="http://www.mega-nerd.com/SRC/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A Sample Rate Converter for audio."

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --datadir=/usr/share \
                           --disable-fftw \
                           --disable-sndfile"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
