/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes

#include "buttons.h"
#include "led.h"

#define  APP_ADDR               0x9d010000
#define WORD_ALIGN_MASK         (~(sizeof(uint32_t) - 1))


/* Counter used as a timer emulation (for button press) */
uint32_t pwr_counter=0;

/**
 * @brief Launch the application.
 * 
 * This function checks if an application has been installed in Flash memory
 * at address APP_ADDR, and transfer execution to it if present.
 * 
 * Before executing the application, we need to 'deinitialize' the system in
 * order to disable some interrupts that are required by the USB driver in order
 * not to interfere with the application startup code.
 */

void launch_app(void)
{
    uint32_t jumpAddrVal = *(uint32_t *)(APP_ADDR & WORD_ALIGN_MASK);

    void (*fptr)(void);

    fptr = (void (*)(void))APP_ADDR;

    if (jumpAddrVal == 0xffffffff)
    {
        return;
    }

    /* Call Deinitialize routine to free any resources acquired by Bootloader */
    SYS_DeInitialize(NULL);

    __builtin_disable_interrupts();

    fptr();
}


/**
 * Check if we need to spawn a Mass-storage device (bootloader condition is met).
 * 
 * If no application is found in memory or if Pause button is pressed at startup,
 * we must spawn a mass-storage device and proceed to a potential upgrade.
 * 
 * @return true if we must spawn a MSD, false otherwise.
 */

bool IsUsbMsdTriggered(void)
{
    uint32_t dwApp = *(uint32_t *)(APP_ADDR);
    
    /* Check if we have something at APP_ADDR. */
    if (dwApp == 0xFFFFFFFF)
    {
        /* No application present, must expose a USB mass-storage device. */
        return true;
    }
    
    /* Pause button is pressed. */
    if (is_pause_button_pressed())
    {
        /* We must spawn a MSD. */
        return true;
    }
    
    /* Default case: launch app. */
    return false;
}


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize_Min( NULL );
    
    /* Wait for power button to be pressed. */
    while (1)
    {
        if (is_power_button_pressed())
        {
            pwr_counter++;
            
            /* Power button must be pressed during ~3 seconds. */
            if (pwr_counter >= 0x442000)
            {
                break;
            }
        }
    }
    
    if (IsUsbMsdTriggered())
    {
        /* Switch on LEDs. */
        led_set_power(false, false, true);
        led_set_updown(true);
                
        SYS_Initialize_Remaining( NULL );

        while ( true )
        {
            /* Maintain state machines of all polled MPLAB Harmony modules. */
            SYS_Tasks ( );
        }
    }
    else
    {
        launch_app();
    }
    
    
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

