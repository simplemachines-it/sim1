

When the SIM.ONE is powered on, it runs two boot loaders before the operating system starts running.

A tiny one resident in the EP9307 chip loads a more powerful one, [U-Boot](http://www.denx.de/wiki/U-Boot), from the flash memory into RAM and runs it; U-Boot then loads and launches the Linux kernel, telling it where to find its root file system and a few other things.

The Sim.One comes with U-Boot pre-programmed into flash; you would only need to have anything to do with the initial EP9307 loader if you wish to upgrade U-Boot or replace it with a different boot loader.

# EP9307 loader #
The EP9307 CPU contains a small boot loader which you can activate by connecting pins 1 and 2 of JP1 and rebooting.
It communicates over the serial port with a program on Your PC.

## Programming the U-Boot loader into Flash ##
Connected to Sim.One to a PC through a [null modem](http://it.wikipedia.org/wiki/File:Null_modem_DB-9_7-wire.svg) cable and start the Cirrus program "[download](http://arm.cirrus.com/files/index.php?path=download/)" which will write the U-Boot image to e Flash memory.

There is [documentation on how to use "download"](http://simplemachines.it/doc/flash/docs/index.html) with [an executable binary for Linux on x86](http://simplemachines.it/doc/flash/download/bin/download) and [a tarball of the docs, sources and Linux/Windows executables](http://simplemachines.it/downloads/flash-1.0.5.tar.bz2).

You will find precompiled U-Boot binaries in [the Downloads area](http://code.google.com/p/sim1/downloads/list).

  1. move jumper JP1 between 1 and 2
  1. on the PC: "`download u-boot.bin`" uses ttyS0/COM1. For other ports use e.g. "`download -p USB0 u-boot.bin`" for /dev/ttyUSB0
  1. press reset button - the download starts and programs the flash memory
  1. move JP1 back to the original position between pins 2 and 3
  1. start `minicom` on the PC at 57600 baud no hardware flow control
  1. press reset button - U-Boot will start...

These steps are not needed on a new Sim.One, because its flash is written with U-Boot during the factory testing.

# U-Boot loader #

To use U-Boot, connect the Sim.One to a PC's RS232 serial port and to the network with an ethernet cable.

With the cable connected we can do one of the following:

> a. load in memory the Linux Kernel and maybe also the rootFS to execute

> b. load in memory the Linux Kernel and execute applications from the onboard flash

On the PC, we must run a terminal program, for example [minicom](http://en.wikipedia.org/wiki/Minicom) (from where we can send commands to U-Boot) and a [tftp](http://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol) server to make the files available to [U-Boot](http://www.denx.de/wiki/U-Boot) on the Sim.One.

## Loading The Kernel and Ramdisk.gz Image ##

U-Boot uses tftp to retrieve images from the network. Therefore, a tftp server must be running on a machine on your network, and the images to be loaded onto the board must reside on that machine. Configuration of a tftp server is different between various OSes, and between various distributions of an OS (such as the various flavors of Linux). Documentation from your OS vendor will have to be consulted in order to get a tftp server running.

Once U-Boot (with networking) is running on the board, Linux can be loaded and run. The images to be loaded by UBoot must be placed into the area used by the tftp server on your host machine, typically "`/tftpboot`" or "`/srv/tftp`" (though this may be different based on your OS; see your OS vendor's documentation for details).

First, configure U-Boot's network settings:
```
SIMONE> set ipaddr 192.168.0.51
SIMONE> set netmask 255.255.255.0
SIMONE> set serverip 192.168.0.1
SIMONE> saveenv
```
(if your server is on a different subnet from your Sim.One, you can add `set gatewayip=192.168.0.254` or whatever)

Now you can use U-Boot's `tftp` command to download the images:

```
SIM.ONE> tftp c0200000 uImage
TFTP from server 192.168.0.1; our IP address is 192.168.0.51
Filename 'uImage'.
Load address: 0xc0200000
Loading: #################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
done
Bytes transferred = 2325704 (237cc8 hex)
```
If your have made your kernel boot from ramdisk, you can also load the compressed ramdisk image:
```
SIM.ONE> tftp c4000000 ramdisk.gz.img
TFTP from server 192.168.0.1; our IP address is 192.168.0.51
Filename 'ramdisk.gz.img'.
Load address: 0xc4000000
Loading: #################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
#################################################################
done
Bytes transferred = 11676555 (b22b8b hex)
```
Use `bootm` command to start kernel with ramdisk:
```
SIM.ONE> bootm c0200000 c4000000
## Booting image at c0200000 ...
Image Name:   linux kernel
Image Type:   ARM Linux Kernel Image (gzip compressed)
Data Size:    1918495 Bytes =  1.8 MB
Load Address: c0080000
Entry Point:  c0080000
Verifying Checksum ... OK
Uncompressing Kernel Image ... OK
## Loading Ramdisk Image at c4000000 ...
Image Name:   linux ramdisk
Image Type:   ARM Linux RAMDisk Image (gzip compressed)
Data Size:    11676491 Bytes = 11.1 MB
Load Address: c4000000
Entry Point:  c4000000
Verifying Checksum ... OK
Starting kernel ...
```

## Programming the kernel image into flash memory ##

Use the `flin` command to get the flash layout:
```
SIM.ONE> flin                                                                             
Bank # 1: CFI conformant FLASH (16 x 16)  Size: 8 MB in 64 Sectors              
Erase timeout 16384 ms, write timeout 3 ms, buffer write timeout 3 ms, buffer size 32
  Sector Start Addresses:
    60000000 (RO) 60020000 (RO) 60040000 (RO) 60060000 (RO) 60080000
    600A0000      600C0000      600E0000      60100000      60120000
    60140000      60160000      60180000      601A0000      601C0000
    601E0000      60200000      60220000      60240000      60260000
    60280000      602A0000      602C0000      602E0000      60300000
    60320000      60340000      60360000      60380000      603A0000
    603C0000      603E0000      60400000      60420000      60440000
    60460000      60480000      604A0000      604C0000      604E0000
    60500000      60520000      60540000      60560000      60580000
    605A0000      605C0000      605E0000      60600000      60620000
    60640000      60660000      60680000      606A0000      606C0000
    606E0000      60700000      60720000      60740000      60760000
    60780000      607A0000      607C0000      607E0000
```
Each address means one sector. The sectors followed by "(RO)" are the FIRMWARE region so please don't touch!

Before programing images, you have to erase flash sectors:
```
SIM.ONE> erase 60080000 602bffff
```

Fetch the image file from your server
```
SIM.ONE> tftp 60080000 uImage 
```

Use the iminfo command in order to verify image's correctness:
```
SIM.ONE> iminfo       
                                                         
## Checking Image at 60080000...                                              
   Image Name:  Linux-2.6.36
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2325640 Bytes = 2.2 MB
   Load Address: c0008000
   Entry Point:  c0008000
   Verifying Checksum ... OK                                                   
SIM.ONE> 
```
now set some U-Boot variables in order to execute the Linux kernel from flash and after mount the SD/MMC card with the rootFS
```
SIM.ONE> set bootargs console=ttyAM0 root=/dev/mmcblk0p1 rootwait mmc_core.use_spi_crc=0
SIM.ONE> set bootcmd bootm 60080000 
SIM.ONE> saveenv
```

It is time to reboot!

## Compiling u-boot from source ##
To compile U-Boot from its source code: (and assuming you are using an arm cross compiler called `arm-linux-gnueabi-gcc`):
```
wget http://sim1.googlecode.com/files/u-boot-1.1.6-sim_one-20110329.tgz
tar xzf u-boot-1.1.6-sim_one-20110329.tgz
cd u-boot-1.1.6
CROSS_COMPILE=arm-linux-gnueabi- make sim_one_config
CROSS_COMPILE=arm-linux-gnueabi- make u-boot.bin
```
If you want to compile it natively on an ARM platform, it might work if you use
`CROSS_COMPILE=/usr/bin/` instead.

If you are using a gnueabi toolchain, it will complain a lot saying
```
warning: target CPU does not support interworking
```
but that's harmless (and not true!).

It should create a `u-boot.bin` file which you can program into the Sim.One's flash memory over a serial cable as described above in the "EP9307 loader" section using the `download` program.

# External links #
  * [ARM Linux Kernel Boot Requirements](http://www.arm.linux.org.uk/developer/booting.php)