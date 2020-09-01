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
	./$(CONFIG)/tools/viewplan | tee $(BUILD_DIR)/viewplan_$(DEVICE).txt


# Display specified package attributes and also the dependencies' list
#	@package - package name with optional target [:<host|target|init|bootstrap>]
viewpack:
ifneq ($(package),)
	./$(CONFIG)/tools/viewpack $(package)
else
	echo "Please specify 'package' parameter"
endif


# Display building process
dashboard:
	./$(CONFIG)/tools/dashboard


# Display the help text
help:
	echo -e "\
\nSYNOPSIS\n\
       make build|install|clean|cleanall|release|image\n\
       make cachestats|viewplan|dashboard\n\
       make help\n\
\nDESCRIPTION\n\
    Executes one of the make tasks defined through this Makefile flow, according \n\
    to the specified DEVICE variable. In case is not defined/exported to the OS \n\
    level you can include it in the command line with '-e' like in the following\n\
    example: 'make build -e DEVICE=RPi4'. It is recommended to work with the OS \n\
    export variable just to avoid complex command lines: 'export DEVICE=RPi4'\n\
    All possible value of DEVICE variable are described in the README files, \n\
    providing the complete list of support devices.\n\n\
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
    cachestats\n\
                  Displays cache statistics\n\
    viewplan\n\
                  Shows the building plan for the current DEVICE\n\
    dashboard\n\
                  Display the real time build process for the current DEVICE\n\
    help\n\
                  Shows this text\n\
\nEXAMPLES\n\
       build the entire distribution ('build' make task is default)\n\
       > make\n\
       > make build\n\n\
       build 'sed' package\n\
       > make build -e package=sed\n\n\
       install 'sed' package (and related dependencies)\n\
       > make install -e package=sed\n\n\
       make system release\n\
       > make release\n\n\
       make system release and OS image\n\
       > make image\n\n\
       view the building plan (it is saved in viewplan.txt file from BUILD_DIR folder)\n\
       > make viewplan\n\n\
"
