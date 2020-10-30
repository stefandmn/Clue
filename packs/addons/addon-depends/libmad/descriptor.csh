PKG_NAME="libmad"
PKG_VERSION="0.15.1b"
PKG_SHA256="bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
PKG_URL="$SOURCEFORGE_SRC/mad/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A high-quality MPEG audio decoder."
PKG_TOOLCHAIN="autotools"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/lib/pkgconfig
	cat >$TARGET_SYSROOT/usr/lib/pkgconfig/mad.pc <<"EOF"
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: mad
Description: MPEG audio decoder
Requires:
Version: 0.15.1b
Libs: -L${libdir} -lmad
Cflags: -I${includedir}
EOF
}