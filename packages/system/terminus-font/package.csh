PKG_NAME="terminus-font"
PKG_VERSION="4.48"
PKG_SHA256="34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af"
PKG_LICENSE="OFL1_1"
PKG_URL="https://downloads.sourceforge.net/project/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_INIT="toolchain Python3:host"
PKG_DESCRIPTION="This package contains the Terminus Font"
PKG_TOOLCHAIN="manual"

pre_configure_init() {
	cd $PKG_BUILD
	rm -rf .${TARGET_NAME}-${TARGET}
}

configure_init() {
	./configure INT=${TOOLCHAIN}/bin/python3
}

make_init() {
	make ter-v32b.psf
}

makeinstall_init() {
	mkdir -p ${INSTALL}/usr/share/consolefonts
	cp ter-v32b.psf ${INSTALL}/usr/share/consolefonts
}
