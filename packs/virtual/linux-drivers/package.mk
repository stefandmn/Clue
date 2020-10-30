PKG_NAME="linux-drivers"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $ADDITIONAL_DRIVERS"
PKG_SECTION="virtual"
PKG_LONGDESC="linux-drivers is a Meta package to install additional drivers"

if [ "$DRIVER_ADDONS_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $DRIVER_ADDONS driverselect"
fi
