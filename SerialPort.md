# Hardware #

In silicon, the serial ports are implemented on the EP9307 system-on-chip using ARM's PL011 design.

On Sim.One hardware up to version 1.3, this drove an 8-pin RJ45 socket with converter cable to a 9-pin D-sub connector.

From Sim.One v1.4, there will be a male 9-pin D-sub connector on the base board with conventional pin-out.

# Software #

The Linux 2.6.36 driver for PL011 hardware works fine except for hardware flow control, which doesn't because the RTS and CTS connections are swapped over in the kernel. A fix is forthcoming...