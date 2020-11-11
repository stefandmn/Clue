PKG_NAME="ccache"
PKG_VERSION="3.6"
PKG_SHA256="c23ecf1253e0d12c9da9dda9567a88a606d46f93d9982b8b1a423d6f238bd435"
PKG_URL="https://samba.org/ftp/ccache/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_HOST="make:host"
PKG_DESCRIPTION="A compiler cache to speed up re-compilation of C/C++ code by caching."

PKG_CONFIGURE_OPTS_HOST="--with-bundled-zlib"

pre_configure_host() {
	export CC=$LOCAL_CC
	export CXX=$LOCAL_CXX
}

post_makeinstall_host() {
	# setup ccache
	if [ -z "$CCACHE_DISABLE" ]; then
		$TOOLCHAIN/bin/ccache --max-size=$CCACHE_CACHE_SIZE
	fi

	cat >$TOOLCHAIN/bin/host-gcc <<EOF
#!/bin/sh
$TOOLCHAIN/bin/ccache $CC "\$@"
EOF

	chmod +x $TOOLCHAIN/bin/host-gcc

	cat >$TOOLCHAIN/bin/host-g++ <<EOF
#!/bin/sh
$TOOLCHAIN/bin/ccache $CXX "\$@"
EOF

	chmod +x $TOOLCHAIN/bin/host-g++
}
