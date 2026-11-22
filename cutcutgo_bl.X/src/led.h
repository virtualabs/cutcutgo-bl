#ifndef __INC_LED_H
#define __INC_LED_H

#include "configuration.h"
#include "definitions.h"

/* LED pins: see board.h in the config folder of the board being built. */
#include "board.h"


/**
 * Exported functions
 **/

/* LED initialization. */
void led_init(void);

/* LED switch on/off. */
void led_set_logo(bool enable);
void led_set_pause(bool enable);
void led_set_power(bool blue, bool white, bool red);
void led_set_updown(bool enable);
void led_toggle_updown(void);


#endif /* __INC_LED_H */
