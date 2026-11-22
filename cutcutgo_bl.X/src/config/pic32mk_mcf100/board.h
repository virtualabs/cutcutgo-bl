/*
 * Board definitions: Cricut Maker 3 (SCM-84-100-X7) and Cricut Explore 3
 * (VLD-84-100-X5), both PIC32MK1024MCF100. The two boards share these pins.
 * The original Cricut Maker (PIC32MX) has its own board.h in
 * config/pic32mx470_curiosity.
 */
#ifndef BOARD_H
#define BOARD_H

/*
 * Front-panel LEDs, Cricut Maker 3 main board (SCM-84-100-X7,
 * PIC32MK1024MCF100). Found by driving each candidate pin in turn.
 * All are ACTIVE HIGH (pin driven high = LED on).
 *
 *   Power ring, white   RB7
 *   Power ring, red     RC10
 *   Power ring, blue    RD15
 *   Load/Unload, white  RD12
 *   Cricut logo, white  RD13
 *   Pause, blue         RD14
 *
 * Not used here: the white carriage light is on RG7 (on when driven LOW).
 *
 * DO NOT DRIVE RB10: it moves the blade-down actuator. (It was the
 * "pause LED" in the original Cricut Maker / PIC32MX pin map.)
 */
#define     LED_PWR_WHITE   GPIO_PIN_RB7
#define     LED_PWR_RED     GPIO_PIN_RC10
#define     LED_PWR_BLUE    GPIO_PIN_RD15
#define     LED_UPDOWN      GPIO_PIN_RD12     /* Load/Unload button LED */
#define     LED_LOGO        GPIO_PIN_RD13     /* Cricut logo button LED */
#define     LED_PAUSE       GPIO_PIN_RD14

/*
 * Front-panel buttons, Cricut Maker 3 main board (SCM-84-100-X7,
 * PIC32MK1024MCF100). Found by watching each input pin while pressing:
 * all are active low, with external pull-ups on the board.
 *
 *   Power           RF13
 *   Load/Unload     RF12
 *   Cricut logo     RE15
 *   Pause           RE14
 *
 * buttons.c derives everything (port, analog select) from these values.
 */
#define     BTN_POWER       GPIO_PIN_RF13
#define     BTN_LOADUNLOAD  GPIO_PIN_RF12
#define     BTN_LOGO        GPIO_PIN_RE15
#define     BTN_PAUSE       GPIO_PIN_RE14

/*
 * UF2 family ID accepted by this bootloader.
 * The original PIC32MX Cricut Maker bootloader uses 0x4d414b52 ("MAKR").
 * This PIC32MK1024MCF100 port uses its own ID so that firmware built for the
 * PIC32MX is rejected instead of being flashed onto an incompatible chip.
 * Generate application UF2 files with this family ID.
 */
#define UF2_FAMILYID    0x4d4b4d43 /* "MKMC" */

/* Application flash window (physical addresses). PIC32MK1024: 1 MB PFM. */
#define APP_FLASH_START_PA      0x1D010000UL
#define APP_FLASH_END_PA        0x1D100000UL   /* exclusive */

/* How long the power button must be held at startup. */
#define POWER_HOLD_MS           1000UL

#endif /* BOARD_H */
