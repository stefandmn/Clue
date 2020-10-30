PKG_NAME="swig"
PKG_VERSION="4.0.0"
PKG_SHA256="e8a39cd6437e342cdcbd5af27a9bf11b62dc9efec9248065debcb8276fcbb925"
PKG_LICENSE="GPL"
PKG_SITE="http://www.swig.org"
PKG_URL="$SOURCEFORGE_SRC/swig/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_LONGDESC="SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages."

PKG_CONFIGURE_OPTS_HOST="--program-suffix=4.0 \
                         --with-pcre-prefix=$TOOLCHAIN \
                         --with-boost=no \
                         --without-pcre \
                         --without-x \
                         --without-tcl \
                         --without-python \
                         --without-python3 \
                         --without-perl5 \
                         --without-octave \
                         --without-java \
                         --without-gcj \
                         --without-android \
                         --without-guile \
                         --without-mzscheme \
                         --without-ruby \
                         --without-php \
                         --without-ocaml \
                         --without-pike \
                         --without-chicken \
                         --without-csharp \
                         --without-lua \
                         --without-allegrocl \
                         --without-clisp \
                         --without-r \
                         --without-go \
                         --without-d"

post_makeinstall_host() {
  ln -sf swig4.0 $TOOLCHAIN/bin/swig
}
