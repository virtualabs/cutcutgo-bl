#include "led.h"


/* Make an LED pin a digital output, initially off (LEDs are active high). */
static void led_pin_init(GPIO_PIN pin)
{
    uint32_t port = ((uint32_t)pin) >> 4;
    uint32_t bit = ((uint32_t)pin) & 0x0FU;

    /* ANSELxCLR (+4 bytes); ports repeat every 0x100 bytes. */
    *(volatile uint32_t *)((uint32_t)&ANSELA + (port * 0x100U) + 0x04U) = (1UL << bit);
    GPIO_PinClear(pin);
    GPIO_PinOutputEnable(pin);
}

static void led_write(GPIO_PIN pin, bool on)
{
    if (on)
    {
        GPIO_PinSet(pin);
    }
    else
    {
        GPIO_PinClear(pin);
    }
}

/**
 * Front-panel LED initialization (all off).
 */
void led_init(void)
{
    led_pin_init(LED_PWR_WHITE);
    led_pin_init(LED_PWR_RED);
    led_pin_init(LED_PWR_BLUE);
    led_pin_init(LED_UPDOWN);
    led_pin_init(LED_LOGO);
    led_pin_init(LED_PAUSE);
}

/** Cricut logo button LED. */
void led_set_logo(bool enable)
{
    led_write(LED_LOGO, enable);
}

/** Pause button LED. */
void led_set_pause(bool enable)
{
    led_write(LED_PAUSE, enable);
}

/**
 * Power ring colour.
 * @param blue  blue on/off
 * @param white white on/off
 * @param red   red on/off
 */
void led_set_power(bool blue, bool white, bool red)
{
    led_write(LED_PWR_RED, red);
    led_write(LED_PWR_WHITE, white);
    led_write(LED_PWR_BLUE, blue);
}

/** Load/Unload button LED. */
void led_set_updown(bool enable)
{
    led_write(LED_UPDOWN, enable);
}

/** Toggle the Load/Unload button LED. */
void led_toggle_updown(void)
{
    GPIO_PinToggle(LED_UPDOWN);
}

