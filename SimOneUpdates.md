

# Software updates #

## Install 16-bit U-Boot ##

To work around the "USB disconnect" bug which makes USB storage unusable, program our 16-bit-data-path version into flash.

You will need the Sim.One connected to its power supply and the serial console cable.

  * Connect a PC's serial port to the Sim.One's serial console port.
  * `wget http://sim1.googlecode.com/files/u-boot-1.1.6-simone-20110329.bin`
  * You'll need the "`download`" program. If you are using a Linux PC on an x86 CPU,<br><code>wget http://simplemachines.it/doc/flash/download/bin/download; chmod +x download</code><br>otherwise see <a href='http://code.google.com/p/sim1/wiki/BootLoader#Programming_the_U-Boot_loader_into_Flash'>Programming the U-Boot loader into Flash</a>
<ul><li><code>download u-boot-1.1.6-simone-20110329.bin</code><br>or, if you are using a USB serial port,<br><code>download -p USB0 u-boot-1.1.6-simone-20110329.bin</code><br>If it says "<code>Command not found</code>" try "<code>./download</code>" instead.<br>On the PC you should see:<br><code>Waiting for the board to wakeup...</code>
</li><li>Move JP1 of the Sim.One to pins 1 & 2 (towards the edge of the board and the ADDON connector) and power the Sim.One on (or reset it). On the PC you should see:<br><code>Downloading first boot code...</code><br><code>Downloading second boot code...</code><br><code>Program the nor FLASH</code><br><code>Programming the FLASH...</code><br><code>Successfully programmed 'u-boot-1.1.6-simone-20110329.bin'.</code>
</li><li>Move the Sim.One's jumper JP1 back to pins 2 & 3 but don't reset it yet if you are also going to do the next step.</li></ul>

<h2>Update U-Boot's configuration variables</h2>

<ul><li>With the serial port still connected to the Sim.One's console serial port, launch a terminal emulator on your PC at 57600 baud, no parity, 8 bits data, 1 stop bit, no hardware flow control.<br>
</li><li>Reset the Sim.One and press a key while it is saying<br><code>Hit any key to stop autoboot</code><br>You should get a prompt "<code>SIM.ONE&gt;</code>". Issue the commands:<br><code>set bootargs root=/dev/mmcblk0p1 rootwait mmc_core.use_spi_crc=0</code><br><code>set ipaddr 192.168.0.51</code><br><code>set netmask 255.255.255.0</code><br><code>set serverip 192.168.0.1</code><br><code>set bootcmd bootm 60080000</code><br><code>set bootfile</code><br><code>saveenv</code></li></ul>

<h2>Program Debian Linux kernel 2.6.36</h2>

The v1.3 Sim.One's have the Cirrus Login 2.6.24.7 Linux kernel programmed into Flash memory, which you should update to our 2.6.36 Debian kernel.<br>
<br>
As well as the serial cable and power lead, the following procedure also needs its ethernet port to be connected to the local network and a TFTP server on the local network at address 192.168.0.1 serving the file <a href='http://sim1.googlecode.com/files/uImage-2.6.36-debian-20101118'>uImage-2.6.36-debian-20101118</a> as "<code>uImage</code>". Issue the following commands at U-Boot's <code>SIM.ONE&gt;</code> prompt:<br>
<pre><code>erase 60080000 607fffff<br>
tftp 60080000 uImage<br>
</code></pre>

An alternative, which doesn't need the ethernet or TFTP server, is to load the file with Kermit, as S-Records or with Y-modem using the U-Boot commands <code>loadb</code>, <code>loads</code> or <code>loady</code>.<br>
If you succeed in doing this, please document the procedure here.<br>
<br>
<h2>Use the latest Debian root fiilesystem</h2>
Your SD or MMC card should be formatted as an ext2, ext3 or ext4 filesystem with <a href='http://sim1.googlecode.com/files/debian-squeeze-rootfs-20110301.tgz'>our Debian "squeeze" root filesystem tarball</a> unpacked onto it. For example, on your PC, assuming that your SD card appears as <code>sda</code> when it is inserted, the fastest-running filesystem is created using:<br>
<pre><code>mkfs -t ext2 -b 1024 -m 0 /dev/sda1<br>
tune2fs -c 0 -i 0 /dev/sda1<br>
mount /dev/sda1 /mnt<br>
wget http://sim1.googlecode.com/files/debian-squeeze-rootfs-20110301.tgz<br>
( cd /mnt &amp;&amp; tar xpSzf - ) &lt; debian-squeeze-rootfs-20110301.tgz<br>
umount /mnt<br>
</code></pre>
Be very careful to get the right device name here, because if your PC's hard disk is <code>sda</code>, the above commands can wipe your PC's disk clean. You can see the device name of the SD card by inserting it and then looking at the last few lines of the output of the <code>dmesg</code> command.<br>
<br>
<h1>Hardware updates</h1>

<h2>Reset hypersensitity workaround</h2>

<img src='http://simplemachines.it/foto/Sim.One reset workaround-mini.jpg' align='right' width='300' height='347'>
The reset switch is so electrically sensitive that the board will reset if you merely touch the contacts on the top of the push button. This is because the push button pulls the Reset line low but the only thing pulling it high is the MIC2774's internal pull-up resistor, which only supplies 100nA typically.<br>
<br>
The workaround is to add a 1K resistor between pins 3 & 5 of U3, as ahown as in the photo (pin 5 (3.3V) is also available at the through-hole just above U3).