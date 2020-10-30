PKG_NAME="sshfs"
PKG_VERSION="2.10"
PKG_SHA256="70845dde2d70606aa207db5edfe878e266f9c193f1956dd10ba1b7e9a3c8d101"
PKG_URL="https://github.com/libfuse/sshfs/releases/download/sshfs-$PKG_VERSION/sshfs-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain fuse glib"
PKG_LONGDESC="A filesystem client based on the SSH File Transfer Protocol."

makeinstall_target() {
	:
}