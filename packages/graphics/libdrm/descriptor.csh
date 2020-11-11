PKG_NAME="libdrm"
PKG_VERSION="2.4.99"
PKG_SHA256="4dbf539c7ed25dbb2055090b77ab87508fc46be39a9379d15fed4b5517e1da5e"
PKG_URL="http://dri.freedesktop.org/libdrm/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libpciaccess"
PKG_DESCRIPTION="The userspace interface library to kernel DRM services."
PKG_TOOLCHAIN="meson"

get_graphicdrivers

PKG_DRM_CONFIG="-Dnouveau=false \
                -Domap=false \
                -Dexynos=false \
                -Dtegra=false"

listcontains "$GRAPHIC_DRIVERS" "vc4" &&
	PKG_DRM_CONFIG+=" -Dvc4=true" || PKG_DRM_CONFIG+=" -Dvc4=false"

PKG_MESON_OPTS_TARGET="-Dlibkms=false \
                       $PKG_DRM_CONFIG \
                       -Dcairo-tests=false \
                       -Dman-pages=false \
                       -Dvalgrind=false \
                       -Dfreedreno-kgsl=false \
                       -Dinstall-test-programs=false \
                       -Dudev=false"

post_makeinstall_target() {
	mkdir -p $INSTALL/usr/bin
	cp -a $PKG_BUILD/.$TARGET_NAME/tests/modetest/modetest $INSTALL/usr/bin/
}
