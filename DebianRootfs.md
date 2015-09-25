

# Making a Debian root filesystem for the Sim.One using debootstrap #
Here's one way to make a Debian root filesystem for the Sim.One.

I prepare the root filesystem on some fast host, then
transfer it to the Sim.One to complete the installation.

## Create the base system on some other computer ##
Working as user `root`:
### Prepare the media ###
Here, I'm using a USB pendrive, whose single partition appears as `/dev/sdb1`;
if you use an SD card, it'll be `/dev/mmcblk0p1` instead. Although the final filesystem can be made to fit into 128MB, you'll need a 256MB device to be able to create it.

If your desktop opens the device automatically, you'll need to close that window and "`umount /dev/sdb1`" first.
```
mkfs -t ext4 -b 1024 -m 0 /dev/sdb1
```
  * `-t ext4`: use a filesystem that doesn't corrupt on power-off
  * `-b 1024`: use the smallest blocksize because read/writes are slow and space is limited
  * `-m 0`: Don't reserve 10% for root-only use as there is not much space

Don't periodically check already-clean volumes because it is time-consuming
```
tune2fs -c 0 -i 0 /dev/sdb1
```
Make the new medium visible on your host computer
```
mount /dev/sdb1 /mnt
```
### Create a "foreign" Debian filesystem ###
Dump an initial filesystem onto the medium, up to the point where you need to run native programs on a real ARM processor
```
apt-get install debootstrap
debootstrap --arch armel --foreign wheezy /mnt http://ftp.debian.org/debian
```
Change directory into the new root filesystem
```
cd /mnt
```
Zap some configurations that were copied from the host system
```
echo simone > etc/hostname
> etc/resolv.conf
```
Create missing devices in the static `/dev`
```
mknod dev/ttyAM0 c 204 16
mknod dev/rtc0 c 254 0
ln -s rtc0 dev/rtc
mknod dev/mmcblk0 b 179 0
mknod dev/mmcblk0p1 b 179 1
mknod dev/sda b 8 0
mknod dev/sda1 b 8 1
```
Install the kernel modules into the root filesystem.
If you have compiled your own kernel 1Gyou can use:
```
cd ~/linux-simone/linux-2.6.36
INSTALL_MOD_PATH=/mnt make modules_install
rm /mnt/sda1/lib/modules/*/{build,source}
```
or if you downloaded the kernel image you should fetch its modules tarball and unpack it into the Debian root filesystem:
```
cd
wget http://sim1.googlecode.com/files/modules-2.6.36-debian-20101118.tgz
tar xzf modules-2.6.36-debian-20101118.tgz -C /mnt
```
If you don't need the modules, you will at least need to `cd` out of `/mnt`
so that you can unmount it.

Now unmount the storage and wait for the prompt to return before unplugging it
```
umount /mnt
```
## Complete the installation on the Sim.One ##
### Boot the base system ###
Now move the pendrive to one of the Sim.One's USB sockets and boot it into a single-user shell, talking to it over the serial port at 57600 baud.

The following settings are for a USB pendrive.
If your root filesystem is on an SD card, use `root=/dev/mmcblk0p1` instead.

First load a Debian EABI kernel.
Here is my setup to fetch it from a file called "uImage" on a tftp server:
```
SIM.ONE> set ipaddr 10.0.0.51
SIM.ONE> set netmask 255.255.255.0
SIM.ONE> set serverip 10.0.0.1
SIM.ONE> set bootfile uImage
SIM.ONE> set bootcmd 'tftp c0200000; bootm'
SIM.ONE> set bootargs console=ttyAM0 root=/dev/sda1 rootwait mmc_core.use_spi_crc=0
SIM.ONE> saveenv
```
alternatively, you can write the image to flash memory:
```
SIM.ONE> set ipaddr 10.0.0.51
SIM.ONE> set netmask 255.255.255.0
SIM.ONE> set serverip 10.0.0.1
SIM.ONE> erase 60080000 602bffff
SIM.ONE> tftp 60080000 uImage
SIM.ONE> set bootcmd bootm 60080000
SIM.ONE> set bootargs console=ttyAM0 root=/dev/sda1 rootwait mmc_core.use_spi_crc=0
SIM.ONE> saveenv
```
Just this once, we want it to boot into a single-user shell:
```
SIM.ONE> set bootargs console=ttyAM0 root=/dev/sda1 rootwait mmc_core.use_spi_crc=0 init=/bin/sh
SIM.ONE> boot
```
### Complete the base installation ###
When you get a shell prompt on the Sim.One, set up the environment and install the core packages.
On an SD card, this step takes just under an hour. On USB pendrive under
half an hour. It's time to take a break!
```
export PATH    # For some reason it is set but not exported
debootstrap/debootstrap --second-stage
```
This is the point at which maximum filespace is used: 243986 KB.

If, during this step, you get I/O errors from the USB storage or "USB disconnect" messages on the console, it may be that you are using Sim.One hardware before v1.4 and have not set it to access the RAM in 16-bit mode. Fetch `u-boot-*-16bit.bin` from the Downloads page
```
wget http://sim1.googlecode.com/files/u-boot-1.1.6-simone-20091201-16bit.bin
```
and program it with the "`download`" utility as described on the BootLoader wiki page at the section "EP9307 loader" -> "Programming the U-Boot loader into Flash".
### Clean up after debootstrap ###
```
apt-get clean
```
### Set the date ###
If the real-time clock is not set correctly, you might like to do so now.
Here we set it to 12:45 on the 1st March 2011
```
date 030112452011
```
### Create kernel module indices ###
If you installed the modules (above) from your own kernel compilation, you will need to
build the module index files before kernel module loading will work. The module tarballs should have had this step performed already, but you can do it anyway to make sure; it takes about a minute.
```
depmod -a
```
### Create basic configurations ###
Filesystem mount table
```
cat > etc/fstab << \EOF
# /etc/fstab: static file system information.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/dev/root       /               auto    defaults        0       1
proc            /proc           proc    defaults        0       0
EOF
```
Arrange for a login shell to be started on the serial port
```
cat >> /etc/inittab << EOF
# Serial port of Sim.One
# 
S0:23:respawn:/sbin/getty -L ttyAM0 57600 vt100
EOF
```
and allow root logins on it
```
echo ttyAM0 >> /etc/securetty
```
If this filesystem is for personal use,
you probably want to set a root password at this point.
```
passwd
```
For the distribution instead, we clear the root password
```
passwd -d root
```
Arrange for the audio modules to be loaded at system startup
```
echo snd-soc-simone >> /etc/modules
```
Configure the network to auto-configure the ethernet with DHCP
```
cat >> /etc/network/interfaces << \EOF

# The primary network interface
auto eth0
iface eth0 inet dhcp
# Generate a unique locally-assigned MAC address from CPU serial number
pre-up ifconfig eth0 hw ether `sed -n 's/^Serial.* 000000/02/p' /proc/cpuinfo`
EOF
```
Now boot into the proper system
```
exec /sbin/init
```
and log in as root
```
simone login: root
```
Set up the software package management system.
You might prefer to use a local mirror such as `ftp.it.debian.org`
- see http://www.debian.org/mirror/list for a complete list -
and for the best in multimedia you might also like to add
`deb http://deb-multimedia.org wheezy main non-free`
```
cat > /etc/apt/sources.list << EOF
deb http://ftp.debian.org/debian wheezy main
deb http://security.debian.org wheezy/updates main
deb http://simplemachines.it/debian armel-wheezy+crunch/
EOF
apt-get update
apt-get upgrade
```
Adding these package lists makes a new high-water mark for filesystem size of 229519KB.
### Save space ###
Install localepurge to save 44 MB of multi-language message translations.
Press Enter at "Do you want to continue?"
and go ahead with "No locales" when it asks:
Tab Enter... Tab Enter.
```
apt-get install localepurge
localepurge
```
Remove downloaded copies of packages (again!)
```
apt-get clean
```
You can save another 14MB by removing the documentation, leaving the directory structure so that future `apt-get install` operations won't fail due to missing directories.
I don't do this in the standard distribution.
```
find /usr/share/man ! -type d -print0 | xargs -0 rm
apt-get purge info man-db      # Do you want to continue [Y/n]? [Enter]
rm -r /usr/share/doc/*
rm /usr/share/info/*.gz
rm `find /etc/alternatives -name '*.gz'`
```
Remove pointless backups, log files and temporary files
```
rm /usr/share/info/dir.old
rm /var/cache/debconf/*.dat-old
rm /var/log/{bootstrap,dpkg}.log
rm /var/log/*.?
rm /tmp/*
for a in /var/log/{*.log,apt/*.log,debug,dmesg,faillog,messages,syslog,wtmp}
do
    > $a
done
```
If you're making a system to distribute, you can also remove the downloaded
package lists
```
rm /var/cache/apt/* /var/lib/apt/lists/*
```
All done. Close down and celebrate.
```
halt
```
The final size of the filesystem without the package lists is 134231 Kbytes. Removing the documentation leaves about 120MB.