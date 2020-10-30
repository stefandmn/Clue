PKG_NAME="RPi.GPIO"
PKG_VERSION="0.7.0"
PKG_SHA256="7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f"
PKG_ARCH="arm"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_LONGDESC="A module to control Raspberry Pi GPIO channels."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
	export PYTHONXCPREFIX="$TARGET_SYSROOT/usr"
	export LDSHARED="$CC -shared"
	export CPPFLAGS="$TARGET_CPPFLAGS -I${TARGET_SYSROOT}/usr/include/$PKG_PYTHON_VERSION"
}

make_target() {
	python setup.py build
}