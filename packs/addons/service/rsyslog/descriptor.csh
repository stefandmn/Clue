PKG_NAME="rsyslog"
PKG_VERSION="8.37.0"
PKG_SHA256="295c289b4c8abd8f8f3fe35a83249b739cedabe82721702b910255f9faf147e7"
PKG_REV="104"
PKG_ARCH="any"
PKG_URL="http://www.rsyslog.com/files/download/rsyslog/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl libestr libfastjson libgcrypt liblogging liblognorm librelp util-linux zlib"
PKG_SECTION="service"
PKG_SHORTDESC="Rsyslog: a rocket-fast system for log processing."
PKG_LONGDESC="Rsyslog ($PKG_VERSION) offers high-performance, great security features and a modular design."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Rsyslog"
PKG_ADDON_TYPE="xbmc.service"

PKG_CONFIGURE_OPTS_TARGET="--disable-default-tests \
                           --enable-imfile \
                           --enable-imjournal \
                           --enable-relp \
                           --enable-omjournal \
                           ac_cv_func_malloc_0_nonnull=yes \
                           ac_cv_func_realloc_0_nonnull=yes"

export LIBGCRYPT_CONFIG="$TARGET_SYSROOT/usr/bin/libgcrypt-config"

makeinstall_target() {
	:
}

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp $PKG_BUILD/.$TARGET_NAME/tools/rsyslogd \
		${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/rsyslog
	for l in $(find $PKG_BUILD/.$TARGET_NAME -name *.so); do
		cp $l ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/rsyslog/
	done
}