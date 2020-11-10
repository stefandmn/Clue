PKG_NAME="libftdi1"
PKG_VERSION="1.4"
PKG_SHA256="ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74"
PKG_URL="http://www.intra2net.com/en/developer/libftdi/download/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libusb"
PKG_LONGDESC="libFTDI is an open source library to talk to FTDI chips"
PKG_BUILD_FLAGS="+pic"

PKG_CMAKE_OPTS_TARGET="-DSTATICLIBS=ON \
                       -DDOCUMENTATION=FALSE \
                       -DEXAMPLES=FALSE \
                       -DFTDIPP=FALSE \
                       -DPYTHON_BINDINGS=FALSE"

makeinstall_target() {
	mkdir -p $TARGET_SYSROOT/usr/include/libftdi1
	cp ../src/ftdi.h $TARGET_SYSROOT/usr/include/libftdi1

	mkdir -p $TARGET_SYSROOT/usr/lib
	cp src/libftdi1.a $TARGET_SYSROOT/usr/lib

	mkdir -p $TARGET_SYSROOT/usr/lib/pkgconfig
	cp libftdi1.pc $TARGET_SYSROOT/usr/lib/pkgconfig
}
