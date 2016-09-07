   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 64 void TIM3_DeInit(void)
  48                     ; 65 {
  50                     .text:	section	.text,new
  51  0000               _TIM3_DeInit:
  55                     ; 66   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  57  0000 725f5280      	clr	21120
  58                     ; 67   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  60  0004 725f5281      	clr	21121
  61                     ; 68   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  63  0008 725f5282      	clr	21122
  64                     ; 69   TIM3->ETR = TIM_ETR_RESET_VALUE;
  66  000c 725f5283      	clr	21123
  67                     ; 70   TIM3->IER = TIM_IER_RESET_VALUE;
  69  0010 725f5284      	clr	21124
  70                     ; 71   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  72  0014 725f5286      	clr	21126
  73                     ; 74   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  75  0018 725f528a      	clr	21130
  76                     ; 76   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  78  001c 35015288      	mov	21128,#1
  79                     ; 77   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  81  0020 35015289      	mov	21129,#1
  82                     ; 80   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  84  0024 725f528a      	clr	21130
  85                     ; 81   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  87  0028 725f5288      	clr	21128
  88                     ; 82   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  90  002c 725f5289      	clr	21129
  91                     ; 84   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  93  0030 725f528b      	clr	21131
  94                     ; 85   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  96  0034 725f528c      	clr	21132
  97                     ; 87   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  99  0038 725f528d      	clr	21133
 100                     ; 89   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 102  003c 35ff528e      	mov	21134,#255
 103                     ; 90   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 105  0040 35ff528f      	mov	21135,#255
 106                     ; 92   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 108  0044 725f5290      	clr	21136
 109                     ; 93   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 111  0048 725f5291      	clr	21137
 112                     ; 94   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 114  004c 725f5292      	clr	21138
 115                     ; 95   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 117  0050 725f5293      	clr	21139
 118                     ; 98   TIM3->OISR = TIM_OISR_RESET_VALUE;
 120  0054 725f5295      	clr	21141
 121                     ; 99   TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 123  0058 35015287      	mov	21127,#1
 124                     ; 100   TIM3->BKR = TIM_BKR_RESET_VALUE;
 126  005c 725f5294      	clr	21140
 127                     ; 101   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 129  0060 725f5285      	clr	21125
 130                     ; 102 }
 133  0064 81            	ret	
 295                     ; 127 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 295                     ; 128                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 295                     ; 129                        uint16_t TIM3_Period)
 295                     ; 130 {
 296                     .text:	section	.text,new
 297  0000               _TIM3_TimeBaseInit:
 299  0000 89            	pushw	x
 300       00000000      OFST:	set	0
 303                     ; 132   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 305                     ; 133   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 307                     ; 138   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 309  0001 7b05          	ld	a,(OFST+5,sp)
 310  0003 c7528e        	ld	21134,a
 311                     ; 139   TIM3->ARRL = (uint8_t)(TIM3_Period);
 313  0006 7b06          	ld	a,(OFST+6,sp)
 314  0008 c7528f        	ld	21135,a
 315                     ; 142   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 317  000b 9e            	ld	a,xh
 318  000c c7528d        	ld	21133,a
 319                     ; 145   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 321  000f c65280        	ld	a,21120
 322  0012 a48f          	and	a,#143
 323  0014 c75280        	ld	21120,a
 324                     ; 146   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 326  0017 9f            	ld	a,xl
 327  0018 ca5280        	or	a,21120
 328  001b c75280        	ld	21120,a
 329                     ; 147 }
 332  001e 85            	popw	x
 333  001f 81            	ret	
 531                     ; 174 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 531                     ; 175                   TIM3_OutputState_TypeDef TIM3_OutputState,
 531                     ; 176                   uint16_t TIM3_Pulse,
 531                     ; 177                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 531                     ; 178                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 531                     ; 179 {
 532                     .text:	section	.text,new
 533  0000               _TIM3_OC1Init:
 535  0000 89            	pushw	x
 536  0001 88            	push	a
 537       00000001      OFST:	set	1
 540                     ; 180   uint8_t tmpccmr1 = 0;
 542                     ; 183   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 544                     ; 184   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 546                     ; 185   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 548                     ; 186   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 550                     ; 188   tmpccmr1 = TIM3->CCMR1;
 552  0002 c65288        	ld	a,21128
 553  0005 6b01          	ld	(OFST+0,sp),a
 554                     ; 191   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 556  0007 7211528a      	bres	21130,#0
 557                     ; 193   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 559  000b a48f          	and	a,#143
 560  000d 6b01          	ld	(OFST+0,sp),a
 561                     ; 196   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 563  000f 9e            	ld	a,xh
 564  0010 1a01          	or	a,(OFST+0,sp)
 565  0012 6b01          	ld	(OFST+0,sp),a
 566                     ; 198   TIM3->CCMR1 = tmpccmr1;
 568  0014 c75288        	ld	21128,a
 569                     ; 201   if (TIM3_OutputState == TIM3_OutputState_Enable)
 571  0017 9f            	ld	a,xl
 572  0018 4a            	dec	a
 573  0019 2606          	jrne	L722
 574                     ; 203     TIM3->CCER1 |= TIM_CCER1_CC1E;
 576  001b 7210528a      	bset	21130,#0
 578  001f 2004          	jra	L132
 579  0021               L722:
 580                     ; 207     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 582  0021 7211528a      	bres	21130,#0
 583  0025               L132:
 584                     ; 211   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 586  0025 7b08          	ld	a,(OFST+7,sp)
 587  0027 4a            	dec	a
 588  0028 2606          	jrne	L332
 589                     ; 213     TIM3->CCER1 |= TIM_CCER1_CC1P;
 591  002a 7212528a      	bset	21130,#1
 593  002e 2004          	jra	L532
 594  0030               L332:
 595                     ; 217     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 597  0030 7213528a      	bres	21130,#1
 598  0034               L532:
 599                     ; 221   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 601  0034 7b09          	ld	a,(OFST+8,sp)
 602  0036 4a            	dec	a
 603  0037 2606          	jrne	L732
 604                     ; 223     TIM3->OISR |= TIM_OISR_OIS1;
 606  0039 72105295      	bset	21141,#0
 608  003d 2004          	jra	L142
 609  003f               L732:
 610                     ; 227     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 612  003f 72115295      	bres	21141,#0
 613  0043               L142:
 614                     ; 231   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 616  0043 7b06          	ld	a,(OFST+5,sp)
 617  0045 c75290        	ld	21136,a
 618                     ; 232   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 620  0048 7b07          	ld	a,(OFST+6,sp)
 621  004a c75291        	ld	21137,a
 622                     ; 233 }
 625  004d 5b03          	addw	sp,#3
 626  004f 81            	ret	
 709                     ; 260 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 709                     ; 261                   TIM3_OutputState_TypeDef TIM3_OutputState,
 709                     ; 262                   uint16_t TIM3_Pulse,
 709                     ; 263                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 709                     ; 264                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 709                     ; 265 {
 710                     .text:	section	.text,new
 711  0000               _TIM3_OC2Init:
 713  0000 89            	pushw	x
 714  0001 88            	push	a
 715       00000001      OFST:	set	1
 718                     ; 266   uint8_t tmpccmr2 = 0;
 720                     ; 269   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 722                     ; 270   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 724                     ; 271   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 726                     ; 272   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 728                     ; 274   tmpccmr2 = TIM3->CCMR2;
 730  0002 c65289        	ld	a,21129
 731  0005 6b01          	ld	(OFST+0,sp),a
 732                     ; 277   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 734  0007 7219528a      	bres	21130,#4
 735                     ; 280   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 737  000b a48f          	and	a,#143
 738  000d 6b01          	ld	(OFST+0,sp),a
 739                     ; 283   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 741  000f 9e            	ld	a,xh
 742  0010 1a01          	or	a,(OFST+0,sp)
 743  0012 6b01          	ld	(OFST+0,sp),a
 744                     ; 285   TIM3->CCMR2 = tmpccmr2;
 746  0014 c75289        	ld	21129,a
 747                     ; 288   if (TIM3_OutputState == TIM3_OutputState_Enable)
 749  0017 9f            	ld	a,xl
 750  0018 4a            	dec	a
 751  0019 2606          	jrne	L503
 752                     ; 290     TIM3->CCER1 |= TIM_CCER1_CC2E;
 754  001b 7218528a      	bset	21130,#4
 756  001f 2004          	jra	L703
 757  0021               L503:
 758                     ; 294     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 760  0021 7219528a      	bres	21130,#4
 761  0025               L703:
 762                     ; 298   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 764  0025 7b08          	ld	a,(OFST+7,sp)
 765  0027 4a            	dec	a
 766  0028 2606          	jrne	L113
 767                     ; 300     TIM3->CCER1 |= TIM_CCER1_CC2P;
 769  002a 721a528a      	bset	21130,#5
 771  002e 2004          	jra	L313
 772  0030               L113:
 773                     ; 304     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 775  0030 721b528a      	bres	21130,#5
 776  0034               L313:
 777                     ; 309   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 779  0034 7b09          	ld	a,(OFST+8,sp)
 780  0036 4a            	dec	a
 781  0037 2606          	jrne	L513
 782                     ; 311     TIM3->OISR |= TIM_OISR_OIS2;
 784  0039 72145295      	bset	21141,#2
 786  003d 2004          	jra	L713
 787  003f               L513:
 788                     ; 315     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 790  003f 72155295      	bres	21141,#2
 791  0043               L713:
 792                     ; 319   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 794  0043 7b06          	ld	a,(OFST+5,sp)
 795  0045 c75292        	ld	21138,a
 796                     ; 320   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 798  0048 7b07          	ld	a,(OFST+6,sp)
 799  004a c75293        	ld	21139,a
 800                     ; 321 }
 803  004d 5b03          	addw	sp,#3
 804  004f 81            	ret	
1002                     ; 350 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1002                     ; 351                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1002                     ; 352                     TIM3_BreakState_TypeDef TIM3_BreakState,
1002                     ; 353                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1002                     ; 354                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1002                     ; 355 
1002                     ; 356 {
1003                     .text:	section	.text,new
1004  0000               _TIM3_BKRConfig:
1006  0000 89            	pushw	x
1007       00000000      OFST:	set	0
1010                     ; 358   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1012                     ; 359   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1014                     ; 360   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1016                     ; 361   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1018                     ; 362   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1020                     ; 369   TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel | \
1020                     ; 370                         (uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity | \
1020                     ; 371                         (uint8_t)TIM3_AutomaticOutput);
1022  0001 9f            	ld	a,xl
1023  0002 1a01          	or	a,(OFST+1,sp)
1024  0004 1a05          	or	a,(OFST+5,sp)
1025  0006 1a06          	or	a,(OFST+6,sp)
1026  0008 1a07          	or	a,(OFST+7,sp)
1027  000a c75294        	ld	21140,a
1028                     ; 372 }
1031  000d 85            	popw	x
1032  000e 81            	ret	
1216                     ; 398 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1216                     ; 399                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1216                     ; 400                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1216                     ; 401                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1216                     ; 402                  uint8_t TIM3_ICFilter)
1216                     ; 403 {
1217                     .text:	section	.text,new
1218  0000               _TIM3_ICInit:
1220  0000 89            	pushw	x
1221       00000000      OFST:	set	0
1224                     ; 405   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1226                     ; 407   if (TIM3_Channel == TIM3_Channel_1)
1228  0001 9e            	ld	a,xh
1229  0002 4d            	tnz	a
1230  0003 2614          	jrne	L735
1231                     ; 410     TI1_Config(TIM3_ICPolarity,
1231                     ; 411                TIM3_ICSelection,
1231                     ; 412                TIM3_ICFilter);
1233  0005 7b07          	ld	a,(OFST+7,sp)
1234  0007 88            	push	a
1235  0008 7b06          	ld	a,(OFST+6,sp)
1236  000a 97            	ld	xl,a
1237  000b 7b03          	ld	a,(OFST+3,sp)
1238  000d 95            	ld	xh,a
1239  000e cd0000        	call	L3_TI1_Config
1241  0011 84            	pop	a
1242                     ; 415     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1244  0012 7b06          	ld	a,(OFST+6,sp)
1245  0014 cd0000        	call	_TIM3_SetIC1Prescaler
1248  0017 2012          	jra	L145
1249  0019               L735:
1250                     ; 420     TI2_Config(TIM3_ICPolarity,
1250                     ; 421                TIM3_ICSelection,
1250                     ; 422                TIM3_ICFilter);
1252  0019 7b07          	ld	a,(OFST+7,sp)
1253  001b 88            	push	a
1254  001c 7b06          	ld	a,(OFST+6,sp)
1255  001e 97            	ld	xl,a
1256  001f 7b03          	ld	a,(OFST+3,sp)
1257  0021 95            	ld	xh,a
1258  0022 cd0000        	call	L5_TI2_Config
1260  0025 84            	pop	a
1261                     ; 424     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1263  0026 7b06          	ld	a,(OFST+6,sp)
1264  0028 cd0000        	call	_TIM3_SetIC2Prescaler
1266  002b               L145:
1267                     ; 426 }
1270  002b 85            	popw	x
1271  002c 81            	ret	
1367                     ; 452 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1367                     ; 453                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1367                     ; 454                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1367                     ; 455                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1367                     ; 456                      uint8_t TIM3_ICFilter)
1367                     ; 457 {
1368                     .text:	section	.text,new
1369  0000               _TIM3_PWMIConfig:
1371  0000 89            	pushw	x
1372  0001 89            	pushw	x
1373       00000002      OFST:	set	2
1376                     ; 458   uint8_t icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1378                     ; 459   uint8_t icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1380                     ; 462   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1382                     ; 465   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1384  0002 9f            	ld	a,xl
1385  0003 4d            	tnz	a
1386  0004 2605          	jrne	L116
1387                     ; 467     icpolarity = (uint8_t)TIM3_ICPolarity_Falling;
1389  0006 4c            	inc	a
1390  0007 6b01          	ld	(OFST-1,sp),a
1392  0009 2002          	jra	L316
1393  000b               L116:
1394                     ; 471     icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1396  000b 0f01          	clr	(OFST-1,sp)
1397  000d               L316:
1398                     ; 475   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1400  000d 7b07          	ld	a,(OFST+5,sp)
1401  000f 4a            	dec	a
1402  0010 2604          	jrne	L516
1403                     ; 477     icselection = (uint8_t)TIM3_ICSelection_IndirectTI;
1405  0012 a602          	ld	a,#2
1407  0014 2002          	jra	L716
1408  0016               L516:
1409                     ; 481     icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1411  0016 a601          	ld	a,#1
1412  0018               L716:
1413  0018 6b02          	ld	(OFST+0,sp),a
1414                     ; 484   if (TIM3_Channel == TIM3_Channel_1)
1416  001a 7b03          	ld	a,(OFST+1,sp)
1417  001c 2626          	jrne	L126
1418                     ; 487     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1418                     ; 488                TIM3_ICFilter);
1420  001e 7b09          	ld	a,(OFST+7,sp)
1421  0020 88            	push	a
1422  0021 7b08          	ld	a,(OFST+6,sp)
1423  0023 97            	ld	xl,a
1424  0024 7b05          	ld	a,(OFST+3,sp)
1425  0026 95            	ld	xh,a
1426  0027 cd0000        	call	L3_TI1_Config
1428  002a 84            	pop	a
1429                     ; 491     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1431  002b 7b08          	ld	a,(OFST+6,sp)
1432  002d cd0000        	call	_TIM3_SetIC1Prescaler
1434                     ; 494     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1436  0030 7b09          	ld	a,(OFST+7,sp)
1437  0032 88            	push	a
1438  0033 7b03          	ld	a,(OFST+1,sp)
1439  0035 97            	ld	xl,a
1440  0036 7b02          	ld	a,(OFST+0,sp)
1441  0038 95            	ld	xh,a
1442  0039 cd0000        	call	L5_TI2_Config
1444  003c 84            	pop	a
1445                     ; 497     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1447  003d 7b08          	ld	a,(OFST+6,sp)
1448  003f cd0000        	call	_TIM3_SetIC2Prescaler
1451  0042 2024          	jra	L326
1452  0044               L126:
1453                     ; 502     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1453                     ; 503                TIM3_ICFilter);
1455  0044 7b09          	ld	a,(OFST+7,sp)
1456  0046 88            	push	a
1457  0047 7b08          	ld	a,(OFST+6,sp)
1458  0049 97            	ld	xl,a
1459  004a 7b05          	ld	a,(OFST+3,sp)
1460  004c 95            	ld	xh,a
1461  004d cd0000        	call	L5_TI2_Config
1463  0050 84            	pop	a
1464                     ; 506     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1466  0051 7b08          	ld	a,(OFST+6,sp)
1467  0053 cd0000        	call	_TIM3_SetIC2Prescaler
1469                     ; 509     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1471  0056 7b09          	ld	a,(OFST+7,sp)
1472  0058 88            	push	a
1473  0059 7b03          	ld	a,(OFST+1,sp)
1474  005b 97            	ld	xl,a
1475  005c 7b02          	ld	a,(OFST+0,sp)
1476  005e 95            	ld	xh,a
1477  005f cd0000        	call	L3_TI1_Config
1479  0062 84            	pop	a
1480                     ; 512     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1482  0063 7b08          	ld	a,(OFST+6,sp)
1483  0065 cd0000        	call	_TIM3_SetIC1Prescaler
1485  0068               L326:
1486                     ; 514 }
1489  0068 5b04          	addw	sp,#4
1490  006a 81            	ret	
1545                     ; 522 void TIM3_Cmd(FunctionalState NewState)
1545                     ; 523 {
1546                     .text:	section	.text,new
1547  0000               _TIM3_Cmd:
1551                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1553                     ; 528   if (NewState != DISABLE)
1555  0000 4d            	tnz	a
1556  0001 2705          	jreq	L356
1557                     ; 530     TIM3->CR1 |= TIM_CR1_CEN;
1559  0003 72105280      	bset	21120,#0
1562  0007 81            	ret	
1563  0008               L356:
1564                     ; 534     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1566  0008 72115280      	bres	21120,#0
1567                     ; 536 }
1570  000c 81            	ret	
1606                     ; 544 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1606                     ; 545 {
1607                     .text:	section	.text,new
1608  0000               _TIM3_CtrlPWMOutputs:
1612                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 551   if (NewState != DISABLE)
1616  0000 4d            	tnz	a
1617  0001 2705          	jreq	L576
1618                     ; 553     TIM3->BKR |= TIM_BKR_MOE ;
1620  0003 721e5294      	bset	21140,#7
1623  0007 81            	ret	
1624  0008               L576:
1625                     ; 557     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1627  0008 721f5294      	bres	21140,#7
1628                     ; 559 }
1631  000c 81            	ret	
1717                     ; 574 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1717                     ; 575 {
1718                     .text:	section	.text,new
1719  0000               _TIM3_ITConfig:
1721  0000 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 577   assert_param(IS_TIM3_IT(TIM3_IT));
1727                     ; 578   assert_param(IS_FUNCTIONAL_STATE(NewState));
1729                     ; 580   if (NewState != DISABLE)
1731  0001 9f            	ld	a,xl
1732  0002 4d            	tnz	a
1733  0003 2706          	jreq	L147
1734                     ; 583     TIM3->IER |= (uint8_t)TIM3_IT;
1736  0005 9e            	ld	a,xh
1737  0006 ca5284        	or	a,21124
1739  0009 2006          	jra	L347
1740  000b               L147:
1741                     ; 588     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1743  000b 7b01          	ld	a,(OFST+1,sp)
1744  000d 43            	cpl	a
1745  000e c45284        	and	a,21124
1746  0011               L347:
1747  0011 c75284        	ld	21124,a
1748                     ; 590 }
1751  0014 85            	popw	x
1752  0015 81            	ret	
1776                     ; 597 void TIM3_InternalClockConfig(void)
1776                     ; 598 {
1777                     .text:	section	.text,new
1778  0000               _TIM3_InternalClockConfig:
1782                     ; 600   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1784  0000 c65282        	ld	a,21122
1785  0003 a4f8          	and	a,#248
1786  0005 c75282        	ld	21122,a
1787                     ; 601 }
1790  0008 81            	ret	
1907                     ; 619 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1907                     ; 620                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1907                     ; 621                               uint8_t TIM3_ExtTRGFilter)
1907                     ; 622 {
1908                     .text:	section	.text,new
1909  0000               _TIM3_ETRClockMode1Config:
1911  0000 89            	pushw	x
1912       00000000      OFST:	set	0
1915                     ; 624   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1917  0001 7b05          	ld	a,(OFST+5,sp)
1918  0003 88            	push	a
1919  0004 7b02          	ld	a,(OFST+2,sp)
1920  0006 95            	ld	xh,a
1921  0007 cd0000        	call	_TIM3_ETRConfig
1923  000a 84            	pop	a
1924                     ; 627   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1926  000b c65282        	ld	a,21122
1927  000e a4f8          	and	a,#248
1928  0010 c75282        	ld	21122,a
1929                     ; 628   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1931  0013 c65282        	ld	a,21122
1932  0016 aa07          	or	a,#7
1933  0018 c75282        	ld	21122,a
1934                     ; 631   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1936  001b c65282        	ld	a,21122
1937  001e a48f          	and	a,#143
1938  0020 c75282        	ld	21122,a
1939                     ; 632   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1941  0023 c65282        	ld	a,21122
1942  0026 aa70          	or	a,#112
1943  0028 c75282        	ld	21122,a
1944                     ; 633 }
1947  002b 85            	popw	x
1948  002c 81            	ret	
2006                     ; 651 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2006                     ; 652                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2006                     ; 653                               uint8_t TIM3_ExtTRGFilter)
2006                     ; 654 {
2007                     .text:	section	.text,new
2008  0000               _TIM3_ETRClockMode2Config:
2010  0000 89            	pushw	x
2011       00000000      OFST:	set	0
2014                     ; 656   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2016  0001 7b05          	ld	a,(OFST+5,sp)
2017  0003 88            	push	a
2018  0004 7b02          	ld	a,(OFST+2,sp)
2019  0006 95            	ld	xh,a
2020  0007 cd0000        	call	_TIM3_ETRConfig
2022  000a 721c5283      	bset	21123,#6
2023  000e 84            	pop	a
2024                     ; 659   TIM3->ETR |= TIM_ETR_ECE ;
2026                     ; 660 }
2029  000f 85            	popw	x
2030  0010 81            	ret	
2086                     ; 678 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2086                     ; 679                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2086                     ; 680                     uint8_t TIM3_ExtTRGFilter)
2086                     ; 681 {
2087                     .text:	section	.text,new
2088  0000               _TIM3_ETRConfig:
2090  0000 89            	pushw	x
2091       00000000      OFST:	set	0
2094                     ; 683   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2096                     ; 684   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2098                     ; 685   assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2100                     ; 687   TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity | (uint8_t)TIM3_ExtTRGFilter);
2102  0001 9f            	ld	a,xl
2103  0002 1a01          	or	a,(OFST+1,sp)
2104  0004 1a05          	or	a,(OFST+5,sp)
2105  0006 ca5283        	or	a,21123
2106  0009 c75283        	ld	21123,a
2107                     ; 688 }
2110  000c 85            	popw	x
2111  000d 81            	ret	
2200                     ; 705 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2200                     ; 706                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2200                     ; 707                                  uint8_t TIM3_ICFilter)
2200                     ; 708 {
2201                     .text:	section	.text,new
2202  0000               _TIM3_TIxExternalClockConfig:
2204  0000 89            	pushw	x
2205       00000000      OFST:	set	0
2208                     ; 710   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2210                     ; 711   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2212                     ; 712   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2214                     ; 715   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2216  0001 9e            	ld	a,xh
2217  0002 a160          	cp	a,#96
2218  0004 260e          	jrne	L3411
2219                     ; 717     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2221  0006 7b05          	ld	a,(OFST+5,sp)
2222  0008 88            	push	a
2223  0009 ae0001        	ldw	x,#1
2224  000c 7b03          	ld	a,(OFST+3,sp)
2225  000e 95            	ld	xh,a
2226  000f cd0000        	call	L5_TI2_Config
2229  0012 200c          	jra	L5411
2230  0014               L3411:
2231                     ; 721     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2233  0014 7b05          	ld	a,(OFST+5,sp)
2234  0016 88            	push	a
2235  0017 ae0001        	ldw	x,#1
2236  001a 7b03          	ld	a,(OFST+3,sp)
2237  001c 95            	ld	xh,a
2238  001d cd0000        	call	L3_TI1_Config
2240  0020               L5411:
2241  0020 84            	pop	a
2242                     ; 725   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2244  0021 7b01          	ld	a,(OFST+1,sp)
2245  0023 cd0000        	call	_TIM3_SelectInputTrigger
2247                     ; 728   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2249  0026 c65282        	ld	a,21122
2250  0029 aa07          	or	a,#7
2251  002b c75282        	ld	21122,a
2252                     ; 729 }
2255  002e 85            	popw	x
2256  002f 81            	ret	
2356                     ; 745 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2356                     ; 746 {
2357                     .text:	section	.text,new
2358  0000               _TIM3_SelectInputTrigger:
2360  0000 88            	push	a
2361  0001 88            	push	a
2362       00000001      OFST:	set	1
2365                     ; 747   uint8_t tmpsmcr = 0;
2367                     ; 750   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2369                     ; 752   tmpsmcr = TIM3->SMCR;
2371  0002 c65282        	ld	a,21122
2372                     ; 755   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2374  0005 a48f          	and	a,#143
2375                     ; 756   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2377  0007 1a02          	or	a,(OFST+1,sp)
2378                     ; 758   TIM3->SMCR = (uint8_t)tmpsmcr;
2380  0009 c75282        	ld	21122,a
2381                     ; 759 }
2384  000c 85            	popw	x
2385  000d 81            	ret	
2421                     ; 767 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2421                     ; 768 {
2422                     .text:	section	.text,new
2423  0000               _TIM3_UpdateDisableConfig:
2427                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
2429                     ; 773   if (NewState != DISABLE)
2431  0000 4d            	tnz	a
2432  0001 2705          	jreq	L7221
2433                     ; 775     TIM3->CR1 |= TIM_CR1_UDIS;
2435  0003 72125280      	bset	21120,#1
2438  0007 81            	ret	
2439  0008               L7221:
2440                     ; 779     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2442  0008 72135280      	bres	21120,#1
2443                     ; 781 }
2446  000c 81            	ret	
2504                     ; 791 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2504                     ; 792 {
2505                     .text:	section	.text,new
2506  0000               _TIM3_UpdateRequestConfig:
2510                     ; 794   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2512                     ; 797   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2514  0000 4a            	dec	a
2515  0001 2605          	jrne	L1621
2516                     ; 799     TIM3->CR1 |= TIM_CR1_URS ;
2518  0003 72145280      	bset	21120,#2
2521  0007 81            	ret	
2522  0008               L1621:
2523                     ; 803     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2525  0008 72155280      	bres	21120,#2
2526                     ; 805 }
2529  000c 81            	ret	
2565                     ; 813 void TIM3_SelectHallSensor(FunctionalState NewState)
2565                     ; 814 {
2566                     .text:	section	.text,new
2567  0000               _TIM3_SelectHallSensor:
2571                     ; 816   assert_param(IS_FUNCTIONAL_STATE(NewState));
2573                     ; 819   if (NewState != DISABLE)
2575  0000 4d            	tnz	a
2576  0001 2705          	jreq	L3031
2577                     ; 821     TIM3->CR2 |= TIM_CR2_TI1S;
2579  0003 721e5281      	bset	21121,#7
2582  0007 81            	ret	
2583  0008               L3031:
2584                     ; 825     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2586  0008 721f5281      	bres	21121,#7
2587                     ; 827 }
2590  000c 81            	ret	
2647                     ; 837 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2647                     ; 838 {
2648                     .text:	section	.text,new
2649  0000               _TIM3_SelectOnePulseMode:
2653                     ; 840   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2655                     ; 843   if (TIM3_OPMode == TIM3_OPMode_Single)
2657  0000 4a            	dec	a
2658  0001 2605          	jrne	L5331
2659                     ; 845     TIM3->CR1 |= TIM_CR1_OPM ;
2661  0003 72165280      	bset	21120,#3
2664  0007 81            	ret	
2665  0008               L5331:
2666                     ; 849     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2668  0008 72175280      	bres	21120,#3
2669                     ; 851 }
2672  000c 81            	ret	
2771                     ; 865 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2771                     ; 866 {
2772                     .text:	section	.text,new
2773  0000               _TIM3_SelectOutputTrigger:
2775  0000 88            	push	a
2776  0001 88            	push	a
2777       00000001      OFST:	set	1
2780                     ; 867   uint8_t tmpcr2 = 0;
2782                     ; 870   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2784                     ; 872   tmpcr2 = TIM3->CR2;
2786  0002 c65281        	ld	a,21121
2787                     ; 875   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2789  0005 a48f          	and	a,#143
2790                     ; 878   tmpcr2 |= (uint8_t)TIM3_TRGOSource;
2792  0007 1a02          	or	a,(OFST+1,sp)
2793                     ; 880   TIM3->CR2 = tmpcr2;
2795  0009 c75281        	ld	21121,a
2796                     ; 881 }
2799  000c 85            	popw	x
2800  000d 81            	ret	
2883                     ; 893 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2883                     ; 894 {
2884                     .text:	section	.text,new
2885  0000               _TIM3_SelectSlaveMode:
2887  0000 88            	push	a
2888  0001 88            	push	a
2889       00000001      OFST:	set	1
2892                     ; 895   uint8_t tmpsmcr = 0;
2894                     ; 898   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2896                     ; 900   tmpsmcr = TIM3->SMCR;
2898  0002 c65282        	ld	a,21122
2899                     ; 903   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2901  0005 a4f8          	and	a,#248
2902                     ; 906   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2904  0007 1a02          	or	a,(OFST+1,sp)
2905                     ; 908   TIM3->SMCR = tmpsmcr;
2907  0009 c75282        	ld	21122,a
2908                     ; 909 }
2911  000c 85            	popw	x
2912  000d 81            	ret	
2948                     ; 917 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2948                     ; 918 {
2949                     .text:	section	.text,new
2950  0000               _TIM3_SelectMasterSlaveMode:
2954                     ; 920   assert_param(IS_FUNCTIONAL_STATE(NewState));
2956                     ; 923   if (NewState != DISABLE)
2958  0000 4d            	tnz	a
2959  0001 2705          	jreq	L7541
2960                     ; 925     TIM3->SMCR |= TIM_SMCR_MSM;
2962  0003 721e5282      	bset	21122,#7
2965  0007 81            	ret	
2966  0008               L7541:
2967                     ; 929     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2969  0008 721f5282      	bres	21122,#7
2970                     ; 931 }
2973  000c 81            	ret	
3086                     ; 950 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3086                     ; 951                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3086                     ; 952                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3086                     ; 953 {
3087                     .text:	section	.text,new
3088  0000               _TIM3_EncoderInterfaceConfig:
3090  0000 89            	pushw	x
3091  0001 5203          	subw	sp,#3
3092       00000003      OFST:	set	3
3095                     ; 954   uint8_t tmpsmcr = 0;
3097                     ; 955   uint8_t tmpccmr1 = 0;
3099                     ; 956   uint8_t tmpccmr2 = 0;
3101                     ; 959   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3103                     ; 960   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3105                     ; 961   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3107                     ; 963   tmpsmcr = TIM3->SMCR;
3109  0003 c65282        	ld	a,21122
3110  0006 6b01          	ld	(OFST-2,sp),a
3111                     ; 964   tmpccmr1 = TIM3->CCMR1;
3113  0008 c65288        	ld	a,21128
3114  000b 6b02          	ld	(OFST-1,sp),a
3115                     ; 965   tmpccmr2 = TIM3->CCMR2;
3117  000d c65289        	ld	a,21129
3118  0010 6b03          	ld	(OFST+0,sp),a
3119                     ; 968   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3121  0012 7b01          	ld	a,(OFST-2,sp)
3122  0014 a4f0          	and	a,#240
3123  0016 6b01          	ld	(OFST-2,sp),a
3124                     ; 969   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3126  0018 9e            	ld	a,xh
3127  0019 1a01          	or	a,(OFST-2,sp)
3128  001b 6b01          	ld	(OFST-2,sp),a
3129                     ; 972   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3131  001d 7b02          	ld	a,(OFST-1,sp)
3132  001f a4fc          	and	a,#252
3133  0021 6b02          	ld	(OFST-1,sp),a
3134                     ; 973   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3136  0023 7b03          	ld	a,(OFST+0,sp)
3137  0025 a4fc          	and	a,#252
3138  0027 6b03          	ld	(OFST+0,sp),a
3139                     ; 974   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3141  0029 7b02          	ld	a,(OFST-1,sp)
3142  002b aa01          	or	a,#1
3143  002d 6b02          	ld	(OFST-1,sp),a
3144                     ; 975   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3146  002f 7b03          	ld	a,(OFST+0,sp)
3147  0031 aa01          	or	a,#1
3148  0033 6b03          	ld	(OFST+0,sp),a
3149                     ; 978   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3151  0035 9f            	ld	a,xl
3152  0036 4a            	dec	a
3153  0037 2606          	jrne	L7351
3154                     ; 980     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3156  0039 7212528a      	bset	21130,#1
3158  003d 2004          	jra	L1451
3159  003f               L7351:
3160                     ; 984     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3162  003f 7213528a      	bres	21130,#1
3163  0043               L1451:
3164                     ; 987   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3166  0043 7b08          	ld	a,(OFST+5,sp)
3167  0045 4a            	dec	a
3168  0046 2606          	jrne	L3451
3169                     ; 989     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3171  0048 721a528a      	bset	21130,#5
3173  004c 2004          	jra	L5451
3174  004e               L3451:
3175                     ; 993     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3177  004e 721b528a      	bres	21130,#5
3178  0052               L5451:
3179                     ; 996   TIM3->SMCR = tmpsmcr;
3181  0052 7b01          	ld	a,(OFST-2,sp)
3182  0054 c75282        	ld	21122,a
3183                     ; 997   TIM3->CCMR1 = tmpccmr1;
3185  0057 7b02          	ld	a,(OFST-1,sp)
3186  0059 c75288        	ld	21128,a
3187                     ; 998   TIM3->CCMR2 = tmpccmr2;
3189  005c 7b03          	ld	a,(OFST+0,sp)
3190  005e c75289        	ld	21129,a
3191                     ; 999 }
3194  0061 5b05          	addw	sp,#5
3195  0063 81            	ret	
3263                     ; 1019 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3263                     ; 1020                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3263                     ; 1021 {
3264                     .text:	section	.text,new
3265  0000               _TIM3_PrescalerConfig:
3269                     ; 1023   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3271                     ; 1024   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3273                     ; 1027   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3275  0000 9e            	ld	a,xh
3276  0001 c7528d        	ld	21133,a
3277                     ; 1031   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3279  0004 9f            	ld	a,xl
3280  0005 4a            	dec	a
3281  0006 2605          	jrne	L1061
3282                     ; 1033     TIM3->EGR |= TIM_EGR_UG ;
3284  0008 72105287      	bset	21127,#0
3287  000c 81            	ret	
3288  000d               L1061:
3289                     ; 1037     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3291  000d 72115287      	bres	21127,#0
3292                     ; 1039 }
3295  0011 81            	ret	
3340                     ; 1052 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3340                     ; 1053 {
3341                     .text:	section	.text,new
3342  0000               _TIM3_CounterModeConfig:
3344  0000 88            	push	a
3345  0001 88            	push	a
3346       00000001      OFST:	set	1
3349                     ; 1054   uint8_t tmpcr1 = 0;
3351                     ; 1057   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3353                     ; 1059   tmpcr1 = TIM3->CR1;
3355  0002 c65280        	ld	a,21120
3356                     ; 1062   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3358  0005 a48f          	and	a,#143
3359                     ; 1065   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3361  0007 1a02          	or	a,(OFST+1,sp)
3362                     ; 1067   TIM3->CR1 = tmpcr1;
3364  0009 c75280        	ld	21120,a
3365                     ; 1068 }
3368  000c 85            	popw	x
3369  000d 81            	ret	
3436                     ; 1078 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3436                     ; 1079 {
3437                     .text:	section	.text,new
3438  0000               _TIM3_ForcedOC1Config:
3440  0000 88            	push	a
3441  0001 88            	push	a
3442       00000001      OFST:	set	1
3445                     ; 1080   uint8_t tmpccmr1 = 0;
3447                     ; 1083   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3449                     ; 1085   tmpccmr1 = TIM3->CCMR1;
3451  0002 c65288        	ld	a,21128
3452                     ; 1088   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3454  0005 a48f          	and	a,#143
3455                     ; 1091   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3457  0007 1a02          	or	a,(OFST+1,sp)
3458                     ; 1093   TIM3->CCMR1 = tmpccmr1;
3460  0009 c75288        	ld	21128,a
3461                     ; 1094 }
3464  000c 85            	popw	x
3465  000d 81            	ret	
3510                     ; 1104 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3510                     ; 1105 {
3511                     .text:	section	.text,new
3512  0000               _TIM3_ForcedOC2Config:
3514  0000 88            	push	a
3515  0001 88            	push	a
3516       00000001      OFST:	set	1
3519                     ; 1106   uint8_t tmpccmr2 = 0;
3521                     ; 1109   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3523                     ; 1111   tmpccmr2 = TIM3->CCMR2;
3525  0002 c65289        	ld	a,21129
3526                     ; 1114   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3528  0005 a48f          	and	a,#143
3529                     ; 1117   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3531  0007 1a02          	or	a,(OFST+1,sp)
3532                     ; 1119   TIM3->CCMR2 = tmpccmr2;
3534  0009 c75289        	ld	21129,a
3535                     ; 1120 }
3538  000c 85            	popw	x
3539  000d 81            	ret	
3575                     ; 1128 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3575                     ; 1129 {
3576                     .text:	section	.text,new
3577  0000               _TIM3_ARRPreloadConfig:
3581                     ; 1131   assert_param(IS_FUNCTIONAL_STATE(NewState));
3583                     ; 1134   if (NewState != DISABLE)
3585  0000 4d            	tnz	a
3586  0001 2705          	jreq	L1271
3587                     ; 1136     TIM3->CR1 |= TIM_CR1_ARPE;
3589  0003 721e5280      	bset	21120,#7
3592  0007 81            	ret	
3593  0008               L1271:
3594                     ; 1140     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3596  0008 721f5280      	bres	21120,#7
3597                     ; 1142 }
3600  000c 81            	ret	
3636                     ; 1150 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3636                     ; 1151 {
3637                     .text:	section	.text,new
3638  0000               _TIM3_OC1PreloadConfig:
3642                     ; 1153   assert_param(IS_FUNCTIONAL_STATE(NewState));
3644                     ; 1156   if (NewState != DISABLE)
3646  0000 4d            	tnz	a
3647  0001 2705          	jreq	L3471
3648                     ; 1158     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3650  0003 72165288      	bset	21128,#3
3653  0007 81            	ret	
3654  0008               L3471:
3655                     ; 1162     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3657  0008 72175288      	bres	21128,#3
3658                     ; 1164 }
3661  000c 81            	ret	
3697                     ; 1172 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3697                     ; 1173 {
3698                     .text:	section	.text,new
3699  0000               _TIM3_OC2PreloadConfig:
3703                     ; 1175   assert_param(IS_FUNCTIONAL_STATE(NewState));
3705                     ; 1178   if (NewState != DISABLE)
3707  0000 4d            	tnz	a
3708  0001 2705          	jreq	L5671
3709                     ; 1180     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3711  0003 72165289      	bset	21129,#3
3714  0007 81            	ret	
3715  0008               L5671:
3716                     ; 1184     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3718  0008 72175289      	bres	21129,#3
3719                     ; 1186 }
3722  000c 81            	ret	
3757                     ; 1194 void TIM3_OC1FastCmd(FunctionalState NewState)
3757                     ; 1195 {
3758                     .text:	section	.text,new
3759  0000               _TIM3_OC1FastCmd:
3763                     ; 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
3765                     ; 1200   if (NewState != DISABLE)
3767  0000 4d            	tnz	a
3768  0001 2705          	jreq	L7002
3769                     ; 1202     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3771  0003 72145288      	bset	21128,#2
3774  0007 81            	ret	
3775  0008               L7002:
3776                     ; 1206     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3778  0008 72155288      	bres	21128,#2
3779                     ; 1208 }
3782  000c 81            	ret	
3817                     ; 1216 void TIM3_OC2FastCmd(FunctionalState NewState)
3817                     ; 1217 {
3818                     .text:	section	.text,new
3819  0000               _TIM3_OC2FastCmd:
3823                     ; 1219   assert_param(IS_FUNCTIONAL_STATE(NewState));
3825                     ; 1222   if (NewState != DISABLE)
3827  0000 4d            	tnz	a
3828  0001 2705          	jreq	L1302
3829                     ; 1224     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3831  0003 72145289      	bset	21129,#2
3834  0007 81            	ret	
3835  0008               L1302:
3836                     ; 1228     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3838  0008 72155289      	bres	21129,#2
3839                     ; 1230 }
3842  000c 81            	ret	
3923                     ; 1243 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3923                     ; 1244 {
3924                     .text:	section	.text,new
3925  0000               _TIM3_GenerateEvent:
3929                     ; 1246   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3931                     ; 1249   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3933  0000 ca5287        	or	a,21127
3934  0003 c75287        	ld	21127,a
3935                     ; 1250 }
3938  0006 81            	ret	
3974                     ; 1260 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
3974                     ; 1261 {
3975                     .text:	section	.text,new
3976  0000               _TIM3_OC1PolarityConfig:
3980                     ; 1263   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
3982                     ; 1266   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
3984  0000 4a            	dec	a
3985  0001 2605          	jrne	L7012
3986                     ; 1268     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3988  0003 7212528a      	bset	21130,#1
3991  0007 81            	ret	
3992  0008               L7012:
3993                     ; 1272     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3995  0008 7213528a      	bres	21130,#1
3996                     ; 1274 }
3999  000c 81            	ret	
4035                     ; 1284 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4035                     ; 1285 {
4036                     .text:	section	.text,new
4037  0000               _TIM3_OC2PolarityConfig:
4041                     ; 1287   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4043                     ; 1290   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4045  0000 4a            	dec	a
4046  0001 2605          	jrne	L1312
4047                     ; 1292     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4049  0003 721a528a      	bset	21130,#5
4052  0007 81            	ret	
4053  0008               L1312:
4054                     ; 1296     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4056  0008 721b528a      	bres	21130,#5
4057                     ; 1298 }
4060  000c 81            	ret	
4105                     ; 1310 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4105                     ; 1311                  FunctionalState NewState)
4105                     ; 1312 {
4106                     .text:	section	.text,new
4107  0000               _TIM3_CCxCmd:
4109  0000 89            	pushw	x
4110       00000000      OFST:	set	0
4113                     ; 1314   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4115                     ; 1315   assert_param(IS_FUNCTIONAL_STATE(NewState));
4117                     ; 1317   if (TIM3_Channel == TIM3_Channel_1)
4119  0001 9e            	ld	a,xh
4120  0002 4d            	tnz	a
4121  0003 2610          	jrne	L7512
4122                     ; 1320     if (NewState != DISABLE)
4124  0005 9f            	ld	a,xl
4125  0006 4d            	tnz	a
4126  0007 2706          	jreq	L1612
4127                     ; 1322       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4129  0009 7210528a      	bset	21130,#0
4131  000d 2014          	jra	L5612
4132  000f               L1612:
4133                     ; 1326       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4135  000f 7211528a      	bres	21130,#0
4136  0013 200e          	jra	L5612
4137  0015               L7512:
4138                     ; 1333     if (NewState != DISABLE)
4140  0015 7b02          	ld	a,(OFST+2,sp)
4141  0017 2706          	jreq	L7612
4142                     ; 1335       TIM3->CCER1 |= TIM_CCER1_CC2E;
4144  0019 7218528a      	bset	21130,#4
4146  001d 2004          	jra	L5612
4147  001f               L7612:
4148                     ; 1339       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4150  001f 7219528a      	bres	21130,#4
4151  0023               L5612:
4152                     ; 1343 }
4155  0023 85            	popw	x
4156  0024 81            	ret	
4201                     ; 1362 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4201                     ; 1363                      TIM3_OCMode_TypeDef TIM3_OCMode)
4201                     ; 1364 {
4202                     .text:	section	.text,new
4203  0000               _TIM3_SelectOCxM:
4205  0000 89            	pushw	x
4206       00000000      OFST:	set	0
4209                     ; 1366   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4211                     ; 1367   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4213                     ; 1369   if (TIM3_Channel == TIM3_Channel_1)
4215  0001 9e            	ld	a,xh
4216  0002 4d            	tnz	a
4217  0003 2615          	jrne	L5122
4218                     ; 1372     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4220  0005 7211528a      	bres	21130,#0
4221                     ; 1375     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4223  0009 c65288        	ld	a,21128
4224  000c a48f          	and	a,#143
4225  000e c75288        	ld	21128,a
4226                     ; 1378     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4228  0011 9f            	ld	a,xl
4229  0012 ca5288        	or	a,21128
4230  0015 c75288        	ld	21128,a
4232  0018 2014          	jra	L7122
4233  001a               L5122:
4234                     ; 1383     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4236  001a 7219528a      	bres	21130,#4
4237                     ; 1386     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4239  001e c65289        	ld	a,21129
4240  0021 a48f          	and	a,#143
4241  0023 c75289        	ld	21129,a
4242                     ; 1389     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4244  0026 c65289        	ld	a,21129
4245  0029 1a02          	or	a,(OFST+2,sp)
4246  002b c75289        	ld	21129,a
4247  002e               L7122:
4248                     ; 1391 }
4251  002e 85            	popw	x
4252  002f 81            	ret	
4286                     ; 1399 void TIM3_SetCounter(uint16_t TIM3_Counter)
4286                     ; 1400 {
4287                     .text:	section	.text,new
4288  0000               _TIM3_SetCounter:
4292                     ; 1403   TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4294  0000 9e            	ld	a,xh
4295  0001 c7528b        	ld	21131,a
4296                     ; 1404   TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4298  0004 9f            	ld	a,xl
4299  0005 c7528c        	ld	21132,a
4300                     ; 1405 }
4303  0008 81            	ret	
4337                     ; 1413 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4337                     ; 1414 {
4338                     .text:	section	.text,new
4339  0000               _TIM3_SetAutoreload:
4343                     ; 1416   TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4345  0000 9e            	ld	a,xh
4346  0001 c7528e        	ld	21134,a
4347                     ; 1417   TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4349  0004 9f            	ld	a,xl
4350  0005 c7528f        	ld	21135,a
4351                     ; 1418 }
4354  0008 81            	ret	
4388                     ; 1426 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4388                     ; 1427 {
4389                     .text:	section	.text,new
4390  0000               _TIM3_SetCompare1:
4394                     ; 1429   TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4396  0000 9e            	ld	a,xh
4397  0001 c75290        	ld	21136,a
4398                     ; 1430   TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4400  0004 9f            	ld	a,xl
4401  0005 c75291        	ld	21137,a
4402                     ; 1431 }
4405  0008 81            	ret	
4439                     ; 1439 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4439                     ; 1440 {
4440                     .text:	section	.text,new
4441  0000               _TIM3_SetCompare2:
4445                     ; 1442   TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4447  0000 9e            	ld	a,xh
4448  0001 c75292        	ld	21138,a
4449                     ; 1443   TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4451  0004 9f            	ld	a,xl
4452  0005 c75293        	ld	21139,a
4453                     ; 1444 }
4456  0008 81            	ret	
4501                     ; 1456 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4501                     ; 1457 {
4502                     .text:	section	.text,new
4503  0000               _TIM3_SetIC1Prescaler:
4505  0000 88            	push	a
4506  0001 88            	push	a
4507       00000001      OFST:	set	1
4510                     ; 1458   uint8_t tmpccmr1 = 0;
4512                     ; 1461   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4514                     ; 1463   tmpccmr1 = TIM3->CCMR1;
4516  0002 c65288        	ld	a,21128
4517                     ; 1466   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4519  0005 a4f3          	and	a,#243
4520                     ; 1469   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4522  0007 1a02          	or	a,(OFST+1,sp)
4523                     ; 1471   TIM3->CCMR1 = tmpccmr1;
4525  0009 c75288        	ld	21128,a
4526                     ; 1472 }
4529  000c 85            	popw	x
4530  000d 81            	ret	
4575                     ; 1484 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4575                     ; 1485 {
4576                     .text:	section	.text,new
4577  0000               _TIM3_SetIC2Prescaler:
4579  0000 88            	push	a
4580  0001 88            	push	a
4581       00000001      OFST:	set	1
4584                     ; 1486   uint8_t tmpccmr2 = 0;
4586                     ; 1489   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4588                     ; 1491   tmpccmr2 = TIM3->CCMR2;
4590  0002 c65289        	ld	a,21129
4591                     ; 1494   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4593  0005 a4f3          	and	a,#243
4594                     ; 1497   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4596  0007 1a02          	or	a,(OFST+1,sp)
4597                     ; 1499   TIM3->CCMR2 = tmpccmr2;
4599  0009 c75289        	ld	21129,a
4600                     ; 1500 }
4603  000c 85            	popw	x
4604  000d 81            	ret	
4656                     ; 1507 uint16_t TIM3_GetCapture1(void)
4656                     ; 1508 {
4657                     .text:	section	.text,new
4658  0000               _TIM3_GetCapture1:
4660  0000 5204          	subw	sp,#4
4661       00000004      OFST:	set	4
4664                     ; 1509   uint16_t tmpccr1 = 0;
4666                     ; 1512   tmpccr1h = TIM3->CCR1H;
4668  0002 c65290        	ld	a,21136
4669  0005 6b02          	ld	(OFST-2,sp),a
4670                     ; 1513   tmpccr1l = TIM3->CCR1L;
4672  0007 c65291        	ld	a,21137
4673  000a 6b01          	ld	(OFST-3,sp),a
4674                     ; 1515   tmpccr1 = (uint16_t)(tmpccr1l);
4676  000c 5f            	clrw	x
4677  000d 97            	ld	xl,a
4678  000e 1f03          	ldw	(OFST-1,sp),x
4679                     ; 1516   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4681  0010 5f            	clrw	x
4682  0011 7b02          	ld	a,(OFST-2,sp)
4683  0013 97            	ld	xl,a
4684  0014 7b04          	ld	a,(OFST+0,sp)
4685  0016 01            	rrwa	x,a
4686  0017 1a03          	or	a,(OFST-1,sp)
4687  0019 01            	rrwa	x,a
4688                     ; 1518   return ((uint16_t)tmpccr1);
4692  001a 5b04          	addw	sp,#4
4693  001c 81            	ret	
4745                     ; 1526 uint16_t TIM3_GetCapture2(void)
4745                     ; 1527 {
4746                     .text:	section	.text,new
4747  0000               _TIM3_GetCapture2:
4749  0000 5204          	subw	sp,#4
4750       00000004      OFST:	set	4
4753                     ; 1528   uint16_t tmpccr2 = 0;
4755                     ; 1531   tmpccr2h = TIM3->CCR2H;
4757  0002 c65292        	ld	a,21138
4758  0005 6b02          	ld	(OFST-2,sp),a
4759                     ; 1532   tmpccr2l = TIM3->CCR2L;
4761  0007 c65293        	ld	a,21139
4762  000a 6b01          	ld	(OFST-3,sp),a
4763                     ; 1534   tmpccr2 = (uint16_t)(tmpccr2l);
4765  000c 5f            	clrw	x
4766  000d 97            	ld	xl,a
4767  000e 1f03          	ldw	(OFST-1,sp),x
4768                     ; 1535   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4770  0010 5f            	clrw	x
4771  0011 7b02          	ld	a,(OFST-2,sp)
4772  0013 97            	ld	xl,a
4773  0014 7b04          	ld	a,(OFST+0,sp)
4774  0016 01            	rrwa	x,a
4775  0017 1a03          	or	a,(OFST-1,sp)
4776  0019 01            	rrwa	x,a
4777                     ; 1537   return ((uint16_t)tmpccr2);
4781  001a 5b04          	addw	sp,#4
4782  001c 81            	ret	
4834                     ; 1545 uint16_t TIM3_GetCounter(void)
4834                     ; 1546 {
4835                     .text:	section	.text,new
4836  0000               _TIM3_GetCounter:
4838  0000 5204          	subw	sp,#4
4839       00000004      OFST:	set	4
4842                     ; 1547   uint16_t tmpcnt = 0;
4844                     ; 1550   tmpcntrh = TIM3->CNTRH;
4846  0002 c6528b        	ld	a,21131
4847  0005 6b02          	ld	(OFST-2,sp),a
4848                     ; 1551   tmpcntrl = TIM3->CNTRL;
4850  0007 c6528c        	ld	a,21132
4851  000a 6b01          	ld	(OFST-3,sp),a
4852                     ; 1553   tmpcnt = (uint16_t)(tmpcntrl);
4854  000c 5f            	clrw	x
4855  000d 97            	ld	xl,a
4856  000e 1f03          	ldw	(OFST-1,sp),x
4857                     ; 1554   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4859  0010 5f            	clrw	x
4860  0011 7b02          	ld	a,(OFST-2,sp)
4861  0013 97            	ld	xl,a
4862  0014 7b04          	ld	a,(OFST+0,sp)
4863  0016 01            	rrwa	x,a
4864  0017 1a03          	or	a,(OFST-1,sp)
4865  0019 01            	rrwa	x,a
4866                     ; 1556   return ((uint16_t)tmpcnt);
4870  001a 5b04          	addw	sp,#4
4871  001c 81            	ret	
4895                     ; 1572 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
4895                     ; 1573 {
4896                     .text:	section	.text,new
4897  0000               _TIM3_GetPrescaler:
4901                     ; 1575   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
4903  0000 c6528d        	ld	a,21133
4906  0003 81            	ret	
5045                     ; 1591 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5045                     ; 1592 {
5046                     .text:	section	.text,new
5047  0000               _TIM3_GetFlagStatus:
5049  0000 89            	pushw	x
5050  0001 89            	pushw	x
5051       00000002      OFST:	set	2
5054                     ; 1593   FlagStatus bitstatus = RESET;
5056                     ; 1597   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5058                     ; 1599   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5060  0002 9f            	ld	a,xl
5061  0003 c45285        	and	a,21125
5062  0006 6b01          	ld	(OFST-1,sp),a
5063                     ; 1600   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5065  0008 c65286        	ld	a,21126
5066  000b 1403          	and	a,(OFST+1,sp)
5067  000d 6b02          	ld	(OFST+0,sp),a
5068                     ; 1602   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5070  000f 1a01          	or	a,(OFST-1,sp)
5071  0011 2702          	jreq	L3552
5072                     ; 1604     bitstatus = SET;
5074  0013 a601          	ld	a,#1
5076  0015               L3552:
5077                     ; 1608     bitstatus = RESET;
5079                     ; 1610   return ((FlagStatus)bitstatus);
5083  0015 5b04          	addw	sp,#4
5084  0017 81            	ret	
5119                     ; 1624 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5119                     ; 1625 {
5120                     .text:	section	.text,new
5121  0000               _TIM3_ClearFlag:
5123  0000 89            	pushw	x
5124       00000000      OFST:	set	0
5127                     ; 1627   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5129                     ; 1629   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5131  0001 9f            	ld	a,xl
5132  0002 43            	cpl	a
5133  0003 c75285        	ld	21125,a
5134                     ; 1630   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5136  0006 7b01          	ld	a,(OFST+1,sp)
5137  0008 43            	cpl	a
5138  0009 c75286        	ld	21126,a
5139                     ; 1631 }
5142  000c 85            	popw	x
5143  000d 81            	ret	
5207                     ; 1644 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5207                     ; 1645 {
5208                     .text:	section	.text,new
5209  0000               _TIM3_GetITStatus:
5211  0000 88            	push	a
5212  0001 5203          	subw	sp,#3
5213       00000003      OFST:	set	3
5216                     ; 1646   __IO ITStatus bitstatus = RESET;
5218  0003 0f03          	clr	(OFST+0,sp)
5219                     ; 1648   __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5221  0005 0f01          	clr	(OFST-2,sp)
5224  0007 0f02          	clr	(OFST-1,sp)
5225                     ; 1651   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5227                     ; 1653   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5229  0009 c45285        	and	a,21125
5230  000c 6b01          	ld	(OFST-2,sp),a
5231                     ; 1655   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5233  000e c65284        	ld	a,21124
5234  0011 1404          	and	a,(OFST+1,sp)
5235  0013 6b02          	ld	(OFST-1,sp),a
5236                     ; 1657   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5238  0015 0d01          	tnz	(OFST-2,sp)
5239  0017 270a          	jreq	L7262
5241  0019 0d02          	tnz	(OFST-1,sp)
5242  001b 2706          	jreq	L7262
5243                     ; 1659     bitstatus = (ITStatus)SET;
5245  001d a601          	ld	a,#1
5246  001f 6b03          	ld	(OFST+0,sp),a
5248  0021 2002          	jra	L1362
5249  0023               L7262:
5250                     ; 1663     bitstatus = (ITStatus)RESET;
5252  0023 0f03          	clr	(OFST+0,sp)
5253  0025               L1362:
5254                     ; 1665   return ((ITStatus)bitstatus);
5256  0025 7b03          	ld	a,(OFST+0,sp)
5259  0027 5b04          	addw	sp,#4
5260  0029 81            	ret	
5296                     ; 1679 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5296                     ; 1680 {
5297                     .text:	section	.text,new
5298  0000               _TIM3_ClearITPendingBit:
5302                     ; 1682   assert_param(IS_TIM3_IT(TIM3_IT));
5304                     ; 1685   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5306  0000 43            	cpl	a
5307  0001 c75285        	ld	21125,a
5308                     ; 1686 }
5311  0004 81            	ret	
5383                     ; 1703 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5383                     ; 1704                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5383                     ; 1705                        uint8_t TIM3_ICFilter)
5383                     ; 1706 {
5384                     .text:	section	.text,new
5385  0000               L3_TI1_Config:
5387  0000 89            	pushw	x
5388  0001 89            	pushw	x
5389       00000002      OFST:	set	2
5392                     ; 1707   uint8_t tmpccmr1 = 0;
5394                     ; 1708   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5396  0002 9e            	ld	a,xh
5397  0003 6b01          	ld	(OFST-1,sp),a
5398                     ; 1709   tmpccmr1 = TIM3->CCMR1;
5400  0005 c65288        	ld	a,21128
5401  0008 6b02          	ld	(OFST+0,sp),a
5402                     ; 1712   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5404                     ; 1713   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5406                     ; 1714   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5408                     ; 1717   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5410  000a 7211528a      	bres	21130,#0
5411                     ; 1720   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5413  000e a40c          	and	a,#12
5414  0010 6b02          	ld	(OFST+0,sp),a
5415                     ; 1721   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5417  0012 7b07          	ld	a,(OFST+5,sp)
5418  0014 97            	ld	xl,a
5419  0015 a610          	ld	a,#16
5420  0017 42            	mul	x,a
5421  0018 9f            	ld	a,xl
5422  0019 1a04          	or	a,(OFST+2,sp)
5423  001b 1a02          	or	a,(OFST+0,sp)
5424  001d 6b02          	ld	(OFST+0,sp),a
5425                     ; 1723   TIM3->CCMR1 = tmpccmr1;
5427  001f c75288        	ld	21128,a
5428                     ; 1726   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5430  0022 7b01          	ld	a,(OFST-1,sp)
5431  0024 4a            	dec	a
5432  0025 2606          	jrne	L7072
5433                     ; 1728     TIM3->CCER1 |= TIM_CCER1_CC1P;
5435  0027 7212528a      	bset	21130,#1
5437  002b 2004          	jra	L1172
5438  002d               L7072:
5439                     ; 1732     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5441  002d 7213528a      	bres	21130,#1
5442  0031               L1172:
5443                     ; 1736   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5445  0031 7210528a      	bset	21130,#0
5446                     ; 1737 }
5449  0035 5b04          	addw	sp,#4
5450  0037 81            	ret	
5522                     ; 1754 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5522                     ; 1755                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5522                     ; 1756                        uint8_t TIM3_ICFilter)
5522                     ; 1757 {
5523                     .text:	section	.text,new
5524  0000               L5_TI2_Config:
5526  0000 89            	pushw	x
5527  0001 89            	pushw	x
5528       00000002      OFST:	set	2
5531                     ; 1758   uint8_t tmpccmr2 = 0;
5533                     ; 1759   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5535  0002 9e            	ld	a,xh
5536  0003 6b01          	ld	(OFST-1,sp),a
5537                     ; 1762   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5539                     ; 1763   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5541                     ; 1764   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5543                     ; 1766   tmpccmr2 = TIM3->CCMR2;
5545  0005 c65289        	ld	a,21129
5546  0008 6b02          	ld	(OFST+0,sp),a
5547                     ; 1769   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5549  000a 7219528a      	bres	21130,#4
5550                     ; 1772   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5552  000e a40c          	and	a,#12
5553  0010 6b02          	ld	(OFST+0,sp),a
5554                     ; 1773   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5556  0012 7b07          	ld	a,(OFST+5,sp)
5557  0014 97            	ld	xl,a
5558  0015 a610          	ld	a,#16
5559  0017 42            	mul	x,a
5560  0018 9f            	ld	a,xl
5561  0019 1a04          	or	a,(OFST+2,sp)
5562  001b 1a02          	or	a,(OFST+0,sp)
5563  001d 6b02          	ld	(OFST+0,sp),a
5564                     ; 1775   TIM3->CCMR2 = tmpccmr2;
5566  001f c75289        	ld	21129,a
5567                     ; 1778   if (tmpicpolarity == (uint8_t)TIM3_ICPolarity_Falling)
5569  0022 7b01          	ld	a,(OFST-1,sp)
5570  0024 4a            	dec	a
5571  0025 2606          	jrne	L1572
5572                     ; 1780     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5574  0027 721a528a      	bset	21130,#5
5576  002b 2004          	jra	L3572
5577  002d               L1572:
5578                     ; 1784     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5580  002d 721b528a      	bres	21130,#5
5581  0031               L3572:
5582                     ; 1788   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5584  0031 7218528a      	bset	21130,#4
5585                     ; 1789 }
5588  0035 5b04          	addw	sp,#4
5589  0037 81            	ret	
5613                     ; 1797 FunctionalState TIM3_GetStatus(void)
5613                     ; 1798 {
5614                     .text:	section	.text,new
5615  0000               _TIM3_GetStatus:
5619                     ; 1799   return ((FunctionalState)(TIM3->CR1 & TIM_CR1_CEN));
5621  0000 c65280        	ld	a,21120
5622  0003 a401          	and	a,#1
5625  0005 81            	ret	
5638                     	xdef	_TIM3_ClearITPendingBit
5639                     	xdef	_TIM3_GetITStatus
5640                     	xdef	_TIM3_ClearFlag
5641                     	xdef	_TIM3_GetFlagStatus
5642                     	xdef	_TIM3_GetPrescaler
5643                     	xdef	_TIM3_GetCounter
5644                     	xdef	_TIM3_GetCapture2
5645                     	xdef	_TIM3_GetCapture1
5646                     	xdef	_TIM3_SetIC2Prescaler
5647                     	xdef	_TIM3_SetIC1Prescaler
5648                     	xdef	_TIM3_SetCompare2
5649                     	xdef	_TIM3_SetCompare1
5650                     	xdef	_TIM3_SetAutoreload
5651                     	xdef	_TIM3_SetCounter
5652                     	xdef	_TIM3_SelectOCxM
5653                     	xdef	_TIM3_CCxCmd
5654                     	xdef	_TIM3_OC2PolarityConfig
5655                     	xdef	_TIM3_OC1PolarityConfig
5656                     	xdef	_TIM3_GenerateEvent
5657                     	xdef	_TIM3_OC2FastCmd
5658                     	xdef	_TIM3_OC1FastCmd
5659                     	xdef	_TIM3_OC2PreloadConfig
5660                     	xdef	_TIM3_OC1PreloadConfig
5661                     	xdef	_TIM3_ARRPreloadConfig
5662                     	xdef	_TIM3_ForcedOC2Config
5663                     	xdef	_TIM3_ForcedOC1Config
5664                     	xdef	_TIM3_CounterModeConfig
5665                     	xdef	_TIM3_PrescalerConfig
5666                     	xdef	_TIM3_EncoderInterfaceConfig
5667                     	xdef	_TIM3_SelectMasterSlaveMode
5668                     	xdef	_TIM3_SelectSlaveMode
5669                     	xdef	_TIM3_SelectOutputTrigger
5670                     	xdef	_TIM3_SelectOnePulseMode
5671                     	xdef	_TIM3_SelectHallSensor
5672                     	xdef	_TIM3_UpdateRequestConfig
5673                     	xdef	_TIM3_UpdateDisableConfig
5674                     	xdef	_TIM3_SelectInputTrigger
5675                     	xdef	_TIM3_TIxExternalClockConfig
5676                     	xdef	_TIM3_ETRConfig
5677                     	xdef	_TIM3_ETRClockMode2Config
5678                     	xdef	_TIM3_ETRClockMode1Config
5679                     	xdef	_TIM3_InternalClockConfig
5680                     	xdef	_TIM3_ITConfig
5681                     	xdef	_TIM3_CtrlPWMOutputs
5682                     	xdef	_TIM3_GetStatus
5683                     	xdef	_TIM3_Cmd
5684                     	xdef	_TIM3_PWMIConfig
5685                     	xdef	_TIM3_ICInit
5686                     	xdef	_TIM3_BKRConfig
5687                     	xdef	_TIM3_OC2Init
5688                     	xdef	_TIM3_OC1Init
5689                     	xdef	_TIM3_TimeBaseInit
5690                     	xdef	_TIM3_DeInit
5709                     	end
