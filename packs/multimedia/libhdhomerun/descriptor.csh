PKG_NAME="libhdhomerun"
PKG_VERSION="b0e5d5f5c8e2bf37dea34beb014e08ebb598ebf6" #20190625
PKG_SHA256="ac39e03090c148678e1a8d4f928a728caccd2d29a0555287e7e5ece28c876959"
PKG_URL="https://github.com/Silicondust/libhdhomerun/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The library provides functionality to setup the HDHomeRun."

PKG_MAKE_OPTS_TARGET="CROSS_COMPILE=$TARGET_PREFIX"

makeinstall_target() {
	mkdir -p $INSTALL/usr/bin
	cp -PR hdhomerun_config $INSTALL/usr/bin

	mkdir -p $INSTALL/usr/lib/
	cp -PR libhdhomerun.so $INSTALL/usr/lib/

	mkdir -p $TARGET_SYSROOT/usr/include/hdhomerun
	cp *.h $TARGET_SYSROOT/usr/include/hdhomerun

	mkdir -p $TARGET_SYSROOT/usr/lib
	cp libhdhomerun.so $TARGET_SYSROOT/usr/lib
}
