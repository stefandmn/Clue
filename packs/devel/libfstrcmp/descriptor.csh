PKG_NAME="libfstrcmp"
PKG_VERSION="0.7.D001"
PKG_SHA256="e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476"
PKG_URL="https://downloads.sourceforge.net/project/fstrcmp/fstrcmp/0.7/fstrcmp-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The fstrcmp project provides a library that is used to make fuzzy comparisons of strings and byte arrays, including multi-byte character strings."

pre_configure_target() {
	cd "$PKG_BUILD"
}

make_target() {
	make all-bin
}

makeinstall_target() {
	make DESTDIR="$TARGET_SYSROOT" install-include install-libdir
}
