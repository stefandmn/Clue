SHELL:=/bin/bash
ROOT=$(shell pwd)

ifndef VERBOSE
.SILENT:
endif

export BUILD_DIR=$(ROOT)/../Clue-out
export CONFIG=setup
export SYSTEM=distro
export PACKAGES=packs

ifeq ($(DEVICE),)
	export DEVICE=RPi
endif


# Build particular package or the entire system
#	@package - package name with optional target [:<host|target|init|bootstrap>]
#	@parent parent of the specified package
#	- in case no one of these parameters is specified then the process build is called
build:
ifeq ($(package),)
	./$(CONFIG)/process | tee $(BUILD_DIR)/process.log
else
	./$(CONFIG)/build $(package) $(parent) | tee $(BUILD_DIR)/build.log
endif


# Install (and build in case was not yet built) a particular package
#	@package - package name with optional target [:<host|target|init|bootstrap>]
#	@parent parent of the specified package
install:
ifneq ($(package),)
	./$(CONFIG)/install $(package) $(parent) | tee $(BUILD_DIR)/install.log
else
	echo "Please specify 'package' and optional 'parent' parameter(s)"
endif


# Clean-up package resources like source code and all build pack (in case @package
# parameter is specified) or clean-up the entire build distribution (including stamps)
#	@package - package name with optional target [:<host|target|init|bootstrap>]
clean:
ifneq ($(package),)
	./$(CONFIG)/clean $(package) $(parent) | tee $(BUILD_DIR)/clean.log
else
	rm -rf $(BUILD_DIR)/build.* $(BUILD_DIR)/.stamps
endif


# Clean-up all build distributions, cache and stamps
cleanall:
	rm -rf $(BUILD_DIR)/* $(BUILD_DIR)/.stamp $(BUILD_DIR)/.ccache


# Build OS release
release:
	./$(CONFIG)/process release | tee $(BUILD_DIR)/process.log


# Build OS image
image:
	./$(CONFIG)/process image | tee $(BUILD_DIR)/process.log


# Display the cache statistics for
cachestats:
	./$(CONFIG)/tools/cachestats | tee $(BUILD_DIR)/cachestats.txt


# Display the building plan for the current distribution
viewplan:
	./$(CONFIG)/tools/viewplan | tee $(BUILD_DIR)/viewplan.txt


# Display the help text
help:
	echo -e "\
\nSYNOPSIS\n\
       make build|install|clean|cleanall|release|image|cachestats|viewplan\n\
\nDESCRIPTION\n\
    build [-e package=<pack>]\n\
                  build one particular package (and all related dependencies) or \n\
                  the entire DEVICE distribution\n\
    install -e package=<pack>\n\
                  install one particular package and related dependencies\n\
    clean [-e package=<pack>]\n\
                  cleanup one particular package or the entire DEVICE distribution\n\
    cleanall\n\
                  Clean-up all DEVICE distributions, cache and stamps resources as well\n\
    release\n\
                  Build the system release for the current DEVICE\n\
    image\n\
                  Build the system release and create OS image for the current DEVICE\n\
\nEXAMPLES\n\
       build the entire distribution ('build' make task is default)\n\
       > make\n\
       > make build\n\n\
       build 'sed' package\n\
       > make build -e package=sed\n\
"