PKG_NAME="mesa"
PKG_VERSION="19.1.7"
PKG_SHA256="97c9f6a6127bee5ab21c3fe63ff3e0bd73a7966415f92f66500b0b276b7150da"
PKG_URL="https://github.com/mesa3d/mesa/archive/mesa-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain expat libdrm Mako:host"
PKG_LONGDESC="Mesa is a 3-D graphics library with an API."
PKG_TOOLCHAIN="meson"
PKG_BUILD_FLAGS="+lto"

get_graphicdrivers

PKG_MESON_OPTS_TARGET="-Ddri-drivers=${DRI_DRIVERS// /,} \
                       -Dgallium-drivers=${GALLIUM_DRIVERS// /,} \
                       -Dgallium-extra-hud=false \
                       -Dgallium-xvmc=false \
                       -Dgallium-omx=disabled \
                       -Dgallium-nine=false \
                       -Dgallium-opencl=disabled \
                       -Dvulkan-drivers= \
                       -Dshader-cache=true \
                       -Dshared-glapi=true \
                       -Dopengl=true \
                       -Dgbm=true \
                       -Degl=true \
                       -Dglvnd=false \
                       -Dasm=true \
                       -Dvalgrind=false \
                       -Dlibunwind=false \
                       -Dlmsensors=false \
                       -Dbuild-tests=false \
                       -Dselinux=false \
                       -Dosmesa=none"

PKG_MESON_OPTS_TARGET+=" -Dplatforms=drm -Ddri3=false -Dglx=disabled"

if [ "$LLVM_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET elfutils llvm"
	export LLVM_CONFIG="$TARGET_SYSROOT/usr/bin/llvm-config-host"
	PKG_MESON_OPTS_TARGET+=" -Dllvm=true"
else
	PKG_MESON_OPTS_TARGET+=" -Dllvm=false"
fi

PKG_MESON_OPTS_TARGET+=" -Dgallium-vdpau=false"
PKG_MESON_OPTS_TARGET+=" -Dgallium-va=false"
PKG_MESON_OPTS_TARGET+=" -Dgallium-xa=false"

if [ "$OPENGLES_SUPPORT" = "yes" ]; then
	PKG_MESON_OPTS_TARGET+=" -Dgles1=false -Dgles2=true"
else
	PKG_MESON_OPTS_TARGET+=" -Dgles1=false -Dgles2=false"
fi
