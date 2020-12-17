PKG_NAME="certifi"
PKG_VERSION="2020.12.5"
PKG_SHA256="1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 setuptools:host"
PKG_DESCRIPTION="Python package for providing Mozilla's CA Bundle."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}