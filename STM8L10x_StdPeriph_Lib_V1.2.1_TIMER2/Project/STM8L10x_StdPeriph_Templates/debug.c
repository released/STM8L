/* Includes ------------------------------------------------------------------*/
#include "debug.h"

#if DEBUG

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

void UART_Config(void) //default UART pin , PD5:TX , PD6:RX
{
	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_Out_PP_High_Slow);//UART TX
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);	

	USART_DeInit();
	/* UART1 configuration ------------------------------------------------------*/
	/* UART1 configured as follow:
		  - BaudRate = 115200 baud	
		  - Word Length = 8 Bits
		  - One Stop Bit
		  - No parity
		  - Receive and transmit enabled
		  - UART1 Clock disabled
	*/

	USART_Init((uint32_t)115200, USART_WordLength_8D, USART_StopBits_1, USART_Parity_No,USART_Mode_Tx);
  
    /* Enable UART1 receive interrupt*/
    USART_ITConfig(USART_IT_RXNE, ENABLE);
  	USART_Cmd(ENABLE);    

	/* Enable general interrupts */
    //enableInterrupts();  
}

static PutChar(uint8_t ch)
{
	USART_SendData8(ch);
	while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET);
}

void PRINTF(char* STR,bool ShowValue,uint32_t value)
{
	uint8_t A,B,C,D,E;
	
	do
	{
		PutChar(*STR);
		STR++;
	}while(*STR != '\n');

	if(ShowValue == TRUE)
	{
		E = value%10;
		D = (value/10)%10;
		C = (value/10/10)%10;
		B = (value/10/10/10)%10;
		A = (value/10/10/10/10)%10;
		if(A != 0)
			PutChar(A+0x30);
		if(B != 0)
			PutChar(B+0x30);
		if(C != 0)
			PutChar(C+0x30);
		if(D != 0)		
			PutChar(D+0x30);
		PutChar(E+0x30);
	}
	PutChar(0x0A);
	PutChar(0x0D);

	
}

#endif

