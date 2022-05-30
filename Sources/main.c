

/* includes */
#include "Cpu.h"
#include "clockMan1.h"
#include "pin_mux.h"
#include "lpit1.h"
#include "flexTimer_ic1.h"
#include "dmaController1.h"
#include "flexTimer_pwm1.h"

#if CPU_INIT_CONFIG
#include "Init_Config.h"
#endif

volatile int exit_code = 0;
/* User includes */

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define LED0_PIN_INDEX  0U			/* defining Blue LED (PTD0 FTM0 CH2) */
#define LED_GPIO_PORT   PTD


/* LPIT channel used */
#define LPIT_CHANNEL        0UL
#define LPIT_Channel_IRQn   LPIT0_Ch0_IRQn


#define TX_MAILBOX  (1UL)		/*TX - transfer */
#define TX_MSG_ID   (1UL)



/*
 * 	 LPIT interrupt handler.
 *   When an interrupt occurs clear channel flag and toggle LED0
 */
void LPIT_ISR(void)
{
    /* Clear LPIT channel flag */
    LPIT_DRV_ClearInterruptFlagTimerChannels(INST_LPIT1, (1 << LPIT_CHANNEL));
    /* Toggle LED0 */
    PINS_DRV_TogglePins(PTD, (1 << 0u));
    /* Toggle LED0
    PINS_DRV_TogglePins(LED_GPIO_PORT, (1 << LED0_PIN_INDEX));*/
}





/***********************************
 * Wait for a number of cycles
 * nbOfCycles is number of cycles to be waited for
 ***********************************/
void delayCycles(volatile uint32_t cycles)
{
    while (cycles--)
    {
    }
}






int main(void)
{

    /*** Processor Expert internal initialization. DON'T REMOVE THIS CODE!!! ***/
#ifdef PEX_RTOS_INIT
    PEX_RTOS_INIT();                 /* Initialization of the selected RTOS. Macro is defined by the RTOS component. */
#endif
/*** End of Processor Expert internal initialization.                    ***/




    ftm_state_t ftm1StateStruct;
    ftm_state_t ftm2StateStruct;
    /*
     Variables used to store PWM frequency,
     * input capture measurement value
     */
    uint16_t inputCaptureMeas = 0U;
    uint32_t frequency;

    /* Buffer for string processing */
    char txBuff[255];




  /* Initialize and configure clocks
   *  -   configure source clocks, PCC for LED port and LPIT instance
   */
    CLOCK_SYS_Init(g_clockManConfigsArr, CLOCK_MANAGER_CONFIG_CNT,		/* &clockMan1_InitConfig0, 1U, 0, 0U    */
        g_clockManCallbacksArr, CLOCK_MANAGER_CALLBACK_CNT);
    CLOCK_SYS_UpdateConfiguration(0U, CLOCK_MANAGER_POLICY_AGREEMENT);





    /* Initialize pins
     *  -   Setup pin used for LED(used as GPIO)
     */
    PINS_DRV_Init(NUM_OF_CONFIGURED_PINS, g_pin_mux_InitConfigArr);		/* ZAKTUALIZOWA£O SIÊ DO 6 - liczba pinów i ich konf. OK*/





        FTM_DRV_Init(INST_FLEXTIMER_IC1, &flexTimer_ic1_InitConfig, &ftm1StateStruct);
        FTM_DRV_Init(INST_FLEXTIMER_PWM1, &flexTimer_pwm1_InitConfig, &ftm2StateStruct);








       /* Setup input capture for FTM 1 channel 0  - PTB2 */
       FTM_DRV_InitInputCapture(INST_FLEXTIMER_IC1, &flexTimer_ic1_InputCaptureConfig);


       /* Get the FTM1 frequency to calculate
       * the frequency of the measured signal.
       */
       frequency = FTM_DRV_GetFrequency(INST_FLEXTIMER_IC1);




       /* Set LED pin direction as output */
       PINS_DRV_SetPinsDirection(LED_GPIO_PORT, (1 << LED0_PIN_INDEX));


       /* Turn off LED0 */
       PINS_DRV_SetPins(PTD, (1 << 0u));


       /* Initialize LPIT instance 0
        *  -   Reset and enable peripheral
        */
       LPIT_DRV_Init(INST_LPIT1, &lpit1_InitConfig);





    /* Initialize LPIT channel 0 and configure it as a periodic counter
     * which is used to generate an interrupt every second.
     */
    LPIT_DRV_InitChannel(INST_LPIT1, LPIT_CHANNEL, &lpit1_ChnConfig0);

    /* ctrl + &lpit1_ChnConfig0 -> basic period: 1000000U (1MHz). So 1MHz/1Mhz = 1s delay
     * the less cycles, the bigger frequency (vice versa)
     * so setting it to 3MHz will do 3s ON, 3s OFF the LED -> 0,3 Hz
     * I Will set it to 500 to generate 1000Hz.
     * */



     /* Install LPIT_ISR as LPIT interrupt handler */
    INT_SYS_InstallHandler(LPIT_Channel_IRQn, &LPIT_ISR, (isr_t*)0);


    /* Start LPIT0 channel 0 counter */
    LPIT_DRV_StartTimerChannels(INST_LPIT1, (1 << LPIT_CHANNEL));

    /* Peripherals Initialization is complete, now the program will wait for
     * LPIT interrupt.
     */





    CAN_Init(&can_pal1_instance, &can_pal1_Config0);

    /* Set information about the data to be sent
     *  - Standard message ID
     *  - Bit rate switch enabled to use a different bitrate for the data segment
     *  - Flexible data rate enabled
     *  - Use zeros for FD padding
     */
    can_buff_config_t buffCfg =  {
        .enableFD = false,
        .enableBRS = false,
        .fdPadding = 0U,
        .idType = CAN_MSG_ID_STD,
        .isRemote = false
    };







    /* Infinite loop
         *  -   Measure and calculate the signal frequency
         */
        while (1)
        {
            /* Get values */
                inputCaptureMeas = FTM_DRV_GetInputCaptureMeasurement(INST_FLEXTIMER_IC1, 0U);
                /* Calculate the signal frequency using recorded data*/
                inputCaptureMeas = frequency / (inputCaptureMeas);


            can_message_t message = {
                .cs = 0U,
                .id = TX_MSG_ID,
                .data[0] = 0,
                .length = 1U
            };


            CAN_Send(&can_pal1_instance, TX_MAILBOX, &message);


        }







     /*** Don't write any code pass this line, or it will be deleted during code generation. ***/
  /*** RTOS startup code. Macro PEX_RTOS_START is defined by the RTOS component. DON'T MODIFY THIS CODE!!! ***/
  #ifdef PEX_RTOS_START
    PEX_RTOS_START();                  /* Startup of the selected RTOS. Macro is defined by the RTOS component. */
  #endif
  /*** End of RTOS startup code.  ***/
  /*** Processor Expert end of main routine. DON'T MODIFY THIS CODE!!! ***/
  for(;;) {
    if(exit_code != 0) {
      break;
    }
  }
  return exit_code;
  /*** Processor Expert end of main routine. DON'T WRITE CODE BELOW!!! ***/
} /*** End of main routine. DO NOT MODIFY THIS TEXT!!! ***/


