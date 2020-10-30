PKG_NAME="fdupes"
PKG_VERSION="1.6.1"
PKG_SHA256="9d6b6fdb0b8419815b4df3bdfd0aebc135b8276c90bbbe78ebe6af0b88ba49ea"
PKG_URL="https://github.com/adrianlopezroche/fdupes/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A program for identifying or deleting duplicate files residing within specified directories."

makeinstall_target() {
	: # nop
}
