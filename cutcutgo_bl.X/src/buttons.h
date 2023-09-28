/* 
 * File:   buttons.h
 * Author: virtualabs
 *
 * Created on 22 septembre 2023, 01:14
 */
#include "configuration.h"
#include "definitions.h"

#define     BTN_PAUSE       GPIO_PIN_RB12
#define     BTN_LOGO        GPIO_PIN_RB13
#define     BTN_POWER       GPIO_PIN_RF3

#ifndef BUTTONS_H
#define	BUTTONS_H

#ifdef	__cplusplus
extern "C" {
#endif

void buttons_init(void);
bool is_pause_button_pressed(void);

#ifdef	__cplusplus
}
#endif

#endif	/* BUTTONS_H */

