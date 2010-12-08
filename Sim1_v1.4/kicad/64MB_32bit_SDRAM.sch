EESchema Schematic File Version 2  date 05/12/2010 17:37:34
LIBS:simone
LIBS:power
LIBS:conn
LIBS:simone-cache
EELAYER 24  0
EELAYER END
$Descr A4 11700 8267
Sheet 4 6
Title "64MB_32bit_SDRAM"
Date "5 dec 2010"
Rev ""
Comp "Simplemachine"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 9100 3000 0    50   ~ 0
/RAS
Text Label 9100 3100 0    50   ~ 0
/CAS
Text Label 9100 3200 0    50   ~ 0
/SDWE
Wire Wire Line
	8850 3000 9700 3000
Wire Wire Line
	8850 3200 9700 3200
Wire Wire Line
	8850 3500 9700 3500
Wire Wire Line
	8850 2700 9700 2700
Wire Wire Line
	8850 2500 9700 2500
Wire Bus Line
	8850 2150 9700 2150
Connection ~ 6350 5950
Wire Wire Line
	6350 6050 6350 5950
Connection ~ 5650 5950
Wire Wire Line
	5650 6050 5650 5950
Connection ~ 4950 5950
Wire Wire Line
	4950 6050 4950 5950
Wire Wire Line
	4600 6050 4600 5800
Wire Wire Line
	4950 6450 4950 6550
Wire Wire Line
	5650 6450 5650 6550
Wire Wire Line
	6350 6450 6350 6550
Wire Wire Line
	4450 4650 3700 4650
Wire Wire Line
	4450 4450 3700 4450
Wire Wire Line
	4450 4150 3700 4150
Wire Wire Line
	4450 3850 3700 3850
Wire Bus Line
	3600 3450 3600 1950
Wire Wire Line
	4450 3450 3700 3450
Connection ~ 6900 5050
Wire Wire Line
	6550 5050 6900 5050
Connection ~ 6900 4850
Wire Wire Line
	6550 4850 6900 4850
Connection ~ 6900 4650
Wire Wire Line
	6550 4650 6900 4650
Wire Wire Line
	6550 2650 6900 2650
Wire Wire Line
	6550 2450 6900 2450
Wire Wire Line
	6550 2250 6900 2250
Wire Wire Line
	6550 2050 6900 2050
Connection ~ 6900 2450
Connection ~ 6900 2250
Connection ~ 6900 2050
Wire Bus Line
	7900 4450 7400 4450
Wire Bus Line
	7400 4450 7400 2950
Wire Wire Line
	6550 4350 7300 4350
Wire Wire Line
	6550 4250 7300 4250
Wire Wire Line
	6550 4050 7300 4050
Wire Wire Line
	6550 4150 7300 4150
Wire Wire Line
	6550 3750 7300 3750
Wire Wire Line
	6550 3650 7300 3650
Wire Wire Line
	6550 3850 7300 3850
Wire Wire Line
	6550 3950 7300 3950
Wire Wire Line
	6550 3150 7300 3150
Wire Wire Line
	6550 3050 7300 3050
Wire Wire Line
	6550 2850 7300 2850
Wire Wire Line
	6550 2950 7300 2950
Wire Wire Line
	6550 3350 7300 3350
Wire Wire Line
	6550 3250 7300 3250
Wire Wire Line
	6550 3450 7300 3450
Wire Wire Line
	6550 3550 7300 3550
Wire Wire Line
	6900 2650 6900 1650
Connection ~ 6900 2150
Connection ~ 6900 2350
Connection ~ 6900 2550
Wire Wire Line
	6550 2150 6900 2150
Wire Wire Line
	6550 2350 6900 2350
Wire Wire Line
	6550 2550 6900 2550
Wire Wire Line
	6550 4550 6900 4550
Wire Wire Line
	6900 4550 6900 5450
Wire Wire Line
	6550 4750 6900 4750
Connection ~ 6900 4750
Wire Wire Line
	6550 4950 6900 4950
Connection ~ 6900 4950
Wire Wire Line
	6550 5150 6900 5150
Connection ~ 6900 5150
Wire Wire Line
	3700 2150 4450 2150
Wire Wire Line
	3700 2050 4450 2050
Wire Wire Line
	3700 2250 4450 2250
Wire Wire Line
	3700 2350 4450 2350
Wire Wire Line
	3700 2750 4450 2750
Wire Wire Line
	3700 2650 4450 2650
Wire Wire Line
	3700 2450 4450 2450
Wire Wire Line
	3700 2550 4450 2550
Wire Wire Line
	3700 3250 4450 3250
Wire Wire Line
	3700 3150 4450 3150
Wire Wire Line
	3700 3050 4450 3050
Wire Wire Line
	3700 2850 4450 2850
Wire Wire Line
	3700 2950 4450 2950
Wire Bus Line
	3600 1950 2750 1950
Wire Wire Line
	4450 3550 3700 3550
Wire Wire Line
	4450 3750 3700 3750
Wire Wire Line
	4450 4050 3700 4050
Wire Wire Line
	4450 4350 3700 4350
Wire Wire Line
	4450 4550 3700 4550
Wire Wire Line
	6700 6450 6700 6550
Wire Wire Line
	6000 6450 6000 6550
Wire Wire Line
	5300 6450 5300 6550
Wire Wire Line
	4600 6450 4600 6550
Wire Wire Line
	6700 6050 6700 5950
Wire Wire Line
	6700 5950 4600 5950
Connection ~ 4600 5950
Wire Wire Line
	5300 6050 5300 5950
Connection ~ 5300 5950
Wire Wire Line
	6000 6050 6000 5950
Connection ~ 6000 5950
Wire Bus Line
	8850 1950 9700 1950
Wire Wire Line
	8850 2400 9700 2400
Wire Wire Line
	8850 2600 9700 2600
Wire Wire Line
	8850 2800 9700 2800
Wire Wire Line
	8850 3400 9700 3400
Wire Wire Line
	8850 3100 9700 3100
Text Label 9100 3400 0    50   ~ 0
/SDCS0
Text Label 9100 3500 0    50   ~ 0
SDCLK
Text GLabel 8850 3500 0    50   Input ~ 0
SDCLK
Text GLabel 8850 3400 0    50   Input ~ 0
/SDCS0
Text GLabel 8850 3200 0    50   Input ~ 0
/SDWE
Text GLabel 8850 3100 0    50   Input ~ 0
/CAS
Text GLabel 8850 3000 0    50   Input ~ 0
/RAS
Text Label 9100 2800 0    50   ~ 0
SDCLKEN
Text Label 9100 2700 0    50   ~ 0
/DQM3
Text Label 9100 2600 0    50   ~ 0
/DQM2
Text Label 9100 2500 0    50   ~ 0
/DQM1
Text Label 9100 2400 0    50   ~ 0
/DQM0
Text GLabel 8850 2800 0    50   Input ~ 0
SDCLKEN
Text GLabel 8850 2700 0    50   Input ~ 0
/DQM3
Text GLabel 8850 2600 0    50   Input ~ 0
/DQM2
Text GLabel 8850 2500 0    50   Input ~ 0
/DQM1
Text GLabel 8850 2400 0    50   Input ~ 0
/DQM0
Text Label 9100 2150 0    50   ~ 0
D[31..0]
Text Label 9100 1950 0    50   ~ 0
AD[25..0]
Text GLabel 8850 2150 0    50   BiDi ~ 0
D[31..0]
Text GLabel 8850 1950 0    50   BiDi ~ 0
AD[25..0]
$Comp
L +3.3V #PWR?
U 1 1 4CFAA61C
P 4600 5800
F 0 "#PWR?" H 4600 5760 30  0001 C CNN
F 1 "+3.3V" H 4600 5910 30  0000 C CNN
	1    4600 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA615
P 6700 6550
F 0 "#PWR?" H 6700 6550 30  0001 C CNN
F 1 "GND" H 6700 6480 30  0001 C CNN
	1    6700 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA613
P 6350 6550
F 0 "#PWR?" H 6350 6550 30  0001 C CNN
F 1 "GND" H 6350 6480 30  0001 C CNN
	1    6350 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA610
P 6000 6550
F 0 "#PWR?" H 6000 6550 30  0001 C CNN
F 1 "GND" H 6000 6480 30  0001 C CNN
	1    6000 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA60E
P 5650 6550
F 0 "#PWR?" H 5650 6550 30  0001 C CNN
F 1 "GND" H 5650 6480 30  0001 C CNN
	1    5650 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA60C
P 5300 6550
F 0 "#PWR?" H 5300 6550 30  0001 C CNN
F 1 "GND" H 5300 6480 30  0001 C CNN
	1    5300 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA60A
P 4950 6550
F 0 "#PWR?" H 4950 6550 30  0001 C CNN
F 1 "GND" H 4950 6480 30  0001 C CNN
	1    4950 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4CFAA607
P 4600 6550
F 0 "#PWR?" H 4600 6550 30  0001 C CNN
F 1 "GND" H 4600 6480 30  0001 C CNN
	1    4600 6550
	1    0    0    -1  
$EndComp
$Comp
L CP1 C85
U 1 1 4CFAA526
P 4950 6250
F 0 "C85" H 5000 6350 50  0000 L CNN
F 1 "10uF" H 5000 6150 50  0000 L CNN
	1    4950 6250
	1    0    0    -1  
$EndComp
$Comp
L C C92
U 1 1 4CFAA514
P 6700 6250
F 0 "C92" H 6750 6350 50  0000 L CNN
F 1 "100nF" H 6750 6150 50  0000 L CNN
	1    6700 6250
	1    0    0    -1  
$EndComp
$Comp
L C C91
U 1 1 4CFAA510
P 6350 6250
F 0 "C91" H 6400 6350 50  0000 L CNN
F 1 "100nF" H 6400 6150 50  0000 L CNN
	1    6350 6250
	1    0    0    -1  
$EndComp
$Comp
L C C90
U 1 1 4CFAA50E
P 6000 6250
F 0 "C90" H 6050 6350 50  0000 L CNN
F 1 "100nF" H 6050 6150 50  0000 L CNN
	1    6000 6250
	1    0    0    -1  
$EndComp
$Comp
L C C89
U 1 1 4CFAA4D9
P 5650 6250
F 0 "C89" H 5700 6350 50  0000 L CNN
F 1 "100nF" H 5700 6150 50  0000 L CNN
	1    5650 6250
	1    0    0    -1  
$EndComp
$Comp
L C C88
U 1 1 4CFAA4D6
P 5300 6250
F 0 "C88" H 5350 6350 50  0000 L CNN
F 1 "100nF" H 5350 6150 50  0000 L CNN
	1    5300 6250
	1    0    0    -1  
$EndComp
$Comp
L CP1 C84
U 1 1 4CFAA4D2
P 4600 6250
F 0 "C84" H 4650 6350 50  0000 L CNN
F 1 "10uF" H 4650 6150 50  0000 L CNN
	1    4600 6250
	1    0    0    -1  
$EndComp
Text Label 4000 4650 0    50   ~ 0
/SDWE
Text Label 4000 4550 0    50   ~ 0
/CAS
Text Label 4000 4450 0    50   ~ 0
/RAS
Text Label 4000 4350 0    50   ~ 0
/SDCS0
Text Label 4000 4150 0    50   ~ 0
SDCLK
Text Label 4000 4050 0    50   ~ 0
SDCLKEN
Text Label 4000 3850 0    50   ~ 0
/DQM0
Text Label 4000 3750 0    50   ~ 0
/DQM1
NoConn ~ 4450 4850
Text Label 4050 3550 0    50   ~ 0
AD14
Text Label 4050 3450 0    50   ~ 0
AD15
Text GLabel 2750 1950 0    50   BiDi ~ 0
AD[25..0]
Entry Wire Line
	3600 3450 3700 3550
Entry Wire Line
	3600 3350 3700 3450
Entry Wire Line
	3600 2750 3700 2850
Entry Wire Line
	3600 3050 3700 3150
Entry Wire Line
	3600 2950 3700 3050
Entry Wire Line
	3600 2850 3700 2950
Text Label 4050 2950 0    50   ~ 0
AD3
Text Label 4050 2850 0    50   ~ 0
AD4
Text Label 4050 3050 0    50   ~ 0
AD2
Text Label 4050 3150 0    50   ~ 0
AD1
Text Label 4050 3250 0    50   ~ 0
AD0
Entry Wire Line
	3600 3150 3700 3250
Entry Wire Line
	3600 2350 3700 2450
Entry Wire Line
	3600 2650 3700 2750
Entry Wire Line
	3600 2550 3700 2650
Entry Wire Line
	3600 2450 3700 2550
Text Label 4050 2550 0    50   ~ 0
AD7
Text Label 4050 2450 0    50   ~ 0
AD8
Text Label 4050 2650 0    50   ~ 0
AD6
Text Label 4050 2750 0    50   ~ 0
AD5
Text Label 4050 2350 0    50   ~ 0
AD9
Text Label 4050 2250 0    50   ~ 0
AD10
Text Label 4050 2050 0    50   ~ 0
AD12
Text Label 4050 2150 0    50   ~ 0
AD11
Entry Wire Line
	3600 2050 3700 2150
Entry Wire Line
	3600 2150 3700 2250
Entry Wire Line
	3600 2250 3700 2350
Entry Wire Line
	3600 1950 3700 2050
$Comp
L GND #PWR?
U 1 1 4CFAA1A1
P 6900 5450
F 0 "#PWR?" H 6900 5450 30  0001 C CNN
F 1 "GND" H 6900 5380 30  0001 C CNN
	1    6900 5450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 4CFAA132
P 6900 1650
F 0 "#PWR?" H 6900 1610 30  0001 C CNN
F 1 "+3.3V" H 6900 1760 30  0000 C CNN
	1    6900 1650
	1    0    0    -1  
$EndComp
Text GLabel 7900 4450 2    50   BiDi ~ 0
D[31..0]
Entry Wire Line
	7300 4350 7400 4450
Entry Wire Line
	7300 4250 7400 4350
Entry Wire Line
	7300 4150 7400 4250
Entry Wire Line
	7300 4050 7400 4150
Entry Wire Line
	7300 3950 7400 4050
Entry Wire Line
	7300 3850 7400 3950
Entry Wire Line
	7300 3750 7400 3850
Entry Wire Line
	7300 3650 7400 3750
Entry Wire Line
	7300 3550 7400 3650
Entry Wire Line
	7300 3450 7400 3550
Entry Wire Line
	7300 3350 7400 3450
Entry Wire Line
	7300 3250 7400 3350
Entry Wire Line
	7300 3150 7400 3250
Entry Wire Line
	7300 3050 7400 3150
Entry Wire Line
	7300 2950 7400 3050
Entry Wire Line
	7300 2850 7400 2950
Text Label 6900 3550 0    50   ~ 0
D8
Text Label 6900 3450 0    50   ~ 0
D9
Text Label 6900 3250 0    50   ~ 0
D11
Text Label 6900 3350 0    50   ~ 0
D10
Text Label 6900 2950 0    50   ~ 0
D14
Text Label 6900 2850 0    50   ~ 0
D15
Text Label 6900 3050 0    50   ~ 0
D13
Text Label 6900 3150 0    50   ~ 0
D12
Text Label 6900 3950 0    50   ~ 0
D4
Text Label 6900 3850 0    50   ~ 0
D5
Text Label 6900 3650 0    50   ~ 0
D7
Text Label 6900 3750 0    50   ~ 0
D6
Text Label 6900 4150 0    50   ~ 0
D2
Text Label 6900 4050 0    50   ~ 0
D3
Text Label 6900 4250 0    50   ~ 0
D1
Text Label 6900 4350 0    50   ~ 0
D0
Text Notes 5050 800  0    100  ~ 0
64MB 32bit SDRAM
$Comp
L K4S561632C_TC/L75 U9
U 1 1 4CEFED6A
P 5500 3600
F 0 "U9" H 5500 3650 60  0000 C CNN
F 1 "K4S561632C_TC/L75" H 5500 3550 60  0000 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
