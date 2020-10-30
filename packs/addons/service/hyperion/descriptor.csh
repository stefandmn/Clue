PKG_NAME="hyperion"
PKG_VERSION="fb413cd7e8825ffc26925013f57ac93a774f12bc"
PKG_SHA256="fafa4eeddacb15a8fd96b0e69fac400faa735c6e1ccd78673c9d96b0ac84d7a3"
PKG_VERSION_DATE="2019-08-19"
PKG_REV="112"
PKG_ARCH="any"
PKG_URL="https://github.com/hyperion-project/hyperion/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 libusb qtbase protobuf rpi_ws281x"
PKG_DEPENDS_UNPACK="rpi_ws281x"
PKG_SECTION="service"
PKG_SHORTDESC="Hyperion: an AmbiLight controller"
PKG_LONGDESC="Hyperion($PKG_VERSION_DATE) is an modern opensource AmbiLight implementation."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Hyperion"
PKG_ADDON_TYPE="xbmc.service"

PKG_DISPMANX_SUPPORT="-DENABLE_DISPMANX=OFF"
PKG_FB_SUPPORT="-DENABLE_FB=ON"
PKG_X11_SUPPORT="-DENABLE_X11=OFF"

PKG_DEPENDS_TARGET+=" bcm2835-driver"
PKG_DISPMANX_SUPPORT="-DENABLE_DISPMANX=ON"
PKG_FB_SUPPORT="-DENABLE_FB=OFF"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_NO_SYSTEM_FROM_IMPORTED=ON \
                       -DHYPERION_VERSION_ID="$PKG_VERSION" \
                       -DENABLE_AMLOGIC=OFF \
                       $PKG_DISPMANX_SUPPORT \
                       $PKG_FB_SUPPORT \
                       -DENABLE_OSX=OFF \
                       -DUSE_SYSTEM_PROTO_LIBS=ON \
                       -DENABLE_SPIDEV=ON \
                       -DENABLE_TINKERFORGE=OFF \
                       -DENABLE_V4L2=ON \
                       -DENABLE_WS2812BPWM=OFF \
                       -DENABLE_WS281XPWM=ON \
                       $PKG_X11_SUPPORT \
                       -DENABLE_QT5=ON \
                       -DENABLE_TESTS=OFF \
                       -Wno-dev"

pre_build_target() {
	cp -a $(get_build_dir rpi_ws281x)/* $PKG_BUILD/dependencies/external/rpi_ws281x
}

pre_configure_target() {
	echo "" >../cmake/FindGitVersion.cmake
}

makeinstall_target() {
	: # nothing to do here
}

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp $PKG_BUILD/.$TARGET_NAME/bin/* ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	cp -PR $PKG_BUILD/assets/webconfig ${BUILDER_ADDON}/$PKG_ADDON_ID
	cp -PR $PKG_BUILD/effects ${BUILDER_ADDON}/$PKG_ADDON_ID
}