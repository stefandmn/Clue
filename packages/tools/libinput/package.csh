PKG_NAME="libinput"
PKG_VERSION="1.10.4"
PKG_SHA256="2330a82f3e4b617a4f9ff0f2bf9cc217b3c4e69d767e61ca59ca07add61f68ac"
PKG_URL="http://www.freedesktop.org/software/libinput/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain systemd libevdev mtdev"
PKG_DESCRIPTION="libinput is a library to handle input devices in Wayland compositors and to provide a generic X.Org input driver."
PKG_TOOLCHAIN="meson"

PKG_MESON_OPTS_TARGET="-Dlibwacom=false \
                       -Ddebug-gui=false \
                       -Dtests=false \
                       -Ddocumentation=false"
