

# How to copy root filesystem to MMC/SD card #

  1. Backup your MMC/SD card. All files will be deleted!
  1. Download, unpack the root filesystem.
  1. Mount card and untar package.
  1. Umount card.

Your device node may be sda1, sdc1 instead of sdb1! Be careful!
Note: You can change the partition type to 0x82 (Linux) with fdisk, but it is not necessary.

We tune everything for speed:
```
wget http://sim1.googlecode.com/files/debian-armel-lenny-rootfs-20091017.tgz
mkfs.ext2 -b 1024 -m 0 /dev/sdb1
tune2fs -c 0 -i 0 /dev/sdb1
mount /dev/sdb1 /mnt
tar xpSf debian-armel-lenny-rootfs-20091017.tgz -C /mnt
umount /mnt
```

# How to boot the kernel #
You should use the following boot arguments if you want to use your MMC/SD card as root filesystem. Using U-Boot:
```
SIM.ONE> set bootargs console=ttyAM0 root=/dev/mmcblk0p1 rootwait mmc_core.use_spi_crc=0
SIM.ONE> saveenv
SIM.ONE> boot 
```