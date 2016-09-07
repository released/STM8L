/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/main.c
  * @author  MCD Application Team
  * @version V1.6.1
  * @date    30-September-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"

#include "debug.h"

/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
void TIM2_Config(void)
{
	/* Time base configuration */
	TIM2_TimeBaseInit(TIM2_Prescaler_1,TIM2_CounterMode_Up, 1);
	
	/* Clear TIM1 update flag */
	TIM2_ClearFlag(TIM2_FLAG_Update);
	/* Enable update interrupt */
	TIM2_ITConfig(TIM2_IT_Update, ENABLE);

	/* Enable TIM2 */
	TIM2_Cmd(ENABLE);
}

void _Delay(uint32_t u32Delay)
{
	//uint32_t i;
	//i = 0xffff;
	while(u32Delay--);
}

void CLK_Config(void)
{
	/* Initialization of the clock */
	/* Clock divider to HSI/1 */
	CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
}


/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
	static u16 i=0;
	
	CLK_Config();

	UART_Config();

	TIM2_Config();
	enableInterrupts();

	printF("TIM2_Config finish !\n",FALSE,0);

    /* Infinite loop */
    while (1)
    {
    	_Delay(100);
		printF("LOG MSG (%4d) !\n",TRUE,i++);
    }
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
