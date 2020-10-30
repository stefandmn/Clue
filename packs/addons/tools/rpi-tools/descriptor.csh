PKG_NAME="rpi-tools"
PKG_VERSION="1.0"
PKG_REV="107"
PKG_ARCH="arm"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain RPi.GPIO picamera gpiozero colorzero lan951x-led-ctl"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of tools and programs for use on the Raspberry Pi"
PKG_LONGDESC="This bundle currently includes RPi.GPIO, picamera, gpiozero lan951x-led-ctl"
PKG_DISCAIMER="Raspberry Pi is a trademark of the Raspberry Pi Foundation http://www.raspberrypi.org"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Raspberry Pi Tools"
PKG_ADDON_TYPE="xbmc.python.module"
PKG_ADDON_DEVICES="RPi"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/RPi/
	cp -PR $(get_build_dir RPi.GPIO)/build/lib.linux-*/RPi/* ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/RPi
	cp -PR $(get_build_dir picamera)/picamera ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/
	cp -PR $(get_build_dir gpiozero)/gpiozero ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/
	cp -PR $(get_build_dir colorzero)/colorzero ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/

	BCM2835_DIR="$(get_build_dir bcm2835-driver)"
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	cp -P $BCM2835_DIR/hardfp/opt/vc/bin/raspistill ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $BCM2835_DIR/hardfp/opt/vc/bin/raspiyuv ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $BCM2835_DIR/hardfp/opt/vc/bin/raspivid ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $BCM2835_DIR/hardfp/opt/vc/bin/raspividyuv ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# lan951x-led-ctl
	cp -P $(get_build_dir lan951x-led-ctl)/lan951x-led-ctl ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
}
