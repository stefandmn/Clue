#!/bin/sh

. /etc/profile

SUNDTEK_ADDON_DIR="$HOME/.kodi/addons/driver.dvb.sundtek-mediatv"

if [ -f $SUNDTEK_ADDON_DIR/lib/libmediaclient.so ]; then
	logger -t Sundtek "### Preloading library ###"
	export LD_PRELOAD=$SUNDTEK_ADDON_DIR/lib/libmediaclient.so
else
	logger -t Sundtek "### Preloading library doesn't exist ###"
fi
