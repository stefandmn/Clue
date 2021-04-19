PKG_NAME="bcm2835-driver"
PKG_VERSION="1.0"
PKG_URL="${REPO_SOURCES}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain dtc"
PKG_DESCRIPTION="OpenGL-ES and OpenMAX driver for BCM2835"
PKG_TOOLCHAIN="manual"

# Set SoftFP ABI or HardFP ABI
if [ "${TARGET_FLOAT}" = "soft" ]; then
	PKG_FLOAT="softfp"
else
	PKG_FLOAT="hardfp"
fi

makeinstall_target() {
	# Install vendor header files
	mkdir -p ${TARGET_SYSROOT}/usr/include
	if [ "${OPENGLES}" = "bcm2835-driver" ]; then
		cp -PRv ${PKG_FLOAT}/opt/vc/include/* ${TARGET_SYSROOT}/usr/include
	else
		for f in $(
			cd ${PKG_FLOAT}/opt/vc/include
			ls | grep -v "GL"
		); do
			cp -PRv ${PKG_FLOAT}/opt/vc/include/$f ${TARGET_SYSROOT}/usr/include
		done
	fi

	# Install EGL, OpenGL ES, Open VG, etc. vendor libs & pkgconfigs
	mkdir -p ${TARGET_SYSROOT}/usr/lib
	if [ "${OPENGLES}" = "bcm2835-driver" ]; then
		cp -PRv ${PKG_FLOAT}/opt/vc/lib/*.so ${TARGET_SYSROOT}/usr/lib
		ln -sf ${TARGET_SYSROOT}/usr/lib/libbrcmEGL.so ${TARGET_SYSROOT}/usr/lib/libEGL.so
		ln -sf ${TARGET_SYSROOT}/usr/lib/libbrcmGLESv2.so ${TARGET_SYSROOT}/usr/lib/libGLESv2.so
		cp -PRv ${PKG_FLOAT}/opt/vc/lib/*.a ${TARGET_SYSROOT}/usr/lib
		cp -PRv ${PKG_FLOAT}/opt/vc/lib/pkgconfig ${TARGET_SYSROOT}/usr/lib
	else
		for f in $(
			cd ${PKG_FLOAT}/opt/vc/lib
			ls *.so *.a | grep -Ev "^lib(EGL|GL)"
		); do
			cp -PRv ${PKG_FLOAT}/opt/vc/lib/$f ${TARGET_SYSROOT}/usr/lib
		done
		mkdir -p ${TARGET_SYSROOT}/usr/lib/pkgconfig
		for f in $(
			cd ${PKG_FLOAT}/opt/vc/lib/pkgconfig
			ls | grep -v "gl"
		); do
			cp -PRv ${PKG_FLOAT}/opt/vc/lib/pkgconfig/$f ${TARGET_SYSROOT}/usr/lib/pkgconfig
		done
	fi

	# Update prefix in vendor pkgconfig files
	for PKG_CONFIGS in $(find "${TARGET_SYSROOT}/usr/lib" -type f -name "*.pc" 2>/dev/null); do
		sed -e "s#prefix=/opt/vc#prefix=/usr#g" -i "${PKG_CONFIGS}"
	done

	# Create symlinks to /opt/vc to satisfy hardcoded include & lib paths
	mkdir -p ${TARGET_SYSROOT}/opt/vc
	ln -sf ${TARGET_SYSROOT}/usr/lib ${TARGET_SYSROOT}/opt/vc/lib
	ln -sf ${TARGET_SYSROOT}/usr/include ${TARGET_SYSROOT}/opt/vc/include

	# Install EGL, OpenGL ES and other vendor libs
	mkdir -p ${INSTALL}/usr/lib
	if [ "${OPENGLES}" = "bcm2835-driver" ]; then
		cp -PRv ${PKG_FLOAT}/opt/vc/lib/*.so ${INSTALL}/usr/lib
		ln -sf /usr/lib/libbrcmEGL.so ${INSTALL}/usr/lib/libEGL.so
		ln -sf /usr/lib/libbrcmEGL.so ${INSTALL}/usr/lib/libEGL.so.1
		ln -sf /usr/lib/libbrcmGLESv2.so ${INSTALL}/usr/lib/libGLESv2.so
		ln -sf /usr/lib/libbrcmGLESv2.so ${INSTALL}/usr/lib/libGLESv2.so.2
	else
		for f in $(
			cd ${PKG_FLOAT}/opt/vc/lib
			ls *.so | grep -Ev "^lib(EGL|GL)"
		); do
			cp -PRv ${PKG_FLOAT}/opt/vc/lib/$f ${INSTALL}/usr/lib
		done
	fi

	# Install useful tools
	mkdir -p ${INSTALL}/usr/bin
	cp -PRv ${PKG_FLOAT}/opt/vc/bin/dtoverlay ${INSTALL}/usr/bin
	ln -s dtoverlay ${INSTALL}/usr/bin/dtparam
	cp -PRv ${PKG_FLOAT}/opt/vc/bin/vcdbg ${INSTALL}/usr/bin
	cp -PRv ${PKG_FLOAT}/opt/vc/bin/vcgencmd ${INSTALL}/usr/bin
	cp -PRv ${PKG_FLOAT}/opt/vc/bin/vcmailbox ${INSTALL}/usr/bin
	cp -PRv ${PKG_FLOAT}/opt/vc/bin/tvservice ${INSTALL}/usr/bin
	cp -PRv ${PKG_FLOAT}/opt/vc/bin/edidparser ${INSTALL}/usr/bin

	# Create symlinks to /opt/vc to satisfy hardcoded lib paths
	mkdir -p ${INSTALL}/opt/vc
	ln -sf /usr/bin ${INSTALL}/opt/vc/bin
	ln -sf /usr/lib ${INSTALL}/opt/vc/lib
}

post_install() {
	# unbind Framebuffer console
	if [ "${OPENGLES}" = "bcm2835-driver" ]; then
		enable_service unbind-console.service
	fi
}
