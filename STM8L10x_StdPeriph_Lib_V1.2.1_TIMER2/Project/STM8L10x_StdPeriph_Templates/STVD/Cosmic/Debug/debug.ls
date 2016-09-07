   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  53                     ; 13 void UART_Config(void) //default UART pin , PD5:TX , PD6:RX
  53                     ; 14 {
  55                     .text:	section	.text,new
  56  0000               _UART_Config:
  60                     ; 15 	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_Out_PP_High_Slow);//UART TX
  62  0000 4bd0          	push	#208
  63  0002 4b04          	push	#4
  64  0004 ae500a        	ldw	x,#20490
  65  0007 cd0000        	call	_GPIO_Init
  67  000a 85            	popw	x
  68                     ; 16 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);	
  70  000b 4b40          	push	#64
  71  000d 4b08          	push	#8
  72  000f ae500a        	ldw	x,#20490
  73  0012 cd0000        	call	_GPIO_Init
  75  0015 85            	popw	x
  76                     ; 18 	USART_DeInit();
  78  0016 cd0000        	call	_USART_DeInit
  80                     ; 29 	USART_Init((uint32_t)115200, USART_WordLength_8D, USART_StopBits_1, USART_Parity_No,USART_Mode_Tx);
  82  0019 4b08          	push	#8
  83  001b 4b00          	push	#0
  84  001d 4b00          	push	#0
  85  001f 4b00          	push	#0
  86  0021 aec200        	ldw	x,#49664
  87  0024 89            	pushw	x
  88  0025 ae0001        	ldw	x,#1
  89  0028 89            	pushw	x
  90  0029 cd0000        	call	_USART_Init
  92  002c 5b08          	addw	sp,#8
  93                     ; 32     USART_ITConfig(USART_IT_RXNE, ENABLE);
  95  002e 4b01          	push	#1
  96  0030 ae0255        	ldw	x,#597
  97  0033 cd0000        	call	_USART_ITConfig
  99  0036 84            	pop	a
 100                     ; 33   	USART_Cmd(ENABLE);    
 102  0037 a601          	ld	a,#1
 104                     ; 37 }
 107  0039 cc0000        	jp	_USART_Cmd
 143                     ; 39 static PutChar(uint8_t ch)
 143                     ; 40 {
 144                     .text:	section	.text,new
 145  0000               L12_PutChar:
 149                     ; 41 	USART_SendData8(ch);
 151  0000 cd0000        	call	_USART_SendData8
 154  0003               L34:
 155                     ; 42 	while (USART_GetFlagStatus(USART_FLAG_TXE) == RESET);
 157  0003 ae0080        	ldw	x,#128
 158  0006 cd0000        	call	_USART_GetFlagStatus
 160  0009 4d            	tnz	a
 161  000a 27f7          	jreq	L34
 162                     ; 43 }
 165  000c 81            	ret	
 285                     .const:	section	.text
 286  0000               L43:
 287  0000 0000000a      	dc.l	10
 288  0004               L63:
 289  0004 00000064      	dc.l	100
 290  0008               L04:
 291  0008 000003e8      	dc.l	1000
 292  000c               L24:
 293  000c 00002710      	dc.l	10000
 294                     ; 45 void PRINTF(char* STR,bool ShowValue,uint32_t value)
 294                     ; 46 {
 295                     .text:	section	.text,new
 296  0000               _PRINTF:
 298  0000 89            	pushw	x
 299  0001 5205          	subw	sp,#5
 300       00000005      OFST:	set	5
 303  0003 1e06          	ldw	x,(OFST+1,sp)
 304  0005 f6            	ld	a,(x)
 305  0006               L131:
 306                     ; 51 		PutChar(*STR);
 308  0006 cd0000        	call	L12_PutChar
 310                     ; 52 		STR++;
 312  0009 1e06          	ldw	x,(OFST+1,sp)
 313  000b 5c            	incw	x
 314  000c 1f06          	ldw	(OFST+1,sp),x
 315                     ; 53 	}while(*STR != '\n');
 317  000e f6            	ld	a,(x)
 318  000f a10a          	cp	a,#10
 319  0011 26f3          	jrne	L131
 320                     ; 55 	if(ShowValue == TRUE)
 322  0013 7b0a          	ld	a,(OFST+5,sp)
 323  0015 4a            	dec	a
 324  0016 2664          	jrne	L731
 325                     ; 57 		E = value%10;
 327  0018 96            	ldw	x,sp
 328  0019 ad7a          	call	LC002
 329  001b cd0000        	call	c_lumd
 331  001e b603          	ld	a,c_lreg+3
 332  0020 6b01          	ld	(OFST-4,sp),a
 333                     ; 58 		D = (value/10)%10;
 335  0022 96            	ldw	x,sp
 336  0023 ad70          	call	LC002
 337  0025 ad62          	call	LC001
 338  0027 6b05          	ld	(OFST+0,sp),a
 339                     ; 59 		C = (value/10/10)%10;
 341  0029 96            	ldw	x,sp
 342  002a 1c000b        	addw	x,#OFST+6
 343  002d cd0000        	call	c_ltor
 345  0030 ae0004        	ldw	x,#L63
 346  0033 ad54          	call	LC001
 347  0035 6b04          	ld	(OFST-1,sp),a
 348                     ; 60 		B = (value/10/10/10)%10;
 350  0037 96            	ldw	x,sp
 351  0038 1c000b        	addw	x,#OFST+6
 352  003b cd0000        	call	c_ltor
 354  003e ae0008        	ldw	x,#L04
 355  0041 ad46          	call	LC001
 356  0043 6b03          	ld	(OFST-2,sp),a
 357                     ; 61 		A = (value/10/10/10/10)%10;
 359  0045 96            	ldw	x,sp
 360  0046 1c000b        	addw	x,#OFST+6
 361  0049 cd0000        	call	c_ltor
 363  004c ae000c        	ldw	x,#L24
 364  004f ad38          	call	LC001
 365  0051 6b02          	ld	(OFST-3,sp),a
 366                     ; 62 		if(A != 0)
 368  0053 2705          	jreq	L141
 369                     ; 63 			PutChar(A+0x30);
 371  0055 ab30          	add	a,#48
 372  0057 cd0000        	call	L12_PutChar
 374  005a               L141:
 375                     ; 64 		if(B != 0)
 377  005a 7b03          	ld	a,(OFST-2,sp)
 378  005c 2705          	jreq	L341
 379                     ; 65 			PutChar(B+0x30);
 381  005e ab30          	add	a,#48
 382  0060 cd0000        	call	L12_PutChar
 384  0063               L341:
 385                     ; 66 		if(C != 0)
 387  0063 7b04          	ld	a,(OFST-1,sp)
 388  0065 2705          	jreq	L541
 389                     ; 67 			PutChar(C+0x30);
 391  0067 ab30          	add	a,#48
 392  0069 cd0000        	call	L12_PutChar
 394  006c               L541:
 395                     ; 68 		if(D != 0)		
 397  006c 7b05          	ld	a,(OFST+0,sp)
 398  006e 2705          	jreq	L741
 399                     ; 69 			PutChar(D+0x30);
 401  0070 ab30          	add	a,#48
 402  0072 cd0000        	call	L12_PutChar
 404  0075               L741:
 405                     ; 70 		PutChar(E+0x30);
 407  0075 7b01          	ld	a,(OFST-4,sp)
 408  0077 ab30          	add	a,#48
 409  0079 cd0000        	call	L12_PutChar
 411  007c               L731:
 412                     ; 72 	PutChar(0x0A);
 414  007c a60a          	ld	a,#10
 415  007e cd0000        	call	L12_PutChar
 417                     ; 73 	PutChar(0x0D);
 419  0081 a60d          	ld	a,#13
 420  0083 cd0000        	call	L12_PutChar
 422                     ; 76 }
 425  0086 5b07          	addw	sp,#7
 426  0088 81            	ret	
 427  0089               LC001:
 428  0089 cd0000        	call	c_ludv
 430  008c ae0000        	ldw	x,#L43
 431  008f cd0000        	call	c_lumd
 433  0092 b603          	ld	a,c_lreg+3
 434  0094 81            	ret	
 435  0095               LC002:
 436  0095 1c000b        	addw	x,#OFST+6
 437  0098 cd0000        	call	c_ltor
 439  009b ae0000        	ldw	x,#L43
 440  009e 81            	ret	
 453                     	xdef	_PRINTF
 454                     	xdef	_UART_Config
 455                     	xref	_USART_GetFlagStatus
 456                     	xref	_USART_SendData8
 457                     	xref	_USART_ITConfig
 458                     	xref	_USART_Cmd
 459                     	xref	_USART_Init
 460                     	xref	_USART_DeInit
 461                     	xref	_GPIO_Init
 462                     	xref.b	c_lreg
 463                     	xref.b	c_x
 482                     	xref	c_ludv
 483                     	xref	c_lumd
 484                     	xref	c_ltor
 485                     	end
