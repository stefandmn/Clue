PKG_NAME="tsdecrypt"
PKG_VERSION="10.0"
PKG_SHA256="a337a7d60cc8f78b9dffbd7d675390497763bcb8f878ec9f1bec3eb80f32b1f1"
PKG_URL="http://georgi.unixsol.org/programs/tsdecrypt/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libdvbcsa openssl"
PKG_LONGDESC="A tool that reads incoming mpeg transport stream over UDP/RTP and then decrypts it using libdvbcsa/ffdecsa."

make_target() {
	make CC=$CC LINK="$LD -o"
}

post_make_target() {
	make strip STRIP=$STRIP
}

makeinstall_target() {
	: # nop
}