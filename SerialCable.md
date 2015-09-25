# Erratum corrige #
The mauve cables shipped with the first batch of developer boards were miswired: RTS and CTS were swapped, as were DSR and DTR.  The result is massive data corruption, looking like line noise.  Two possible fixes are:

  1. Slit the cable open half way and cut the green, yellow, black and yellow wires, leaving TXD, RXD and GND.
  1. Cut the cable and reconnect it, swapping the CTS and RTS signals as well as the DTR and DSR signals.

The following connection schemas were also wrong (corresponding to the erroneous cables), corrected 3 Nov 2010.

# Simone UART DTE serial cable #
Electrical pins configured as (DTE) Data Terminal Equipment like the PC's serial ports

RJ45 (male) <======> D-Type-9 (male) PC-like

|RJ45|D-Type-9|  Abbrev.  |Full name          |Colour |
|:---|:-------|:----------|:------------------|:------|
|1   |   7    |    RTS    |Request To Send    |Green  |
|2   |   4    |    DTR    |Data Terminal Ready|Yellow |
|3   |   3    |    TD     |Transmit Data      |Orange |
|4   |   5    |    SG     |Signal Ground      |Red    |
|5   |   5    |    SG     |Signal Ground      | -     |
|6   |   2    |    RD     |Receive Data       |Grey   |
|7   |   6    |    DSR    |Data Set Ready     |Black  |
|8   |   8    |    CTS    |Clear To Send      |Blue   |

To connect this cable to a PC, you need a [null modem cable](http://it.wikipedia.org/wiki/File:Null_modem_DB-9_7-wire.svg)
from this cable to the PC.

# Simone UART to PC cable #
Electrical pins configured as (DCE) Data Communications Equipment
to connect straight to a PC serial port.

RJ45 (male) <======> D-Type-9 (female)

|RJ45  |   D-Type-9 |    Abbrev.  |       Full name|
|:-----|:-----------|:------------|:---------------|
|1     |     8      |     CTS     |       Clear To Send|
|2     |     6      |     DSR     |       Data Set Ready|
|3     |     2      |     RD      |       Receive Data|
|4     |     5      |     SG      |       Signal Ground|
|5     |     5      |     SG      |       Signal Ground|
|6     |     3      |     TD      |       Transmit Data|
|7     |     4      |     DTR     |       Data Terminal Ready|
|8     |     7      |     RTS     |       Request To Send|

Note that on the first hundred Sim.One circuit boards, the square pad is pin 8, not pin 1, and the labelling of the pins (1/5 - 7/8) is also wrong.