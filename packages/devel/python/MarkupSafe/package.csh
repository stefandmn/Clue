PKG_NAME="MarkupSafe"
PKG_VERSION="1.0"
PKG_SHA256="a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host setuptools:host"
PKG_DESCRIPTION="MarkupSafe implements a XML/HTML/XHTML Markup safe string for Python"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
	exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}
