PKG_NAME="dbus"
PKG_VERSION="1.13.10"
PKG_SHA256="a11239e504b99adfa9ded0bbdb2f752fd51f1afc768d78a7e5642282622855f2"
PKG_URL="https://dbus.freedesktop.org/releases/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain expat systemd"
PKG_DESCRIPTION="D-Bus is a message bus, used for sending messages between applications."
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="export ac_cv_have_abstract_sockets=yes \
                           --with-sysroot=$TARGET_SYSROOT \
                           --libexecdir=/usr/lib/dbus \
                           --disable-verbose-mode \
                           --disable-asserts \
                           --enable-checks \
                           --disable-tests \
                           --disable-ansi \
                           --disable-xml-docs \
                           --disable-doxygen-docs \
                           --disable-x11-autolaunch \
                           --disable-selinux \
                           --disable-libaudit \
                           --enable-systemd \
                           --enable-inotify \
                           --without-valgrind \
                           --without-x \
                           --with-dbus-user=dbus \
                           --runstatedir=/run \
                           --with-system-socket=/run/dbus/system_bus_socket"

post_makeinstall_target() {
	rm -rf $INSTALL/etc/rc.d
	rm -rf $INSTALL/usr/lib/dbus-1.0/include
}

post_install() {
	add_user dbus x 81 81 "System message bus" "/" "/bin/sh"
	add_group dbus 81
	add_group netdev 497

	echo "chmod 4750 $INSTALL/usr/lib/dbus/dbus-daemon-launch-helper" >>$FAKEROOT_SCRIPT
	echo "chown 0:81 $INSTALL/usr/lib/dbus/dbus-daemon-launch-helper" >>$FAKEROOT_SCRIPT
}
