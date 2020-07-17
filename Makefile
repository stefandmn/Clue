BUILD_DIRS=../CWork/build.*
SOURCES_DIR=../CWork/sources
TARGET_DIR=../CWork/target

all: release

system:
	./setup/image

release:
	./setup/image release

image:
	./setup/image mkimage

noobs:
	./setup/image noobs

clean:
	rm -rf $(BUILD_DIRS)/* $(BUILD_DIRS)/.stamps

distclean:
	rm -rf ./.ccache ./$(BUILD_DIRS)

src-pkg:
	tar cvJf sources.tar.xz sources .stamps
