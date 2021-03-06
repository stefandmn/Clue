PKG_NAME="distutilscross"
PKG_VERSION="0.1"
PKG_SHA256="4ed3fb427708c8a3ed5fe9c599532480f581078a1e0aec0e50f40eb58e9f0015"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python2:host setuptools:host"
PKG_DESCRIPTION="distutilscross enhances distutils to support Cross Compile of Python extensions"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
	exec_thread_safe python setup.py install --prefix=$TOOLCHAIN
}
