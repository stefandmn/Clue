PKG_NAME="openssl"
PKG_VERSION="1.1.1d"
PKG_SHA256="1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2"
PKG_URL="https://www.openssl.org/source/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_DESCRIPTION="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security"
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="-parallel"

PKG_CONFIGURE_OPTS_SHARED="--libdir=lib \
                           shared \
                           threads \
                           no-ec2m \
                           no-md2 \
                           no-rc5 \
                           no-rfc3779 \
                           no-sctp \
                           no-ssl-trace \
                           no-ssl3 \
                           no-unit-test \
                           no-weak-ssl-ciphers \
                           no-zlib \
                           no-zlib-dynamic \
                           no-static-engine"

PKG_CONFIGURE_OPTS_HOST="--prefix=$TOOLCHAIN \
                         --openssldir=$TOOLCHAIN/etc/ssl"
PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --openssldir=/etc/ssl"

post_unpack() {
	find $PKG_BUILD/apps -type f | xargs -n 1 -t sed 's|./demoCA|/etc/ssl|' -i
}

pre_configure_host() {
	mkdir -p $PKG_BUILD/.$HOST_NAME
	cp -a $PKG_BUILD/* $PKG_BUILD/.$HOST_NAME/
}

configure_host() {
	cd $PKG_BUILD/.$HOST_NAME
	./Configure $PKG_CONFIGURE_OPTS_HOST $PKG_CONFIGURE_OPTS_SHARED linux-x86_64 $CFLAGS $LDFLAGS
}

makeinstall_host() {
	make install_sw
}

pre_configure_target() {
	mkdir -p $PKG_BUILD/.$TARGET_NAME
	cp -a $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME/

	OPENSSL_TARGET=linux-armv4
}

configure_target() {
	cd $PKG_BUILD/.$TARGET_NAME
	./Configure $PKG_CONFIGURE_OPTS_TARGET $PKG_CONFIGURE_OPTS_SHARED $PLATFORM_FLAGS $OPENSSL_TARGET $CFLAGS $LDFLAGS
}

makeinstall_target() {
	make DESTDIR=$INSTALL install_sw
	make DESTDIR=$TARGET_SYSROOT install_sw
}

post_makeinstall_target() {
	rm -rf $INSTALL/etc/ssl/misc
	rm -rf $INSTALL/usr/bin/c_rehash

	debug_strip $INSTALL/usr/bin/openssl

	# cert from https://curl.haxx.se/docs/caextract.html
	mkdir -p $INSTALL/etc/ssl
	cp $PKG_DIR/cert/cacert.pem $INSTALL/etc/ssl/cacert.pem.system

	# give user the chance to include their own CA
	mkdir -p $INSTALL/usr/bin
	cp $PKG_DIR/scripts/openssl-config $INSTALL/usr/bin
	ln -sf /run/clue/cacert.pem $INSTALL/etc/ssl/cacert.pem
	ln -sf /run/clue/cacert.pem $INSTALL/etc/ssl/cert.pem

	# backwards comatibility
	mkdir -p $INSTALL/etc/pki/tls
	ln -sf /run/clue/cacert.pem $INSTALL/etc/pki/tls/cacert.pem
	mkdir -p $INSTALL/etc/pki/tls/certs
	ln -sf /run/clue/cacert.pem $INSTALL/etc/pki/tls/certs/ca-bundle.crt
	mkdir -p $INSTALL/usr/lib/ssl
	ln -sf /run/clue/cacert.pem $INSTALL/usr/lib/ssl/cert.pem
}

post_install() {
	enable_service openssl-config.service
}
