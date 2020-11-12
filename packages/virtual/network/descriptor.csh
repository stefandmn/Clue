PKG_NAME="network"
PKG_VERSION=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain connman netbase ethtool openssh rsync iw"
PKG_SECTION="virtual"
PKG_DESCRIPTION="Metapackage to install network support packages"

if [ "$BLUETOOTH_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bluez"
fi

if [ "$SAMBA_SERVER" = "yes" ] || [ "$SAMBA_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET samba"
fi

if [ "$OPENVPN_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET openvpn"
fi

if [ "$WIREGUARD_SUPPORT" = "yes" ]; then
	PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET wireguard-tools wireguard-linux-compat"
fi

# nss needed by inputstream.adaptive, chromium etc.
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nss"
