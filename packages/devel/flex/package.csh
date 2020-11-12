PKG_NAME="flex"
PKG_VERSION="2.6.0"
PKG_SHA256="24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
PKG_URL="https://prdownloads.sourceforge.net/flex/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="ccache:host m4:host autoconf:host automake:host intltool:host libtool:host autoconf-archive:host bison:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="A tool for generating programs that perform pattern-matching on text."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_HOST="--enable-static --disable-shared --disable-rpath --with-gnu-ld"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_realloc_0_nonnull=yes \
                           ac_cv_func_malloc_0_nonnull=yes"

post_makeinstall_host() {
	cat >$TOOLCHAIN/bin/lex <<"EOF"
#!/bin/sh
exec flex "$@"
EOF

	chmod -v 755 $TOOLCHAIN/bin/lex
}
