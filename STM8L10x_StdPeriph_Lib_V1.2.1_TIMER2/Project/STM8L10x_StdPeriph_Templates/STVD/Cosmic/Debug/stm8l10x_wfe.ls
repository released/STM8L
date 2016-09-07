   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 55 void WFE_DeInit(void)
  48                     ; 56 {
  50                     .text:	section	.text,new
  51  0000               _WFE_DeInit:
  55                     ; 57   WFE->CR1 = WFE_CR1_RESET_VALUE;
  57  0000 725f50a6      	clr	20646
  58                     ; 58   WFE->CR2 = WFE_CR2_RESET_VALUE;
  60  0004 725f50a7      	clr	20647
  61                     ; 59 }
  64  0008 81            	ret	
 241                     ; 80 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 241                     ; 81 {
 242                     .text:	section	.text,new
 243  0000               _WFE_WakeUpSourceEventCmd:
 245  0000 89            	pushw	x
 246  0001 88            	push	a
 247       00000001      OFST:	set	1
 250                     ; 82   uint8_t register_index = 0;
 252                     ; 84   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 254                     ; 85   assert_param(IS_FUNCTIONAL_STATE(NewState));
 256                     ; 88   register_index = (uint8_t)((uint16_t)WFE_Source >> (uint8_t)0x08);
 258  0002 9e            	ld	a,xh
 259  0003 6b01          	ld	(OFST+0,sp),a
 260                     ; 90   if (NewState != DISABLE)
 262  0005 0d06          	tnz	(OFST+5,sp)
 263  0007 2719          	jreq	L721
 264                     ; 92     switch (register_index)
 267                     ; 102       default:
 267                     ; 103         break;
 268  0009 4a            	dec	a
 269  000a 2705          	jreq	L12
 270  000c 4a            	dec	a
 271  000d 2709          	jreq	L32
 272  000f 2022          	jra	L531
 273  0011               L12:
 274                     ; 94       case 1:
 274                     ; 95         WFE->CR1 |= (uint8_t)WFE_Source;
 276  0011 c650a6        	ld	a,20646
 277  0014 1a03          	or	a,(OFST+2,sp)
 278                     ; 96         break;
 280  0016 2018          	jp	LC001
 281  0018               L32:
 282                     ; 98       case 2:
 282                     ; 99         WFE->CR2 |= (uint8_t)WFE_Source;
 284  0018 c650a7        	ld	a,20647
 285  001b 1a03          	or	a,(OFST+2,sp)
 286  001d               LC002:
 287  001d c750a7        	ld	20647,a
 288                     ; 100         break;
 290  0020 2011          	jra	L531
 291                     ; 102       default:
 291                     ; 103         break;
 294  0022               L721:
 295                     ; 108     switch (register_index)
 298                     ; 118       default:
 298                     ; 119         break;
 299  0022 4a            	dec	a
 300  0023 2705          	jreq	L72
 301  0025 4a            	dec	a
 302  0026 270e          	jreq	L13
 303  0028 2009          	jra	L531
 304  002a               L72:
 305                     ; 110       case 1:
 305                     ; 111         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 307  002a 7b03          	ld	a,(OFST+2,sp)
 308  002c 43            	cpl	a
 309  002d c450a6        	and	a,20646
 310  0030               LC001:
 311  0030 c750a6        	ld	20646,a
 312                     ; 112         break;
 313  0033               L531:
 314                     ; 122 }
 317  0033 5b03          	addw	sp,#3
 318  0035 81            	ret	
 319  0036               L13:
 320                     ; 114       case 2:
 320                     ; 115         WFE->CR2 &= (uint8_t)(~(uint8_t)WFE_Source);
 322  0036 7b03          	ld	a,(OFST+2,sp)
 323  0038 43            	cpl	a
 324  0039 c450a7        	and	a,20647
 325                     ; 116         break;
 327  003c 20df          	jp	LC002
 328                     ; 118       default:
 328                     ; 119         break;
 376                     ; 142 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 376                     ; 143 {
 377                     .text:	section	.text,new
 378  0000               _WFE_GetWakeUpSourceEventStatus:
 380  0000 89            	pushw	x
 381  0001 88            	push	a
 382       00000001      OFST:	set	1
 385                     ; 144   FunctionalState status = DISABLE;
 387  0002 0f01          	clr	(OFST+0,sp)
 388                     ; 146   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 390                     ; 148   switch (WFE_Source)
 393                     ; 187     default:
 393                     ; 188       break;
 394  0004 1d0101        	subw	x,#257
 395  0007 2735          	jreq	L341
 396  0009 5a            	decw	x
 397  000a 2732          	jreq	L341
 398  000c 1d000e        	subw	x,#14
 399  000f 272d          	jreq	L341
 400  0011 1d0010        	subw	x,#16
 401  0014 2728          	jreq	L341
 402  0016 1d0020        	subw	x,#32
 403  0019 2723          	jreq	L341
 404  001b 1d0040        	subw	x,#64
 405  001e 271e          	jreq	L341
 406  0020 1d0081        	subw	x,#129
 407  0023 2722          	jreq	L541
 408  0025 5a            	decw	x
 409  0026 271f          	jreq	L541
 410  0028 1d0002        	subw	x,#2
 411  002b 271a          	jreq	L541
 412  002d 1d0004        	subw	x,#4
 413  0030 2715          	jreq	L541
 414  0032 1d0008        	subw	x,#8
 415  0035 2710          	jreq	L541
 416  0037 1d0010        	subw	x,#16
 417  003a 270b          	jreq	L541
 418  003c 2018          	jra	L571
 419  003e               L341:
 420                     ; 150     case WFE_Source_TIM2_EV0:
 420                     ; 151     case WFE_Source_TIM2_EV1:
 420                     ; 152     case WFE_Source_EXTI_EV0:
 420                     ; 153     case WFE_Source_EXTI_EV1:
 420                     ; 154     case WFE_Source_EXTI_EV2:
 420                     ; 155     case WFE_Source_EXTI_EV3:
 420                     ; 156 
 420                     ; 157       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 422  003e c650a6        	ld	a,20646
 423  0041 1503          	bcp	a,(OFST+2,sp)
 424  0043 270f          	jreq	L302
 425                     ; 160         status = ENABLE;
 427  0045 2007          	jp	LC004
 428                     ; 165         status = DISABLE;
 429  0047               L541:
 430                     ; 169     case WFE_Source_EXTI_EV4:
 430                     ; 170     case WFE_Source_EXTI_EV5:
 430                     ; 171     case WFE_Source_EXTI_EV6:
 430                     ; 172     case WFE_Source_EXTI_EV7:
 430                     ; 173     case WFE_Source_EXTI_EVB:
 430                     ; 174     case WFE_Source_EXTI_EVD:
 430                     ; 175 
 430                     ; 176       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 432  0047 c650a7        	ld	a,20647
 433  004a 1503          	bcp	a,(OFST+2,sp)
 434  004c 2706          	jreq	L302
 435                     ; 179         status = ENABLE;
 437  004e               LC004:
 439  004e a601          	ld	a,#1
 440  0050 6b01          	ld	(OFST+0,sp),a
 442  0052 2002          	jra	L571
 443  0054               L302:
 444                     ; 184         status = DISABLE;
 447  0054 0f01          	clr	(OFST+0,sp)
 448                     ; 187     default:
 448                     ; 188       break;
 450  0056               L571:
 451                     ; 190   return status;
 453  0056 7b01          	ld	a,(OFST+0,sp)
 456  0058 5b03          	addw	sp,#3
 457  005a 81            	ret	
 470                     	xdef	_WFE_GetWakeUpSourceEventStatus
 471                     	xdef	_WFE_WakeUpSourceEventCmd
 472                     	xdef	_WFE_DeInit
 491                     	end
