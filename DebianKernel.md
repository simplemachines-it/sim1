

# Building the kernel on a Debian x86 box #
## Install native build tools ##
```
apt-get install gcc make uboot-mkimage
```
If you want to use "make menuconfig", add `libncurses-dev` too
## Get the emdebian cross compiler ##
Add
```
deb http://www.emdebian.org/debian/ lenny main
```
to your `/etc/apt/sources.list` file and run
```
apt-get update
apt-get install gcc-4.3-arm-linux-gnueabi
```
In Ubuntu, from release 10.10 ("maverick"), a cross compiler is included in the
"universe" package repository:
```
apt-get install gcc-4.4-arm-linux-gnueabi
```
## Fetch the mainline kernel sources ##
```
wget http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.36.tar.bz2
tar xjf linux-2.6.36.tar.bz2
```
## Fetch and apply the kernel patches ##
```
apt-get install mercurial quilt
hg clone https://sim1.googlecode.com/hg/ sim1
cd linux-2.6.36
ln -s ../sim1/linux-2.6.36-patches patches
quilt push -a
```
or, if you don't want to install mercurial and quilt,
```
wget -r -np -nH http://sim1.googlecode.com/hg/linux-2.6.36-patches/
cd linux-2.6.36
for a in `cat ../hg/linux-2.6.36-patches/series`
do
    patch -p1 < ../hg/linux-2.6.36-patches/$a
done
```
## Configure the kernel ##
To configure for use with a Debian root filesystem:
  * built-in support for booting from SD/MMC card or USB storage using ext2/3/4 or with NFSroot
  * drivers for the on-board hardware, mostly built into the kernel:
    * MMC, USB, ethernet, real-time clock, video frame buffer built in
    * audio driver as module `snd_soc_simone` (Debian needs audio drivers as modules)
  * drivers for every possible device and option as modules, the same as other Debian systems (26.8MB of modules)

```
wget http://sim1.googlecode.com/hg/config-2.6.36-debian
mv config-2.6.36-debian .config
ARCH=arm make oldconfig
```
Alternatively, for a kernel with a minimal set of drivers, all built into the kernel with no loadable modules (larger kernel, smaller filesystem):
```
ARCH=arm make simone_defconfig
```
## Compile the kernel ##
```
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make uImage modules
```
Error messages saying something like
```
/tmp/ccY2difo.s: Assembler messages:
/tmp/ccY2difo.s:1542: rdhi, rdlo and rm must all be different
```
are harmless.

## Install the kernel image and modules ##
How you do this depends on your setup. At present my Sim.One bootloader is set up to download the kernel from my main server using `tftp` and it has its root filesystem on an SD card so I mount its SD card under `/mnt/sda1` and say:
```
cp -p arch/arm/boot/uImage /tftpboot/    # standard Debian uses /srv/tftp
INSTALL_MOD_PATH=/mnt/sda1 ARCH=arm make modules_install
```
## Make distfiles ##
I make the files I upload to the Downloads section like this: as root,
```
mv arch/arm/boot/uImage ../uImage-2.6.36-`date +"%Y%m%d"`
```
or, for the Debian configuration with kernel modules:
```
mv arch/arm/boot/uImage ../uImage-2.6.36-debian-`date +"%Y%m%d"`
INSTALL_MOD_PATH=.. ARCH=arm make modules_install
cd ..
rm lib/modules/*/{build,source}
tar czf modules-2.6.36-debian-`date +"%Y%m%d"`.tgz lib
```
Actually, this is not true. The above procedure bundles up the modules OK, but the indices, needed to be able to load them, are not created properly. To get the final version of the module directory, you have to boot the new kernel with the modules in its filesystem and run
```
depmod -a
```
as root.  The actual distributed tarballs are made from the resulting `/lib/modules/2.6.36` directory.
# Hacking the patches #
Working on a repository of patches to a standard source is rather unusual but here's how:

Suppose you have done the above steps as far as "`quilt push -a`", you are currently in the `linux-2.6.36` directory and you want to make a change to the touchscreen code.
```
$ quilt series
simone-add-mmc_spi.patch
ep93xx-cpuinfo.patch
ep93xx-touchscreen.patch
mmc_spi-fix-SDHC.patch
0001-ASoC-add-ep93xx-AC97-audio-driver.patch
0002-ARM-ep93xx-add-AC97-platform-support.patch
0003-ASoC-ep93xx-add-Simplemachines-Sim.One-AC97-audio.patch
arm-fix-dma-mapping.patch
simone_defconfig.patch
simone-set-video-modes.patch
$
```
Undo all the patches back to the touchscreen one:
```
$ quilt pop ep93xx-touchscreen.patch
```
see which files it modifies:
```
$ quilt files
drivers/input/touchscreen/Kconfig
drivers/input/touchscreen/Makefile
drivers/input/touchscreen/ep93xx_ts.c
```
You can edit one or more of those files, then update the patch with
```
$ quilt refresh
```
The kernel will build cleanly with any number of patches applied so you can test your code syntax. However, the `simone_defconfig` and the board definition come with the last patch, so you will need to
```
$ quilt push -a
```
to build a kernel that can be tested on the Sim.One.

If you are authorized to do so, you can update the Googlecode repository with your changes:
```
cd ../sim1
hg commit    # commit your changes to the local repository
hg push      # send your changes to google code
```
which will ask for your google username (e.g. "martinwguy") and your Google Code password, which you can find [here](https://code.google.com/hosting/settings).