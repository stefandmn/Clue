PKG_NAME="libvpx"
PKG_VERSION="1.8.1"
PKG_SHA256="df19b8f24758e90640e1ab228ab4a4676ec3df19d23e4593375e6f3847dee03e"
PKG_LICENSE="BSD"
PKG_SITE="https://www.webmproject.org"
PKG_URL="https://github.com/webmproject/libvpx/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="WebM VP8/VP9 Codec"

configure_target() {

	PKG_TARGET_NAME_LIBVPX="armv7-linux-gcc"

	$PKG_CONFIGURE_SCRIPT --prefix=/usr \
		--extra-cflags="$CFLAGS" \
		--as=nasm \
		--target=$PKG_TARGET_NAME_LIBVPX \
		--disable-docs \
		--disable-examples \
		--disable-shared \
		--disable-tools \
		--disable-unit-tests \
		--disable-vp8-decoder \
		--disable-vp9-decoder \
		--enable-ccache \
		--enable-pic \
		--enable-static \
		--enable-vp8 \
		--enable-vp9
}
