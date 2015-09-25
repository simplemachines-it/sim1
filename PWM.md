The EP9307 has one PWM output "`PWMOUT`" which is routed to the ADDON connector.

The other chips of the family EP930{1,2,12,15} have two PWM outputs each (see EP93xx Users Guide, Preface, Table P-2).

Example code to enable this in the Linux kernel for another board (from http://lists.infradead.org/pipermail/linux-arm-kernel/2010-March/011012.html) is:
```
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -176,6 +176,9 @@ static void __init ts72xx_init_machine(void)
       ts72xx_register_flash();
       platform_device_register(&ts72xx_rtc_device);

+       /* PWM1 is DIO_6 on TS-72xx header */
+       ep93xx_register_pwm(0, 1);
+
       ep93xx_register_eth(&ts72xx_eth_data, 1);
 }

```
modifying simone.c instead and (presumably) using
```
        ep93xx_register_pwm(1, 0);
```
