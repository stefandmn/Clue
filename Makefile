SHELL:=/bin/bash
ROOT=$(shell pwd)

ifndef VERBOSE
.SILENT:
endif

export CONFIG=setup
export SYSTEM=distro
export PACKAGES=packs

ifeq ($(DEVICE),)
	export DEVICE=RPi
endif

ifeq ($(OUTPUT),)
	export OUTPUT_DIR=$(ROOT)/../Clue-out
endif

# Build particular package or the entire system
#	@package - package name with optional target [:<host|target|init|bootstrap>]
#	@parent parent of the specified package
#	- in case no one of these parameters is specified then the process build is called
build:
ifeq ($(package),)
	./$(CONFIG)/process | tee $(OUTPUT_DIR)/process.log
else
	./$(CONFIG)/build $(package) $(parent) | tee $(OUTPUT_DIR)/build.log
endif


# Install (and build in case was not yet built) a particular package
#	@package - package name with optional target [:<host|target|init|bootstrap>]
#	@parent parent of the specified package
install:
ifneq ($(package),)
	./$(CONFIG)/install $(package) $(parent) | tee $(OUTPUT_DIR)/install.log
else
	@printf "\n* Please specify 'package' parameter, and optional 'parent' parameter!\n\n"
	exit 1
endif


# Clean-up package resources like source code and all build pack (in case @package
# parameter is specified) or clean-up the entire build distribution (including stamps)
#	@package - package name with optional target [:<host|target|init|bootstrap>]
clean:
ifneq ($(package),)
	./$(CONFIG)/clean $(package) $(parent) | tee $(OUTPUT_DIR)/clean.log
else
	rm -rf $(OUTPUT_DIR)/*-${DEVICE}.* $(OUTPUT_DIR)/.stamps
endif


# Clean-up all build distributions, cache and stamps
cleanall:
	rm -rf $(OUTPUT_DIR)/* $(OUTPUT_DIR)/.stamp $(OUTPUT_DIR)/.ccache


# Build OS release
release:
	./$(CONFIG)/process release | tee $(OUTPUT_DIR)/process.log


# Build OS image
image:
	./$(CONFIG)/process image | tee $(OUTPUT_DIR)/process.log


# Display the cache statistics for
cachestats:
	./$(CONFIG)/tools/cachestats | tee $(OUTPUT_DIR)/cachestats.txt


# Display the building plan for the current distribution
viewplan:
	./$(CONFIG)/tools/viewplan | tee $(OUTPUT_DIR)/viewplan_$(DEVICE).txt


# Display specified package attributes and also the dependencies' list
#	@package - package name with optional target [:<host|target|init|bootstrap>]
viewpack:
ifneq ($(package),)
	./$(CONFIG)/tools/viewpack $(package)
else
	@printf "\n* Please specify 'package' parameter!\n\n"
	exit 1
endif


# Display building process
viewbuild:
	./$(CONFIG)/tools/viewbuild

monitor:viewbuild


# Display the help text
help:
	echo -e "\
\nSYNOPSIS\n\
       make build|install|clean|cleanall|release|image\n\
       make cachestats|viewplan|viewpack|viewbuild\n\
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
    viewpack\n\
                  Shows the package descriptor and properties\n\
    viewbuild\n\
                  Display the real time build process for the current DEVICE\n\
    help\n\
                  Shows this text\n\
\n\
    There are couple of system variables that can be set in order to drive the building \n\
    process:\n\
    DEVICE\n\
                  Indicates the target device type. Possible options are: RPi, RPi2, RPi4\n\
                  Default value is 'RPi'.\n\
    OUTPUT\n\
                  Describe the local file system location where the build process will be  \n\
                  executed. Default value is '$(ROOT)/../Clue-out'\n\
    STATUS\n\
                  Provides and indication about distribution build status. All possible values\n\
                  are: stable, devel, nightly, daily, weekly, monthly, Default value is 'devel'\n\
    DEBUG\n\
                  Debug compilation flag (yes/no). Default value is 'no'\n\
    VERBOSE\n\
                  Verbose compilation mode (yes/no). Default value is 'yes'\n\
\n\
EXAMPLES\n\
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
       view the building plan (it is saved in viewplan.txt file from $(OUTPUT_DIR) folder)\n\
       > make viewplan\n\n\
"