

# Filesystem factors #
## Storage medium ##
Putting the root filesystem on different media affects the system speed.

| Medium                          | SD/MMC | USB | NFS  |
|:--------------------------------|:-------|:----|:-----|
| Maximum transfer speed (kB/sec) | 387    | 965 | 3400 |
| System CPU usage at full speed  | 18%    | 8%  | 100% |

Note that in Sim.One's up to v1.3, USB storage is only reliable when the 16-bit u-boot image has been programmed into the on-board flash to avoid a bug in the silicon. Sim.One v1.4 fixes this by always running in 16-bit mode.

The fastest-loading system is obtained by putting the root filesystem on an NFS server and accessing it over the network. Boot runes are something like:
```
set bootargs console=ttyAM0 root=nfs nfsroot=192.168.0.1:/tftpboot/simone-rootfs ip=dhcp mmc_core.use_spi_crc=0
```
or, to set a fixed ip address during boot (and hence for the duration of the Linux session also)
```
set bootargs console=ttyAM0 root=nfs nfsroot=192.168.0.1:/tftpboot/simone-rootfs,nfsvers=3 ip=192.168.0.51::192.168.0.254:255.255.255.0 mmc_core.use_spi_crc=0
```
where the essential `ip}} parameters are {{{ip=my-address:::netmask`

## Filesystem options ##
To reduce the quantity of disk access, we format the SD card with the simplest filesystem and the smallest block size
```
mkfs -t ext2 -b 1024 /dev/mmcblk0p1
```
and disable the periodic consistency checks (it will be checked anyway if the machine was not shut down cleanly)
```
tune2fs -c 0 -i 0 /dev/mmcblk0p1
```
(if you're creating the filesystem on a faster host via an SD-to-USB adapter, you will need to say `sda1` or `sdb1` or whatever instead of `mmcblk0p1`.

When it **does** have to `fsck` the filesystem, the time it takes appears to depend on the size of the media, not the amount of data stored on it, so using the smallest MMC card you can get away with is a win (256MB for a lightly populated Debian system).



# Stop video frame buffer memory accesses #
If you compile the frame buffer driver as a module and don't insert it, the Sim.One performs about 10% faster on CPU-bound tasks because of the constant accesses to RAM by the video hardware to keep the display refreshed.

Note: if you find you can load the `ep93xxfb` module but not unload it again because it is being used, you should check that
  * `fbcon` ("Use frame buffer as console") is a module or deselected (i.e. not built-in)
  * `/etc/inittab` does not contain lines that open login sessions on the `ttyX` devices (which are provided by `fbcon`)

# Use the FPU #
Compiling floating-point intensive applications and libraries to use the MaverickCrunch FPU gives between 2.5 and 4 times speedup compared to the default soft-float math routines.

Unfortunately, generation of Crunch code in mainline GCC has never worked: the hardware has a dozen subtle timing bugs that must be avoided by not putting certain pairs of instructions consecutively or within a certain number of cycles of each other.

Simplemachines, Arenque and others funded development of working patches to GCC - native compilers are available from http://simplemachines.it/tools (of which gcc-4.2 is the fastest and produces the smallest code) and a description of the modifications to GCC is at http://martinwguy.co.uk/crunch

Simplemachines also provide a small repository of Debian packages that contains accelerated versions of some (mostly audio) libraries and applications. `/etc/apt/sources.list` already includes this in the Debian filesystem for the Sim.One:
```
deb http://simplemachines.it/debian armel-lenny+crunch/
```
or
```
deb http://simplemachines.it/debian armel-squeeze+crunch/
```
If you don't know which you are using, look at `/etc/apt/sources.list`

If you need any other FP-intensive packages compiled for Crunch, ask martinwguy.
If you'd like a cross-compiling crunch-enabled toolchain or updates
to the patches for gcc-4.4 and 4.5 (smaller, faster code!), please ask my rates for open source work!

# Add swap #
Add some swap space to free up some memory.

## On SD card ##
Lazy man's way:
```
dd if=/dev/zero of=/swapfile bs=1M count=64
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab
```

## On USB storage ##
On USB pendrive is both 4 times faster in transfers, but unlike the SD card it doesn't hog the CPU during transfers, so with mild swapping going on, full speed is maintained.
Unfortunately, USB is unreliable at present sufferint random disconnects - losing access to swapped-out pages can freeze the system.

## Over the network ##
Swapping is possible over the network. Create a 64MB file somewhere on some server, `mkswap` it and make a Network Block Device (NBD) out of it with `nbd-server`.
On the client machine, run `nbd-client` to attach it as `/dev/nbd0`, then swap onto it.

First create a swap file on some server
```
cd /tftpboot
dd if=/dev/zero of=sim1.swap bs=1M count=64
mkswap sim1.swap
```
To make it available as a Network Block Device, install `nbd-server` on your fileserver, put something like this in its `/etc/nbd-server/config`:
```
[generic]
        user = nbd
        group = nbd
[sim1]
        exportname = /tftpboot/sim1.swap
        port = 2024
```
then "`/etc/init.d/nbd-server restart`" to make it available.

On the clients, install `nbd-client` and use "`nbd-client host port nbd-device`".
For example:
```
sim1:# nbd-client 10.0.0.1 2024 /dev/nbd0
sim1:# swapon /dev/nbd0
```

If you add `nbd-client`'s `-swap` flag, intended for devices that will be used as swap, that seems to stop it from working at all!

After you install `nbd-client`, if you get the error message:
```
nbd: Unknown parameter `max_part'
```
that is because `nbd-client` installer automatically creates a file `/etc/modprobe.d/nbd-client` with inside "`options max_part=...`".
If you delete its contents then "`/etc/init.d/nbd-client restart`" will not show the error any more.

To stop using the network block device properly from the client:
```
sim1:# swapoff /dev/nbd0
sim1:# nbd-client -d /dev/nbd0
```