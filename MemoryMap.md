# Sim.One memory map #

Here is the layout of the physical address space of the Sim.One's memory.

| `0x00000000-0x0000FFFF` | If JP1 is on pins 1 and 2, internal boot ROM (a copy of `0x80090000-0x80091FFF`)

&lt;BR&gt;

If JP1 is on pins 2 and 3 ...  |
|:------------------------|:-----------------------------------------------------------------------------------------------------------------------------|
| `0x60000000-0x607FFFFF` | 8MB flash memory                                                                                                             |
| `0x80000000-0x800FFFFF`

&lt;BR&gt;

`0x80800000-0x8FFFFFFF` | AHB mapped registers See EP9307 User's Guide, Table 13-7: "Internal register map"                                            |
| `0x80090000-0x80093FFF` | 16KB internal boot ROM containing the EP9307 boot loader in the first 8KB

&lt;BR&gt;

and two "secure code blocks" of 4KB each (not used by Simplemachines).

&lt;BR&gt;

The first 8KB are also mapped to address `0x00000000` at system boot when JP1 is on pins 1 and 2. |
| `0xC0000000-0xC1FFFFFF`

&lt;BR&gt;

`0xC4000000-0xC5FFFFFF` | 64MB SDRAM when using two 32MB RAM chips in 32-bit mode                                                                      |
| `0xC0000000-0xC07FFFFF`

&lt;BR&gt;

`0xC1000000-0xC17FFFFF`

&lt;BR&gt;

`0xC4000000-0xC47FFFFF`

&lt;BR&gt;

`0xC5000000-0xC57FFFFF` | 32MB SDRAM when using one 32MB RAM chip (U9) in 16-bit mode                                                                  |
| `0xC0000000-0xC07FFFFF`

&lt;BR&gt;

`0xC1000000-0xC17FFFFF`

&lt;BR&gt;

`0xC2000000-0xC27FFFFF`

&lt;BR&gt;

`0xC3000000-0xC37FFFFF`

&lt;BR&gt;

`0xC4000000-0xC47FFFFF`

&lt;BR&gt;

`0xC5000000-0xC57FFFFF`

&lt;BR&gt;

`0xC6000000-0xC67FFFFF`

&lt;BR&gt;

`0xC7000000-0xC77FFFFF` | 64MB SDRAM when using one 64MB RAM chip (U9) in 16-bit mode                                                                  |