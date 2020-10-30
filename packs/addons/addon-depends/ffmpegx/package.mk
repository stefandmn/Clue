PKG_NAME="ffmpegx"
PKG_VERSION="4.2.1"
PKG_SHA256="cec7c87e9b60d174509e263ac4011b522385fd0775292e1670ecc1180c9bb6d4"
PKG_LICENSE="LGPLv2.1+"
PKG_SITE="https://ffmpeg.org"
PKG_URL="https://ffmpeg.org/releases/ffmpeg-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain aom bzip2 gnutls libvorbis opus x264 zlib"
PKG_LONGDESC="FFmpegx is an complete FFmpeg build to support encoding and decoding."
PKG_BUILD_FLAGS="-gold"

# Dependencies
get_graphicdrivers

if [ "$KODIPLAYER_DRIVER" == "bcm2835-driver" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bcm2835-driver"
fi

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libvpx"

pre_configure_target() {
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME

  # pass gnutls to build
  PKG_CONFIG_PATH="$(get_build_dir gnutls)/.INSTALL_PKG/usr/lib/pkgconfig"
  CFLAGS="$CFLAGS -I$(get_build_dir gnutls)/.INSTALL_PKG/usr/include"
  LDFLAGS="$LDFLAGS -L$(get_build_dir gnutls)/.INSTALL_PKG/usr/lib"

  if [ "$KODIPLAYER_DRIVER" == "bcm2835-driver" ]; then
    CFLAGS="$CFLAGS -DRPI=1 -I$SYSROOT_PREFIX/usr/include/IL"
    PKG_FFMPEG_LIBS="-lbcm_host -ldl -lmmal -lmmal_core -lmmal_util -lvchiq_arm -lvcos -lvcsm"
  fi

# HW encoders

  # RPi 0-3
  if [ "$KODIPLAYER_DRIVER" == "bcm2835-driver" ]; then
    PKG_FFMPEG_HW_ENCODERS_RPi="\
    `#Video encoders` \
    --enable-omx-rpi \
    --enable-mmal \
    --enable-encoder=h264_omx \
    \
    `#Video hwaccel` \
    --enable-hwaccel=h264_mmal \
    --enable-hwaccel=mpeg2_mmal \
    --enable-hwaccel=mpeg4_mmal \
    --enable-hwaccel=vc1_mmal"
  fi

# Encoders
    PKG_FFMPEG_ENCODERS="\
    `#Video encoders` \
    --enable-libvpx \
    --enable-encoder=libvpx_vp8 \
    --enable-encoder=libvpx_vp9 \
    --enable-libx264 \
    --enable-encoder=x264 \
    --enable-libx265 \
    --enable-encoder=x265 \
    --enable-libaom \
    --enable-encoder=libaom_av1 \
    \
    `#Audio encoders` \
    --enable-encoder=aac \
    --enable-encoder=ac3 \
    --enable-encoder=eac3 \
    --enable-encoder=flac \
    --enable-libmp3lame \
    --enable-encoder=libmp3lame \
    --enable-libopus \
    --enable-encoder=libopus \
    --enable-libvorbis \
    --enable-encoder=libvorbis"
}

configure_target() {
  ./configure \
    \
    `#Programs to build` \
    --enable-ffmpeg \
    --disable-ffplay \
    --enable-ffprobe \
    \
    `#Static and Shared` \
    --enable-static \
    --disable-shared \
    \
    `#Licensing options` \
    --enable-gpl \
    \
    `#Documentation options` \
    --disable-doc \
    \
    `#Hardware accelerated decoding encoding` \
    $PKG_FFMPEG_HW_ENCODERS_RPi \
    $PKG_FFMPEG_HW_ENCODERS_GENERIC \
    \
    `#General options` \
    --enable-avresample \
    --disable-lzma \
    --disable-alsa \
    $PKG_FFMPEG_X11_GRAB \
    \
    `#Toolchain options` \
    --arch="$TARGET_ARCH" \
    --cpu="$TARGET_CPU" \
    --cross-prefix="$TARGET_PREFIX" \
    --enable-cross-compile \
    --sysroot="$SYSROOT_PREFIX" \
    --sysinclude="$SYSROOT_PREFIX/usr/include" \
    --target-os="linux" \
    --nm="$NM" \
    --ar="$AR" \
    --as="$CC" \
    --cc="$CC" \
    --ld="$CC" \
    --pkg-config="$TOOLCHAIN/bin/pkg-config" \
    --host-cc="$HOST_CC" \
    --host-cflags="$HOST_CFLAGS" \
    --host-ldflags="$HOST_LDFLAGS" \
    --host-extralibs="-lm" \
    --extra-cflags="$CFLAGS" \
    --extra-ldflags="$LDFLAGS" \
    --extra-libs="$PKG_FFMPEG_LIBS" \
    --enable-pic \
    --enable-gnutls \
    --disable-openssl \
    \
    `#Advanced options` \
    --disable-hardcoded-tables \

}

makeinstall_target() {
  make install DESTDIR="$INSTALL/../.INSTALL_PKG"
}
