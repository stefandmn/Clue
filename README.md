# Clue Media Experience

--- _**Clue v2** distribution is still under construction_ --- 

**Clue** is a free and open source environment, developed as fork of LibreELEC project,
to provide you builtin functions like multimedia center, integrated webcam, multiple 
networking pre-configurations (like Repeater, Router, Hotspot, etc.), etc., everything 
out of the box, easy to be deployed and to use over **Kodi** media center.

To install **Clue**  you need to download the installer image from [amsd.go.ro/clue](https://amsd.go.ro/clue),
choosing the right image file corresponding to your RPi device version, write it on the SD 
(or min SD) card, and connect RPi device through LAN port to your local network. The 
installer doesn't require human interaction and it will finish the installation process 
in 1-2 minutes (depending by your RPi version).

After installation **Clue** will boot loading automatically _Kodi_ media center with a 
dedicate graphical interface. Furthermore, you'll have access over SSH using __root__ account 
(default password is `clue`) or over HTTP to control most of the system configurations.
Connecting the RPi device to a TV over _HDMI_ you'll be able to setup the system directly 
from TV remove control and also to control the entire _HDMI_ chain using **System Setup** 
utility (deployed like a _Kodi_ addon).

**Clue** works mainly on all RPi devices, supported devices and their technical specifications 
are described below. In addition, this documentation provides guidelines to extend the **Clue OS**
setup or to adapt existing functionalities adjusting packages configuration.  
 
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


## Development Process

Development process is always driven __GNU make__ utility, providing the entire set command to 
build the entire distro, creater OS image, or to build or install particular packages or addons.
Also, __Makefile__ gives you details how to configure your environment in order to run the processes
and to optimize your resources. Just to identify all these details try a simple ```make help``` command.

Development process for ***Clue*** project means to update existing packages or to add new 
packages. In base cases you need to understand the `package.csh` file that provides a set of 
variables and functions for integrated building and deployment process.

### Variables
Package descriptor file (`package.csh`) contains a list of variables (mandatory and optional), 
just to control the build behaviour of the package (use variables in the top-down order listed below).

| Variable    | Default | Required | Description |
|-------------|---------|----------|-------------|
| PKG_NAME    | -       | yes | Name of the packaged software module. Should be lowercase |
| PKG_VERSION | -       | yes | Version of the packaged software module. If the version is a githash, please use the full githash, not the abbreviated form. |
| PKG_SHA256  | -       | yes | SHA256 hashsum of the application download file |
| PKG_ARCH    | any     | no  | Architectures for which the package builds. `any` or a space separated list of `aarch64`and/or `arm` |
| PKG_URL     | -       | yes | Address at which the source of the software application can be retrieved |
| PKG_DEPENDS_BOOTSTRAP<br>PKG_DEPENDS_HOST<br>PKG_DEPENDS_INIT<br>PKG_DEPENDS_TARGET | - | no | A space separated list of name of packages required to build the software application (thos package should be also part of this ***Clue** idstribution - watch out to circular depdencies) |
| PKG_SECTION | -       | no  | `abstract` if the package only defines dependencies |
| PKG_DESCRIPTION | -      | yes | Description of the package including purpose or function within ***Clue*** or ***Kodi*** |

#### Universal Build Option
| Variable    | Default | Required | Description |
|-------------|---------|----------|-------------|
| PKG_SOURCE_DIR | -    | no  | Force the folder name that application sources are unpacked to. Used when sources do not automatically unpack to a folder with the `PKG_NAME-PKG_VERSION` naming convention. |
| PKG_SOURCE_NAME | -   | no  | Force the filename of the application sources. Used when the filename is not the basename of `PKG_URL` |
| PKG_PATCH_DIRS | -    | no  | Patches in `./patches` are automatically applied after package unpack. Use this option to include patches from an additional folder, e.g. `./patches/$PKG_PATCH_DIRS` |
| PKG_NEED_UNPACK | -   | no  | Space separated list of files or folders to include in package stamp calculation. If the stamp is invalidated through changes to package files or dependent files/folders the package is cleaned and rebuilt. e.g. `PKG_NEED_UNPACK="$(get_pkg_directory linux)"` will trigger clean/rebuild of a Linux kernel driver package when a change to the `linux` kernel package is detected. |
| PKG_TOOLCHAIN | auto  | no  | Control which build toolchain is used. |
| PKG_BUILD_FLAGS | -   | no  | A space separated list of flags with which to fine-tune the build process. Flags can be enabled or disabled with a `+` or `-` prefix. For detailed information, see the [Reference](#build_flags-options). |
| PKG_PYTHON_VERSION | python2.7 | no | Define the Python version to be used. |
| PKG_IS_KERNEL_PKG | - | no  | Set to `yes` for packages that include Linux kernel modules |

#### Meson Options
| Variable    | Default | Required | Description |
|-------------|---------|----------|-------------|
| PKG_MESON_SCRIPT | $PKG_BUILD/meson.build | no | Meson build file to use |
| PKG_MESON_OPTS_TARGET | - | no   | Options directly passed to meson |

#### CMAKE Options
| Variable    | Default | Required | Description |
|-------------|---------|----------|-------------|
| PKG_CMAKE_SCRIPT | $PKG_BUILD/CMakeLists.txt | no | CMake build file to use |
| PKG_CMAKE_OPTS_HOST<br>PKG_CMAKE_OPTS_TARGET | - | no | Options directly passed to cmake |

#### Configure Options
| Variable    | Default | Required | Description |
|-------------|---------|----------|-------------|
| PKG_CONFIGURE_SCRIPT | $PKG_BUILD/configure | no | configure script to use |
| PKG_CONFIGURE_OPTS<br>PKG_CONFIGURE_OPTS_BOOTSTRAP<br>PKG_CONFIGURE_OPTS_HOST<br>PKG_CONFIGURE_OPTS_INIT<br>PKG_CONFIGURE_OPTS_TARGET | - | no | Options directly passed to configure |

#### Make Options
| Variable    | Default | Required | Description |
|-------------|---------|----------|-------------|
| PKG_MAKE_OPTS<br>PKG_MAKE_OPTS_BOOTSTRP<br>PKG_MAKE_OPTS_HOST<br>PKG_MAKE_OPTS_INIT<br>PKG_MAKE_OPTS_TARGET | - | no | Options directly passed to make in the build step
| PKG_MAKEINSTALL_OPTS_HOST<br>PKG_MAKEINSTALL_OPTS_TARGET | - | no | Options directly passed to make in the install step

#### Detailed Information for Options

##### TOOLCHAIN options

Application/packages needs different toolchains for build.
For instance `cmake` or the classic `./configure` or same very different.

For the most application/packages, the auto-detection of the toolchain works proper.
But not always. To select a specific toolchain, you only need to set the `PKG_TOOLCHAIN` variable.

| Toolchain   | Description (if needed) |
|-----------  |-------------------------|
| meson       | [Meson Build System](http://mesonbuild.com/) |
| cmake       | [CMake](https://cmake.org/) with Ninja |
| cmake-make  | [CMake](https://cmake.org/) with Make |
| autotools   | [GNU Build System](https://en.wikipedia.org/wiki/GNU_Build_System)
| configure   | preconfigured [GNU Build System](https://en.wikipedia.org/wiki/GNU_Build_System) |
| ninja       | [Ninja Build](https://ninja-build.org/) |
| make        | [Makefile Based](https://www.gnu.org/software/make/) |
| manual      | only runs self writen build steps, see [Functions](#functions) |

###### Auto-Detection
The auto-detections looks for specific files in the source path.

1. `meson.build` (PKG_MESON_SCRIPT) => meson toolchain
2. `CMakeLists.txt` (PKG_CMAKE_SCRIPT) => cmake toolchain
3. `configure` (PKG_CONFIGURE_SCRIPT) => configure toolchain
4. `Makefile` => make toolchain

When none of these was found, the build abort and you have to set the toolchain via `PKG_TOOLCHAIN`

##### BUILD_FLAGS options

Build flags implement often used build options. Normally these are activated be default, but single 
applications/packages has problems to compile/run with these.

Set the variable `PKG_BUILD_FLAGS` in the `package.csh` to enable/disable the single flags. 
It is a space separated list. The flags can enabled with a `+` prefix, and disabled with a `-`.

| Flag     | Default  | Affected stage | Description |
|----------|----------|----------------|-------------|
| pic      | disabled | target/init    | [Position Independent Code](https://en.wikipedia.org/wiki/Position-independent_code) |
| pic:host | disabled | host/bootstrap | see above |
| lto      | disabled | target/init    | enable LTO (Link Time optimization) in the compiler and linker unless disabled via `LTO_SUPPORT`. Compiles non-fat LTO objects (only bytecode) and performs single-threaded optimization at link stage |
| lto-parallel | disabled | target/init | same as `lto` but enable parallel optimization at link stage. Only enable this if the package build doesn't run multiple linkers in parallel otherwise this can result in lots of parallel processes! |
| lto-fat  | disabled | target/init | same as `lto` but compile fat LTO objects (bytecode plus optimized assembly). This increases compile time but can be useful to create static libraries suitable both for LTO and non-LTO linking |
| lto-off  | disabled | target/init | explicitly disable LTO in the compiler and linker |
| gold     | depend on `GOLD_SUPPORT` | target/init | can only disabled, use of the GOLD-Linker |
| parallel | enabled  | all | `make` or `ninja` builds with multiple threads/processes (or not) |
| strip    | enabled  | target | strips executables (or not) |

###### Example
```
PKG_BUILD_FLAGS="+pic -gold"
PKG_BUILD_FLAGS="-parallel"
```

### Functions
All build steps in the Clue build system, a done by shell function.
These functions can overwritten in the `package.csh`. But this raises problems, when the build 
system is updated. To reduce the problem, most function was extended by `pre_` and `post_` scripts, 
to use instead.

When it is necessary to replace configure, make and make install, please use `PKG_TOOLCHAIN="manual"`.

Some of the build steps needs to be run once, like `unpack`. Other steps needs to be run multiple 
times, to create the toolchain (stage bootstrap & host) or to create the OS image (stage init & target). 
These stage specific functions have the stage as suffix, like `make_target`.

Full list of overwrittable functions.

| Function                | Stage | Description |
|-------------------------|-------|-------------|
| configure_package | - | Optional function to implement late binding variable assignment (see below) |
| unpack<br>pre_unpack<br>post_unpack | - | Extract the source from the downloaded file |
| pre_patch<br>post_patch | -      | Apply the patches to the source, after extraction. The patch function it self is not allowed to overwritten |
| pre_build_\[stage]      | yes    | Runs before of the start of the build |
| pre_configure<br>pre_configure_\[stage]<br>configure_\[stage]<br>post_configure_\[stage] | yes | Configure the package for the compile. This is only relevant for toolchain, that supports it (e.g. meson, cmake, configure, manual) |
| make_\[stage]<br>pre_make_\[stage]<br>post_make_\[stage] | yes | Build of the package |
| makeinstall_\[stage]<br>pre_makeinstall_\[stage]<br>post_makeinstall_\[stage] | yes | Installation of the files in the correct pathes<br>host: TOOLCHAIN<br>target: SYSROOT and IMAGE<br>bootstrap and init: temporary destination


### Late Binding variable assignment

A package will be loaded only once, by the call to `/options`. During this process, additional package 
specific variables will be initialised, such as:

* `PKG_BUILD` - path to the build folder
* `PKG_SOURCE_NAME` - if not already specified, generated from `PKG_URL`, `PKG_NAME` and` PKG_VERSION`

Since these variables will not exist at the time the package is loaded, they can only be referenced **after** 
package has loaded. This can be accomplished by referencing these variables in the `configure_package()` 
function which is executed once the additional variables have been assigned.

If necessary, the following variables would be configured in `configure_package()` as they are normally 
relative to `${PKG_BUILD}`:
```
  PKG_CONFIGURE_SCRIPT
  PKG_CMAKE_SCRIPT
  PKG_MESON_SCRIPT
```

Further to this, toolchain variables that are defined in `setup_toolchain()` must not be referenced 
"globally" in the package as they will only be configured reliably after `setup_toolchain()` has been 
called during `setup/build`. Any variable in the following list must instead be referenced in a package 
function such as `pre_build_*`, `pre_configure_*`, `pre_make_*` etc.:
```
  TARGET_CFLAGS TARGET_CXXFLAGS TARGET_LDFLAGS
  NINJA_OPTS MAKEFLAGS
  DESTIMAGE
  CC CXX CPP LD
  AS AR NM RANLIB
  OBJCOPY OBJDUMP
  STRIP
  CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
  PKG_CONFIG
  PKG_CONFIG_PATH
  PKG_CONFIG_LIBDIR
  PKG_CONFIG_SYSROOT_DIR
  PKG_CONFIG_ALLOW_SYSTEM_CFLAGS
  PKG_CONFIG_ALLOW_SYSTEM_LIBS
  CMAKE_CONF CMAKE
  HOST_CC HOST_CXX HOSTCC HOSTCXX
  CC_FOR_BUILD CXX_FOR_BUILD BUILD_CC BUILD_CXX
  _python_sysroot _python_prefix _python_exec_prefix
```

Lastly, the following variables are assigned during `setup/build` but some packages may need to use 
alternative values for these variables. To do so, the package must assign alternative values 
in `pre_build_*`/`pre_configure_*`/`pre_make_*` etc. functions as these functions will be called after 
the variables are initialised with default values in `scripts/build` but before they are used by `scripts/build`.
```
  CMAKE_GENERATOR_NINJA

  TARGET_CONFIGURE_OPTS
  TARGET_CMAKE_OPTS
  TARGET_MESON_OPTS

  HOST_CONFIGURE_OPTS
  HOST_CMAKE_OPTS
  HOST_MESON_OPTS

  INIT_CONFIGURE_OPTS
  INIT_CMAKE_OPTS
  INIT_MESON_OPTS

  BOOTSTRAP_CONFIGURE_OPTS
  BOOTSTRAP_CMAKE_OPTS
  BOOTSTRAP_MESON_OPTS
```

#### Example
```
configure_package() {
  # now we know where we're building, assign a value
  PKG_CONFIGURE_SCRIPT="${PKG_BUILD}/gettext-tools/configure"
}

post_patch() {
  # replace hardcoded stuff
  sed -i ${PKG_CONFIGURE_SCRIPT} 's|hardcoded stuff|variable stuff|'
}

pre_configure_target() {
  # add extra flag to toolchain default
  CFLAGS="$CFLAGS -DEXTRA_FLAG=yeah"
}

post_makeinstall_target() {
  # remove unused executable, install what remains
  rm $INSTALL/usr/bin/bigexecutable
}
```

Distribution environment provides an utility`setup/pkgcheck` to verify packages. 
It can detect the following type of issues:

Issue | Level | Meaning |
| :--- | :----: | ---- |
| late&nbsp;binding&nbsp;violation | FAIL | Late binding variables referenced outside of a function |
| duplicate&nbsp;function&nbsp;def | FAIL | Function defined multiple times, only last definition will be used |
| bad&nbsp;func&nbsp;-&nbsp;missing&nbsp;brace | FAIL | Opening brace (`{`) for function definition should be on same line as the function def, ie. `pre_configure_target() {` |
| intertwined&nbsp;vars&nbsp;&&nbsp;funcs | WARN | Variable assignments and logic is intertwined with functions - this is cosmetic, but variables and logic should be specified before all functions |
| unknown&nbsp;function | WARN | Could be a misspelled function, ie. `per_configure_target() {` which might fail silently.|
| ignored&nbsp;depends&nbsp;assign | WARN | Values assigned to `PKG_DEPENDS_*` outside of the global section or `configure_package()` will be ignored. |


### Add a new package to the distribution
1. Think about, why you need it in the image.
    * new multimedia tool
    * add a new network tool
    * new kernel driver
    * ...
2. Find a place in the packages tree
    * look into the package tree structure, which is generally self explaind.
    * do not place it in an existing package (directory that includes a `package.csh`)
    * when you found a place, create a directory with the name of your package (use same value for `PKG_NAME`!!)
3. Create an initial `package.csh`
    * you can find a template within this documentation. Copy the template into the new directory and call it `package.csh`
    * apply any required changes to your new `package.csh`
4. Find a place in the dependency tree
    * when it extend an existing package, add it there to the `PKG_DEPENDS_TARGET`/`PKG_DEPENDS_HOST` etc.
    * take a look into the path `packages/abstract`, there you should find an abstract packages, that match your new package
5. Now you can build the system image
    * after the build, inside the `devel-*` folder you should find a directory with your package name and -version, eg. `widget-1.2.3`.

#### Example
```
PKG_NAME="mariadb-connector-c"
PKG_VERSION="3.0.2"
PKG_SHA256="f44f436fc35e081db3a56516de9e3bb11ae96838e75d58910be28ddd2bc56d88"
PKG_URL="https://github.com/MariaDB/mariadb-connector-c/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib openssl"
PKG_DESCRIPTION="mariadb-connector: library to conntect to mariadb/mysql database server"
PKG_BUILD_FLAGS="-gold"

PKG_CMAKE_OPTS_TARGET="-DWITH_EXTERNAL_ZLIB=ON \
                       -DAUTH_CLEARTEXT=STATIC \
                       -DAUTH_DIALOG=STATIC \
                       -DAUTH_OLDPASSWORD=STATIC \
                       -DREMOTEIO=OFF"

post_makeinstall_target() {
  # drop all unneeded
  rm -rf $INSTALL/usr
}
```


### Templates
The template below can be used when you want to extend the capabilities of **Clue OS**, 
adding new packages to bring additional functionalities. The package file descriptor should 
have `package.csh` name and should be created into a new folder within the `/packages` directory
structure having the same name like the package itself.
```
PKG_NAME="[package name]"
PKG_VERSION="[package version identifier or unique githash]"
PKG_SHA256="[sha256 hash of the source file, downloaded from PKG_URL]"
PKG_ARCH="any"
PKG_URL="[download url, e.g. https://github.com/example/libexample/archive/$PKG_VERSION.tar.gz]"
PKG_DEPENDS_TARGET="[build system dependencies, e.g. toolchain zlib openssl]"
PKG_SECTION="[location under packages, e.g. database]"
PKG_DESCRIPTION="[long description of the package, often taken from the package/project website, e.g. libexample: this project is created to calculate examples for x and y, with maximum efficiency and fewer errors]"
# PKG_TOOLCHAIN="auto"

#PKG_CMAKE_OPTS_TARGET="-DWITH_EXAMPLE_PATH=/clue/.example
#                      "

#pre_configure_target() {
#  do something, or drop it
#}
```
