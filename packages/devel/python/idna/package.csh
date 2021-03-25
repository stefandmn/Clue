PKG_NAME="idna"
PKG_VERSION="2.10"
PKG_SHA256="b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python2:host setuptools:host"
PKG_DEPENDS_TARGET="toolchain Python2"
PKG_DESCRIPTION="Internationalized Domain Names in Applications (IDNA)"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}