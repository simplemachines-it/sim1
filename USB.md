The Sim.One has three USB 1.1 "host" interfaces: two are on standard connectors on the edge
of the main board and the third's data signals are present on the multi-function ADDON connector.

USB 1.1 runs a two speeds: 12MHz for full speed devices and 1.5MHz for low-speed devices (such as keyboard and mouse), resulting in a maximum data rate of 923 kbytes/second for one device, and just over 1000 for two used in parallel.

## Hardware bug ##

### Overview ###

For the USB storage to work reliably, the Sim.One must be accessing its RAM in 16-bit mode (not 32) to avoid a timing bug in the USB silicon. The symptom of using 32-bit mode is that the storage becomes unavailable at random ("USB disconnect" messages), so is not yet suitable for a rootfs.
16-bit mode is set by programming the `u-boot*16bit.bin` firmware image on the Downloads page.

Sim.One v1.3 and before were shipped with 32-bit u-boot, so need reprogramming to get reliable USB. In 32-bit mode thay have 64MB RAM, in 16-bit mode they have 32MB.

Sim.One v1.4 and onward use 16-bit RAM access by default (for this reason).

### Detail ###

Unfortunately, the EP9307 revision E1 silicon used in the first production run of the Sim.One has a hardware bug in the USB section whose symptom is that devices suffer random "USB disconnect" failures. For keyboard and mouse this is not a problem, as they reconnect straight away, but makes USB storage (and other stateful devices) unusable. The symptom for USB storage is that a pen drive (say `/dev/sda`) will work for a number of minutes, then suddenly stops responding and after a few seconds reappears as another, new, USB storage device (`/dev/sdb`). If you start using that it will eventually disconnect and reappear as `sdc`, and so on.

The [EP9307 rev E1 errata](http://www.cirrus.com/en/pubs/errata/ER667E1REV2.pdf) describe the hardware bug thus:

<blockquote>
<b>Description</b>

Outgoing USB DMA transfers may be corrupted if the data buffer is not quad word aligned or if the data<br>
buffer length is not an integer number of quad words. USB quad word and single word transfers are not<br>
affected.<br>
<br>
<b>Workaround</b>

Make the transmit buffers used by the USB device aligned on a quad word boundary, i.e. the start address<br>
ends in a 0x0 nibble, and make the buffer length an integer number of quad words, i.e. the length in bytes<br>
ends in a 0x0 nibble. This can be achieved by padding the transmit buffer structure by the appropriate<br>
number of bytes.<br>
<br>
Incoming USB data is not affected.<br>
<br>
A fix for this bug has been implemented for silicon revision E2.<br>
</blockquote>

Though it is not clear how one is supposed to pad all outgoing USB messages to multiples of 16 bytes in size without making a nonsense of the USB traffic itself. Mounting USB storage volumes in read-only mode is not enough, since "outgoing" messages are still sent to them to request the reading of blocks of data.

### Sim.One workaround ###
The only workaround we have at present is to run the Sim.One's SDRAM in 16-bit-wide mode, which slows the system down by 10% and halves the amount of available RAM from 64MB to 32MB. However, the slightly slower RAM timing seems to prevent the hardware bug from being triggering.

This also changes the physical memory map from the usual two 32MB banks
```
	c0000000-c1ffffff
	c4000000-c5ffffff
```
to four 8MB banks
```
	c0000000-c07fffff
	c1000000-c17fffff
	c4000000-c47fffff
	c5000000-c57fffff
```

To apply this workaround to Sim.One's up to v1.3, you need to flash the 16-bit version of `u-boot` to the Sim.One, available on [the Downloads page](http://code.google.com/p/sim1/downloads/list).

Sim.One v1.4 and onward always run in 16-bit mode but can access the whole 64MB.