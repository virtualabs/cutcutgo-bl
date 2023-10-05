#include "buttons.h"

/**
 * Initialize Cricut Maker buttons.
 */

void buttons_init(void)
{
    /* Set B12 and B13 as digital IO. */
    ANSELBbits.ANSB12 = 0;
    ANSELBbits.ANSB13 = 0;
    
    /* Set buttons GPIO direction. */
    GPIO_PinInputEnable(BTN_PAUSE);
    GPIO_PinInputEnable(BTN_LOGO);
    GPIO_PinInputEnable(BTN_POWER);
    
    /* Disable pull-ups. */
    CNPUB &= ~((1 << (BTN_PAUSE & 0x0F)) | (1 << (BTN_LOGO & 0x0F)));
    CNENB |= (1 << (BTN_PAUSE & 0x0F)) | (1 << (BTN_LOGO & 0x0F));
    CNPUF &= ~(1 << (BTN_POWER & 0x0F));
    CNENF |= (1 << (BTN_POWER & 0x0F));
}


/**
 * Check if Pause button is pressed. No debounce is made here.
 * 
 * @return true if pressed, false otherwise.
 */

bool is_pause_button_pressed(void)
{
    volatile uint32_t portb = PORTB;
    
    /* Is pause button pressed ? */
    return ((portb & (1 << (BTN_PAUSE & 0x0F))) == 0);
}

/**
 * Check if Power button is pressed, no debounce.
 * 
 * @return true if pressed, false otherwise.
 */

bool is_power_button_pressed(void)
{
    volatile uint32_t portf = PORTF;
    
    /* Is pause button pressed ? */
    return ((portf & (1 << (BTN_POWER & 0x0F))) == 0);
}

