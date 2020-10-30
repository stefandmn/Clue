PKG_NAME="locale"
PKG_REV="102"
PKG_ARCH="any"
PKG_DEPENDS_TARGET="toolchain glibc"
PKG_SECTION="service"
PKG_SHORTDESC="Locale: allows users to set a custom locale to override the POSIX default"
PKG_LONGDESC="Locale ($PKG_REV) allows users to set a custom locale in the OS to override the POSIX default"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Locale"
PKG_ADDON_TYPE="xbmc.service"

addon() {
	mkdir -p "${BUILDER_ADDON}/$PKG_ADDON_ID/bin"
	cp -PR "$(get_build_dir glibc)/.$TARGET_NAME/locale/localedef" \
		"${BUILDER_ADDON}/$PKG_ADDON_ID/bin"

	mkdir -p "${BUILDER_ADDON}/$PKG_ADDON_ID/i18n"
	cp -PR "$(get_build_dir glibc)/localedata/charmaps" \
		"$(get_build_dir glibc)/localedata/locales" \
		"${BUILDER_ADDON}/$PKG_ADDON_ID/i18n"

	mkdir -p "${BUILDER_ADDON}/$PKG_ADDON_ID/locpath"

	cp -PR $PKG_DIR/resources ${BUILDER_ADDON}/$PKG_ADDON_ID

	locales=""
	for p in "${BUILDER_ADDON}/$PKG_ADDON_ID/i18n/locales"/*; do
		l="$(basename $p)"
		if [ "$l" = "POSIX" ]; then
			continue
		fi
		locales="$locales|$l"
	done
	locales="${locales:1}"

	sed -e "s/@LOCALES@/$locales/" \
		-i ${BUILDER_ADDON}/$PKG_ADDON_ID/resources/settings.xml
}
