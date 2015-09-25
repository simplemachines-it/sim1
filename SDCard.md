

# Characteristics #

The MMC/SD card is connected to the SSP (Synchronous Serial Port) bus of the EP9307 and is driven using the SPI (Serial Peripheral Interface) protocol, which is a simple protocol supported by both MMC and SD cards in addition their "native" access methods. Though slower, this ability allows their connection to embedded devices such as ours.

The SD card specifications state a maximum clock frequency of 25MHz, and the MMC
specifications state a maximum clock frequency of 52MHz (other docs say 20MHz); the highest SSP frequency that the EP9307 can generate is 3.7MHz in the revision E1 silicon used in the Sim.One (this rises to 7.4MHz in Rev E2 silicon).

See also
  * [an article about SPI transfers on Wikipedia](https://secure.wikimedia.org/wikipedia/en/wiki/Serial_Peripheral_Interface_Bus)
  * [a tutorial about driving MMC/SD cards over SPI at ELM](http://elm-chan.org/docs/mmc/mmc_e.html).

# Silicon #
The SSP/SPI hardware in the EP9307 is **not** the ARM AMBA PL022 silicon module, it is a Cirrus Logic implementation with a very similar register layout and functionality.

# Read/write speed #
With the Linux 2.6.24.7 Cirrus driver, the Sim.One reads SD/MMC cards at 256 kbyte/sec, but that speed consumes 100% CPU power. DMA and interrupts are not used; it simply waits for each transfer to complete. The 256KB/s speed is shared between reads and writes.

A new ep93xx SPI driver has been developed for the 2.6.35 kernel and it is included in our patch set for 2.6.34. It uses interrupts to free the CPU during transfers and results in a maximum data transfer speed of 373 kbyte/sec using 55% of the CPU.
Unlike the 2.6.24.7 Cirrus driver, it works reliably with MMC, SD and SDHC cards.

# Problems with the 2.6.24.7 driver #
With the 2.6.24.7 Cirrus driver, three error conditions have been reported, some harmless some not:

## mmcblk0: error -22 sending stop command ##
Typical console output:
```
mmcblk0: error -22 sending stop command
end_request: I/O error, dev mmcblk0, sector 1950712
Buffer I/O error on device mmcblk0, logical block 243839
```
Error numbers are negative `errno` values.

22 is EINVAL: "Request cannot be performed because of restrictions in hardware
and/or the driver"

This error is emitted once during every boot (for me!) but seems harmless.

See http://code.google.com/p/sim1/issues/detail?id=2

## mmcblk0: error -84 transferring data ##
```
mmcblk0: error -84 transferring data
end_request: I/O error, dev mmcblk0, sector 581756
```
Error 84 is EILSEQ: "Basic format problem with the received or sent data (e.g. CRC
check failed, incorrect opcode in response or bad end bit)".

This is the error we sometimes get during an apt-get, when it is doing two huge simultaneous file writes while still catching up with writing gzip output to the rootfs (the gunzipping of the downloaded package files).

Widespread read errors of this kind can occur to the point where the filesystem stops
working, making the machine unusable and a hard reset necessary.

See the same page as above for discussion of this.

## mmc0: error -110 whilst initialising SD card ##
Errno 110 is ETIMEDOUT. It occurs during boot, most often with SHDC cards (as supplied with the sim.one devkits):
```
Advanced Linux Sound Architecture Driver Version 1.0.15 (Tue Nov 20 19:16:42 2007 .
mmc0: error -110 whilst initialising SD card
Cirrus Logic ep93xx ac97 audio initialized
```
It then waits forever at
```
Waiting for root device /dev/mmcblk0p1...
```

# Problems with the 2.6.36 driver #

## CRC errors ##
We used to sometimes get reports of data errors when writing to the SD card.

This has been solved by adding `mmc_core.use_spi_crc=0` to the kernel command line in U-Boot. See [issue 15](https://code.google.com/p/sim1/issues/detail?id=15).

## Read errors using 4GB SDHC cards ##
4GB SDHC cards (maybe all SDHC cards?) make the kernel spew read errors as soon as they are inserted:
```
mmcblk0: error -38 sending status comand
mmcblk0: error -38 sending read/write command, response 0x4, card status 0xff04
end_request: I/O error, dev mmcblk0, sector 7744509
```
This seems to be due to the driver using a multi-block read command to read the last
blocks of the card, but failing to stop the multi-block read in time.

The 2.6.34 driver works the same way, but avoids this error condition by switching to single-block reads when it is reading the last blocks of the device.