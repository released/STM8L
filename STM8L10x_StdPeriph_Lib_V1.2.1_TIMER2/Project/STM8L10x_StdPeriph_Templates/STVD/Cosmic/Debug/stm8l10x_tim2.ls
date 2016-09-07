   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 63 void TIM2_DeInit(void)
  48                     ; 64 {
  50                     .text:	section	.text,new
  51  0000               _TIM2_DeInit:
  55                     ; 65   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  57  0000 725f5250      	clr	21072
  58                     ; 66   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  60  0004 725f5251      	clr	21073
  61                     ; 67   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  63  0008 725f5252      	clr	21074
  64                     ; 68   TIM2->ETR = TIM_ETR_RESET_VALUE;
  66  000c 725f5253      	clr	21075
  67                     ; 69   TIM2->IER = TIM_IER_RESET_VALUE;
  69  0010 725f5254      	clr	21076
  70                     ; 70   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  72  0014 725f5256      	clr	21078
  73                     ; 73   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  75  0018 725f525a      	clr	21082
  76                     ; 75   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  78  001c 35015258      	mov	21080,#1
  79                     ; 76   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  81  0020 35015259      	mov	21081,#1
  82                     ; 79   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  84  0024 725f525a      	clr	21082
  85                     ; 80   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  87  0028 725f5258      	clr	21080
  88                     ; 81   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  90  002c 725f5259      	clr	21081
  91                     ; 83   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  93  0030 725f525b      	clr	21083
  94                     ; 84   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  96  0034 725f525c      	clr	21084
  97                     ; 86   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  99  0038 725f525d      	clr	21085
 100                     ; 88   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
 102  003c 35ff525e      	mov	21086,#255
 103                     ; 89   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 105  0040 35ff525f      	mov	21087,#255
 106                     ; 91   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 108  0044 725f5260      	clr	21088
 109                     ; 92   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 111  0048 725f5261      	clr	21089
 112                     ; 93   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 114  004c 725f5262      	clr	21090
 115                     ; 94   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 117  0050 725f5263      	clr	21091
 118                     ; 96   TIM2->OISR = TIM_OISR_RESET_VALUE;
 120  0054 725f5265      	clr	21093
 121                     ; 97   TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 123  0058 35015257      	mov	21079,#1
 124                     ; 98   TIM2->BKR = TIM_BKR_RESET_VALUE;
 126  005c 725f5264      	clr	21092
 127                     ; 99   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 129  0060 725f5255      	clr	21077
 130                     ; 100 }
 133  0064 81            	ret	
 295                     ; 124 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 295                     ; 125                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 295                     ; 126                        uint16_t TIM2_Period)
 295                     ; 127 {
 296                     .text:	section	.text,new
 297  0000               _TIM2_TimeBaseInit:
 299  0000 89            	pushw	x
 300       00000000      OFST:	set	0
 303                     ; 129   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 305                     ; 130   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 307                     ; 133   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 309  0001 7b05          	ld	a,(OFST+5,sp)
 310  0003 c7525e        	ld	21086,a
 311                     ; 134   TIM2->ARRL = (uint8_t)(TIM2_Period);
 313  0006 7b06          	ld	a,(OFST+6,sp)
 314  0008 c7525f        	ld	21087,a
 315                     ; 137   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 317  000b 9e            	ld	a,xh
 318  000c c7525d        	ld	21085,a
 319                     ; 140   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 321  000f c65250        	ld	a,21072
 322  0012 a48f          	and	a,#143
 323  0014 c75250        	ld	21072,a
 324                     ; 141   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 326  0017 9f            	ld	a,xl
 327  0018 ca5250        	or	a,21072
 328  001b c75250        	ld	21072,a
 329                     ; 142 }
 332  001e 85            	popw	x
 333  001f 81            	ret	
 531                     ; 169 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 531                     ; 170                   TIM2_OutputState_TypeDef TIM2_OutputState,
 531                     ; 171                   uint16_t TIM2_Pulse,
 531                     ; 172                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 531                     ; 173                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 531                     ; 174 {
 532                     .text:	section	.text,new
 533  0000               _TIM2_OC1Init:
 535  0000 89            	pushw	x
 536  0001 88            	push	a
 537       00000001      OFST:	set	1
 540                     ; 175   uint8_t tmpccmr1 = 0;
 542                     ; 178   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 544                     ; 179   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 546                     ; 180   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 548                     ; 181   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 550                     ; 183   tmpccmr1 = TIM2->CCMR1;
 552  0002 c65258        	ld	a,21080
 553  0005 6b01          	ld	(OFST+0,sp),a
 554                     ; 186   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 556  0007 7211525a      	bres	21082,#0
 557                     ; 188   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 559  000b a48f          	and	a,#143
 560  000d 6b01          	ld	(OFST+0,sp),a
 561                     ; 191   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 563  000f 9e            	ld	a,xh
 564  0010 1a01          	or	a,(OFST+0,sp)
 565  0012 6b01          	ld	(OFST+0,sp),a
 566                     ; 193   TIM2->CCMR1 = tmpccmr1;
 568  0014 c75258        	ld	21080,a
 569                     ; 196   if (TIM2_OutputState == TIM2_OutputState_Enable)
 571  0017 9f            	ld	a,xl
 572  0018 4a            	dec	a
 573  0019 2606          	jrne	L722
 574                     ; 198     TIM2->CCER1 |= TIM_CCER1_CC1E;
 576  001b 7210525a      	bset	21082,#0
 578  001f 2004          	jra	L132
 579  0021               L722:
 580                     ; 202     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 582  0021 7211525a      	bres	21082,#0
 583  0025               L132:
 584                     ; 206   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 586  0025 7b08          	ld	a,(OFST+7,sp)
 587  0027 4a            	dec	a
 588  0028 2606          	jrne	L332
 589                     ; 208     TIM2->CCER1 |= TIM_CCER1_CC1P;
 591  002a 7212525a      	bset	21082,#1
 593  002e 2004          	jra	L532
 594  0030               L332:
 595                     ; 212     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 597  0030 7213525a      	bres	21082,#1
 598  0034               L532:
 599                     ; 216   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 601  0034 7b09          	ld	a,(OFST+8,sp)
 602  0036 4a            	dec	a
 603  0037 2606          	jrne	L732
 604                     ; 218     TIM2->OISR |= TIM_OISR_OIS1;
 606  0039 72105265      	bset	21093,#0
 608  003d 2004          	jra	L142
 609  003f               L732:
 610                     ; 222     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 612  003f 72115265      	bres	21093,#0
 613  0043               L142:
 614                     ; 226   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 616  0043 7b06          	ld	a,(OFST+5,sp)
 617  0045 c75260        	ld	21088,a
 618                     ; 227   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 620  0048 7b07          	ld	a,(OFST+6,sp)
 621  004a c75261        	ld	21089,a
 622                     ; 228 }
 625  004d 5b03          	addw	sp,#3
 626  004f 81            	ret	
 709                     ; 255 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 709                     ; 256                   TIM2_OutputState_TypeDef TIM2_OutputState,
 709                     ; 257                   uint16_t TIM2_Pulse,
 709                     ; 258                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 709                     ; 259                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 709                     ; 260 {
 710                     .text:	section	.text,new
 711  0000               _TIM2_OC2Init:
 713  0000 89            	pushw	x
 714  0001 88            	push	a
 715       00000001      OFST:	set	1
 718                     ; 261   uint8_t tmpccmr2 = 0;
 720                     ; 264   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 722                     ; 265   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 724                     ; 266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 726                     ; 267   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 728                     ; 269   tmpccmr2 = TIM2->CCMR2;
 730  0002 c65259        	ld	a,21081
 731  0005 6b01          	ld	(OFST+0,sp),a
 732                     ; 272   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 734  0007 7219525a      	bres	21082,#4
 735                     ; 275   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 737  000b a48f          	and	a,#143
 738  000d 6b01          	ld	(OFST+0,sp),a
 739                     ; 278   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 741  000f 9e            	ld	a,xh
 742  0010 1a01          	or	a,(OFST+0,sp)
 743  0012 6b01          	ld	(OFST+0,sp),a
 744                     ; 280   TIM2->CCMR2 = tmpccmr2;
 746  0014 c75259        	ld	21081,a
 747                     ; 283   if (TIM2_OutputState == TIM2_OutputState_Enable)
 749  0017 9f            	ld	a,xl
 750  0018 4a            	dec	a
 751  0019 2606          	jrne	L503
 752                     ; 285     TIM2->CCER1 |= TIM_CCER1_CC2E;
 754  001b 7218525a      	bset	21082,#4
 756  001f 2004          	jra	L703
 757  0021               L503:
 758                     ; 289     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 760  0021 7219525a      	bres	21082,#4
 761  0025               L703:
 762                     ; 293   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 764  0025 7b08          	ld	a,(OFST+7,sp)
 765  0027 4a            	dec	a
 766  0028 2606          	jrne	L113
 767                     ; 295     TIM2->CCER1 |= TIM_CCER1_CC2P;
 769  002a 721a525a      	bset	21082,#5
 771  002e 2004          	jra	L313
 772  0030               L113:
 773                     ; 299     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 775  0030 721b525a      	bres	21082,#5
 776  0034               L313:
 777                     ; 304   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 779  0034 7b09          	ld	a,(OFST+8,sp)
 780  0036 4a            	dec	a
 781  0037 2606          	jrne	L513
 782                     ; 306     TIM2->OISR |= TIM_OISR_OIS2;
 784  0039 72145265      	bset	21093,#2
 786  003d 2004          	jra	L713
 787  003f               L513:
 788                     ; 310     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 790  003f 72155265      	bres	21093,#2
 791  0043               L713:
 792                     ; 314   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 794  0043 7b06          	ld	a,(OFST+5,sp)
 795  0045 c75262        	ld	21090,a
 796                     ; 315   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 798  0048 7b07          	ld	a,(OFST+6,sp)
 799  004a c75263        	ld	21091,a
 800                     ; 316 }
 803  004d 5b03          	addw	sp,#3
 804  004f 81            	ret	
1002                     ; 344 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1002                     ; 345                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1002                     ; 346                     TIM2_BreakState_TypeDef TIM2_BreakState,
1002                     ; 347                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1002                     ; 348                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1002                     ; 349 
1002                     ; 350 {
1003                     .text:	section	.text,new
1004  0000               _TIM2_BKRConfig:
1006  0000 89            	pushw	x
1007       00000000      OFST:	set	0
1010                     ; 352   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1012                     ; 353   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1014                     ; 354   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1016                     ; 355   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1018                     ; 356   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1020                     ; 361   TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel | \
1020                     ; 362                         (uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity | \
1020                     ; 363                         (uint8_t)TIM2_AutomaticOutput);
1022  0001 9f            	ld	a,xl
1023  0002 1a01          	or	a,(OFST+1,sp)
1024  0004 1a05          	or	a,(OFST+5,sp)
1025  0006 1a06          	or	a,(OFST+6,sp)
1026  0008 1a07          	or	a,(OFST+7,sp)
1027  000a c75264        	ld	21092,a
1028                     ; 364 }
1031  000d 85            	popw	x
1032  000e 81            	ret	
1216                     ; 390 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1216                     ; 391                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1216                     ; 392                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1216                     ; 393                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1216                     ; 394                  uint8_t TIM2_ICFilter)
1216                     ; 395 {
1217                     .text:	section	.text,new
1218  0000               _TIM2_ICInit:
1220  0000 89            	pushw	x
1221       00000000      OFST:	set	0
1224                     ; 397   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1226                     ; 399   if (TIM2_Channel == TIM2_Channel_1)
1228  0001 9e            	ld	a,xh
1229  0002 4d            	tnz	a
1230  0003 2614          	jrne	L735
1231                     ; 402     TI1_Config(TIM2_ICPolarity,
1231                     ; 403                TIM2_ICSelection,
1231                     ; 404                TIM2_ICFilter);
1233  0005 7b07          	ld	a,(OFST+7,sp)
1234  0007 88            	push	a
1235  0008 7b06          	ld	a,(OFST+6,sp)
1236  000a 97            	ld	xl,a
1237  000b 7b03          	ld	a,(OFST+3,sp)
1238  000d 95            	ld	xh,a
1239  000e cd0000        	call	L3_TI1_Config
1241  0011 84            	pop	a
1242                     ; 407     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1244  0012 7b06          	ld	a,(OFST+6,sp)
1245  0014 cd0000        	call	_TIM2_SetIC1Prescaler
1248  0017 2012          	jra	L145
1249  0019               L735:
1250                     ; 412     TI2_Config(TIM2_ICPolarity,
1250                     ; 413                TIM2_ICSelection,
1250                     ; 414                TIM2_ICFilter);
1252  0019 7b07          	ld	a,(OFST+7,sp)
1253  001b 88            	push	a
1254  001c 7b06          	ld	a,(OFST+6,sp)
1255  001e 97            	ld	xl,a
1256  001f 7b03          	ld	a,(OFST+3,sp)
1257  0021 95            	ld	xh,a
1258  0022 cd0000        	call	L5_TI2_Config
1260  0025 84            	pop	a
1261                     ; 416     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1263  0026 7b06          	ld	a,(OFST+6,sp)
1264  0028 cd0000        	call	_TIM2_SetIC2Prescaler
1266  002b               L145:
1267                     ; 418 }
1270  002b 85            	popw	x
1271  002c 81            	ret	
1367                     ; 444 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1367                     ; 445                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1367                     ; 446                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1367                     ; 447                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1367                     ; 448                      uint8_t TIM2_ICFilter)
1367                     ; 449 {
1368                     .text:	section	.text,new
1369  0000               _TIM2_PWMIConfig:
1371  0000 89            	pushw	x
1372  0001 89            	pushw	x
1373       00000002      OFST:	set	2
1376                     ; 450   uint8_t icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1378                     ; 451   uint8_t icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1380                     ; 454   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1382                     ; 457   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1384  0002 9f            	ld	a,xl
1385  0003 4d            	tnz	a
1386  0004 2605          	jrne	L116
1387                     ; 459     icpolarity = (uint8_t)TIM2_ICPolarity_Falling;
1389  0006 4c            	inc	a
1390  0007 6b01          	ld	(OFST-1,sp),a
1392  0009 2002          	jra	L316
1393  000b               L116:
1394                     ; 463     icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1396  000b 0f01          	clr	(OFST-1,sp)
1397  000d               L316:
1398                     ; 467   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1400  000d 7b07          	ld	a,(OFST+5,sp)
1401  000f 4a            	dec	a
1402  0010 2604          	jrne	L516
1403                     ; 469     icselection = (uint8_t)TIM2_ICSelection_IndirectTI;
1405  0012 a602          	ld	a,#2
1407  0014 2002          	jra	L716
1408  0016               L516:
1409                     ; 473     icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1411  0016 a601          	ld	a,#1
1412  0018               L716:
1413  0018 6b02          	ld	(OFST+0,sp),a
1414                     ; 476   if (TIM2_Channel == TIM2_Channel_1)
1416  001a 7b03          	ld	a,(OFST+1,sp)
1417  001c 2626          	jrne	L126
1418                     ; 479     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1418                     ; 480                TIM2_ICFilter);
1420  001e 7b09          	ld	a,(OFST+7,sp)
1421  0020 88            	push	a
1422  0021 7b08          	ld	a,(OFST+6,sp)
1423  0023 97            	ld	xl,a
1424  0024 7b05          	ld	a,(OFST+3,sp)
1425  0026 95            	ld	xh,a
1426  0027 cd0000        	call	L3_TI1_Config
1428  002a 84            	pop	a
1429                     ; 483     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1431  002b 7b08          	ld	a,(OFST+6,sp)
1432  002d cd0000        	call	_TIM2_SetIC1Prescaler
1434                     ; 486     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1436  0030 7b09          	ld	a,(OFST+7,sp)
1437  0032 88            	push	a
1438  0033 7b03          	ld	a,(OFST+1,sp)
1439  0035 97            	ld	xl,a
1440  0036 7b02          	ld	a,(OFST+0,sp)
1441  0038 95            	ld	xh,a
1442  0039 cd0000        	call	L5_TI2_Config
1444  003c 84            	pop	a
1445                     ; 489     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1447  003d 7b08          	ld	a,(OFST+6,sp)
1448  003f cd0000        	call	_TIM2_SetIC2Prescaler
1451  0042 2024          	jra	L326
1452  0044               L126:
1453                     ; 494     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1453                     ; 495                TIM2_ICFilter);
1455  0044 7b09          	ld	a,(OFST+7,sp)
1456  0046 88            	push	a
1457  0047 7b08          	ld	a,(OFST+6,sp)
1458  0049 97            	ld	xl,a
1459  004a 7b05          	ld	a,(OFST+3,sp)
1460  004c 95            	ld	xh,a
1461  004d cd0000        	call	L5_TI2_Config
1463  0050 84            	pop	a
1464                     ; 498     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1466  0051 7b08          	ld	a,(OFST+6,sp)
1467  0053 cd0000        	call	_TIM2_SetIC2Prescaler
1469                     ; 501     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1471  0056 7b09          	ld	a,(OFST+7,sp)
1472  0058 88            	push	a
1473  0059 7b03          	ld	a,(OFST+1,sp)
1474  005b 97            	ld	xl,a
1475  005c 7b02          	ld	a,(OFST+0,sp)
1476  005e 95            	ld	xh,a
1477  005f cd0000        	call	L3_TI1_Config
1479  0062 84            	pop	a
1480                     ; 504     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1482  0063 7b08          	ld	a,(OFST+6,sp)
1483  0065 cd0000        	call	_TIM2_SetIC1Prescaler
1485  0068               L326:
1486                     ; 506 }
1489  0068 5b04          	addw	sp,#4
1490  006a 81            	ret	
1545                     ; 514 void TIM2_Cmd(FunctionalState NewState)
1545                     ; 515 {
1546                     .text:	section	.text,new
1547  0000               _TIM2_Cmd:
1551                     ; 517   assert_param(IS_FUNCTIONAL_STATE(NewState));
1553                     ; 520   if (NewState != DISABLE)
1555  0000 4d            	tnz	a
1556  0001 2705          	jreq	L356
1557                     ; 522     TIM2->CR1 |= TIM_CR1_CEN;
1559  0003 72105250      	bset	21072,#0
1562  0007 81            	ret	
1563  0008               L356:
1564                     ; 526     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1566  0008 72115250      	bres	21072,#0
1567                     ; 528 }
1570  000c 81            	ret	
1606                     ; 536 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1606                     ; 537 {
1607                     .text:	section	.text,new
1608  0000               _TIM2_CtrlPWMOutputs:
1612                     ; 539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 543   if (NewState != DISABLE)
1616  0000 4d            	tnz	a
1617  0001 2705          	jreq	L576
1618                     ; 545     TIM2->BKR |= TIM_BKR_MOE ;
1620  0003 721e5264      	bset	21092,#7
1623  0007 81            	ret	
1624  0008               L576:
1625                     ; 549     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1627  0008 721f5264      	bres	21092,#7
1628                     ; 551 }
1631  000c 81            	ret	
1717                     ; 566 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1717                     ; 567 {
1718                     .text:	section	.text,new
1719  0000               _TIM2_ITConfig:
1721  0000 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 569   assert_param(IS_TIM2_IT(TIM2_IT));
1727                     ; 570   assert_param(IS_FUNCTIONAL_STATE(NewState));
1729                     ; 572   if (NewState != DISABLE)
1731  0001 9f            	ld	a,xl
1732  0002 4d            	tnz	a
1733  0003 2706          	jreq	L147
1734                     ; 575     TIM2->IER |= (uint8_t)TIM2_IT;
1736  0005 9e            	ld	a,xh
1737  0006 ca5254        	or	a,21076
1739  0009 2006          	jra	L347
1740  000b               L147:
1741                     ; 580     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1743  000b 7b01          	ld	a,(OFST+1,sp)
1744  000d 43            	cpl	a
1745  000e c45254        	and	a,21076
1746  0011               L347:
1747  0011 c75254        	ld	21076,a
1748                     ; 582 }
1751  0014 85            	popw	x
1752  0015 81            	ret	
1776                     ; 589 void TIM2_InternalClockConfig(void)
1776                     ; 590 {
1777                     .text:	section	.text,new
1778  0000               _TIM2_InternalClockConfig:
1782                     ; 592   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1784  0000 c65252        	ld	a,21074
1785  0003 a4f8          	and	a,#248
1786  0005 c75252        	ld	21074,a
1787                     ; 593 }
1790  0008 81            	ret	
1907                     ; 611 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1907                     ; 612                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1907                     ; 613                               uint8_t TIM2_ExtTRGFilter)
1907                     ; 614 {
1908                     .text:	section	.text,new
1909  0000               _TIM2_ETRClockMode1Config:
1911  0000 89            	pushw	x
1912       00000000      OFST:	set	0
1915                     ; 616   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1917  0001 7b05          	ld	a,(OFST+5,sp)
1918  0003 88            	push	a
1919  0004 7b02          	ld	a,(OFST+2,sp)
1920  0006 95            	ld	xh,a
1921  0007 cd0000        	call	_TIM2_ETRConfig
1923  000a 84            	pop	a
1924                     ; 619   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1926  000b c65252        	ld	a,21074
1927  000e a4f8          	and	a,#248
1928  0010 c75252        	ld	21074,a
1929                     ; 620   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1931  0013 c65252        	ld	a,21074
1932  0016 aa07          	or	a,#7
1933  0018 c75252        	ld	21074,a
1934                     ; 623   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1936  001b c65252        	ld	a,21074
1937  001e a48f          	and	a,#143
1938  0020 c75252        	ld	21074,a
1939                     ; 624   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1941  0023 c65252        	ld	a,21074
1942  0026 aa70          	or	a,#112
1943  0028 c75252        	ld	21074,a
1944                     ; 625 }
1947  002b 85            	popw	x
1948  002c 81            	ret	
2006                     ; 634 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2006                     ; 635                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2006                     ; 636                               uint8_t TIM2_ExtTRGFilter)
2006                     ; 637 {
2007                     .text:	section	.text,new
2008  0000               _TIM2_ETRClockMode2Config:
2010  0000 89            	pushw	x
2011       00000000      OFST:	set	0
2014                     ; 639   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2016  0001 7b05          	ld	a,(OFST+5,sp)
2017  0003 88            	push	a
2018  0004 7b02          	ld	a,(OFST+2,sp)
2019  0006 95            	ld	xh,a
2020  0007 cd0000        	call	_TIM2_ETRConfig
2022  000a 721c5253      	bset	21075,#6
2023  000e 84            	pop	a
2024                     ; 642   TIM2->ETR |= TIM_ETR_ECE ;
2026                     ; 643 }
2029  000f 85            	popw	x
2030  0010 81            	ret	
2086                     ; 660 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2086                     ; 661                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2086                     ; 662                     uint8_t TIM2_ExtTRGFilter)
2086                     ; 663 {
2087                     .text:	section	.text,new
2088  0000               _TIM2_ETRConfig:
2090  0000 89            	pushw	x
2091       00000000      OFST:	set	0
2094                     ; 665   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2096                     ; 666   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2098                     ; 667   assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2100                     ; 669   TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity | (uint8_t)TIM2_ExtTRGFilter);
2102  0001 9f            	ld	a,xl
2103  0002 1a01          	or	a,(OFST+1,sp)
2104  0004 1a05          	or	a,(OFST+5,sp)
2105  0006 ca5253        	or	a,21075
2106  0009 c75253        	ld	21075,a
2107                     ; 670 }
2110  000c 85            	popw	x
2111  000d 81            	ret	
2200                     ; 687 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2200                     ; 688                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2200                     ; 689                                  uint8_t TIM2_ICFilter)
2200                     ; 690 {
2201                     .text:	section	.text,new
2202  0000               _TIM2_TIxExternalClockConfig:
2204  0000 89            	pushw	x
2205       00000000      OFST:	set	0
2208                     ; 692   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2210                     ; 693   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2212                     ; 694   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2214                     ; 697   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2216  0001 9e            	ld	a,xh
2217  0002 a160          	cp	a,#96
2218  0004 260e          	jrne	L3411
2219                     ; 699     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2221  0006 7b05          	ld	a,(OFST+5,sp)
2222  0008 88            	push	a
2223  0009 ae0001        	ldw	x,#1
2224  000c 7b03          	ld	a,(OFST+3,sp)
2225  000e 95            	ld	xh,a
2226  000f cd0000        	call	L5_TI2_Config
2229  0012 200c          	jra	L5411
2230  0014               L3411:
2231                     ; 703     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2233  0014 7b05          	ld	a,(OFST+5,sp)
2234  0016 88            	push	a
2235  0017 ae0001        	ldw	x,#1
2236  001a 7b03          	ld	a,(OFST+3,sp)
2237  001c 95            	ld	xh,a
2238  001d cd0000        	call	L3_TI1_Config
2240  0020               L5411:
2241  0020 84            	pop	a
2242                     ; 707   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2244  0021 7b01          	ld	a,(OFST+1,sp)
2245  0023 cd0000        	call	_TIM2_SelectInputTrigger
2247                     ; 710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2249  0026 c65252        	ld	a,21074
2250  0029 aa07          	or	a,#7
2251  002b c75252        	ld	21074,a
2252                     ; 711 }
2255  002e 85            	popw	x
2256  002f 81            	ret	
2356                     ; 727 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2356                     ; 728 {
2357                     .text:	section	.text,new
2358  0000               _TIM2_SelectInputTrigger:
2360  0000 88            	push	a
2361  0001 88            	push	a
2362       00000001      OFST:	set	1
2365                     ; 729   uint8_t tmpsmcr = 0;
2367                     ; 732   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2369                     ; 734   tmpsmcr = TIM2->SMCR;
2371  0002 c65252        	ld	a,21074
2372                     ; 737   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2374  0005 a48f          	and	a,#143
2375                     ; 738   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2377  0007 1a02          	or	a,(OFST+1,sp)
2378                     ; 740   TIM2->SMCR = (uint8_t)tmpsmcr;
2380  0009 c75252        	ld	21074,a
2381                     ; 741 }
2384  000c 85            	popw	x
2385  000d 81            	ret	
2421                     ; 749 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2421                     ; 750 {
2422                     .text:	section	.text,new
2423  0000               _TIM2_UpdateDisableConfig:
2427                     ; 752   assert_param(IS_FUNCTIONAL_STATE(NewState));
2429                     ; 755   if (NewState != DISABLE)
2431  0000 4d            	tnz	a
2432  0001 2705          	jreq	L7221
2433                     ; 757     TIM2->CR1 |= TIM_CR1_UDIS;
2435  0003 72125250      	bset	21072,#1
2438  0007 81            	ret	
2439  0008               L7221:
2440                     ; 761     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2442  0008 72135250      	bres	21072,#1
2443                     ; 763 }
2446  000c 81            	ret	
2504                     ; 773 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2504                     ; 774 {
2505                     .text:	section	.text,new
2506  0000               _TIM2_UpdateRequestConfig:
2510                     ; 776   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2512                     ; 779   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2514  0000 4a            	dec	a
2515  0001 2605          	jrne	L1621
2516                     ; 781     TIM2->CR1 |= TIM_CR1_URS ;
2518  0003 72145250      	bset	21072,#2
2521  0007 81            	ret	
2522  0008               L1621:
2523                     ; 785     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2525  0008 72155250      	bres	21072,#2
2526                     ; 787 }
2529  000c 81            	ret	
2565                     ; 795 void TIM2_SelectHallSensor(FunctionalState NewState)
2565                     ; 796 {
2566                     .text:	section	.text,new
2567  0000               _TIM2_SelectHallSensor:
2571                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
2573                     ; 801   if (NewState != DISABLE)
2575  0000 4d            	tnz	a
2576  0001 2705          	jreq	L3031
2577                     ; 803     TIM2->CR2 |= TIM_CR2_TI1S;
2579  0003 721e5251      	bset	21073,#7
2582  0007 81            	ret	
2583  0008               L3031:
2584                     ; 807     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2586  0008 721f5251      	bres	21073,#7
2587                     ; 809 }
2590  000c 81            	ret	
2647                     ; 819 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2647                     ; 820 {
2648                     .text:	section	.text,new
2649  0000               _TIM2_SelectOnePulseMode:
2653                     ; 822   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2655                     ; 825   if (TIM2_OPMode == TIM2_OPMode_Single)
2657  0000 4a            	dec	a
2658  0001 2605          	jrne	L5331
2659                     ; 827     TIM2->CR1 |= TIM_CR1_OPM ;
2661  0003 72165250      	bset	21072,#3
2664  0007 81            	ret	
2665  0008               L5331:
2666                     ; 831     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2668  0008 72175250      	bres	21072,#3
2669                     ; 833 }
2672  000c 81            	ret	
2771                     ; 847 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2771                     ; 848 {
2772                     .text:	section	.text,new
2773  0000               _TIM2_SelectOutputTrigger:
2775  0000 88            	push	a
2776  0001 88            	push	a
2777       00000001      OFST:	set	1
2780                     ; 849   uint8_t tmpcr2 = 0;
2782                     ; 852   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2784                     ; 854   tmpcr2 = TIM2->CR2;
2786  0002 c65251        	ld	a,21073
2787                     ; 857   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2789  0005 a48f          	and	a,#143
2790                     ; 860   tmpcr2 |= (uint8_t)TIM2_TRGOSource;
2792  0007 1a02          	or	a,(OFST+1,sp)
2793                     ; 862   TIM2->CR2 = tmpcr2;
2795  0009 c75251        	ld	21073,a
2796                     ; 863 }
2799  000c 85            	popw	x
2800  000d 81            	ret	
2883                     ; 875 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2883                     ; 876 {
2884                     .text:	section	.text,new
2885  0000               _TIM2_SelectSlaveMode:
2887  0000 88            	push	a
2888  0001 88            	push	a
2889       00000001      OFST:	set	1
2892                     ; 877   uint8_t tmpsmcr = 0;
2894                     ; 880   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2896                     ; 882   tmpsmcr = TIM2->SMCR;
2898  0002 c65252        	ld	a,21074
2899                     ; 885   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2901  0005 a4f8          	and	a,#248
2902                     ; 888   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2904  0007 1a02          	or	a,(OFST+1,sp)
2905                     ; 890   TIM2->SMCR = tmpsmcr;
2907  0009 c75252        	ld	21074,a
2908                     ; 891 }
2911  000c 85            	popw	x
2912  000d 81            	ret	
2948                     ; 899 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2948                     ; 900 {
2949                     .text:	section	.text,new
2950  0000               _TIM2_SelectMasterSlaveMode:
2954                     ; 902   assert_param(IS_FUNCTIONAL_STATE(NewState));
2956                     ; 905   if (NewState != DISABLE)
2958  0000 4d            	tnz	a
2959  0001 2705          	jreq	L7541
2960                     ; 907     TIM2->SMCR |= TIM_SMCR_MSM;
2962  0003 721e5252      	bset	21074,#7
2965  0007 81            	ret	
2966  0008               L7541:
2967                     ; 911     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2969  0008 721f5252      	bres	21074,#7
2970                     ; 913 }
2973  000c 81            	ret	
3086                     ; 932 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3086                     ; 933                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3086                     ; 934                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3086                     ; 935 {
3087                     .text:	section	.text,new
3088  0000               _TIM2_EncoderInterfaceConfig:
3090  0000 89            	pushw	x
3091  0001 5203          	subw	sp,#3
3092       00000003      OFST:	set	3
3095                     ; 936   uint8_t tmpsmcr = 0;
3097                     ; 937   uint8_t tmpccmr1 = 0;
3099                     ; 938   uint8_t tmpccmr2 = 0;
3101                     ; 941   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3103                     ; 942   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3105                     ; 943   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3107                     ; 945   tmpsmcr = TIM2->SMCR;
3109  0003 c65252        	ld	a,21074
3110  0006 6b01          	ld	(OFST-2,sp),a
3111                     ; 946   tmpccmr1 = TIM2->CCMR1;
3113  0008 c65258        	ld	a,21080
3114  000b 6b02          	ld	(OFST-1,sp),a
3115                     ; 947   tmpccmr2 = TIM2->CCMR2;
3117  000d c65259        	ld	a,21081
3118  0010 6b03          	ld	(OFST+0,sp),a
3119                     ; 950   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3121  0012 7b01          	ld	a,(OFST-2,sp)
3122  0014 a4f0          	and	a,#240
3123  0016 6b01          	ld	(OFST-2,sp),a
3124                     ; 951   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3126  0018 9e            	ld	a,xh
3127  0019 1a01          	or	a,(OFST-2,sp)
3128  001b 6b01          	ld	(OFST-2,sp),a
3129                     ; 954   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3131  001d 7b02          	ld	a,(OFST-1,sp)
3132  001f a4fc          	and	a,#252
3133  0021 6b02          	ld	(OFST-1,sp),a
3134                     ; 955   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3136  0023 7b03          	ld	a,(OFST+0,sp)
3137  0025 a4fc          	and	a,#252
3138  0027 6b03          	ld	(OFST+0,sp),a
3139                     ; 956   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3141  0029 7b02          	ld	a,(OFST-1,sp)
3142  002b aa01          	or	a,#1
3143  002d 6b02          	ld	(OFST-1,sp),a
3144                     ; 957   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3146  002f 7b03          	ld	a,(OFST+0,sp)
3147  0031 aa01          	or	a,#1
3148  0033 6b03          	ld	(OFST+0,sp),a
3149                     ; 960   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3151  0035 9f            	ld	a,xl
3152  0036 4a            	dec	a
3153  0037 2606          	jrne	L7351
3154                     ; 962     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3156  0039 7212525a      	bset	21082,#1
3158  003d 2004          	jra	L1451
3159  003f               L7351:
3160                     ; 966     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3162  003f 7213525a      	bres	21082,#1
3163  0043               L1451:
3164                     ; 969   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3166  0043 7b08          	ld	a,(OFST+5,sp)
3167  0045 4a            	dec	a
3168  0046 2606          	jrne	L3451
3169                     ; 971     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3171  0048 721a525a      	bset	21082,#5
3173  004c 2004          	jra	L5451
3174  004e               L3451:
3175                     ; 975     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3177  004e 721b525a      	bres	21082,#5
3178  0052               L5451:
3179                     ; 978   TIM2->SMCR = tmpsmcr;
3181  0052 7b01          	ld	a,(OFST-2,sp)
3182  0054 c75252        	ld	21074,a
3183                     ; 979   TIM2->CCMR1 = tmpccmr1;
3185  0057 7b02          	ld	a,(OFST-1,sp)
3186  0059 c75258        	ld	21080,a
3187                     ; 980   TIM2->CCMR2 = tmpccmr2;
3189  005c 7b03          	ld	a,(OFST+0,sp)
3190  005e c75259        	ld	21081,a
3191                     ; 981 }
3194  0061 5b05          	addw	sp,#5
3195  0063 81            	ret	
3263                     ; 1001 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3263                     ; 1002                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3263                     ; 1003 {
3264                     .text:	section	.text,new
3265  0000               _TIM2_PrescalerConfig:
3269                     ; 1005   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3271                     ; 1006   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3273                     ; 1009   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3275  0000 9e            	ld	a,xh
3276  0001 c7525d        	ld	21085,a
3277                     ; 1012   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3279  0004 9f            	ld	a,xl
3280  0005 4a            	dec	a
3281  0006 2605          	jrne	L1061
3282                     ; 1014     TIM2->EGR |= TIM_EGR_UG ;
3284  0008 72105257      	bset	21079,#0
3287  000c 81            	ret	
3288  000d               L1061:
3289                     ; 1018     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3291  000d 72115257      	bres	21079,#0
3292                     ; 1020 }
3295  0011 81            	ret	
3340                     ; 1033 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3340                     ; 1034 {
3341                     .text:	section	.text,new
3342  0000               _TIM2_CounterModeConfig:
3344  0000 88            	push	a
3345  0001 88            	push	a
3346       00000001      OFST:	set	1
3349                     ; 1035   uint8_t tmpcr1 = 0;
3351                     ; 1038   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3353                     ; 1040   tmpcr1 = TIM2->CR1;
3355  0002 c65250        	ld	a,21072
3356                     ; 1043   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3358  0005 a48f          	and	a,#143
3359                     ; 1046   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3361  0007 1a02          	or	a,(OFST+1,sp)
3362                     ; 1048   TIM2->CR1 = tmpcr1;
3364  0009 c75250        	ld	21072,a
3365                     ; 1049 }
3368  000c 85            	popw	x
3369  000d 81            	ret	
3436                     ; 1059 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3436                     ; 1060 {
3437                     .text:	section	.text,new
3438  0000               _TIM2_ForcedOC1Config:
3440  0000 88            	push	a
3441  0001 88            	push	a
3442       00000001      OFST:	set	1
3445                     ; 1061   uint8_t tmpccmr1 = 0;
3447                     ; 1064   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3449                     ; 1066   tmpccmr1 = TIM2->CCMR1;
3451  0002 c65258        	ld	a,21080
3452                     ; 1069   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3454  0005 a48f          	and	a,#143
3455                     ; 1072   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3457  0007 1a02          	or	a,(OFST+1,sp)
3458                     ; 1074   TIM2->CCMR1 = tmpccmr1;
3460  0009 c75258        	ld	21080,a
3461                     ; 1075 }
3464  000c 85            	popw	x
3465  000d 81            	ret	
3510                     ; 1085 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3510                     ; 1086 {
3511                     .text:	section	.text,new
3512  0000               _TIM2_ForcedOC2Config:
3514  0000 88            	push	a
3515  0001 88            	push	a
3516       00000001      OFST:	set	1
3519                     ; 1087   uint8_t tmpccmr2 = 0;
3521                     ; 1090   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3523                     ; 1092   tmpccmr2 = TIM2->CCMR2;
3525  0002 c65259        	ld	a,21081
3526                     ; 1095   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3528  0005 a48f          	and	a,#143
3529                     ; 1098   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3531  0007 1a02          	or	a,(OFST+1,sp)
3532                     ; 1100   TIM2->CCMR2 = tmpccmr2;
3534  0009 c75259        	ld	21081,a
3535                     ; 1101 }
3538  000c 85            	popw	x
3539  000d 81            	ret	
3575                     ; 1109 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3575                     ; 1110 {
3576                     .text:	section	.text,new
3577  0000               _TIM2_ARRPreloadConfig:
3581                     ; 1112   assert_param(IS_FUNCTIONAL_STATE(NewState));
3583                     ; 1115   if (NewState != DISABLE)
3585  0000 4d            	tnz	a
3586  0001 2705          	jreq	L1271
3587                     ; 1117     TIM2->CR1 |= TIM_CR1_ARPE;
3589  0003 721e5250      	bset	21072,#7
3592  0007 81            	ret	
3593  0008               L1271:
3594                     ; 1121     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3596  0008 721f5250      	bres	21072,#7
3597                     ; 1123 }
3600  000c 81            	ret	
3636                     ; 1131 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3636                     ; 1132 {
3637                     .text:	section	.text,new
3638  0000               _TIM2_OC1PreloadConfig:
3642                     ; 1134   assert_param(IS_FUNCTIONAL_STATE(NewState));
3644                     ; 1137   if (NewState != DISABLE)
3646  0000 4d            	tnz	a
3647  0001 2705          	jreq	L3471
3648                     ; 1139     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3650  0003 72165258      	bset	21080,#3
3653  0007 81            	ret	
3654  0008               L3471:
3655                     ; 1143     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3657  0008 72175258      	bres	21080,#3
3658                     ; 1145 }
3661  000c 81            	ret	
3697                     ; 1153 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3697                     ; 1154 {
3698                     .text:	section	.text,new
3699  0000               _TIM2_OC2PreloadConfig:
3703                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
3705                     ; 1159   if (NewState != DISABLE)
3707  0000 4d            	tnz	a
3708  0001 2705          	jreq	L5671
3709                     ; 1161     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3711  0003 72165259      	bset	21081,#3
3714  0007 81            	ret	
3715  0008               L5671:
3716                     ; 1165     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3718  0008 72175259      	bres	21081,#3
3719                     ; 1167 }
3722  000c 81            	ret	
3757                     ; 1174 void TIM2_OC1FastCmd(FunctionalState NewState)
3757                     ; 1175 {
3758                     .text:	section	.text,new
3759  0000               _TIM2_OC1FastCmd:
3763                     ; 1177   assert_param(IS_FUNCTIONAL_STATE(NewState));
3765                     ; 1180   if (NewState != DISABLE)
3767  0000 4d            	tnz	a
3768  0001 2705          	jreq	L7002
3769                     ; 1182     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3771  0003 72145258      	bset	21080,#2
3774  0007 81            	ret	
3775  0008               L7002:
3776                     ; 1186     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3778  0008 72155258      	bres	21080,#2
3779                     ; 1188 }
3782  000c 81            	ret	
3817                     ; 1195 void TIM2_OC2FastCmd(FunctionalState NewState)
3817                     ; 1196 {
3818                     .text:	section	.text,new
3819  0000               _TIM2_OC2FastCmd:
3823                     ; 1198   assert_param(IS_FUNCTIONAL_STATE(NewState));
3825                     ; 1201   if (NewState != DISABLE)
3827  0000 4d            	tnz	a
3828  0001 2705          	jreq	L1302
3829                     ; 1203     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3831  0003 72145259      	bset	21081,#2
3834  0007 81            	ret	
3835  0008               L1302:
3836                     ; 1207     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3838  0008 72155259      	bres	21081,#2
3839                     ; 1209 }
3842  000c 81            	ret	
3923                     ; 1222 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3923                     ; 1223 {
3924                     .text:	section	.text,new
3925  0000               _TIM2_GenerateEvent:
3929                     ; 1225   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3931                     ; 1228   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3933  0000 ca5257        	or	a,21079
3934  0003 c75257        	ld	21079,a
3935                     ; 1229 }
3938  0006 81            	ret	
3974                     ; 1239 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3974                     ; 1240 {
3975                     .text:	section	.text,new
3976  0000               _TIM2_OC1PolarityConfig:
3980                     ; 1242   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
3982                     ; 1245   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
3984  0000 4a            	dec	a
3985  0001 2605          	jrne	L7012
3986                     ; 1247     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3988  0003 7212525a      	bset	21082,#1
3991  0007 81            	ret	
3992  0008               L7012:
3993                     ; 1251     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3995  0008 7213525a      	bres	21082,#1
3996                     ; 1253 }
3999  000c 81            	ret	
4035                     ; 1263 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4035                     ; 1264 {
4036                     .text:	section	.text,new
4037  0000               _TIM2_OC2PolarityConfig:
4041                     ; 1266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4043                     ; 1269   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4045  0000 4a            	dec	a
4046  0001 2605          	jrne	L1312
4047                     ; 1271     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4049  0003 721a525a      	bset	21082,#5
4052  0007 81            	ret	
4053  0008               L1312:
4054                     ; 1275     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4056  0008 721b525a      	bres	21082,#5
4057                     ; 1277 }
4060  000c 81            	ret	
4105                     ; 1289 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4105                     ; 1290                  FunctionalState NewState)
4105                     ; 1291 {
4106                     .text:	section	.text,new
4107  0000               _TIM2_CCxCmd:
4109  0000 89            	pushw	x
4110       00000000      OFST:	set	0
4113                     ; 1293   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4115                     ; 1294   assert_param(IS_FUNCTIONAL_STATE(NewState));
4117                     ; 1296   if (TIM2_Channel == TIM2_Channel_1)
4119  0001 9e            	ld	a,xh
4120  0002 4d            	tnz	a
4121  0003 2610          	jrne	L7512
4122                     ; 1299     if (NewState != DISABLE)
4124  0005 9f            	ld	a,xl
4125  0006 4d            	tnz	a
4126  0007 2706          	jreq	L1612
4127                     ; 1301       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4129  0009 7210525a      	bset	21082,#0
4131  000d 2014          	jra	L5612
4132  000f               L1612:
4133                     ; 1305       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4135  000f 7211525a      	bres	21082,#0
4136  0013 200e          	jra	L5612
4137  0015               L7512:
4138                     ; 1312     if (NewState != DISABLE)
4140  0015 7b02          	ld	a,(OFST+2,sp)
4141  0017 2706          	jreq	L7612
4142                     ; 1314       TIM2->CCER1 |= TIM_CCER1_CC2E;
4144  0019 7218525a      	bset	21082,#4
4146  001d 2004          	jra	L5612
4147  001f               L7612:
4148                     ; 1318       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4150  001f 7219525a      	bres	21082,#4
4151  0023               L5612:
4152                     ; 1322 }
4155  0023 85            	popw	x
4156  0024 81            	ret	
4201                     ; 1342 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4201                     ; 1343                      TIM2_OCMode_TypeDef TIM2_OCMode)
4201                     ; 1344 {
4202                     .text:	section	.text,new
4203  0000               _TIM2_SelectOCxM:
4205  0000 89            	pushw	x
4206       00000000      OFST:	set	0
4209                     ; 1346   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4211                     ; 1347   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4213                     ; 1349   if (TIM2_Channel == TIM2_Channel_1)
4215  0001 9e            	ld	a,xh
4216  0002 4d            	tnz	a
4217  0003 2615          	jrne	L5122
4218                     ; 1352     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4220  0005 7211525a      	bres	21082,#0
4221                     ; 1355     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4223  0009 c65258        	ld	a,21080
4224  000c a48f          	and	a,#143
4225  000e c75258        	ld	21080,a
4226                     ; 1358     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4228  0011 9f            	ld	a,xl
4229  0012 ca5258        	or	a,21080
4230  0015 c75258        	ld	21080,a
4232  0018 2014          	jra	L7122
4233  001a               L5122:
4234                     ; 1363     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4236  001a 7219525a      	bres	21082,#4
4237                     ; 1366     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4239  001e c65259        	ld	a,21081
4240  0021 a48f          	and	a,#143
4241  0023 c75259        	ld	21081,a
4242                     ; 1369     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4244  0026 c65259        	ld	a,21081
4245  0029 1a02          	or	a,(OFST+2,sp)
4246  002b c75259        	ld	21081,a
4247  002e               L7122:
4248                     ; 1371 }
4251  002e 85            	popw	x
4252  002f 81            	ret	
4286                     ; 1379 void TIM2_SetCounter(uint16_t TIM2_Counter)
4286                     ; 1380 {
4287                     .text:	section	.text,new
4288  0000               _TIM2_SetCounter:
4292                     ; 1383   TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4294  0000 9e            	ld	a,xh
4295  0001 c7525b        	ld	21083,a
4296                     ; 1384   TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4298  0004 9f            	ld	a,xl
4299  0005 c7525c        	ld	21084,a
4300                     ; 1385 }
4303  0008 81            	ret	
4337                     ; 1393 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4337                     ; 1394 {
4338                     .text:	section	.text,new
4339  0000               _TIM2_SetAutoreload:
4343                     ; 1396   TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4345  0000 9e            	ld	a,xh
4346  0001 c7525e        	ld	21086,a
4347                     ; 1397   TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4349  0004 9f            	ld	a,xl
4350  0005 c7525f        	ld	21087,a
4351                     ; 1398 }
4354  0008 81            	ret	
4388                     ; 1406 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4388                     ; 1407 {
4389                     .text:	section	.text,new
4390  0000               _TIM2_SetCompare1:
4394                     ; 1409   TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4396  0000 9e            	ld	a,xh
4397  0001 c75260        	ld	21088,a
4398                     ; 1410   TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4400  0004 9f            	ld	a,xl
4401  0005 c75261        	ld	21089,a
4402                     ; 1411 }
4405  0008 81            	ret	
4439                     ; 1419 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4439                     ; 1420 {
4440                     .text:	section	.text,new
4441  0000               _TIM2_SetCompare2:
4445                     ; 1422   TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4447  0000 9e            	ld	a,xh
4448  0001 c75262        	ld	21090,a
4449                     ; 1423   TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4451  0004 9f            	ld	a,xl
4452  0005 c75263        	ld	21091,a
4453                     ; 1424 }
4456  0008 81            	ret	
4501                     ; 1436 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4501                     ; 1437 {
4502                     .text:	section	.text,new
4503  0000               _TIM2_SetIC1Prescaler:
4505  0000 88            	push	a
4506  0001 88            	push	a
4507       00000001      OFST:	set	1
4510                     ; 1438   uint8_t tmpccmr1 = 0;
4512                     ; 1441   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4514                     ; 1443   tmpccmr1 = TIM2->CCMR1;
4516  0002 c65258        	ld	a,21080
4517                     ; 1446   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4519  0005 a4f3          	and	a,#243
4520                     ; 1449   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4522  0007 1a02          	or	a,(OFST+1,sp)
4523                     ; 1451   TIM2->CCMR1 = tmpccmr1;
4525  0009 c75258        	ld	21080,a
4526                     ; 1452 }
4529  000c 85            	popw	x
4530  000d 81            	ret	
4575                     ; 1464 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4575                     ; 1465 {
4576                     .text:	section	.text,new
4577  0000               _TIM2_SetIC2Prescaler:
4579  0000 88            	push	a
4580  0001 88            	push	a
4581       00000001      OFST:	set	1
4584                     ; 1466   uint8_t tmpccmr2 = 0;
4586                     ; 1469   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4588                     ; 1471   tmpccmr2 = TIM2->CCMR2;
4590  0002 c65259        	ld	a,21081
4591                     ; 1474   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4593  0005 a4f3          	and	a,#243
4594                     ; 1477   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4596  0007 1a02          	or	a,(OFST+1,sp)
4597                     ; 1479   TIM2->CCMR2 = tmpccmr2;
4599  0009 c75259        	ld	21081,a
4600                     ; 1480 }
4603  000c 85            	popw	x
4604  000d 81            	ret	
4656                     ; 1487 uint16_t TIM2_GetCapture1(void)
4656                     ; 1488 {
4657                     .text:	section	.text,new
4658  0000               _TIM2_GetCapture1:
4660  0000 5204          	subw	sp,#4
4661       00000004      OFST:	set	4
4664                     ; 1489   uint16_t tmpccr1 = 0;
4666                     ; 1492   tmpccr1h = TIM2->CCR1H;
4668  0002 c65260        	ld	a,21088
4669  0005 6b02          	ld	(OFST-2,sp),a
4670                     ; 1493   tmpccr1l = TIM2->CCR1L;
4672  0007 c65261        	ld	a,21089
4673  000a 6b01          	ld	(OFST-3,sp),a
4674                     ; 1495   tmpccr1 = (uint16_t)(tmpccr1l);
4676  000c 5f            	clrw	x
4677  000d 97            	ld	xl,a
4678  000e 1f03          	ldw	(OFST-1,sp),x
4679                     ; 1496   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4681  0010 5f            	clrw	x
4682  0011 7b02          	ld	a,(OFST-2,sp)
4683  0013 97            	ld	xl,a
4684  0014 7b04          	ld	a,(OFST+0,sp)
4685  0016 01            	rrwa	x,a
4686  0017 1a03          	or	a,(OFST-1,sp)
4687  0019 01            	rrwa	x,a
4688                     ; 1498   return ((uint16_t)tmpccr1);
4692  001a 5b04          	addw	sp,#4
4693  001c 81            	ret	
4745                     ; 1506 uint16_t TIM2_GetCapture2(void)
4745                     ; 1507 {
4746                     .text:	section	.text,new
4747  0000               _TIM2_GetCapture2:
4749  0000 5204          	subw	sp,#4
4750       00000004      OFST:	set	4
4753                     ; 1508   uint16_t tmpccr2 = 0;
4755                     ; 1511   tmpccr2h = TIM2->CCR2H;
4757  0002 c65262        	ld	a,21090
4758  0005 6b02          	ld	(OFST-2,sp),a
4759                     ; 1512   tmpccr2l = TIM2->CCR2L;
4761  0007 c65263        	ld	a,21091
4762  000a 6b01          	ld	(OFST-3,sp),a
4763                     ; 1514   tmpccr2 = (uint16_t)(tmpccr2l);
4765  000c 5f            	clrw	x
4766  000d 97            	ld	xl,a
4767  000e 1f03          	ldw	(OFST-1,sp),x
4768                     ; 1515   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4770  0010 5f            	clrw	x
4771  0011 7b02          	ld	a,(OFST-2,sp)
4772  0013 97            	ld	xl,a
4773  0014 7b04          	ld	a,(OFST+0,sp)
4774  0016 01            	rrwa	x,a
4775  0017 1a03          	or	a,(OFST-1,sp)
4776  0019 01            	rrwa	x,a
4777                     ; 1517   return ((uint16_t)tmpccr2);
4781  001a 5b04          	addw	sp,#4
4782  001c 81            	ret	
4834                     ; 1525 uint16_t TIM2_GetCounter(void)
4834                     ; 1526 {
4835                     .text:	section	.text,new
4836  0000               _TIM2_GetCounter:
4838  0000 5204          	subw	sp,#4
4839       00000004      OFST:	set	4
4842                     ; 1527   uint16_t tmpcnt = 0;
4844                     ; 1530   tmpcntrh = TIM2->CNTRH;
4846  0002 c6525b        	ld	a,21083
4847  0005 6b02          	ld	(OFST-2,sp),a
4848                     ; 1531   tmpcntrl = TIM2->CNTRL;
4850  0007 c6525c        	ld	a,21084
4851  000a 6b01          	ld	(OFST-3,sp),a
4852                     ; 1533   tmpcnt = (uint16_t)(tmpcntrl);
4854  000c 5f            	clrw	x
4855  000d 97            	ld	xl,a
4856  000e 1f03          	ldw	(OFST-1,sp),x
4857                     ; 1534   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4859  0010 5f            	clrw	x
4860  0011 7b02          	ld	a,(OFST-2,sp)
4861  0013 97            	ld	xl,a
4862  0014 7b04          	ld	a,(OFST+0,sp)
4863  0016 01            	rrwa	x,a
4864  0017 1a03          	or	a,(OFST-1,sp)
4865  0019 01            	rrwa	x,a
4866                     ; 1536   return ((uint16_t)tmpcnt);
4870  001a 5b04          	addw	sp,#4
4871  001c 81            	ret	
4895                     ; 1544 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4895                     ; 1545 {
4896                     .text:	section	.text,new
4897  0000               _TIM2_GetPrescaler:
4901                     ; 1547   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
4903  0000 c6525d        	ld	a,21085
4906  0003 81            	ret	
5045                     ; 1563 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5045                     ; 1564 {
5046                     .text:	section	.text,new
5047  0000               _TIM2_GetFlagStatus:
5049  0000 89            	pushw	x
5050  0001 89            	pushw	x
5051       00000002      OFST:	set	2
5054                     ; 1565   FlagStatus bitstatus = RESET;
5056                     ; 1569   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5058                     ; 1571   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5060  0002 9f            	ld	a,xl
5061  0003 c45255        	and	a,21077
5062  0006 6b01          	ld	(OFST-1,sp),a
5063                     ; 1572   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5065  0008 c65256        	ld	a,21078
5066  000b 1403          	and	a,(OFST+1,sp)
5067  000d 6b02          	ld	(OFST+0,sp),a
5068                     ; 1574   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5070  000f 1a01          	or	a,(OFST-1,sp)
5071  0011 2702          	jreq	L3552
5072                     ; 1576     bitstatus = SET;
5074  0013 a601          	ld	a,#1
5076  0015               L3552:
5077                     ; 1580     bitstatus = RESET;
5079                     ; 1582   return ((FlagStatus)bitstatus);
5083  0015 5b04          	addw	sp,#4
5084  0017 81            	ret	
5119                     ; 1596 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5119                     ; 1597 {
5120                     .text:	section	.text,new
5121  0000               _TIM2_ClearFlag:
5123  0000 89            	pushw	x
5124       00000000      OFST:	set	0
5127                     ; 1599   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5129                     ; 1601   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5131  0001 9f            	ld	a,xl
5132  0002 43            	cpl	a
5133  0003 c75255        	ld	21077,a
5134                     ; 1602   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5136  0006 7b01          	ld	a,(OFST+1,sp)
5137  0008 43            	cpl	a
5138  0009 c75256        	ld	21078,a
5139                     ; 1603 }
5142  000c 85            	popw	x
5143  000d 81            	ret	
5207                     ; 1616 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5207                     ; 1617 {
5208                     .text:	section	.text,new
5209  0000               _TIM2_GetITStatus:
5211  0000 88            	push	a
5212  0001 5203          	subw	sp,#3
5213       00000003      OFST:	set	3
5216                     ; 1618   __IO ITStatus bitstatus = RESET;
5218  0003 0f03          	clr	(OFST+0,sp)
5219                     ; 1620   __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5221  0005 0f01          	clr	(OFST-2,sp)
5224  0007 0f02          	clr	(OFST-1,sp)
5225                     ; 1623   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5227                     ; 1625   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5229  0009 c45255        	and	a,21077
5230  000c 6b01          	ld	(OFST-2,sp),a
5231                     ; 1627   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5233  000e c65254        	ld	a,21076
5234  0011 1404          	and	a,(OFST+1,sp)
5235  0013 6b02          	ld	(OFST-1,sp),a
5236                     ; 1629   if ((TIM2_itStatus != (uint8_t)RESET) && (TIM2_itEnable != (uint8_t)RESET))
5238  0015 0d01          	tnz	(OFST-2,sp)
5239  0017 270a          	jreq	L7262
5241  0019 0d02          	tnz	(OFST-1,sp)
5242  001b 2706          	jreq	L7262
5243                     ; 1631     bitstatus = (ITStatus)SET;
5245  001d a601          	ld	a,#1
5246  001f 6b03          	ld	(OFST+0,sp),a
5248  0021 2002          	jra	L1362
5249  0023               L7262:
5250                     ; 1635     bitstatus = (ITStatus)RESET;
5252  0023 0f03          	clr	(OFST+0,sp)
5253  0025               L1362:
5254                     ; 1637   return ((ITStatus)bitstatus);
5256  0025 7b03          	ld	a,(OFST+0,sp)
5259  0027 5b04          	addw	sp,#4
5260  0029 81            	ret	
5296                     ; 1651 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5296                     ; 1652 {
5297                     .text:	section	.text,new
5298  0000               _TIM2_ClearITPendingBit:
5302                     ; 1654   assert_param(IS_TIM2_IT(TIM2_IT));
5304                     ; 1657   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5306  0000 43            	cpl	a
5307  0001 c75255        	ld	21077,a
5308                     ; 1658 }
5311  0004 81            	ret	
5383                     ; 1675 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5383                     ; 1676                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5383                     ; 1677                        uint8_t TIM2_ICFilter)
5383                     ; 1678 {
5384                     .text:	section	.text,new
5385  0000               L3_TI1_Config:
5387  0000 89            	pushw	x
5388  0001 89            	pushw	x
5389       00000002      OFST:	set	2
5392                     ; 1679   uint8_t tmpccmr1 = 0;
5394                     ; 1680   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5396  0002 9e            	ld	a,xh
5397  0003 6b01          	ld	(OFST-1,sp),a
5398                     ; 1681   tmpccmr1 = TIM2->CCMR1;
5400  0005 c65258        	ld	a,21080
5401  0008 6b02          	ld	(OFST+0,sp),a
5402                     ; 1684   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5404                     ; 1685   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5406                     ; 1686   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5408                     ; 1689   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5410  000a 7211525a      	bres	21082,#0
5411                     ; 1692   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5413  000e a40c          	and	a,#12
5414  0010 6b02          	ld	(OFST+0,sp),a
5415                     ; 1693   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5417  0012 7b07          	ld	a,(OFST+5,sp)
5418  0014 97            	ld	xl,a
5419  0015 a610          	ld	a,#16
5420  0017 42            	mul	x,a
5421  0018 9f            	ld	a,xl
5422  0019 1a04          	or	a,(OFST+2,sp)
5423  001b 1a02          	or	a,(OFST+0,sp)
5424  001d 6b02          	ld	(OFST+0,sp),a
5425                     ; 1695   TIM2->CCMR1 = tmpccmr1;
5427  001f c75258        	ld	21080,a
5428                     ; 1698   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5430  0022 7b01          	ld	a,(OFST-1,sp)
5431  0024 4a            	dec	a
5432  0025 2606          	jrne	L7072
5433                     ; 1700     TIM2->CCER1 |= TIM_CCER1_CC1P;
5435  0027 7212525a      	bset	21082,#1
5437  002b 2004          	jra	L1172
5438  002d               L7072:
5439                     ; 1704     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5441  002d 7213525a      	bres	21082,#1
5442  0031               L1172:
5443                     ; 1708   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5445  0031 7210525a      	bset	21082,#0
5446                     ; 1709 }
5449  0035 5b04          	addw	sp,#4
5450  0037 81            	ret	
5522                     ; 1726 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5522                     ; 1727                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5522                     ; 1728                        uint8_t TIM2_ICFilter)
5522                     ; 1729 {
5523                     .text:	section	.text,new
5524  0000               L5_TI2_Config:
5526  0000 89            	pushw	x
5527  0001 89            	pushw	x
5528       00000002      OFST:	set	2
5531                     ; 1730   uint8_t tmpccmr2 = 0;
5533                     ; 1731   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5535  0002 9e            	ld	a,xh
5536  0003 6b01          	ld	(OFST-1,sp),a
5537                     ; 1734   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5539                     ; 1735   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5541                     ; 1736   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5543                     ; 1738   tmpccmr2 = TIM2->CCMR2;
5545  0005 c65259        	ld	a,21081
5546  0008 6b02          	ld	(OFST+0,sp),a
5547                     ; 1741   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5549  000a 7219525a      	bres	21082,#4
5550                     ; 1744   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5552  000e a40c          	and	a,#12
5553  0010 6b02          	ld	(OFST+0,sp),a
5554                     ; 1745   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5556  0012 7b07          	ld	a,(OFST+5,sp)
5557  0014 97            	ld	xl,a
5558  0015 a610          	ld	a,#16
5559  0017 42            	mul	x,a
5560  0018 9f            	ld	a,xl
5561  0019 1a04          	or	a,(OFST+2,sp)
5562  001b 1a02          	or	a,(OFST+0,sp)
5563  001d 6b02          	ld	(OFST+0,sp),a
5564                     ; 1747   TIM2->CCMR2 = tmpccmr2;
5566  001f c75259        	ld	21081,a
5567                     ; 1750   if (tmpicpolarity == (uint8_t)TIM2_ICPolarity_Falling)
5569  0022 7b01          	ld	a,(OFST-1,sp)
5570  0024 4a            	dec	a
5571  0025 2606          	jrne	L1572
5572                     ; 1752     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5574  0027 721a525a      	bset	21082,#5
5576  002b 2004          	jra	L3572
5577  002d               L1572:
5578                     ; 1756     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5580  002d 721b525a      	bres	21082,#5
5581  0031               L3572:
5582                     ; 1760   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5584  0031 7218525a      	bset	21082,#4
5585                     ; 1761 }
5588  0035 5b04          	addw	sp,#4
5589  0037 81            	ret	
5657                     ; 1771 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5657                     ; 1772 {
5658                     .text:	section	.text,new
5659  0000               _TIM2_ComputeLsiClockFreq:
5661  0000 520c          	subw	sp,#12
5662       0000000c      OFST:	set	12
5665                     ; 1777   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5667  0002 4b00          	push	#0
5668  0004 4b0c          	push	#12
5669  0006 4b01          	push	#1
5670  0008 5f            	clrw	x
5671  0009 cd0000        	call	_TIM2_ICInit
5673  000c 5b03          	addw	sp,#3
5674                     ; 1780   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5676  000e ae0201        	ldw	x,#513
5677  0011 cd0000        	call	_TIM2_ITConfig
5679                     ; 1783   TIM2_Cmd(ENABLE);
5681  0014 a601          	ld	a,#1
5682  0016 cd0000        	call	_TIM2_Cmd
5684                     ; 1785   TIM2->SR1 = 0x00;
5686  0019 725f5255      	clr	21077
5687                     ; 1786   TIM2->SR2 = 0x00;
5689  001d 725f5256      	clr	21078
5690                     ; 1789   TIM2_ClearFlag(TIM2_FLAG_CC1);
5692  0021 ae0002        	ldw	x,#2
5693  0024 cd0000        	call	_TIM2_ClearFlag
5696  0027               L1103:
5697                     ; 1792   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5699  0027 72035255fb    	btjf	21077,#1,L1103
5700                     ; 1795   ICValue1 = TIM2_GetCapture1();
5702  002c cd0000        	call	_TIM2_GetCapture1
5704  002f 1f09          	ldw	(OFST-3,sp),x
5705                     ; 1796   TIM2_ClearFlag(TIM2_FLAG_CC1);
5707  0031 ae0002        	ldw	x,#2
5708  0034 cd0000        	call	_TIM2_ClearFlag
5711  0037               L7103:
5712                     ; 1799   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5714  0037 72035255fb    	btjf	21077,#1,L7103
5715                     ; 1802   ICValue2 = TIM2_GetCapture1();
5717  003c cd0000        	call	_TIM2_GetCapture1
5719  003f 1f0b          	ldw	(OFST-1,sp),x
5720                     ; 1803   TIM2_ClearFlag(TIM2_FLAG_CC1);
5722  0041 ae0002        	ldw	x,#2
5723  0044 cd0000        	call	_TIM2_ClearFlag
5725                     ; 1806   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5727  0047 7211525a      	bres	21082,#0
5728                     ; 1808   TIM2->CCMR1 = 0x00;
5730  004b 725f5258      	clr	21080
5731                     ; 1810   TIM2_Cmd(DISABLE);
5733  004f 4f            	clr	a
5734  0050 cd0000        	call	_TIM2_Cmd
5736                     ; 1813   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5738  0053 1e0b          	ldw	x,(OFST-1,sp)
5739  0055 72f009        	subw	x,(OFST-3,sp)
5740  0058 cd0000        	call	c_uitolx
5742  005b 96            	ldw	x,sp
5743  005c 5c            	incw	x
5744  005d cd0000        	call	c_rtol
5746  0060 96            	ldw	x,sp
5747  0061 1c000f        	addw	x,#OFST+3
5748  0064 cd0000        	call	c_ltor
5750  0067 a603          	ld	a,#3
5751  0069 cd0000        	call	c_llsh
5753  006c 96            	ldw	x,sp
5754  006d 5c            	incw	x
5755  006e cd0000        	call	c_ludv
5757  0071 96            	ldw	x,sp
5758  0072 1c0005        	addw	x,#OFST-7
5759  0075 cd0000        	call	c_rtol
5761                     ; 1814   return LSIClockFreq;
5763  0078 96            	ldw	x,sp
5764  0079 1c0005        	addw	x,#OFST-7
5765  007c cd0000        	call	c_ltor
5769  007f 5b0c          	addw	sp,#12
5770  0081 81            	ret	
5794                     ; 1822 FunctionalState TIM2_GetStatus(void)
5794                     ; 1823 {
5795                     .text:	section	.text,new
5796  0000               _TIM2_GetStatus:
5800                     ; 1824   return ((FunctionalState)(TIM2->CR1 & TIM_CR1_CEN));
5802  0000 c65250        	ld	a,21072
5803  0003 a401          	and	a,#1
5806  0005 81            	ret	
5819                     	xdef	_TIM2_GetStatus
5820                     	xdef	_TIM2_ComputeLsiClockFreq
5821                     	xdef	_TIM2_ClearITPendingBit
5822                     	xdef	_TIM2_GetITStatus
5823                     	xdef	_TIM2_ClearFlag
5824                     	xdef	_TIM2_GetFlagStatus
5825                     	xdef	_TIM2_GetPrescaler
5826                     	xdef	_TIM2_GetCounter
5827                     	xdef	_TIM2_GetCapture2
5828                     	xdef	_TIM2_GetCapture1
5829                     	xdef	_TIM2_SetIC2Prescaler
5830                     	xdef	_TIM2_SetIC1Prescaler
5831                     	xdef	_TIM2_SetCompare2
5832                     	xdef	_TIM2_SetCompare1
5833                     	xdef	_TIM2_SetAutoreload
5834                     	xdef	_TIM2_SetCounter
5835                     	xdef	_TIM2_SelectOCxM
5836                     	xdef	_TIM2_CCxCmd
5837                     	xdef	_TIM2_OC2PolarityConfig
5838                     	xdef	_TIM2_OC1PolarityConfig
5839                     	xdef	_TIM2_GenerateEvent
5840                     	xdef	_TIM2_OC2FastCmd
5841                     	xdef	_TIM2_OC1FastCmd
5842                     	xdef	_TIM2_OC2PreloadConfig
5843                     	xdef	_TIM2_OC1PreloadConfig
5844                     	xdef	_TIM2_ARRPreloadConfig
5845                     	xdef	_TIM2_ForcedOC2Config
5846                     	xdef	_TIM2_ForcedOC1Config
5847                     	xdef	_TIM2_CounterModeConfig
5848                     	xdef	_TIM2_PrescalerConfig
5849                     	xdef	_TIM2_EncoderInterfaceConfig
5850                     	xdef	_TIM2_SelectMasterSlaveMode
5851                     	xdef	_TIM2_SelectSlaveMode
5852                     	xdef	_TIM2_SelectOutputTrigger
5853                     	xdef	_TIM2_SelectOnePulseMode
5854                     	xdef	_TIM2_SelectHallSensor
5855                     	xdef	_TIM2_UpdateRequestConfig
5856                     	xdef	_TIM2_UpdateDisableConfig
5857                     	xdef	_TIM2_SelectInputTrigger
5858                     	xdef	_TIM2_TIxExternalClockConfig
5859                     	xdef	_TIM2_ETRConfig
5860                     	xdef	_TIM2_ETRClockMode2Config
5861                     	xdef	_TIM2_ETRClockMode1Config
5862                     	xdef	_TIM2_InternalClockConfig
5863                     	xdef	_TIM2_ITConfig
5864                     	xdef	_TIM2_CtrlPWMOutputs
5865                     	xdef	_TIM2_Cmd
5866                     	xdef	_TIM2_PWMIConfig
5867                     	xdef	_TIM2_ICInit
5868                     	xdef	_TIM2_BKRConfig
5869                     	xdef	_TIM2_OC2Init
5870                     	xdef	_TIM2_OC1Init
5871                     	xdef	_TIM2_TimeBaseInit
5872                     	xdef	_TIM2_DeInit
5873                     	xref.b	c_x
5892                     	xref	c_ludv
5893                     	xref	c_rtol
5894                     	xref	c_uitolx
5895                     	xref	c_llsh
5896                     	xref	c_ltor
5897                     	end
