PKG_NAME="TexturePacker"
PKG_VERSION="0"
PKG_DEPENDS_HOST="lzo:host libpng:host libjpeg-turbo:host giflib:host"
PKG_DEPENDS_UNPACK="kodi"
PKG_NEED_UNPACK="$(get_pkg_directory kodi)"
PKG_DESCRIPTION="kodi-platform:"

PKG_CMAKE_SCRIPT="$(get_build_dir kodi)/tools/depends/native/TexturePacker/CMakeLists.txt"

PKG_CMAKE_OPTS_HOST="-Wno-dev"

pre_configure_host() {
	export CXXFLAGS="$CXXFLAGS -std=c++11 -DTARGET_POSIX -DTARGET_LINUX -D_LINUX -I$(get_build_dir kodi)/xbmc/platform/linux"
}

makeinstall_host() {
	mkdir -p $TOOLCHAIN/bin
	cp TexturePacker $TOOLCHAIN/bin
}
