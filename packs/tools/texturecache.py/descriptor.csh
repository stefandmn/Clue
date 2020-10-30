PKG_NAME="texturecache.py"
PKG_VERSION="2.5.4"
PKG_SHA256="0717c2e62dc3f809e8754be2c83d2c7d0f92188741eb425d5377c1d326d25276"
PKG_URL="https://github.com/MilhouseVH/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="The Swiss Army knife for Kodi"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	mkdir -p $INSTALL/usr/bin
	cp -PRv texturecache.py $INSTALL/usr/bin
	cp -PRv tools/mklocal.py $INSTALL/usr/bin
	chmod +x $INSTALL/usr/bin/*
}
