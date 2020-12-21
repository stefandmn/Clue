PKG_NAME="pyOpenSSL"
PKG_VERSION="20.0.1"
PKG_SHA256="4c231c759543ba02560fcd2480c48dcec4dae34c9da7d3747c508227e0624b51"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host"
PKG_DESCRIPTION="Python wrapper module around the OpenSSL library."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}