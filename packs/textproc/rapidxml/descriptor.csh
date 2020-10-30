PKG_NAME="rapidxml"
PKG_VERSION="1.13"
PKG_SHA256="c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571"
PKG_URL="https://sourceforge.net/projects/rapidxml/files/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A fast XML DOM parser."
PKG_TOOLCHAIN="manual"

post_unpack() {
	mkdir -p $PKG_BUILD/rapidxml
	mv $PKG_BUILD/*.hpp $PKG_BUILD/rapidxml
}
