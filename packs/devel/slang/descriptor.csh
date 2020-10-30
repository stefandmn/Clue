PKG_NAME="slang"
PKG_VERSION="2.1.4"
PKG_SHA256="14877efebbf0e57a3543f7ab3c72b491d3e398ea852616990f88463d64a3b4e3"
PKG_URL="ftp://space.mit.edu/pub/davis/slang/v2.1/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A library designed to allow a developer to create robust multi-platform software."
PKG_BUILD_FLAGS="-parallel"

PKG_CONFIGURE_OPTS_TARGET="--without-onig"

pre_configure_target() {
	# slang fails to build in subdirs
	cd $PKG_BUILD
	rm -rf .$TARGET_NAME
}

pre_configure_host() {
	# slang fails to build in subdirs
	cd $PKG_BUILD
	rm -rf .$HOST_NAME
}
