PKG_NAME="lirc"
PKG_VERSION="0.10.1"
PKG_SHA256="8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2"
PKG_URL="https://sourceforge.net/projects/lirc/files/LIRC/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libftdi1 libusb-compat libxslt alsa-lib"
PKG_DESCRIPTION="LIRC is a package that allows you to decode and send infra-red signals."
PKG_TOOLCHAIN="autotools"

PKG_PYTHON_WANTED=Python2

PKG_CONFIGURE_OPTS_TARGET="--enable-devinput \
                           --enable-uinput \
                           --with-gnu-ld \
                           --without-x \
                           --runstatedir=/run"

pre_configure_target() {
	export HAVE_WORKING_POLL=yes
	export HAVE_UINPUT=yes
	export PYTHON=:
	export PYTHON_VERSION=${PKG_PYTHON_VERSION#python}
	if [ -e ${TARGET_SYSROOT}/usr/include/linux/input-event-codes.h ]; then
		export DEVINPUT_HEADER=${TARGET_SYSROOT}/usr/include/linux/input-event-codes.h
	else
		export DEVINPUT_HEADER=${TARGET_SYSROOT}/usr/include/linux/input.h
	fi
}

post_makeinstall_target() {
	rm -rf $INSTALL/usr/lib/systemd
	rm -rf $INSTALL/lib
	rm -rf $INSTALL/usr/share
	rm -rf $INSTALL/etc

	mkdir -p $INSTALL/etc/lirc
	cp -r $PKG_DIR/config/lirc_options.conf $INSTALL/etc/lirc
	ln -s /home/.config/lircd.conf $INSTALL/etc/lirc/lircd.conf

	mkdir -p $INSTALL/usr/lib/clue
	cp $PKG_DIR/scripts/lircd_helper $INSTALL/usr/lib/clue
	cp $PKG_DIR/scripts/lircd_uinput_helper $INSTALL/usr/lib/clue

	mkdir -p $INSTALL/usr/share/services
	cp -P $PKG_DIR/default.d/*.conf $INSTALL/usr/share/services
}

post_install() {
	enable_service lircd.socket
	enable_service lircd.service
	enable_service lircd-uinput.service
}
