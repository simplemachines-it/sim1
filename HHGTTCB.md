


# Sim.One v1.3 circuit board #

See [the circuit diagram](http://sim1.googlecode.com/files/Simone_v1.3_Schematics-20090919.pdf).

## Connectors ##
|Name	|Pins	|Function|
|:----|:----|:-------|
|ADDON1|20x2	|Add-On Bus connector            ([pinout](HHGTTCB#ADDON1_pins.md))|
|CON1	|11	  |SD/MMC card socket              ([pinout](HHGTTCB#CON1_pins.md))|
|CON2	|8	   |Serial port 0 / modem interface ([pinout](HHGTTCB#CON2_pins.md))|
|CON3	|20x2	|External LCD panel              ([pinout](HHGTTCB#CON3_pins.md))|
|CON4	|8	   |Ethernet RJ45                   ([pinout)](HHGTTCB#CON4_pins.md)|
|J1	  |5	   |Headphone output|
|J2	  |3	   |Microphone input|
|J3	  |2	   |Power input (7.2V DC, positive center)|
|J4	  |9	   |USB port 0|
|J5	  |4	   |USB port 1|
|J7	  |15	  |DB-15 VGA video output|
|JP9	 |20x2	|Power bus                       ([pinout)](HHGTTCB#JP9_pins.md)|
|JP10	|10x2	|Multi-ICE header (JTAG)|
|JP13	|40x1	|LCD panel                       ([pinout)](HHGTTCB#JP13_pins.md)|
|JP14	|4	   |Touch screen|
|JP15	|16x1	|LCD display (2 lines of 16 characters)|
|JP16	|5x2	 |Arrow keys and Enter button|
|P1	  |2	   |SP/DIF audio output|

## Jumpers ##
|JP1	|3	|Boot mode selection "BOOT0" (normal = 2-3)|
|:---|:-|:-----------------------------------------|
|JP2	|3	|Boot mode selection "BOOT1" (normal = 2-3)|
|JP3	|2	|Enable [AN258](http://simplemachines.it/doc/AN258REV2.pdf) workaround (normal = closed)|
|JP4	|2	|Boot width /CS6 (normal = open)           |
|JP5	|2	|Boot width /CS7 (normal = closed)         |
|JP6	|3	|Boot width ASDOUT (normal = 1-2)          |
|JP7	|2	|Boot mode (internal) EECLK" (normal = open)|
|JP8	|2	|Test mode EEDAT (normal = open)           |
|JP11	|2	|Enable /RESET to Multi-ICE header         |
|JP12	|3	|Select brightness control for external LCD|
|JP17	|2	|Ethernet TX slew rate selector            |
|JP18	|2	|Ethernet TX slew rate selector            |

A full description of the Boot mode/width jumper settings is given in the
[EP9307 User's Guide](http://simplemachines.it/doc/EP9307_Users_Guide.pdf) at section 4.1.3, pages 96-97.

Moving JP1 to 1-2 enables you to program a new version of U-Boot into the internal flash memory over the serial port.

## Switches ##
|S1	|2	|Power switch (ON=towards edge of board)|
|:--|:-|:--------------------------------------|
|SW1	|2	|Reset button                           |

## Potentiometers ##
|R 112	|Internal LCD brightness|
|:-----|:----------------------|
|R 107	|External LCD brightness (if selected by JP12)|

## Fuses ##
|F1	|Main power, 3.6 Ampere|
|:--|:---------------------|
|F2	|MINISMDC050-2 on USB port 0|
|F3	|MINISMDC050-2 on USB port 1|

## Test points ##
|TP5	|DCD output from U11|
|:---|:------------------|
|TP6	|DCD input to U11   |
|TP10	|GGPIO2             |
|TP11	|HGPIO7             |
|TP12	|HGPIO6             |
|TP13	|HGPIO5             |
|TP14	|HGPIO4             |
|TP15	|/CS0               |
|TP16	|AD25               |
|TP17	|EGPIO15            |
|TP18	|HGPIO3             |
|TP19	|HGPIO2             |
|TP20	|/SDCS3             |
|TP21	|/SDCS1             |
|TP22	|/SDCS2             |

## Components ##
| **Part** | **Pins** | **Component** |
|:---------|:---------|:--------------|
|CPU1	     |272	      |EP9307 System-on-a-chip (CPU etc)|
|LED1	     |2	        |Red boot LED   |
|TR1	      |16	       |Pulse H1102 ethernet signal transformer|
|U1	       |14	       |M74HC14M1R inverter driving red LED|
|U2	       |6	        |MIC2774N-31BM5 Power-on reset (and [AN258](http://simplemachines.it/doc/AN258REV2.pdf) workaround)|
|U3	       |6	        |MIC2774N-31BM5 Reset switch circuitry|
|U4	       |8	        |MC7805 audio power supply regulator|
|U5	       |48	       |CS4202 audio chip|
|U6	       |56	       |MT28F640J3RG12 Flash ROM (16 bits wide)|
|U7	       |3	        |LM78M05 5-volt 1.5-amp main power regulator|
|U8	       |3	        |LM78M05 5-volt 1.5-amp USB power regulator|
|U9	       |54	       |K4S56132C-TC/L75 SDRAM (low 16 bits)|
|U10	      |54	       |K4S56132C-TC/L75 SDRAM (high 16 bits)|
|U11	      |28	       |MAX3243CAI RS232 full modem signal amplifier|
|U12	      |8	        |DS1337 real-time clock driver|
|U13	      |48	       |16-bit buffer/driver with 3-state outputs (for Ext. LCD)|
|U14	      |48	       |16-bit buffer/driver with 3-state outputs (for Ext. LCD)|
|U15	      |14	       |SN74HCT125 VGA hsync/vsync amplifiers|
|U16	      |48	       |ADV7123-KST140 VGA video driver|
|U17	      |64	       |Intel LXT972A-LQFP ethernet driver|
|VR1	      |3	        |LM1117MP-3.3 TO-252 3.3V regulator|
|VR2	      |3	        |LM1117DT-ADJ TO-252 1.8V regulator|
|Y1	       |2	        |14.7456 MHz crystal (for CPU)|
|Y2	       |2	        |24.576 MHz crystal (for audio chip)|
|Y3	       |2	        |32.768KHz crystal (for RTC)|
|Y4	       |2	        |25MHz crystal (for ethernet chip)|

## ADDON1 pins ##
Add-On Bus connector: 20x2 x 2.54mm pitch: the EP9307 ADDON bus, free GPIO lines, 2 serial ports, 1 USB port, audio etc.

| 1	|POWER (7.2V DC unregulated)	| 2	|POWER (7.2V DC unregulated)|
|:--|:---------------------------|:--|:--------------------------|
| 3	|PWMOUT			                   | 4	|INT1                       |
| 5	|ADDONC7			                  | 6	|ADDOND7                    |
| 7	|ADDONC6			                  | 8	|ADDOND6                    |
| 9	|ADDONC5			                  |10	|ADDOND5                    |
|11	|ADDONC4			                  |12	|ADDOND4                    |
|13	|ADDONC3			                  |14	|ADDOND3                    |
|15	|ADDONC2			                  |16	|ADDOND2                    |
|17	|ADDONC1			                  |18	|ADDOND1                    |
|19	|ADDONC0			                  |20	|ADDOND0                    |
|21	|GPIO FGPIO 0			             |22	|UART 1 TXD                 |
|23	|GPIO FGPIO 5			             |24	|UART 1 RXD                 |
|25	|GPIO FGPIO 7			             |26	|SPDIF\_TX                  |
|27	|USB 2 m			                  |28	|MONO OUT                   |
|29	|USB 2 p			                  |30	|LINE OUT R                 |
|31	|/BRESET			                  |32	|LINE OUT L                 |
|33	|UART 2 TXD			               |34	|PHONE IN                   |
|35	|UART 2 RXD			               |36	|LINE IN R                  |
|37	|GPIO / Green LED		          |38	|LINE IN L                  |
|39	|DGND				                    |40	|AGND                       |

## CON1 pins ##
SD/MMC card socket

|1	|CS|Chip select (SFRMOUT from EP9307)|
|:-|:-|:--------------------------------|
|2	|DI|Data in                          |
|3	|GND|Ground (0V)                      |
|4	|VDD|Power supply (3.3V)              |
|5	|SCLK|Data clock                       |
|6	|GND|Ground (0V)                      |
|7	|DO|Data out                         |
|8	|IRQ|                                 |
|9	|NC|No connection                    |
|10	|CP1|Card present switch (EGPIO0)     |
|11	|CP2|Card present switch (Ground)     |

## CON2 pins ##
Serial port / modem

|CON2 pin |Signal |DB9F |DB9M|
|:--------|:------|:----|:---|
|1        |RTS    |7    |8   |
|2        |DTR    |4    |6   |
|3        |RD     |2    |3   |
|4        |GND    |5    |5   |
|5        |GND    |5    |5   |
|6        |TD     |3    |2   |
|7        |DSR    |6    |4   |
|8        |CTS    |8    |7   |

  * DB9F: Corresponding pins on a female 9-pin plug configured as Data Communications Equipment (DCE) to connect straight to a PC serial port.
  * DB9M: Corresponding pins on a male 9-pin plug configured as Data Terminal Equipment (DTE) like the PC's serial ports. To connect this cable to a PC, you need a null modem cable.

A Cisco console cable is compatible with the Sim.One pinout (DB9F) and can be used.

Some users have reported garbled output data when using the serial port. This is believed to be due to noise on the DTS/CTS lines and the suggested fix is to cut all conductors except for GND, TD and RD.

## CON3 pins ##
External LCD panel, 0.1 inch pitch 2x20 connector

| 1	|VCC (+3.3V)	| 2	|VCC (+5V USB)|
|:--|:-----------|:--|:------------|
| 3	|VCC (+3.3V)	| 4	|VCC (+5V USB)|
| 5	|GND		       | 6	|GND          |
| 7	|DCLK		      | 8	|DE           |
| 9	|HSYNC		     |10	|VSYNC        |
|11	|GND		       |12	|GND          |
|13	|[R0](https://code.google.com/p/sim1/source/detail?r=0)		|14	|[R1](https://code.google.com/p/sim1/source/detail?r=1)|
|15	|[R2](https://code.google.com/p/sim1/source/detail?r=2)		|16	|[R3](https://code.google.com/p/sim1/source/detail?r=3)|
|17	|[R4](https://code.google.com/p/sim1/source/detail?r=4)		|18	|[R5](https://code.google.com/p/sim1/source/detail?r=5)|
|19	|G0		        |20	|G1           |
|21	|G2		        |22	|G3           |
|23	|G4		        |24	|G5           |
|25	|B0		        |26	|B1           |
|27	|B2		        |28	|B3           |
|29	|B4		        |30	|B5           |
|31	|/SLEEP	     |32	|BRIGHT       |
|33	|sYmv		      |34	|sXm          |
|35	|Ym		        |36	|Xm           |
|37	|sXp		       |38	|sYp          |
|39	|Xp		        |40	|Ypv          |

## CON4 pins ##
Ethernet RJ45

|1	|TD+|
|:-|:--|
|2	|TD-|
|3	|RD+|
|4	|\ 4 & 5|
|5	|/ shorted|
|6	|RD-|
|7	|\ 7 & 8|
|8	|/ shorted|

## JP9 pins ##
Power bus, 0.1" pitch 2x40 header

JP9 was originally designed as an alternative way to power the Sim.One from an intelligent battery unit instead of from a single unregulated 7.2V supply on `J3`.
When the Sim.One is powered by `J3`, this connector can be used to power custom boards.

You can also power several Sim.One boards from a single 7.2V source simply by chaining the power busses together with a regular 40-pin IDE cable. As the unregulated supply is also transmitted, this does not overload the voltage regulators of the first Sim.One; all the boards' regulators co-operate to share the load.

| 1	|Power (+7.2V)	| 2	|DGND|
|:--|:-------------|:--|:---|
| 3	|NC		          | 4	|EGPIO12|
| 5	|+5VD		        | 6	|DGND|
| 7	|+5VD		        | 8	|DGND|
| 9	|+5VD		        |10	|DGND|
|11	|NC		          |12	|EGPIO3|
|13	|+5V USB	      |14	|DGND|
|15	|+5V USB	      |16	|DGND|
|17	|+5V USB	      |18	|EGPIO13|
|19	|V\_INT\_LCD	  |20	|DGND|
|21	|V\_INT\_LCD	  |22	|DGND|
|23	|NC		          |24	|EGPIO8|
|25	|+5V AUDIO	    |26	|AGND|
|27	|NC		          |28	|EGPIO1|
|29	|+1.8V		       |30	|DGND|
|31	|+1.8V		       |32	|DGND|
|33	|NC		          |34	|M\_BRIGHT|
|35	|+3.3VD	       |36	|DGND|
|37	|+3.3VD	       |38	|DGND|
|39	|+3.3VD	       |40	|DGND|

## JP13 pins ##
LCD panel, 0.5mm pitch 1x40 connector

The power signals on `VDD_[1234]` are only connected to the `V_INT_LCD` pin of `JP9`; the Sim.One itself does not have a 2.5V power line. Supplying the right power voltage to this connector can be achieved either by powering the whole Sim.One from `JP9` or by connecting a suitable voltage regulator on `JP9` to derive the required voltage from the other power signals present there.

|1 |   VDD\_1|
|:-|:--------|
|2 |   VDD\_2|
|3 |   VDD\_3|
|4 |   VDD\_4|
|5 |    NC\_1|
|6 |D\_ENABLE|
|7 |   GND\_1|
|8 |   VSYNC |
|9 |   GND\_2|
|10|   HSYNC |
|11|   GND\_3|
|12|      B5 |
|13|      B4 |
|14|      B3 |
|15|   GND\_4|
|16|      B2 |
|17|      B1 |
|18|      B0 |
|19|   GND\_5|
|20|      G5 |
|21|      G4 |
|22|      G3 |
|23|   GND\_6|
|24|      G2 |
|25|      G1 |
|26|      G0 |
|27|   GND\_7|
|28|      [R5](https://code.google.com/p/sim1/source/detail?r=5)|
|29|      [R4](https://code.google.com/p/sim1/source/detail?r=4)|
|30|      [R3](https://code.google.com/p/sim1/source/detail?r=3)|
|31|   GND\_8|
|32|      [R2](https://code.google.com/p/sim1/source/detail?r=2)|
|33|      [R1](https://code.google.com/p/sim1/source/detail?r=1)|
|34|      [R0](https://code.google.com/p/sim1/source/detail?r=0)|
|35|      NC |
|36|   GND\_9|
|37|  GND\_10|
|38| DOT\_CLK|
|39|  GND\_11|
|40|  GND\_12|


# Sim.One v1.4 circuit board #