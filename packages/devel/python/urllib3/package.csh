PKG_NAME="urllib3"
PKG_VERSION="1.26.2"
PKG_SHA256="19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host"
PKG_DESCRIPTION="HTTP library with thread-safe connection pooling, file post, and more."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}