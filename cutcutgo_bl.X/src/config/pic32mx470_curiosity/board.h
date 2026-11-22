/*
 * Board definitions: original Cricut Maker (PIC32MX470F512L), as in
 * virtualabs/cutcutgo-bl. The Maker 3 / Explore 3 board.h is in
 * config/pic32mk_mcf100.
 */
#ifndef BOARD_H
#define BOARD_H

/* Front-panel LEDs (active high). */
#define     LED_LOGO        GPIO_PIN_RB11
#define     LED_PAUSE       GPIO_PIN_RB10
#define     LED_UPDOWN      GPIO_PIN_RF13     /* Load/Unload button LED */
#define     LED_PWR_WHITE   GPIO_PIN_RF4
#define     LED_PWR_RED     GPIO_PIN_RF5
#define     LED_PWR_BLUE    GPIO_PIN_RE4

/* Front-panel buttons (active low). Load/Unload is RD13, as in the
 * cutcutgo firmware's button.h; the bootloader does not use it. */
#define     BTN_POWER       GPIO_PIN_RF3
#define     BTN_LOADUNLOAD  GPIO_PIN_RD13
#define     BTN_LOGO        GPIO_PIN_RB13
#define     BTN_PAUSE       GPIO_PIN_RB12

/* UF2 family ID of the original Cricut Maker bootloader ("MAKR"), so
 * existing Maker firmware .uf2 files still flash. */
#define UF2_FAMILYID    0x4d414b52 /* "MAKR" */

/* Application flash window (physical addresses). PIC32MX470F512: 512 KB PFM. */
#define APP_FLASH_START_PA      0x1D010000UL
#define APP_FLASH_END_PA        0x1D080000UL   /* exclusive */

/* How long the power button must be held at startup (about 3 s, as in the
 * original bootloader). */
#define POWER_HOLD_MS           3000UL

#endif /* BOARD_H */
