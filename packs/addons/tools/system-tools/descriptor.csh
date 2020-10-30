PKG_NAME="system-tools"
PKG_VERSION="1.0"
PKG_REV="111"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of system tools and programs"
PKG_LONGDESC="This bundle currently includes autossh, diffutils, dstat, dtach, efibootmgr, encfs, evtest, fdupes, file, getscancodes, hddtemp, hd-idle, hid_mapper, htop, i2c-tools, inotify-tools, jq, lm_sensors, lshw, mc, mrxvt, mtpfs, nmon, p7zip, patch, pv, screen, smartmontools, strace, stress-ng, unrar, usb-modeswitch and vim."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="System Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    autossh \
                    diffutils \
                    dstat \
                    dtach \
                    encfs \
                    evtest \
                    fdupes \
                    file \
                    getscancodes \
                    hddtemp \
                    hd-idle \
                    hid_mapper \
                    htop \
                    i2c-tools \
                    inotify-tools \
                    jq \
                    lm_sensors \
                    lshw \
                    mc \
                    mtpfs \
                    nmon \
                    p7zip \
                    patch \
                    pv \
                    screen \
                    smartmontools \
                    strace \
                    stress-ng \
                    unrar \
                    usb-modeswitch \
                    vim"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/lib/
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/data/
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	# autossh
	cp -P $(get_build_dir autossh)/.$TARGET_NAME/autossh ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# diffutils
	cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/cmp ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/diff3 ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir diffutils)/.$TARGET_NAME/src/sdiff ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# dstat
	cp -P $(get_build_dir dstat)/dstat ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# dtach
	cp -P $(get_build_dir dtach)/.$TARGET_NAME/dtach ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# efibootmgr
	cp -P $(get_build_dir efibootmgr)/src/efibootmgr ${BUILDER_ADDON}/$PKG_ADDON_ID/bin 2>/dev/null || :

	# encfs
	cp -P $(get_build_dir encfs)/.$TARGET_NAME/encfs ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir encfs)/.$TARGET_NAME/encfsctl ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# evtest
	cp -P $(get_build_dir evtest)/.$TARGET_NAME/evtest ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# fdupes
	cp -P $(get_build_dir fdupes)/fdupes ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# file
	cp -P $(get_build_dir file)/.$TARGET_NAME/src/file ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir file)/.$TARGET_NAME/magic/magic.mgc ${BUILDER_ADDON}/$PKG_ADDON_ID/data

	# getscancodes
	cp -P $(get_build_dir getscancodes)/getscancodes ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# hddtemp
	cp -P $(get_build_dir hddtemp)/.$TARGET_NAME/src/hddtemp ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir hddtemp)/hddtemp.db ${BUILDER_ADDON}/$PKG_ADDON_ID/data

	# hd-idle
	cp -P $(get_build_dir hd-idle)/hd-idle ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# hid_mapper
	cp -P $(get_build_dir hid_mapper)/hid_mapper ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# htop
	cp -P $(get_build_dir htop)/.install_pkg/usr/bin/htop ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# i2c-tools
	cp -P $(get_build_dir i2c-tools)/tools/i2cdetect ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir i2c-tools)/tools/i2cdump ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir i2c-tools)/tools/i2cget ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir i2c-tools)/tools/i2cset ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir i2c-tools)/py-smbus/build/lib.linux-*/smbus.so ${BUILDER_ADDON}/$PKG_ADDON_ID/lib

	# inotify-tools
	cp -P $(get_build_dir inotify-tools)/.$TARGET_NAME/src/inotifywait ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir inotify-tools)/.$TARGET_NAME/src/inotifywatch ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# jq
	cp -P $(get_build_dir jq)/.$TARGET_NAME/jq ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir oniguruma)/.install_pkg/usr/lib/libonig.so ${BUILDER_ADDON}/$PKG_ADDON_ID/lib

	# lm_sensors
	cp -P $(get_build_dir lm_sensors)/prog/sensors/sensors ${BUILDER_ADDON}/$PKG_ADDON_ID/bin 2>/dev/null || :

	# lshw
	cp -P $(get_build_dir lshw)/src/lshw ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# mc
	cp -Pa $(get_build_dir mc)/.install_pkg/usr/bin/* ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/
	cp -Pa $(get_build_dir mc)/.install_pkg/clue/.kodi/addons/virtual.system-tools/* ${BUILDER_ADDON}/$PKG_ADDON_ID

	# mrxvt
	cp -P $(get_build_dir mrxvt)/.$TARGET_NAME/src/mrxvt ${BUILDER_ADDON}/$PKG_ADDON_ID/bin 2>/dev/null || :

	# mtpfs
	cp -P $(get_build_dir mtpfs)/.$TARGET_NAME/mtpfs ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	# nmon
	cp -P $(get_build_dir nmon)/nmon ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/

	# p7zip
	cp -P $(get_build_dir p7zip)/bin/7z.so ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -PR $(get_build_dir p7zip)/bin/Codecs ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir p7zip)/bin/7z ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir p7zip)/bin/7za ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# patch
	cp -P $(get_build_dir patch)/.$TARGET_NAME/src/patch ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# pv
	cp -P $(get_build_dir pv)/.$TARGET_NAME/pv ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# screen
	cp -P $(get_build_dir screen)/screen ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# smartmontools
	cp -P $(get_build_dir smartmontools)/.$TARGET_NAME/smartctl ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# strace
	cp -P $(get_build_dir strace)/.$TARGET_NAME/strace ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# stress-ng
	cp -P $(get_build_dir stress-ng)/.install_pkg/usr/bin/stress-ng ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# unrar
	cp -P $(get_build_dir unrar)/unrar ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# usb-modeswitch
	cp -P $(get_build_dir usb-modeswitch)/usb_modeswitch ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# vim
	cp -P $(get_build_dir vim)/.install_pkg/usr/bin/vim ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
}
