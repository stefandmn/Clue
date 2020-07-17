# Clue Media Experience

**Clue** is a free and open source environment developed as a fork of OpenELEC platform,
to provide you builtin functions like multimedia home cinema, integrated surveillance and
multiple networking pre-configurations (Repeater, Router, Hotspot,etc.), everything out of the
box, easily to be deployed and use.

**Clue** framework is fully functional but the packages that are part of this linux distribution
are still under development. You can update your Clue system by using **Clue Setup** utility
(type `setup` or `clue` in OS console) over _SSH_.

In order to install **Clue** OS you have to download the installer image from 
[GitHub releases](https://github.com/stefandmn/Clue/releases) or from [amsd.go.ro/clue](https://amsd.go.ro/clue),
choosing the file corresponding to your RPi version), write it on the SD (or min SD) card, connect
RPi device through LAN port to your local network - that must have Internet access and _DHCP_ enabled,
and then power it on. The installer doesn't require human interaction and it will be ready depending
by your RPi version: for _RPi v2 B model_ will take around 1h and 30 minutes, for _RPi v3 B model_
will take around 45 minutes.

After installation **Clue** OS will boot automatically using a dedicated splash screen and will
load the media center graphical interface. In additional you'll have access to OS over SSH through
__root__ account (default password is `clue`) or over HTTP to control most of the system configurations.
Connecting the RPi device to a TV over _HDMI_ you'll be able to setup the system directly from
TV remove control.

**Clue OS** works quite well on _RPi v2_ (it is suggested to not activate all services together due to
limited power processor) but it is recommended to run it on _RPi v3_ - it works like a charm on this
hardware platform.

Enjoy!
