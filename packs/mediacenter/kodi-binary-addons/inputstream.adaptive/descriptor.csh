PKG_NAME="inputstream.adaptive"
PKG_VERSION="2.4.5-Leia"
PKG_SHA256="14389878598f34c9eb931ee9c7b431ddd4ee19df7368fc718c34b8bf4b56b0a1"
PKG_REV="1"
PKG_ARCH="any"
PKG_URL="https://github.com/peak3d/inputstream.adaptive/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION=""
PKG_SHORTDESC="inputstream.adaptive"
PKG_LONGDESC="inputstream.adaptive"

PKG_IS_ADDON="yes"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nss"

addon() {
	install_binary_addon $PKG_ADDON_ID

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID
	cp -P $PKG_BUILD/.$TARGET_NAME/wvdecrypter/libssd_wv.so ${BUILDER_ADDON}/$PKG_ADDON_ID
}