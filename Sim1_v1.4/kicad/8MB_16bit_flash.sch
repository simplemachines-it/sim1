EESchema Schematic File Version 2  date 05/12/2010 17:37:34
LIBS:simone
LIBS:power
LIBS:conn
LIBS:simone-cache
EELAYER 24  0
EELAYER END
$Descr A4 11700 8267
Sheet 5 6
Title ""
Date "5 dec 2010"
Rev ""
Comp "Simplemachine"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5750 950  0    100  ~ 0
8MB, 16bit FLASH
Wire Wire Line
	1450 6600 2050 6600
Wire Wire Line
	1450 6300 2050 6300
Connection ~ 4500 6250
Wire Wire Line
	4500 6150 4500 6350
Wire Wire Line
	5200 6750 5200 6850
Wire Wire Line
	4500 6750 4500 6850
Connection ~ 4850 6250
Wire Wire Line
	5200 6250 5200 6350
Connection ~ 7300 4550
Wire Wire Line
	7600 4400 7600 4550
Wire Wire Line
	7600 4550 6500 4550
Wire Wire Line
	6900 1650 6900 2050
Wire Wire Line
	4500 4450 3700 4450
Wire Wire Line
	3500 4450 3500 4650
Wire Wire Line
	4500 4950 3700 4950
Connection ~ 4100 5150
Wire Wire Line
	4500 5150 4100 5150
Connection ~ 4100 5350
Wire Wire Line
	4500 5350 4100 5350
Wire Bus Line
	3250 4050 3250 1550
Wire Wire Line
	4500 1850 3350 1850
Wire Wire Line
	4500 2050 3350 2050
Wire Wire Line
	4500 2250 3350 2250
Wire Wire Line
	4500 2450 3350 2450
Wire Wire Line
	4500 2650 3350 2650
Wire Wire Line
	4500 2850 3350 2850
Wire Wire Line
	4500 3050 3350 3050
Wire Wire Line
	4500 3250 3350 3250
Wire Wire Line
	4500 3450 3350 3450
Wire Wire Line
	4500 3650 3350 3650
Wire Wire Line
	4500 3850 3350 3850
Wire Wire Line
	4500 4050 3350 4050
Wire Wire Line
	6500 3650 7500 3650
Wire Wire Line
	6500 3450 7500 3450
Wire Wire Line
	6500 3250 7500 3250
Wire Wire Line
	6500 3050 7500 3050
Wire Wire Line
	6500 2850 7500 2850
Wire Wire Line
	6500 2650 7500 2650
Wire Wire Line
	6500 2450 7500 2450
Wire Wire Line
	6500 2250 7500 2250
Connection ~ 6650 4550
Wire Wire Line
	6650 4550 6650 4350
Wire Wire Line
	6650 4350 6500 4350
Wire Wire Line
	6500 3950 6650 3950
Connection ~ 6900 1850
Wire Wire Line
	6500 1850 6900 1850
Connection ~ 6900 1950
Wire Wire Line
	6900 2050 6500 2050
Wire Wire Line
	6900 1950 6500 1950
Wire Wire Line
	7150 3950 7300 3950
Wire Wire Line
	7300 3950 7300 4550
Wire Wire Line
	6500 4150 7150 4150
Wire Wire Line
	6500 2350 7500 2350
Wire Wire Line
	6500 2550 7500 2550
Wire Wire Line
	6500 2750 7500 2750
Wire Wire Line
	6500 2950 7500 2950
Wire Wire Line
	6500 3150 7500 3150
Wire Wire Line
	6500 3350 7500 3350
Wire Wire Line
	6500 3550 7500 3550
Wire Wire Line
	6500 3750 7500 3750
Wire Wire Line
	4500 4150 3350 4150
Wire Wire Line
	4500 3950 3350 3950
Wire Wire Line
	4500 3750 3350 3750
Wire Wire Line
	4500 3550 3350 3550
Wire Wire Line
	4500 3350 3350 3350
Wire Wire Line
	4500 3150 3350 3150
Wire Wire Line
	4500 2950 3350 2950
Wire Wire Line
	4500 2750 3350 2750
Wire Wire Line
	4500 2550 3350 2550
Wire Wire Line
	4500 2350 3350 2350
Wire Wire Line
	4500 2150 3350 2150
Wire Wire Line
	4500 1950 3350 1950
Wire Bus Line
	3250 1550 2300 1550
Wire Wire Line
	4500 4250 4100 4250
Wire Wire Line
	4100 4250 4100 5900
Wire Wire Line
	4500 5250 4100 5250
Connection ~ 4100 5250
Wire Wire Line
	4500 4850 3700 4850
Wire Wire Line
	4500 4550 4300 4550
Wire Wire Line
	4300 4550 4300 4650
Connection ~ 4300 4650
Wire Wire Line
	3500 4650 4500 4650
Wire Bus Line
	7600 2350 7600 3950
Wire Bus Line
	7600 3950 8300 3950
Wire Wire Line
	4850 6250 4850 6350
Wire Wire Line
	4500 6250 5550 6250
Wire Wire Line
	5550 6250 5550 6350
Connection ~ 5200 6250
Wire Wire Line
	4850 6750 4850 6850
Wire Wire Line
	5550 6750 5550 6850
Wire Wire Line
	1450 6150 2050 6150
Wire Wire Line
	1450 6450 2050 6450
Text GLabel 1450 6600 0    50   Input ~ 0
/WR
Text Label 1750 6600 0    50   ~ 0
/WR
Text GLabel 1450 6450 0    50   Input ~ 0
/RD
Text Label 1750 6450 0    50   ~ 0
/RD
Text GLabel 1450 6300 0    50   Input ~ 0
/CS6
Text Label 1750 6300 0    50   ~ 0
/CS6
Text GLabel 1450 6150 0    50   Input ~ 0
/RESET
Text Label 1750 6150 0    50   ~ 0
/RESET
$Comp
L +3.3V #PWR?
U 1 1 4CFBB94C
P 4500 6150
F 0 "#PWR?" H 4500 6110 30  0001 C CNN
F 1 "+3.3V" H 4500 6260 30  0000 C CNN
	1    4500 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFBB93E
P 4500 6850
F 0 "#PWR?" H 4500 6850 30  0001 C CNN
F 1 "GND" H 4500 6780 30  0001 C CNN
	1    4500 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFBB93B
P 4850 6850
F 0 "#PWR?" H 4850 6850 30  0001 C CNN
F 1 "GND" H 4850 6780 30  0001 C CNN
	1    4850 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFBB937
P 5200 6850
F 0 "#PWR?" H 5200 6850 30  0001 C CNN
F 1 "GND" H 5200 6780 30  0001 C CNN
	1    5200 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFBB933
P 5550 6850
F 0 "#PWR?" H 5550 6850 30  0001 C CNN
F 1 "GND" H 5550 6780 30  0001 C CNN
	1    5550 6850
	1    0    0    -1  
$EndComp
$Comp
L CP1 C62
U 1 1 4CFBB896
P 4500 6550
F 0 "C62" H 4550 6650 50  0000 L CNN
F 1 "10uF" H 4550 6450 50  0000 L CNN
	1    4500 6550
	1    0    0    -1  
$EndComp
$Comp
L C C65
U 1 1 4CFBB88C
P 5550 6550
F 0 "C65" H 5600 6650 50  0000 L CNN
F 1 "100nF" H 5600 6450 50  0000 L CNN
	1    5550 6550
	1    0    0    -1  
$EndComp
$Comp
L C C64
U 1 1 4CFBB887
P 5200 6550
F 0 "C64" H 5250 6650 50  0000 L CNN
F 1 "100nF" H 5250 6450 50  0000 L CNN
	1    5200 6550
	1    0    0    -1  
$EndComp
$Comp
L C C63
U 1 1 4CFBB884
P 4850 6550
F 0 "C63" H 4900 6650 50  0000 L CNN
F 1 "100nF" H 4900 6450 50  0000 L CNN
	1    4850 6550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 4CFBB853
P 7600 4400
F 0 "#PWR?" H 7600 4360 30  0001 C CNN
F 1 "+3.3V" H 7600 4510 30  0000 C CNN
	1    7600 4400
	1    0    0    -1  
$EndComp
Text Label 7800 3950 0    50   ~ 0
D[31..0]
Text GLabel 8300 3950 2    50   BiDi ~ 0
D[31..0]
Text Label 3700 1850 0    50   ~ 0
AD24
Text Label 3700 1950 0    50   ~ 0
AD23
Text Label 3700 2050 0    50   ~ 0
AD22
Text Label 3700 2150 0    50   ~ 0
AD21
Text Label 3700 2250 0    50   ~ 0
AD20
Text Label 3700 2350 0    50   ~ 0
AD19
Text Label 3700 2450 0    50   ~ 0
AD18
Text Label 3700 2550 0    50   ~ 0
AD17
Text Label 3700 2650 0    50   ~ 0
AD16
Text Label 3700 2750 0    50   ~ 0
AD15
Text Label 3700 2850 0    50   ~ 0
AD14
Text Label 3700 2950 0    50   ~ 0
AD13
Text Label 3700 3050 0    50   ~ 0
AD12
Text Label 3700 3150 0    50   ~ 0
AD11
Text Label 3700 3250 0    50   ~ 0
AD10
Text Label 3700 3350 0    50   ~ 0
AD9
Text Label 3700 3450 0    50   ~ 0
AD8
Text Label 3700 3550 0    50   ~ 0
AD7
Text Label 3700 3650 0    50   ~ 0
AD6
Text Label 3700 3750 0    50   ~ 0
AD5
Text Label 3700 3850 0    50   ~ 0
AD4
Text Label 3700 3950 0    50   ~ 0
AD3
Text Label 3700 4050 0    50   ~ 0
AD2
Text Label 3700 4150 0    50   ~ 0
AD1
Text Label 6850 2250 0    50   ~ 0
D15
Text Label 6850 2350 0    50   ~ 0
D14
Text Label 6850 2450 0    50   ~ 0
D13
Text Label 6850 2550 0    50   ~ 0
D12
Text Label 6850 2650 0    50   ~ 0
D11
Text Label 6850 2750 0    50   ~ 0
D10
Text Label 6850 2850 0    50   ~ 0
D9
Text Label 6850 2950 0    50   ~ 0
D8
Text Label 6850 3050 0    50   ~ 0
D7
Text Label 6850 3150 0    50   ~ 0
D6
Text Label 6850 3250 0    50   ~ 0
D5
Text Label 6850 3350 0    50   ~ 0
D4
Text Label 6850 3450 0    50   ~ 0
D3
Text Label 6850 3550 0    50   ~ 0
D2
Text Label 6850 3650 0    50   ~ 0
D1
Text Label 6850 3750 0    50   ~ 0
D0
$Comp
L +3.3V #PWR?
U 1 1 4CFBB439
P 3500 4450
F 0 "#PWR?" H 3500 4410 30  0001 C CNN
F 1 "+3.3V" H 3500 4560 30  0000 C CNN
	1    3500 4450
	1    0    0    -1  
$EndComp
Text Label 3750 4950 0    50   ~ 0
/WR
Text Label 3750 4850 0    50   ~ 0
/RD
Text Label 3750 4450 0    50   ~ 0
/CS6
$Comp
L GND #PWR?
U 1 1 4CFBB3AB
P 4100 5900
F 0 "#PWR?" H 4100 5900 30  0001 C CNN
F 1 "GND" H 4100 5830 30  0001 C CNN
	1    4100 5900
	1    0    0    -1  
$EndComp
Text Label 2450 1550 0    50   ~ 0
AD[25..0]
Text GLabel 2300 1550 0    50   BiDi ~ 0
AD[25..0]
Entry Wire Line
	3250 1750 3350 1850
Entry Wire Line
	3250 1850 3350 1950
Entry Wire Line
	3250 1950 3350 2050
Entry Wire Line
	3250 2050 3350 2150
Entry Wire Line
	3250 2150 3350 2250
Entry Wire Line
	3250 2250 3350 2350
Entry Wire Line
	3250 2350 3350 2450
Entry Wire Line
	3250 2450 3350 2550
Entry Wire Line
	3250 2550 3350 2650
Entry Wire Line
	3250 2650 3350 2750
Entry Wire Line
	3250 2750 3350 2850
Entry Wire Line
	3250 2850 3350 2950
Entry Wire Line
	3250 2950 3350 3050
Entry Wire Line
	3250 3050 3350 3150
Entry Wire Line
	3250 3150 3350 3250
Entry Wire Line
	3250 3250 3350 3350
Entry Wire Line
	3250 3350 3350 3450
Entry Wire Line
	3250 3450 3350 3550
Entry Wire Line
	3250 3550 3350 3650
Entry Wire Line
	3250 3650 3350 3750
Entry Wire Line
	3250 3750 3350 3850
Entry Wire Line
	3250 3850 3350 3950
Entry Wire Line
	3250 3950 3350 4050
Entry Wire Line
	3250 4050 3350 4150
Text Label 6750 4150 0    50   ~ 0
/RESET
$Comp
L R R52
U 1 1 4CFBAF91
P 6900 3950
F 0 "R52" V 6850 3700 50  0000 C CNN
F 1 "10K" V 6850 4150 50  0000 C CNN
	1    6900 3950
	0    1    1    0   
$EndComp
Entry Wire Line
	7500 3750 7600 3850
Entry Wire Line
	7500 3650 7600 3750
Entry Wire Line
	7500 3550 7600 3650
Entry Wire Line
	7500 3450 7600 3550
Entry Wire Line
	7500 3350 7600 3450
Entry Wire Line
	7500 3250 7600 3350
Entry Wire Line
	7500 3150 7600 3250
Entry Wire Line
	7500 3050 7600 3150
Entry Wire Line
	7500 2950 7600 3050
Entry Wire Line
	7500 2850 7600 2950
Entry Wire Line
	7500 2750 7600 2850
Entry Wire Line
	7500 2650 7600 2750
Entry Wire Line
	7500 2550 7600 2650
Entry Wire Line
	7500 2450 7600 2550
Entry Wire Line
	7500 2350 7600 2450
Entry Wire Line
	7500 2250 7600 2350
$Comp
L +3.3V #PWR?
U 1 1 4CFBAE65
P 6900 1650
F 0 "#PWR?" H 6900 1610 30  0001 C CNN
F 1 "+3.3V" H 6900 1760 30  0000 C CNN
	1    6900 1650
	1    0    0    -1  
$EndComp
$Comp
L MT28F640J3RG12 U6
U 1 1 4CEFEC02
P 5500 3600
F 0 "U6" H 5500 3650 60  0000 C CNN
F 1 "MT28F640J3RG12" H 5500 3550 60  0000 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
