PKG_NAME="chardet"
PKG_VERSION="4.0.0"
PKG_SHA256="0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host"
PKG_DESCRIPTION="The Universal Character Encoding Detector."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}