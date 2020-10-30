PKG_NAME="SDL2"
PKG_VERSION="2.0.9"
PKG_SHA256="255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libsdl.org/"
PKG_URL="https://www.libsdl.org/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib systemd dbus"
PKG_LONGDESC="A cross-platform multimedia library designed to provide fast access to the graphics framebuffer and audio device. "
PKG_BUILD_FLAGS="+pic"

PKG_SDL2_X86ASM="-DASSEMBLY=OFF"

PKG_CMAKE_OPTS_TARGET="-DSDL_STATIC=ON \
                       -DSDL_SHARED=OFF \
                       -DLIBC=ON \
                       -DGCC_ATOMICS=ON \
                       $PKG_SDL2_X86ASM \
                       -DALTIVEC=OFF \
                       -DOSS=OFF \
                       -DALSA=ON \
                       -DALSA_SHARED=ON \
                       -DESD=OFF \
                       -DESD_SHARED=OFF \
                       -DARTS=OFF \
                       -DARTS_SHARED=OFF \
                       -DNAS=OFF \
                       -DNAS_SHARED=ON \
                       -DSNDIO=OFF \
                       -DDISKAUDIO=OFF \
                       -DDUMMYAUDIO=OFF \
                       -DVIDEO_WAYLAND=OFF \
                       -DVIDEO_WAYLAND_QT_TOUCH=ON \
                       -DWAYLAND_SHARED=OFF \
                       -DVIDEO_MIR=OFF \
                       -DMIR_SHARED=OFF \
                       -DVIDEO_COCOA=OFF \
                       -DVIDEO_DIRECTFB=OFF \
                       -DDIRECTFB_SHARED=OFF \
                       -DFUSIONSOUND=OFF \
                       -DFUSIONSOUND_SHARED=OFF \
                       -DVIDEO_DUMMY=OFF \
                       -DINPUT_TSLIB=OFF \
                       -DPTHREADS=ON \
                       -DPTHREADS_SEM=ON \
                       -DDIRECTX=OFF \
                       -DSDL_DLOPEN=ON \
                       -DCLOCK_GETTIME=OFF \
                       -DRPATH=OFF \
                       -DRENDER_D3D=OFF"

PKG_CMAKE_OPTS_TARGET="$PKG_CMAKE_OPTS_TARGET \
                         -DVIDEO_X11=OFF"

if [ ! "$OPENGL" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL"

  PKG_CMAKE_OPTS_TARGET="$PKG_CMAKE_OPTS_TARGET \
                         -DVIDEO_OPENGL=ON \
                         -DVIDEO_OPENGLES=OFF"
else
  PKG_CMAKE_OPTS_TARGET="$PKG_CMAKE_OPTS_TARGET \
                         -DVIDEO_OPENGL=OFF \
                         -DVIDEO_OPENGLES=ON"
fi

if [ "$PULSEAUDIO_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pulseaudio"

  PKG_CMAKE_OPTS_TARGET="$PKG_CMAKE_OPTS_TARGET \
                         -DPULSEAUDIO=ON \
                         -DPULSEAUDIO_SHARED=ON"
else
  PKG_CMAKE_OPTS_TARGET="$PKG_CMAKE_OPTS_TARGET \
                         -DPULSEAUDIO=OFF \
                         -DPULSEAUDIO_SHARED=OFF"
fi

post_makeinstall_target() {
  sed -e "s:\(['=\" ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" -i $SYSROOT_PREFIX/usr/bin/sdl2-config

  rm -rf $INSTALL/usr/bin
}
