# Files #

---

|`Simone_v1.3_Schematics-*.pdf`|Circuit diagrams for the Sim.One|
|:-----------------------------|:-------------------------------|

A dozen sheets of circuitry. Handy to see what is on each of the connectors!

---

|`u-boot-1.1.6-simone-20110329.bin`|The boot loader for the Sim.One|
|:---------------------------------|:------------------------------|
|`u-boot-1.1.6-simone-20110329.tgz`|Source code for the boot loader|

This is the downloadable binary image and the source code for the U-Boot boot loader for the Sim.One. It always works in 16-bit mode (see below) so is suitable for all Sim.One boards.

Owners of older Sim.One boards with two SDRAM chips (U9 and U10) will only see 32MB of RAM when using this bootloader but will have reliable USB storage and devices.
To use these devices with 64MB available and 10% faster but with unreliable USB, you can use our 20091201 non-16-bit version of U-Boot.

For compilation instructions, see the BootLoader page.

---

|`u-boot-1.1.6-simone-20091201-16bit.bin`|Hacked U-Boot to workaround USB disconnect problem|
|:---------------------------------------|:-------------------------------------------------|
|`u-boot-1.1.6-simone-16bit.patch`       |Source code modification for the hacked U-Boot    |

This is an earlier version of U-Boot for Sim.One v1.3 boards that have both RAM chips (U9 and U10) and is modified to work round a hardware bug in the EP9307 revision E1 silicon. The bug only allows the reliable use of USB keyboard and mouse devices; other devices, such as USB storage drives, suffer "USB disconnect" failures at random.

This version of U-Boot works around the hardware bug by accessing the RAM in 16-bit mode, which alters the timing sufficiently not to tickle the hardware bug. This slows the whole system by 10% and halves the available RAM to 32MB.

An alternative workaround for those boards, without reprogramming this U-Boot into flash, is simply to remove chip U10.

---

|`uImage-2.6.24.7-debian-*`|Kernel image of Debian Linux 2.6.24.7|
|:-------------------------|:------------------------------------|
|`debian-armel-lenny-rootfs-20091017.tgz`|Debian "armel" lenny root file system for linux 2.6.24.7|

These are what you'd need to download for a basic Debian system for the board, and are what is in the flash memory and on the SD card as supplied to developers. The kernel can be loaded from internal Flash memory, or u-Boot can be programmed to load the `uImage` from a file server by TFTP and it has the drivers built in to run a rootfs as ext2 or ext3 on an SD card or USB storage, or over NFS.

|`uImage-2.6.36-debian-*`|Kernel image of Debian Linux 2.6.36|
|:-----------------------|:----------------------------------|
|`debian-lenny-rootfs-*.tgz`|Debian "armel" lenny root file system for linux 2.6.36|

This is our more recent kernel, which contains a working audio driver and a much faster SD-card data transfer rate, and associated Debian root filesystem.

This is the rootfs version that is recommended for production use on the Sim.One.

|`debian-squeeze-rootfs-*.tgz`|Debian "armel" squeeze root file system for linux 2.6.36|
|:----------------------------|:-------------------------------------------------------|

This is for the more recent release 6.0.0 of Debian from 6 Feb 2011 ("lenny" is from 14 Feb 2009). It works with our same 2.6.36 kernel as above, but some things (X Server, crunch accelerated packages) aren't working yet (see Issues).


---

|`linux-2.6.*-patches-*.tgz`|Snapshot of patches to Linux source|
|:--------------------------|:----------------------------------|

These are the patches you need to apply to the standard linux source code to compile the kernel yourself.

---

|`uImage-2.6.*-*`|Kernel image with default configuration|
|:---------------|:--------------------------------------|
|`modules-2.6.*-*.tgz`|Kernel modules for default kernel image|

These kernels are built according to the default `ARCH=arm make simone_defconfig` which has a minimal set of support for the usual needs, all of which is built in to the kernel.

---

|`config-2.6.*-debian-*`|Debian config for Linux kernel|
|:----------------------|:-----------------------------|
|`uImage-2.6.*-debian-*`|Kernel image with Debian configuration|
|`modules-2.6.*-debian-*.tgz`|Kernel modules for Debian linux image|

These are the linux kernel configuration, kernel image and modules suitable for use with a Debian filesystem. The Sim.One's built-in devices are built in to the kernel, as are ext2, ext3, jffs and nfsroot filesystem support. Drivers for every possible device that could be used with the Sim.One are included as loadable modules.

## Kernel versions ##
2.6.24.7 is Cirrus Logic's version of the kernel from 2004, including drivers for all the Sim.One devices. However their code gives buggy support: read/write errors to SD cards and occasional bursts of noise or silence from the audio card.

From version 20091001, it includes a patch to show the serial number in `/proc/cpuinfo`. This is used in the Debian filesystem to set the ethernet's MAC address to something unique, instead of always being 00:BA:D0:0B:AD:00, so that multiple Sim.Ones can be used on the same ethernet segment. The code for the `/etc/network/interfaces` hack to do this is on the DebianRootfs page under "Create basic configurations".

20091017 versions is that the ALSA audio driver is built into the 1017 uImage, whereas it is loadable modules in 1001 (so you need to "`modprobe snd-ep93xx-ac97`" or to add `snd-ep93xx-ac97` to `/etc/modules` to get audio support). This turns out to be step backward because the `oss-compat` package, which creates `/dev/dsp` and `/dev/mixer` for programs that only support OSS audio, only works if the ALSA drivers are present as modules. The kernel source (and patches) is the same for both.

2.6.34, from 2010, contain faster, more reliable community-contributed code for everything, but does not have a driver for the audio chip.

2.6.36 includes a driver for the audio.