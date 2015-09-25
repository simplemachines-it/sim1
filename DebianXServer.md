

Here's how to get the X Window System working on the Sim.One's video output with USB keyboard and mouse. You can perform these steps on the serial console or on the keyboard and screen.

# Install necessary software packages #
As root:
```
apt-get install xserver-xorg-video-fbdev xserver-xorg-input-kbd xserver-xorg-input-mouse xserver-xorg xfonts-base
```
You _can_ just install `xserver-xorg xfonts-base` but this installs 26 video drivers and 6 input drivers instead of just the ones that you need.

# Configure the X server to use the frame buffer #

## Debian release _lenny_ ##

Edit `/etc/X11/xorg.conf` to add the line:
```
   Driver "fbdev"
```
to the video device section thus:
```
Section "Device"
        Identifier      "Configured Video Device"
        Driver          "fbdev"
        Option          "UseFBDev"              "true"
EndSection
```
(the text editors `vi` and `nano` are pre-installed).

You might also like to set the default screen resolution by adding some lines to the "Screen" section so that it looks like this:
```
Section "Screen"
	Identifier	"Default Screen"
	Monitor		"Configured Monitor"
	DefaultDepth	16
	SubSection "Display"
		Depth	16
		Modes	"800x600"
	EndSubSection
EndSection
```
otherwise you'll get 640x400.

## Debian release _squeeze_ ##

No configuration is required.

# Test the X server #

You should now be able to start the X server manually
```
# X
```
and verify that moving the USB mouse moves the X cursor on the screen and that typing the Ctrl-Alt-Backspace chord on the USB keyboard makes the X server quit.

# Start a single application #

If you install the usual X startup system and a single small application
```
# apt-get install xinit rxvt
```
you should be able to get a usable terminal window on the X display using
```
# xinit /usr/bin/rxvt
```
or simply
```
# startx
```

# Use the Sim.One as a remote desktop #

If you have a server called `foo` on the local network that allows remote XDCMP sessions, you can use the Sim.One as an additional screen, keyboard and mouse by saying:
```
X -query foo
```
or, to open a session on any available XDCMP server:
```
X -broadcast
```
Adding this line near the end of {{{/etc/rc.local}}] turns your Sim.One into an automatic X terminal - a cheap way to get a room full of computers out of a single PC.

By default, most Linux distributions have remote XDMCP sessions disabled by default: search the web to find out how to enable them on yours.