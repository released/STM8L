   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 56 void TIM4_DeInit(void)
  48                     ; 57 {
  50                     .text:	section	.text,new
  51  0000               _TIM4_DeInit:
  55                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  57  0000 725f52e0      	clr	21216
  58                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  60  0004 725f52e1      	clr	21217
  61                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  63  0008 725f52e2      	clr	21218
  64                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  66  000c 725f52e3      	clr	21219
  67                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  69  0010 725f52e6      	clr	21222
  70                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  72  0014 725f52e7      	clr	21223
  73                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  75  0018 35ff52e8      	mov	21224,#255
  76                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  78  001c 725f52e4      	clr	21220
  79                     ; 66 }
  82  0020 81            	ret	
 250                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 250                     ; 92                        uint8_t TIM4_Period)
 250                     ; 93 {
 251                     .text:	section	.text,new
 252  0000               _TIM4_TimeBaseInit:
 256                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 258                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 260  0000 9f            	ld	a,xl
 261  0001 c752e8        	ld	21224,a
 262                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 264  0004 9e            	ld	a,xh
 265  0005 c752e7        	ld	21223,a
 266                     ; 100 }
 269  0008 81            	ret	
 324                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 324                     ; 109 {
 325                     .text:	section	.text,new
 326  0000               _TIM4_Cmd:
 330                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 332                     ; 114   if (NewState != DISABLE)
 334  0000 4d            	tnz	a
 335  0001 2705          	jreq	L531
 336                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 338  0003 721052e0      	bset	21216,#0
 341  0007 81            	ret	
 342  0008               L531:
 343                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 345  0008 721152e0      	bres	21216,#0
 346                     ; 122 }
 349  000c 81            	ret	
 414                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 414                     ; 135 {
 415                     .text:	section	.text,new
 416  0000               _TIM4_ITConfig:
 418  0000 89            	pushw	x
 419       00000000      OFST:	set	0
 422                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 424                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 426                     ; 140   if (NewState != DISABLE)
 428  0001 9f            	ld	a,xl
 429  0002 4d            	tnz	a
 430  0003 2706          	jreq	L371
 431                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 433  0005 9e            	ld	a,xh
 434  0006 ca52e3        	or	a,21219
 436  0009 2006          	jra	L571
 437  000b               L371:
 438                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 440  000b 7b01          	ld	a,(OFST+1,sp)
 441  000d 43            	cpl	a
 442  000e c452e3        	and	a,21219
 443  0011               L571:
 444  0011 c752e3        	ld	21219,a
 445                     ; 150 }
 448  0014 85            	popw	x
 449  0015 81            	ret	
 473                     ; 157 void TIM4_InternalClockConfig(void)
 473                     ; 158 {
 474                     .text:	section	.text,new
 475  0000               _TIM4_InternalClockConfig:
 479                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 481  0000 c652e2        	ld	a,21218
 482  0003 a4f8          	and	a,#248
 483  0005 c752e2        	ld	21218,a
 484                     ; 161 }
 487  0008 81            	ret	
 555                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 555                     ; 172 {
 556                     .text:	section	.text,new
 557  0000               _TIM4_SelectInputTrigger:
 559  0000 88            	push	a
 560  0001 88            	push	a
 561       00000001      OFST:	set	1
 564                     ; 173   uint8_t tmpsmcr = 0;
 566                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 568                     ; 178   tmpsmcr = TIM4->SMCR;
 570  0002 c652e2        	ld	a,21218
 571                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 573  0005 a48f          	and	a,#143
 574                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 576  0007 1a02          	or	a,(OFST+1,sp)
 577                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 579  0009 c752e2        	ld	21218,a
 580                     ; 185 }
 583  000c 85            	popw	x
 584  000d 81            	ret	
 620                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 620                     ; 194 {
 621                     .text:	section	.text,new
 622  0000               _TIM4_UpdateDisableConfig:
 626                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 628                     ; 199   if (NewState != DISABLE)
 630  0000 4d            	tnz	a
 631  0001 2705          	jreq	L752
 632                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 634  0003 721252e0      	bset	21216,#1
 637  0007 81            	ret	
 638  0008               L752:
 639                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 641  0008 721352e0      	bres	21216,#1
 642                     ; 207 }
 645  000c 81            	ret	
 703                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 703                     ; 218 {
 704                     .text:	section	.text,new
 705  0000               _TIM4_UpdateRequestConfig:
 709                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 711                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 713  0000 4a            	dec	a
 714  0001 2605          	jrne	L113
 715                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 717  0003 721452e0      	bset	21216,#2
 720  0007 81            	ret	
 721  0008               L113:
 722                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 724  0008 721552e0      	bres	21216,#2
 725                     ; 231 }
 728  000c 81            	ret	
 785                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 785                     ; 242 {
 786                     .text:	section	.text,new
 787  0000               _TIM4_SelectOnePulseMode:
 791                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 793                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 795  0000 4a            	dec	a
 796  0001 2605          	jrne	L343
 797                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 799  0003 721652e0      	bset	21216,#3
 802  0007 81            	ret	
 803  0008               L343:
 804                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 806  0008 721752e0      	bres	21216,#3
 807                     ; 256 }
 810  000c 81            	ret	
 885                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 885                     ; 268 {
 886                     .text:	section	.text,new
 887  0000               _TIM4_SelectOutputTrigger:
 889  0000 88            	push	a
 890  0001 88            	push	a
 891       00000001      OFST:	set	1
 894                     ; 269   uint8_t tmpcr2 = 0;
 896                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 898                     ; 274   tmpcr2 = TIM4->CR2;
 900  0002 c652e1        	ld	a,21217
 901                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 903  0005 a48f          	and	a,#143
 904                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 906  0007 1a02          	or	a,(OFST+1,sp)
 907                     ; 282   TIM4->CR2 = tmpcr2;
 909  0009 c752e1        	ld	21217,a
 910                     ; 283 }
 913  000c 85            	popw	x
 914  000d 81            	ret	
1005                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1005                     ; 298 {
1006                     .text:	section	.text,new
1007  0000               _TIM4_SelectSlaveMode:
1009  0000 88            	push	a
1010  0001 88            	push	a
1011       00000001      OFST:	set	1
1014                     ; 299   uint8_t tmpsmcr = 0;
1016                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1018                     ; 304   tmpsmcr = TIM4->SMCR;
1020  0002 c652e2        	ld	a,21218
1021                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1023  0005 a4f8          	and	a,#248
1024                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1026  0007 1a02          	or	a,(OFST+1,sp)
1027                     ; 312   TIM4->SMCR = tmpsmcr;
1029  0009 c752e2        	ld	21218,a
1030                     ; 313 }
1033  000c 85            	popw	x
1034  000d 81            	ret	
1070                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1070                     ; 322 {
1071                     .text:	section	.text,new
1072  0000               _TIM4_SelectMasterSlaveMode:
1076                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1078                     ; 327   if (NewState != DISABLE)
1080  0000 4d            	tnz	a
1081  0001 2705          	jreq	L164
1082                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1084  0003 721e52e2      	bset	21218,#7
1087  0007 81            	ret	
1088  0008               L164:
1089                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1091  0008 721f52e2      	bres	21218,#7
1092                     ; 335 }
1095  000c 81            	ret	
1163                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1163                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1163                     ; 365 {
1164                     .text:	section	.text,new
1165  0000               _TIM4_PrescalerConfig:
1169                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1171                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1173                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1175  0000 9e            	ld	a,xh
1176  0001 c752e7        	ld	21223,a
1177                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1179  0004 9f            	ld	a,xl
1180  0005 4a            	dec	a
1181  0006 2605          	jrne	L715
1182                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1184  0008 721052e5      	bset	21221,#0
1187  000c 81            	ret	
1188  000d               L715:
1189                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1191  000d 721152e5      	bres	21221,#0
1192                     ; 382 }
1195  0011 81            	ret	
1231                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1231                     ; 391 {
1232                     .text:	section	.text,new
1233  0000               _TIM4_ARRPreloadConfig:
1237                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1239                     ; 396   if (NewState != DISABLE)
1241  0000 4d            	tnz	a
1242  0001 2705          	jreq	L145
1243                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1245  0003 721e52e0      	bset	21216,#7
1248  0007 81            	ret	
1249  0008               L145:
1250                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1252  0008 721f52e0      	bres	21216,#7
1253                     ; 404 }
1256  000c 81            	ret	
1313                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1313                     ; 415 {
1314                     .text:	section	.text,new
1315  0000               _TIM4_GenerateEvent:
1319                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1321                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1323  0000 ca52e5        	or	a,21221
1324  0003 c752e5        	ld	21221,a
1325                     ; 421 }
1328  0006 81            	ret	
1362                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1362                     ; 430 {
1363                     .text:	section	.text,new
1364  0000               _TIM4_SetCounter:
1368                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1370  0000 c752e6        	ld	21222,a
1371                     ; 433 }
1374  0003 81            	ret	
1408                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1408                     ; 442 {
1409                     .text:	section	.text,new
1410  0000               _TIM4_SetAutoreload:
1414                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1416  0000 c752e8        	ld	21224,a
1417                     ; 446 }
1420  0003 81            	ret	
1454                     ; 453 uint8_t TIM4_GetCounter(void)
1454                     ; 454 {
1455                     .text:	section	.text,new
1456  0000               _TIM4_GetCounter:
1458  0000 88            	push	a
1459       00000001      OFST:	set	1
1462                     ; 455   uint8_t tmpcntr = 0;
1464                     ; 456   tmpcntr = TIM4->CNTR;
1466  0001 c652e6        	ld	a,21222
1467                     ; 458   return ((uint8_t)tmpcntr);
1471  0004 5b01          	addw	sp,#1
1472  0006 81            	ret	
1496                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1496                     ; 483 {
1497                     .text:	section	.text,new
1498  0000               _TIM4_GetPrescaler:
1502                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1504  0000 c652e7        	ld	a,21223
1507  0003 81            	ret	
1531                     ; 493 FunctionalState TIM4_GetStatus(void)
1531                     ; 494 {
1532                     .text:	section	.text,new
1533  0000               _TIM4_GetStatus:
1537                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1539  0000 c652e0        	ld	a,21216
1540  0003 a401          	and	a,#1
1543  0005 81            	ret	
1629                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1629                     ; 508 {
1630                     .text:	section	.text,new
1631  0000               _TIM4_GetFlagStatus:
1633  0000 88            	push	a
1634       00000001      OFST:	set	1
1637                     ; 509   __IO FlagStatus bitstatus = RESET;
1639  0001 0f01          	clr	(OFST+0,sp)
1640                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1642                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1644  0003 c452e4        	and	a,21220
1645  0006 2702          	jreq	L727
1646                     ; 516     bitstatus = SET;
1648  0008 a601          	ld	a,#1
1650  000a               L727:
1651                     ; 520     bitstatus = RESET;
1653  000a 6b01          	ld	(OFST+0,sp),a
1654                     ; 522   return ((FlagStatus)bitstatus);
1656  000c 7b01          	ld	a,(OFST+0,sp)
1659  000e 5b01          	addw	sp,#1
1660  0010 81            	ret	
1695                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1695                     ; 534 {
1696                     .text:	section	.text,new
1697  0000               _TIM4_ClearFlag:
1701                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1703                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1705  0000 43            	cpl	a
1706  0001 c752e4        	ld	21220,a
1707                     ; 539 }
1710  0004 81            	ret	
1774                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1774                     ; 551 {
1775                     .text:	section	.text,new
1776  0000               _TIM4_GetITStatus:
1778  0000 88            	push	a
1779  0001 5203          	subw	sp,#3
1780       00000003      OFST:	set	3
1783                     ; 552   __IO ITStatus bitstatus = RESET;
1785  0003 0f03          	clr	(OFST+0,sp)
1786                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1788  0005 0f01          	clr	(OFST-2,sp)
1791  0007 0f02          	clr	(OFST-1,sp)
1792                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1794                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1796  0009 c452e4        	and	a,21220
1797  000c 6b01          	ld	(OFST-2,sp),a
1798                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1800  000e c652e3        	ld	a,21219
1801  0011 1404          	and	a,(OFST+1,sp)
1802  0013 6b02          	ld	(OFST-1,sp),a
1803                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1805  0015 0d01          	tnz	(OFST-2,sp)
1806  0017 270a          	jreq	L3001
1808  0019 0d02          	tnz	(OFST-1,sp)
1809  001b 2706          	jreq	L3001
1810                     ; 565     bitstatus = (ITStatus)SET;
1812  001d a601          	ld	a,#1
1813  001f 6b03          	ld	(OFST+0,sp),a
1815  0021 2002          	jra	L5001
1816  0023               L3001:
1817                     ; 569     bitstatus = (ITStatus)RESET;
1819  0023 0f03          	clr	(OFST+0,sp)
1820  0025               L5001:
1821                     ; 571   return ((ITStatus)bitstatus);
1823  0025 7b03          	ld	a,(OFST+0,sp)
1826  0027 5b04          	addw	sp,#4
1827  0029 81            	ret	
1863                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1863                     ; 583 {
1864                     .text:	section	.text,new
1865  0000               _TIM4_ClearITPendingBit:
1869                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1871                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1873  0000 43            	cpl	a
1874  0001 c752e4        	ld	21220,a
1875                     ; 589 }
1878  0004 81            	ret	
1891                     	xdef	_TIM4_ClearITPendingBit
1892                     	xdef	_TIM4_GetITStatus
1893                     	xdef	_TIM4_ClearFlag
1894                     	xdef	_TIM4_GetFlagStatus
1895                     	xdef	_TIM4_GetStatus
1896                     	xdef	_TIM4_GetPrescaler
1897                     	xdef	_TIM4_GetCounter
1898                     	xdef	_TIM4_SetAutoreload
1899                     	xdef	_TIM4_SetCounter
1900                     	xdef	_TIM4_GenerateEvent
1901                     	xdef	_TIM4_ARRPreloadConfig
1902                     	xdef	_TIM4_PrescalerConfig
1903                     	xdef	_TIM4_SelectMasterSlaveMode
1904                     	xdef	_TIM4_SelectSlaveMode
1905                     	xdef	_TIM4_SelectOutputTrigger
1906                     	xdef	_TIM4_SelectOnePulseMode
1907                     	xdef	_TIM4_UpdateRequestConfig
1908                     	xdef	_TIM4_UpdateDisableConfig
1909                     	xdef	_TIM4_SelectInputTrigger
1910                     	xdef	_TIM4_InternalClockConfig
1911                     	xdef	_TIM4_ITConfig
1912                     	xdef	_TIM4_Cmd
1913                     	xdef	_TIM4_TimeBaseInit
1914                     	xdef	_TIM4_DeInit
1933                     	end
