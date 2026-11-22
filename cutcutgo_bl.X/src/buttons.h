/*
 * File:   buttons.h
 * Author: virtualabs
 *
 * Created on 22 septembre 2023, 01:14
 */
#include "configuration.h"
#include "definitions.h"

/* Button pins: see board.h in the config folder of the board being built. */
#include "board.h"

#ifndef BUTTONS_H
#define	BUTTONS_H

#ifdef	__cplusplus
extern "C" {
#endif

void buttons_init(void);
bool is_pause_button_pressed(void);
bool is_power_button_pressed(void);
bool is_logo_button_pressed(void);
bool is_loadunload_button_pressed(void);

#ifdef	__cplusplus
}
#endif

#endif	/* BUTTONS_H */
