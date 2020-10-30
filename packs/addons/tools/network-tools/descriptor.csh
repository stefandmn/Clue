PKG_NAME="network-tools"
PKG_VERSION="1.0"
PKG_REV="104"
PKG_ARCH="any"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="A bundle of network tools and programs"
PKG_LONGDESC="This bundle currently includes bwm-ng, iftop, iperf, irssi, lftp, ncftp, ngrep, nmap, rar2fs, rsync, sshfs, tcpdump, udpxy and wireless_tools."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Network Tools"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_DEPENDS_TARGET="toolchain \
                    bwm-ng \
                    iftop \
                    iperf \
                    irssi \
                    lftp \
                    ncftp \
                    ngrep \
                    nmap \
                    rar2fs \
                    rsync \
                    sshfs \
                    tcpdump \
                    udpxy \
                    wireless_tools"

addon() {
	mkdir -p ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	# bwm-ng
	cp -P $(get_build_dir bwm-ng)/.$TARGET_NAME/src/bwm-ng ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# iftop
	cp -P $(get_build_dir iftop)/.$TARGET_NAME/iftop ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# iperf
	cp -P $(get_build_dir iperf)/.$TARGET_NAME/src/iperf3 ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	ln -s iperf3 ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/iperf

	# irssi
	cp -P $(get_build_dir irssi)/.$TARGET_NAME/src/fe-text/irssi ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# lftp
	cp -P $(get_build_dir lftp)/.$TARGET_NAME/src/lftp ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# ncftp
	cp -P $(get_build_dir ncftp)/.$TARGET_NAME/bin/ncftp ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir ncftp)/.$TARGET_NAME/bin/ncftpbatch ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir ncftp)/.$TARGET_NAME/bin/ncftpget ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir ncftp)/.$TARGET_NAME/bin/ncftpls ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir ncftp)/.$TARGET_NAME/bin/ncftpput ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# ngrep
	cp -P $(get_build_dir ngrep)/.$TARGET_NAME/ngrep ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# nmap
	cp -P $(get_build_dir nmap)/nmap ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# rar2fs
	cp -P $(get_build_dir rar2fs)/.$TARGET_NAME/mkr2i ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	cp -P $(get_build_dir rar2fs)/.$TARGET_NAME/rar2fs ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# rsync
	cp -P $(get_build_dir rsync)/.$TARGET_NAME/rsync ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# sshfs
	cp -P $(get_build_dir sshfs)/.$TARGET_NAME/sshfs ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# tcpdump
	cp -P $(get_build_dir tcpdump)/.$TARGET_NAME/tcpdump ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# udpxy
	cp -P $(get_build_dir udpxy)/udpxy ${BUILDER_ADDON}/$PKG_ADDON_ID/bin

	# wireless_tools
	cp -P $(get_build_dir wireless_tools)/iwmulticall ${BUILDER_ADDON}/$PKG_ADDON_ID/bin
	ln -s iwmulticall ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/iwconfig
	ln -s iwmulticall ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/iwgetid
	ln -s iwmulticall ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/iwlist
	ln -s iwmulticall ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/iwspy
	ln -s iwmulticall ${BUILDER_ADDON}/$PKG_ADDON_ID/bin/iwpriv
}
