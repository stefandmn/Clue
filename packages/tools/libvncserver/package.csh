PKG_NAME="libvncserver"
PKG_VERSION="0.9.11"
PKG_SHA256="193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"
PKG_URL="https://github.com/LibVNC/libvncserver/archive/LibVNCServer-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo libpng openssl systemd"
PKG_DESCRIPTION="A C library that allow you to easily implement VNC server or client functionality."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared \
                           --enable-static \
                           --with-sysroot=$SYSROOT_PREFIX \
                           --with-jpeg \
                           --with-png \
                           --without-sdl \
                           --without-gcrypt \
                           --without-client-gcrypt \
                           --without-gnutls"
