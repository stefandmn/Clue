PKG_NAME="requests"
PKG_VERSION="2.25.0"
PKG_SHA256="7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host chardet idna urllib3 certifi"
PKG_DESCRIPTION="Requests is a simple, yet elegant HTTP library."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}