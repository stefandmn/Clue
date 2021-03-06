PKG_NAME="Pillow"
PKG_VERSION="6.0.0"
PKG_SHA256="809c0a2ce9032cbcd7b5313f71af4bdc5c8c771cb86eb7559afd954cab82ebb5"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host zlib freetype libjpeg-turbo tiff"
PKG_DESCRIPTION="The Python Imaging Library adds image processing capabilities to your Python interpreter."
PKG_TOOLCHAIN="manual"

pre_make_target() {
	export PYTHONXCPREFIX="$TARGET_SYSROOT/usr"
	export LDSHARED="$CC -shared"
}

make_target() {
	python setup.py build --cross-compile
}

makeinstall_target() {
	python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
	find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"

	rm -rf $INSTALL/usr/bin
}
