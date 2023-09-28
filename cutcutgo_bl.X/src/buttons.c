#include "buttons.h"

void buttons_init(void)
{
    /* Initialize buttons GPIOs */
    ANSELBbits.ANSB12 = 0;
    ANSELBbits.ANSB13 = 0;
    
    GPIO_PinInputEnable(BTN_PAUSE);
    GPIO_PinInputEnable(BTN_LOGO);
    GPIO_PinInputEnable(BTN_POWER);
    
    /* Disable pull-ups. */
    CNPUB &= ~((1 << (BTN_PAUSE & 0x0F)) | (1 << (BTN_LOGO & 0x0F)));
    CNENB |= (1 << (BTN_PAUSE & 0x0F)) | (1 << (BTN_LOGO & 0x0F));
        
    CNPUF &= ~(1 << (BTN_POWER & 0x0F));
    CNENF |= (1 << (BTN_POWER & 0x0F));
}

bool is_pause_button_pressed(void)
{
    volatile uint32_t portb = PORTB;
    
    /* Is pause button pressed ? */
    return ((portb & (1 << (BTN_PAUSE & 0x0F))) == 0);
}

