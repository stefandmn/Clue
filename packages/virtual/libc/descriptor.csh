PKG_NAME="libc"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain glibc tz libidn2"
PKG_DEPENDS_INIT="toolchain glibc:init"
PKG_SECTION="virtual"
PKG_LONGDESC="Meta package for installing various tools and libs needed for libc"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET arm-mem"
PKG_DEPENDS_INIT="$PKG_DEPENDS_INIT arm-mem:init"
