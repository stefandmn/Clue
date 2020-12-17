PKG_NAME="setuptools"
PKG_VERSION="39.2.0"
PKG_SHA256="ca8119dd5c2764a7d290518817de0b880d23d790913fcd797c02ad2aa39b8c41"
PKG_URL="https://github.com/pypa/setuptools/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python2:host Python3:host"
PKG_DEPENDS_TARGET="toolchain Python2"
PKG_DESCRIPTION="Replaces Setuptools as the standard method for working with Python module distributions."
PKG_TOOLCHAIN="manual"

make_host() {
	python2 bootstrap.py
	python3 bootstrap.py
}

makeinstall_host() {
	exec_thread_safe python2 setup.py install --prefix=$TOOLCHAIN
	exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
	exec_thread_safe python2 setup.py install --root=$INSTALL --prefix=/usr
}
