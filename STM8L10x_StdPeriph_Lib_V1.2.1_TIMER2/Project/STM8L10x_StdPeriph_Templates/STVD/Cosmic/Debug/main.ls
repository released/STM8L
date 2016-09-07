   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 44 void GPIO_Config(void)
  49                     ; 45 {
  51                     .text:	section	.text,new
  52  0000               _GPIO_Config:
  56                     ; 46 	GPIO_Init(GPIOC, GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  58  0000 4be0          	push	#224
  59  0002 4b10          	push	#16
  60  0004 ae500a        	ldw	x,#20490
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 47 }
  67  000b 81            	ret	
  95                     ; 49 void TIM2_Config(void)
  95                     ; 50 {
  96                     .text:	section	.text,new
  97  0000               _TIM2_Config:
 101                     ; 51 	TIM2_DeInit();
 103  0000 cd0000        	call	_TIM2_DeInit
 105                     ; 53 	TIM2_TimeBaseInit(TIM2_Prescaler_1,TIM2_CounterMode_Up, 1);
 107  0003 ae0001        	ldw	x,#1
 108  0006 89            	pushw	x
 109  0007 5f            	clrw	x
 110  0008 cd0000        	call	_TIM2_TimeBaseInit
 112  000b 85            	popw	x
 113                     ; 56 	TIM2_ClearFlag(TIM2_FLAG_Update);
 115  000c ae0001        	ldw	x,#1
 116  000f cd0000        	call	_TIM2_ClearFlag
 118                     ; 58 	TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 120  0012 ae0101        	ldw	x,#257
 121  0015 cd0000        	call	_TIM2_ITConfig
 123                     ; 61 	TIM2_Cmd(ENABLE);
 125  0018 a601          	ld	a,#1
 127                     ; 62 }
 130  001a cc0000        	jp	_TIM2_Cmd
 164                     ; 64 void _Delay(uint32_t u32Delay)
 164                     ; 65 {
 165                     .text:	section	.text,new
 166  0000               __Delay:
 168       00000000      OFST:	set	0
 171  0000               L15:
 172                     ; 68 	while(u32Delay--);
 174  0000 96            	ldw	x,sp
 175  0001 1c0003        	addw	x,#OFST+3
 176  0004 cd0000        	call	c_ltor
 178  0007 96            	ldw	x,sp
 179  0008 1c0003        	addw	x,#OFST+3
 180  000b a601          	ld	a,#1
 181  000d cd0000        	call	c_lgsbc
 183  0010 cd0000        	call	c_lrzmp
 185  0013 26eb          	jrne	L15
 186                     ; 69 }
 189  0015 81            	ret	
 214                     ; 71 void CLK_Config(void)
 214                     ; 72 {
 215                     .text:	section	.text,new
 216  0000               _CLK_Config:
 220                     ; 75 	CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
 222  0000 4f            	clr	a
 223  0001 cd0000        	call	_CLK_MasterPrescalerConfig
 225                     ; 77 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
 227  0004 ae0101        	ldw	x,#257
 229                     ; 78 }
 232  0007 cc0000        	jp	_CLK_PeripheralClockConfig
 235                     	bsct
 236  0000               L56_i:
 237  0000 0000          	dc.w	0
 273                     ; 80 void main(void)
 273                     ; 81 {
 274                     .text:	section	.text,new
 275  0000               _main:
 279                     ; 84 	CLK_Config();
 281  0000 cd0000        	call	_CLK_Config
 283                     ; 88 	GPIO_Config();
 285  0003 cd0000        	call	_GPIO_Config
 287                     ; 90 	TIM2_Config();
 289  0006 cd0000        	call	_TIM2_Config
 291                     ; 91 	enableInterrupts();
 294  0009 9a            	rim	
 296  000a               L501:
 298  000a 20fe          	jra	L501
 311                     	xdef	_main
 312                     	xdef	_CLK_Config
 313                     	xdef	__Delay
 314                     	xdef	_TIM2_Config
 315                     	xdef	_GPIO_Config
 316                     	xref	_TIM2_ClearFlag
 317                     	xref	_TIM2_ITConfig
 318                     	xref	_TIM2_Cmd
 319                     	xref	_TIM2_TimeBaseInit
 320                     	xref	_TIM2_DeInit
 321                     	xref	_GPIO_Init
 322                     	xref	_CLK_MasterPrescalerConfig
 323                     	xref	_CLK_PeripheralClockConfig
 342                     	xref	c_lrzmp
 343                     	xref	c_lgsbc
 344                     	xref	c_ltor
 345                     	end
