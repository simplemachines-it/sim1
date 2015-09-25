# Character LCD driver #

This driver is built across two kernel modules which are part of [Lcd-Linux](http://lcd-linux.sourceforge.net/). We modified one of the two modules (hd44780.ko) to let it work with the Sim.One Character LCD port (originally it works on a PC's parallel port) and cut out some of the features not usable on our hardware to make it lighter.

![http://simplemachines.it/images/display.jpg](http://simplemachines.it/images/display.jpg)

The Lcd-Linux project it's similar to the famous [LCD4Linux](https://ssl.bulix.org/projects/lcd4linux/) but it adapts better to embedded systems.

Here are some examples:
https://ssl.bulix.org/projects/lcd4linux/wiki/Features

For further details see the lcd-linux manual:
[How to use the lcd driver for LCD displays under Linux](http://lcd-linux.cvs.sourceforge.net/viewvc/lcd-linux/lcd-linux-new/Documentation/lcd-linux.txt?view=markup)