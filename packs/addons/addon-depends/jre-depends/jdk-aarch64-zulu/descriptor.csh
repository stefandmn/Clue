PKG_NAME="jdk-aarch64-zulu"
PKG_VERSION="8.38.0.162-1.8.0_212"
PKG_SHA256="2afa6b9a86fea6f9275856506b5cc1efd8420f674c5e2dc3e1b04e140d6ad852"
PKG_URL="http://cdn.azul.com/zulu-embedded/bin/zulu${PKG_VERSION%%-*}-ca-jdk${PKG_VERSION##*-}-linux_aarch64.tar.gz"
PKG_LONGDESC="Zulu, the open Java(TM) platform from Azul Systems."
PKG_TOOLCHAIN="manual"

post_unpack() {
	rm -f $PKG_BUILD/src.zip
}
