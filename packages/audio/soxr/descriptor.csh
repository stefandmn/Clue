PKG_NAME="soxr"
PKG_VERSION="0.1.3"
PKG_SHA256="b111c15fdc8c029989330ff559184198c161100a59312f5dc19ddeb9b5a15889"
PKG_URL="$SOURCEFORGE_SRC/soxr/soxr-$PKG_VERSION-Source.tar.xz"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_DESCRIPTION="The SoX Resampler library performs one-dimensional sample-rate conversion. It may be used to resample PCM-encoded audio."
PKG_BUILD_FLAGS="+pic"

PKG_CMAKE_OPTS_TARGET="-DBUILD_EXAMPLES=OFF \
                       -DBUILD_SHARED_LIBS=OFF \
                       -DBUILD_TESTS=OFF \
                       -DWITH_AVFFT=OFF"

if target_has_feature neon; then
	PKG_CMAKE_OPTS_TARGET+=" -DWITH_CR32=OFF"
else
	PKG_CMAKE_OPTS_TARGET+=" -DWITH_CR32S=OFF"
fi
