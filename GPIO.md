The GPIO pins appear on various connectors of the Sim.One main board and at test points near the CPU. Some of the EP9307's 96 GPIO lines are used by certain devices, others can be programmed to 0 or 5V as an output or be read as a high-impedance input.

| **GPIO** | **Signal** | **Location** | **Comments** |
|:---------|:-----------|:-------------|:-------------|
| EGPIO0   |            |              | ?            |
| EGPIO1   | /SLEEP     | CON3 pin 31 

&lt;BR&gt;

 JP9 pin 28 | External LCD 

&lt;BR&gt;

 Power connector |
| EGPIO2   | LCD\_RS    | JP15 pin 4   |              |
| EGPIO3   | LCD\_RD    | JP15 pin 5 

&lt;BR&gt;

 JP9 pin 12 |              |
| EGPIO4   | LCD\_D4    | JP15 pin 11  |              |
| EGPIO5   | LCD\_D5    | JP15 pin 12  |              |
| EGPIO6   | LCD\_D6    | JP15 pin 13  |              |
| EGPIO7   | LCD\_D7    | JP15 pin 14  |              |
| EGPIO8   | ENTER\_KEY | JP16 pin 9 

&lt;BR&gt;

 JP9 pin 24 |              |
| EGPIO9   | UP\_KEY    | JP16 pin 5   |              |
| EGPIO10  | LEFT\_KEY  | JP16 pin 1   |              |
| EGPIO11  | /INTA      | DS1337 pin 3 | Real time clock |
| EGPIO12  | LCD\_EN    | JP15 pin 6 

&lt;BR&gt;

 JP9 pin 4|              |
| EGPIO13  | LCD\_LED   | JP15 pin 16 

&lt;BR&gt;

JP9 pin 8 | -High output pulls JP15 pin 16 to DGND through a BC639 transistor 

&lt;BR&gt;

 -Raw signal on JP9 |
| EGPIO14  |            |              | ?            |
| EGPIO15  |            | Test point TP17 |              |
| FGPIO0   |            | ADDON1 pin 21 |              |
| FGPIO5   |            | ADDON1 pin 23 |              |
| FGPIO7   |            | ADDON1 pin 25 |              |
| GGPIO2   |            | ?            | I2C          |
| HGPIO2   |            | TP19         | Test point   |
| HGPIO3   |            | TP18         | Test point   |
| HGPIO4   |            | TP14         | Test point   |
| HGPIO5   |            | TP13         | Test point   |
| HGPIO6   |            | TP12         | Test point   |
| HGPIO7   |            | TP11         | Test point   |