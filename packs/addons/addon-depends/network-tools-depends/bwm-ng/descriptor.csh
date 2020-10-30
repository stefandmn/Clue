PKG_NAME="bwm-ng"
PKG_VERSION="0.6.1"
PKG_SHA256="613e8072b0efc2f5f790143192bca45c3c80b7ad09bff384de9bbaa57aa499b8"
PKG_URL="https://github.com/vgropp/bwm-ng/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain ncurses libstatgrab"
PKG_LONGDESC="A small and simple console-based live network and disk io bandwidth monitor."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-libstatgrab \
                           --with-time \
                           --with-getifaddrs \
                           --with-sysctl \
                           --with-sysctldisk \
                           --with-procnetdev \
                           --with-partitions"

makeinstall_target() {
	: # nop
}
