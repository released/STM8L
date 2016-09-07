/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef _debug_H
#define _debug_H
/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"

#define DEBUG	1

#if DEBUG
#define printF(a,b,c) PRINTF(a,b,c)
#else
#define printF(a,b,c)
#endif

#if DEBUG
extern void UART_Config(void);
extern void PRINTF(char* STR,bool ShowValue,uint32_t value);
#endif

/* Define config -------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/


#endif  /* _debug_H */

