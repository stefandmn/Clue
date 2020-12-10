PKG_NAME="plymouth-lite"
PKG_VERSION="0.6.0"
PKG_SHA256="fa7b581bdd38c5751668243ff9d2ebaee7c45753358cbb310fb50cfcd3a8081b"
PKG_URL="${DISTRO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_INIT="toolchain gcc:init libpng"
PKG_DESCRIPTION="Boot splash screen based on Fedora's Plymouth code"

if [ "$UVESAFB_SUPPORT" = yes ]; then
	PKG_DEPENDS_INIT="$PKG_DEPENDS_INIT v86d:init"
fi

pre_configure_init() {
	# plymouth-lite don't support to build in sub-dirs
	cd $PKG_BUILD
	rm -rf .$TARGET_NAME-init
}

makeinstall_init() {
	mkdir -p $INSTALL/usr/bin
	cp ply-image $INSTALL/usr/bin

	mkdir -p $INSTALL/usr/share/plymouth
	find_file_path splash/splash.conf && cp ${FOUND_PATH} $INSTALL/usr/share/plymouth
	find_file_path "splash/splash*.png" && cp ${FOUND_PATH} $INSTALL/usr/share/plymouth
}
