PKG_NAME="espeak"
PKG_VERSION="1.48.04-source"
PKG_SHA256="bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
PKG_URL="http://sourceforge.net/projects/espeak/files/espeak/espeak-1.48/$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="Text to Speech engine for English, with support for other languages"
PKG_TOOLCHAIN="manual"

pre_make_target() {
	cp src/portaudio19.h src/portaudio.h
}

make_target() {
	make -C src \
		CXXFLAGS="$CXXFLAGS" \
		LDFLAGS="$LDFLAGS" \
		AUDIO=""
}

makeinstall_target() {
	make -C src \
		CXXFLAGS="$CXXFLAGS" \
		LDFLAGS="$LDFLAGS" \
		AUDIO="" \
		DESTDIR=$INSTALL install
}
