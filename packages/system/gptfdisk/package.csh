PKG_NAME="gptfdisk"
PKG_VERSION="1.0.4"
PKG_SHA256="b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c7ba78d"
PKG_URL="https://downloads.sourceforge.net/project/$PKG_NAME/$PKG_NAME/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain popt crossguid"
PKG_DESCRIPTION="GPT text-mode partitioning tools"

make_target() {
	make sgdisk "CC=$CC" "CXX=$CXX"
}

makeinstall_target() {
	mkdir -p $INSTALL/usr/sbin/
	cp -p sgdisk $INSTALL/usr/sbin/
}
