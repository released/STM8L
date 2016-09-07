   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 48 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  49                     ; 49 {
  50                     .text:	section	.text,new
  51  0000               f_NonHandledInterrupt:
  55                     ; 53 }
  58  0000 80            	iret	
  80                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  80                     ; 62 {
  81                     .text:	section	.text,new
  82  0000               f_TRAP_IRQHandler:
  86                     ; 66 }
  89  0000 80            	iret	
 111                     ; 73 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 111                     ; 74 {
 112                     .text:	section	.text,new
 113  0000               f_FLASH_IRQHandler:
 117                     ; 78 }
 120  0000 80            	iret	
 142                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 142                     ; 86 {
 143                     .text:	section	.text,new
 144  0000               f_AWU_IRQHandler:
 148                     ; 90 }
 151  0000 80            	iret	
 173                     ; 97 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 173                     ; 98 {
 174                     .text:	section	.text,new
 175  0000               f_EXTIB_IRQHandler:
 179                     ; 102 }
 182  0000 80            	iret	
 204                     ; 109 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 204                     ; 110 {
 205                     .text:	section	.text,new
 206  0000               f_EXTID_IRQHandler:
 210                     ; 114 }
 213  0000 80            	iret	
 235                     ; 121 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 235                     ; 122 {
 236                     .text:	section	.text,new
 237  0000               f_EXTI0_IRQHandler:
 241                     ; 126 }
 244  0000 80            	iret	
 266                     ; 133 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 266                     ; 134 {
 267                     .text:	section	.text,new
 268  0000               f_EXTI1_IRQHandler:
 272                     ; 138 }
 275  0000 80            	iret	
 297                     ; 145 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 297                     ; 146 {
 298                     .text:	section	.text,new
 299  0000               f_EXTI2_IRQHandler:
 303                     ; 150 }
 306  0000 80            	iret	
 328                     ; 157 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 328                     ; 158 {
 329                     .text:	section	.text,new
 330  0000               f_EXTI3_IRQHandler:
 334                     ; 162 }
 337  0000 80            	iret	
 359                     ; 169 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 359                     ; 170 {
 360                     .text:	section	.text,new
 361  0000               f_EXTI4_IRQHandler:
 365                     ; 174 }
 368  0000 80            	iret	
 390                     ; 181 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 390                     ; 182 {
 391                     .text:	section	.text,new
 392  0000               f_EXTI5_IRQHandler:
 396                     ; 186 }
 399  0000 80            	iret	
 421                     ; 193 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 421                     ; 194 
 421                     ; 195 {
 422                     .text:	section	.text,new
 423  0000               f_EXTI6_IRQHandler:
 427                     ; 199 }
 430  0000 80            	iret	
 452                     ; 206 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 452                     ; 207 {
 453                     .text:	section	.text,new
 454  0000               f_EXTI7_IRQHandler:
 458                     ; 211 }
 461  0000 80            	iret	
 483                     ; 218 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 483                     ; 219 {
 484                     .text:	section	.text,new
 485  0000               f_COMP_IRQHandler:
 489                     ; 223 }
 492  0000 80            	iret	
 517                     ; 230 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 517                     ; 231 {
 518                     .text:	section	.text,new
 519  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 521  0000 8a            	push	cc
 522  0001 84            	pop	a
 523  0002 a4bf          	and	a,#191
 524  0004 88            	push	a
 525  0005 86            	pop	cc
 526  0006 3b0002        	push	c_x+2
 527  0009 be00          	ldw	x,c_x
 528  000b 89            	pushw	x
 529  000c 3b0002        	push	c_y+2
 530  000f be00          	ldw	x,c_y
 531  0011 89            	pushw	x
 534                     ; 236 	GPIO_ToggleBits(GPIOC, GPIO_Pin_4);
 536  0012 4b10          	push	#16
 537  0014 ae500a        	ldw	x,#20490
 538  0017 cd0000        	call	_GPIO_ToggleBits
 540  001a 84            	pop	a
 541                     ; 237 	TIM2_ClearITPendingBit(TIM2_IT_Update);
 543  001b a601          	ld	a,#1
 544  001d cd0000        	call	_TIM2_ClearITPendingBit
 546                     ; 238 }
 549  0020 85            	popw	x
 550  0021 bf00          	ldw	c_y,x
 551  0023 320002        	pop	c_y+2
 552  0026 85            	popw	x
 553  0027 bf00          	ldw	c_x,x
 554  0029 320002        	pop	c_x+2
 555  002c 80            	iret	
 578                     ; 245 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 578                     ; 246 {
 579                     .text:	section	.text,new
 580  0000               f_TIM2_CAP_IRQHandler:
 584                     ; 250 }
 587  0000 80            	iret	
 610                     ; 258 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 610                     ; 259 {
 611                     .text:	section	.text,new
 612  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 616                     ; 263 }
 619  0000 80            	iret	
 642                     ; 269 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 642                     ; 270 {
 643                     .text:	section	.text,new
 644  0000               f_TIM3_CAP_IRQHandler:
 648                     ; 274 }
 651  0000 80            	iret	
 674                     ; 280 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 674                     ; 281 {
 675                     .text:	section	.text,new
 676  0000               f_TIM4_UPD_OVF_IRQHandler:
 680                     ; 285 }
 683  0000 80            	iret	
 705                     ; 292 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
 705                     ; 293 {
 706                     .text:	section	.text,new
 707  0000               f_SPI_IRQHandler:
 711                     ; 297 }
 714  0000 80            	iret	
 737                     ; 303 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
 737                     ; 304 {
 738                     .text:	section	.text,new
 739  0000               f_USART_TX_IRQHandler:
 743                     ; 308 }
 746  0000 80            	iret	
 769                     ; 315 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
 769                     ; 316 {
 770                     .text:	section	.text,new
 771  0000               f_USART_RX_IRQHandler:
 775                     ; 320 }
 778  0000 80            	iret	
 800                     ; 328 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
 800                     ; 329 {
 801                     .text:	section	.text,new
 802  0000               f_I2C_IRQHandler:
 806                     ; 333 }
 809  0000 80            	iret	
 821                     	xdef	f_I2C_IRQHandler
 822                     	xdef	f_USART_RX_IRQHandler
 823                     	xdef	f_USART_TX_IRQHandler
 824                     	xdef	f_SPI_IRQHandler
 825                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 826                     	xdef	f_TIM3_CAP_IRQHandler
 827                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 828                     	xdef	f_TIM2_CAP_IRQHandler
 829                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 830                     	xdef	f_COMP_IRQHandler
 831                     	xdef	f_EXTI7_IRQHandler
 832                     	xdef	f_EXTI6_IRQHandler
 833                     	xdef	f_EXTI5_IRQHandler
 834                     	xdef	f_EXTI4_IRQHandler
 835                     	xdef	f_EXTI3_IRQHandler
 836                     	xdef	f_EXTI2_IRQHandler
 837                     	xdef	f_EXTI1_IRQHandler
 838                     	xdef	f_EXTI0_IRQHandler
 839                     	xdef	f_EXTID_IRQHandler
 840                     	xdef	f_EXTIB_IRQHandler
 841                     	xdef	f_AWU_IRQHandler
 842                     	xdef	f_FLASH_IRQHandler
 843                     	xdef	f_TRAP_IRQHandler
 844                     	xdef	f_NonHandledInterrupt
 845                     	xref	_TIM2_ClearITPendingBit
 846                     	xref	_GPIO_ToggleBits
 847                     	xref.b	c_x
 848                     	xref.b	c_y
 867                     	end
