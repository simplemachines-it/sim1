# Sim.One flash memory #

The Sim.One has 8MB of Flash memory in chip U6, an MT28F640J3RG12 part.

This is NOR flash memory, whose characteristics are that it can be read by the CPU at system bus speed (100 MHz) but is very slow to program.  (This is in contrast to the more common NAND flash, which is cheaper and fairly slow both to read and to write).

The flash chip is selected by the EP9307's /CS6 chip select pin, which maps it into physical memory at address `0x60000000` and the data bus between the CPU and the flash memory is 16 bits wide.

Simplemachines program it with the following contents:
| 0x60000000-0x6007FFFF | U-Boot boot loader |
|:----------------------|:-------------------|
| 0x60080000-0x6027FFFF | Linux kernel uImage |