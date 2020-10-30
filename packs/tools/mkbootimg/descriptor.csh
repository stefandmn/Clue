PKG_NAME="mkbootimg"
PKG_VERSION="6668fc2"
PKG_SHA256="d84870e055414d638a3e7eb4b7a3ebf415899841218f24cb3647d06ecf6ddb17"
PKG_URL="https://github.com/codesnake/mkbootimg/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="gcc:host"
PKG_LONGDESC="mkbootimg: Creates kernel boot images for Android"

makeinstall_host() {
	mkdir -p $TARGET_SYSROOT/usr/include
	cp mkbootimg $TOOLCHAIN/bin/
}
