# Clue Media Experience

**Clue** is a free and open source environment, developed as fork of `LibreELEC`,
to provide you builtin functions like multimedia center, integrated webcam, multiple 
networking pre-configurations (like Repeater, Router, Hotspot,etc.), etc., everything 
out of the box, easy to be deployed and to use.

To install **Clue**  you need to download the installer image from [amsd.go.ro/clue](https://amsd.go.ro/clue),
choosing the right image file corresponding to your RPi version, write it on the SD 
(or min SD) card, and connect RPi device through LAN port to your local network. The 
installer doesn't require human interaction and it will finish the installation process 
in 1-2 minutes (depending by your RPi version).

After installation **Clue** will boot loading automatically _Kodi_ media center 
graphical interface. Furthermore, level you'll have access over SSH using __root__ account 
(default password is `clue`) or over HTTP to control most of the system configurations.
Connecting the RPi device to a TV over _HDMI_ you'll be able to setup the system directly 
from TV remove control and also to control the entire _HDMI_ chain using **Setup** utility.

**Clue** works mainly on all RPi devices, supported devices and their tech. specs. 
are described below.
 
_Enjoy!_


## Supported Raspberry Pi Devices

The **Raspberry Pi** single-board computers are all supported by this project but in order to build 
the system for one particular RPi device you have to define and export`DEVICE` environment variable,
the possible values correlated with the device type /revision and specs are described below.

### Raspberry Pi 1 
`DEVICE=RPi`
 * 700 MHz single-core ARM1176JZF-S (model A, A+, B, B+, CM)
 * Broadcom VideoCore IV
 * 256 MB (model A, A+, B rev 1); 512 MB (model B rev 2, B+, CM)
 * Broadcom VideoCore IV
 * SDHC slot (model A and B); MicroSDHC slot (model A+ and B+); 4 GB eMMC IC chip (model CM)
 * 1.5 W (model A); 1.0 W (model A+); 3.5 W (model B); 3.0 W (model B+) or 0.8 W (model Zero)

### Raspberry Pi Zero / Zero W
`DEVICE=RPi`
 * 1000 MHz single-core ARM1176JZF-S
 * 512 MB RAM
 * Mini HDMI port
 * Micro USB OTG port
 * Micro USB power
 * HAT-compatible 40-pin header
 * Composite video and reset headers
 * CSI camera connector (v1.3 only)

_Zero W model specific_
 * 802.11 b/g/n wireless LAN
 * Bluetooth 4.1
 * Bluetooth Low Energy (BLE)


### Raspberry Pi 2
`DEVICE=RPi2`
 * Broadcom BCM2837 Arm7 Quad Core Processor powered Single Board Computer running at 900MHz
 * 1GB RAM (shared with GPU)
 * Broadcom VideoCore IV @ 250 MHz, OpenGL ES 2.0 (24 GFLOPS); 1080p30 MPEG-2 and VC-1 decoder (with license)
 * 40pin extended GPIO, 17 GPIO plus specific functions, and HAT ID bus
 * 4 x USB 2 ports
 * 4 pole Stereo output and Composite video port
 * Full size HDMI
 * Analog via 3.5 mm jack
 * CSI camera port for connecting the Raspberry Pi camera
 * DSI display port for connecting the Raspberry Pi touch screen display
 * Micro SD port for loading your operating system and storing data
 * Micro USB power source    

### Raspberry Pi 3
`DEVICE=RPi2`
 * Quad Core 1.2GHz Broadcom BCM2837 64bit CPU
 * 1GB RAM
 * BCM43438 wireless LAN and Bluetooth Low Energy (BLE) on board
 * 100 Base Ethernet
 * 40-pin extended GPIO
 * 4 USB 2 ports
 * 4 Pole stereo output and composite video port
 * Full size HDMI
 * CSI camera port for connecting a Raspberry Pi camera
 * DSI display port for connecting a Raspberry Pi touchscreen display
 * Micro SD port for loading your operating system and storing data
 * Upgraded switched Micro USB power source up to 2.5A

_B+ model specific_
 * Broadcom BCM2837B0, Cortex-A53 (ARMv8) 64-bit SoC @ 1.4GHz)
 * 2.4GHz and 5GHz IEEE 802.11.b/g/n/ac wireless LAN, Bluetooth 4.2, BLE
 * B+ model Gigabit Ethernet over USB 2.0 (maximum throughput 300 Mbps)
 * Power-over-Ethernet (PoE) support (requires separate PoE HAT)

### Raspberry Pi 4
`DEVICE=RPi4`
 * Broadcom BCM2711, Quad core Cortex-A72 (ARM v8) 64-bit SoC @ 1.5GHz
 * 2GB, 4GB or 8GB LPDDR4-3200 SDRAM (depending on model)
 * 2.4 GHz and 5.0 GHz IEEE 802.11ac wireless, Bluetooth 5.0, BLE
 * Gigabit Ethernet
 * 2 USB 3.0 ports; 2 USB 2.0 ports.
 * Raspberry Pi standard 40 pin GPIO header (fully backwards compatible with previous boards)
 * 2 × micro-HDMI ports (up to 4kp60 supported)
 * 2-lane MIPI DSI display port
 * 2-lane MIPI CSI camera port
 * 4-pole stereo audio and composite video port
 * H.265 (4kp60 decode), H264 (1080p60 decode, 1080p30 encode)
 * OpenGL ES 3.0 graphics
 * Micro-SD card slot for loading operating system and data storage
 * 5V DC via USB-C connector (minimum 3A*)
 * 5V DC via GPIO header (minimum 3A*)
 * Power over Ethernet (PoE) enabled (requires separate PoE HAT)
