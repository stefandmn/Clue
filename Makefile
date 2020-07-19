ROOT=$(shell pwd)
export BUILD_DIR=$(ROOT)/../CWork
export PROJECT=RPi
export DEVICE=RPi
export ARCH=arm


all: release

addons:
	./setup/addon all

system:
	./setup/image

release:
	./setup/image release

image:
	./setup/image mkimage

noobs:
	./setup/image noobs

clean:
	rm -rf $(BUILD_DIR)/* $(BUILD_DIR)/.stamps

