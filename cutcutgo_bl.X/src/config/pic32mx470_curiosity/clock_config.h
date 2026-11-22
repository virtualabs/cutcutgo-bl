/*
 * Clock values for the original Cricut Maker (PIC32MX470F512L).
 * 16 MHz crystal, PLL /4 x24 /1: SYSCLK = 96 MHz (see initialization.c).
 */
#ifndef CLOCK_CONFIG_H
#define CLOCK_CONFIG_H

#define SYS_CLK_FREQ_HZ         96000000UL
/* The MIPS core timer (CP0 Count) runs at SYSCLK / 2. */
#define CORE_TIMER_FREQ_HZ      (SYS_CLK_FREQ_HZ / 2UL)

#endif /* CLOCK_CONFIG_H */
