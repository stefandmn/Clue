PKG_NAME="certifi"
PKG_VERSION="2020.11.8"
PKG_SHA256="f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host"
PKG_DESCRIPTION="Python package for providing Mozilla's CA Bundle."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}