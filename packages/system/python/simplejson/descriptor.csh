PKG_NAME="simplejson"
PKG_VERSION="3.16.0"
PKG_SHA256="b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_DESCRIPTION="A simple, fast, complete, correct and extensible JSON encoder and decoder for Python 2.5+."
PKG_TOOLCHAIN="manual"

pre_make_target() {
	export PYTHONXCPREFIX="$TARGET_SYSROOT/usr"
}

make_target() {
	python setup.py build --cross-compile
}

makeinstall_target() {
	python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
	find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
	rm -rf $INSTALL/usr/lib/python*/site-packages/*/tests
}
