PKG_NAME="PySocks"
PKG_VERSION="1.7.1"
PKG_SHA256="3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host"
PKG_DESCRIPTION="A Python SOCKS client module."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}