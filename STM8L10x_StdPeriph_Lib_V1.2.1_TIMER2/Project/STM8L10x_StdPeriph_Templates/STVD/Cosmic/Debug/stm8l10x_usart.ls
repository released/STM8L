   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 59 void USART_DeInit(void)
  48                     ; 60 {
  50                     .text:	section	.text,new
  51  0000               _USART_DeInit:
  55                     ; 63   (void)USART->SR;
  57  0000 c65230        	ld	a,21040
  58                     ; 64   (void)USART->DR;
  60  0003 c65231        	ld	a,21041
  61                     ; 66   USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  63  0006 725f5233      	clr	21043
  64                     ; 67   USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  66  000a 725f5232      	clr	21042
  67                     ; 69   USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  69  000e 725f5234      	clr	21044
  70                     ; 70   USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  72  0012 725f5235      	clr	21045
  73                     ; 71   USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  75  0016 725f5236      	clr	21046
  76                     ; 72   USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  78  001a 725f5237      	clr	21047
  79                     ; 73 }
  82  001e 81            	ret	
 255                     ; 100 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 255                     ; 101                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 255                     ; 102                 USART_Parity, USART_Mode_TypeDef USART_Mode)
 255                     ; 103 {
 256                     .text:	section	.text,new
 257  0000               _USART_Init:
 259  0000 5204          	subw	sp,#4
 260       00000004      OFST:	set	4
 263                     ; 104   uint32_t BaudRate_Mantissa = 0;
 265                     ; 107   assert_param(IS_USART_BAUDRATE(BaudRate));
 267                     ; 109   assert_param(IS_USART_WordLength(USART_WordLength));
 269                     ; 111   assert_param(IS_USART_STOPBITS(USART_StopBits));
 271                     ; 113   assert_param(IS_USART_PARITY(USART_Parity));
 273                     ; 115   assert_param(IS_USART_MODE(USART_Mode));
 275                     ; 118   USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 277  0002 c65234        	ld	a,21044
 278  0005 a4e9          	and	a,#233
 279  0007 c75234        	ld	21044,a
 280                     ; 121   USART->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 282  000a 7b0b          	ld	a,(OFST+7,sp)
 283  000c 1a0d          	or	a,(OFST+9,sp)
 284  000e ca5234        	or	a,21044
 285  0011 c75234        	ld	21044,a
 286                     ; 124   USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 288  0014 c65236        	ld	a,21046
 289  0017 a4cf          	and	a,#207
 290  0019 c75236        	ld	21046,a
 291                     ; 126   USART->CR3 |= (uint8_t)USART_StopBits;
 293  001c c65236        	ld	a,21046
 294  001f 1a0c          	or	a,(OFST+8,sp)
 295  0021 c75236        	ld	21046,a
 296                     ; 129   USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 298  0024 725f5232      	clr	21042
 299                     ; 131   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 301  0028 c65233        	ld	a,21043
 302  002b a40f          	and	a,#15
 303  002d c75233        	ld	21043,a
 304                     ; 133   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 306  0030 c65233        	ld	a,21043
 307  0033 a4f0          	and	a,#240
 308  0035 c75233        	ld	21043,a
 309                     ; 135   BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq() / BaudRate);
 311  0038 cd0000        	call	_CLK_GetClockFreq
 313  003b 96            	ldw	x,sp
 314  003c 1c0007        	addw	x,#OFST+3
 315  003f cd0000        	call	c_ludv
 317  0042 96            	ldw	x,sp
 318  0043 5c            	incw	x
 319  0044 cd0000        	call	c_rtol
 321                     ; 137   USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 323  0047 7b03          	ld	a,(OFST-1,sp)
 324  0049 a4f0          	and	a,#240
 325  004b c75233        	ld	21043,a
 326                     ; 139   USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 328  004e 7b04          	ld	a,(OFST+0,sp)
 329  0050 a40f          	and	a,#15
 330  0052 ca5233        	or	a,21043
 331  0055 c75233        	ld	21043,a
 332                     ; 141   USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 334  0058 96            	ldw	x,sp
 335  0059 5c            	incw	x
 336  005a cd0000        	call	c_ltor
 338  005d a604          	ld	a,#4
 339  005f cd0000        	call	c_lursh
 341  0062 5500035232    	mov	21042,c_lreg+3
 342                     ; 144   USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 344  0067 c65235        	ld	a,21045
 345  006a a4f3          	and	a,#243
 346  006c c75235        	ld	21045,a
 347                     ; 146   USART->CR2 |= (uint8_t)USART_Mode;
 349  006f c65235        	ld	a,21045
 350  0072 1a0e          	or	a,(OFST+10,sp)
 351  0074 c75235        	ld	21045,a
 352                     ; 147 }
 355  0077 5b04          	addw	sp,#4
 356  0079 81            	ret	
 504                     ; 171 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 504                     ; 172                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 504                     ; 173 {
 505                     .text:	section	.text,new
 506  0000               _USART_ClockInit:
 508  0000 89            	pushw	x
 509       00000000      OFST:	set	0
 512                     ; 175   assert_param(IS_USART_CLOCK(USART_Clock));
 514                     ; 176   assert_param(IS_USART_CPOL(USART_CPOL));
 516                     ; 177   assert_param(IS_USART_CPHA(USART_CPHA));
 518                     ; 178   assert_param(IS_USART_LASTBIT(USART_LastBit));
 520                     ; 181   USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 522  0001 c65236        	ld	a,21046
 523  0004 a4f8          	and	a,#248
 524  0006 c75236        	ld	21046,a
 525                     ; 183   USART->CR3 |= (uint8_t)((uint8_t)USART_CPOL | (uint8_t)USART_CPHA | (uint8_t)USART_LastBit);
 527  0009 9f            	ld	a,xl
 528  000a 1a05          	or	a,(OFST+5,sp)
 529  000c 1a06          	or	a,(OFST+6,sp)
 530  000e ca5236        	or	a,21046
 531  0011 c75236        	ld	21046,a
 532                     ; 185   if (USART_Clock != USART_Clock_Disable)
 534  0014 7b01          	ld	a,(OFST+1,sp)
 535  0016 2706          	jreq	L712
 536                     ; 187     USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 538  0018 72165236      	bset	21046,#3
 540  001c 2004          	jra	L122
 541  001e               L712:
 542                     ; 191     USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 544  001e 72175236      	bres	21046,#3
 545  0022               L122:
 546                     ; 193 }
 549  0022 85            	popw	x
 550  0023 81            	ret	
 605                     ; 201 void USART_Cmd(FunctionalState NewState)
 605                     ; 202 {
 606                     .text:	section	.text,new
 607  0000               _USART_Cmd:
 611                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 613                     ; 205   if (NewState != DISABLE)
 615  0000 4d            	tnz	a
 616  0001 2705          	jreq	L152
 617                     ; 207     USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 619  0003 721b5234      	bres	21044,#5
 622  0007 81            	ret	
 623  0008               L152:
 624                     ; 211     USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 626  0008 721a5234      	bset	21044,#5
 627                     ; 213 }
 630  000c 81            	ret	
 741                     ; 229 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 741                     ; 230 {
 742                     .text:	section	.text,new
 743  0000               _USART_ITConfig:
 745  0000 89            	pushw	x
 746  0001 89            	pushw	x
 747       00000002      OFST:	set	2
 750                     ; 231   uint8_t uartreg, itpos = 0x00;
 752                     ; 232   assert_param(IS_USART_CONFIG_IT(USART_IT));
 754                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 756                     ; 236   uartreg = (uint8_t)((uint16_t)USART_IT >> (uint8_t)0x08);
 758  0002 9e            	ld	a,xh
 759  0003 6b01          	ld	(OFST-1,sp),a
 760                     ; 238   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 762  0005 9f            	ld	a,xl
 763  0006 a40f          	and	a,#15
 764  0008 5f            	clrw	x
 765  0009 97            	ld	xl,a
 766  000a a601          	ld	a,#1
 767  000c 5d            	tnzw	x
 768  000d 2704          	jreq	L02
 769  000f               L22:
 770  000f 48            	sll	a
 771  0010 5a            	decw	x
 772  0011 26fc          	jrne	L22
 773  0013               L02:
 774  0013 6b02          	ld	(OFST+0,sp),a
 775                     ; 240   if (NewState != DISABLE)
 777  0015 7b07          	ld	a,(OFST+5,sp)
 778  0017 2713          	jreq	L723
 779                     ; 243     if (uartreg == 0x01)
 781  0019 7b01          	ld	a,(OFST-1,sp)
 782  001b 4a            	dec	a
 783  001c 2607          	jrne	L133
 784                     ; 245       USART->CR1 |= itpos;
 786  001e c65234        	ld	a,21044
 787  0021 1a02          	or	a,(OFST+0,sp)
 789  0023 2012          	jp	LC002
 790  0025               L133:
 791                     ; 250       USART->CR2 |= itpos;
 793  0025 c65235        	ld	a,21045
 794  0028 1a02          	or	a,(OFST+0,sp)
 795  002a 2016          	jp	LC001
 796  002c               L723:
 797                     ; 256     if (uartreg == 0x01)
 799  002c 7b01          	ld	a,(OFST-1,sp)
 800  002e 4a            	dec	a
 801  002f 260b          	jrne	L733
 802                     ; 258       USART->CR1 &= (uint8_t)(~itpos);
 804  0031 7b02          	ld	a,(OFST+0,sp)
 805  0033 43            	cpl	a
 806  0034 c45234        	and	a,21044
 807  0037               LC002:
 808  0037 c75234        	ld	21044,a
 810  003a 2009          	jra	L533
 811  003c               L733:
 812                     ; 263       USART->CR2 &= (uint8_t)(~itpos);
 814  003c 7b02          	ld	a,(OFST+0,sp)
 815  003e 43            	cpl	a
 816  003f c45235        	and	a,21045
 817  0042               LC001:
 818  0042 c75235        	ld	21045,a
 819  0045               L533:
 820                     ; 267 }
 823  0045 5b04          	addw	sp,#4
 824  0047 81            	ret	
 847                     ; 275 uint8_t USART_ReceiveData8(void)
 847                     ; 276 {
 848                     .text:	section	.text,new
 849  0000               _USART_ReceiveData8:
 853                     ; 277   return USART->DR;
 855  0000 c65231        	ld	a,21041
 858  0003 81            	ret	
 892                     ; 287 uint16_t USART_ReceiveData9(void)
 892                     ; 288 {
 893                     .text:	section	.text,new
 894  0000               _USART_ReceiveData9:
 896  0000 89            	pushw	x
 897       00000002      OFST:	set	2
 900                     ; 289   uint16_t temp = 0;
 902                     ; 291   temp = ((uint16_t)(((uint16_t)((uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 904  0001 c65234        	ld	a,21044
 905  0004 a480          	and	a,#128
 906  0006 5f            	clrw	x
 907  0007 02            	rlwa	x,a
 908  0008 58            	sllw	x
 909  0009 1f01          	ldw	(OFST-1,sp),x
 910                     ; 292   return (uint16_t)( ((uint16_t)((uint16_t)USART->DR) | temp) & ((uint16_t)0x01FF));
 912  000b c65231        	ld	a,21041
 913  000e 5f            	clrw	x
 914  000f 97            	ld	xl,a
 915  0010 01            	rrwa	x,a
 916  0011 1a02          	or	a,(OFST+0,sp)
 917  0013 01            	rrwa	x,a
 918  0014 1a01          	or	a,(OFST-1,sp)
 919  0016 a401          	and	a,#1
 920  0018 01            	rrwa	x,a
 923  0019 5b02          	addw	sp,#2
 924  001b 81            	ret	
 960                     ; 301 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 960                     ; 302 {
 961                     .text:	section	.text,new
 962  0000               _USART_ReceiverWakeUpCmd:
 966                     ; 303   assert_param(IS_FUNCTIONAL_STATE(NewState));
 968                     ; 305   if (NewState != DISABLE)
 970  0000 4d            	tnz	a
 971  0001 2705          	jreq	L704
 972                     ; 308     USART->CR2 |= USART_CR2_RWU;
 974  0003 72125235      	bset	21045,#1
 977  0007 81            	ret	
 978  0008               L704:
 979                     ; 313     USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 981  0008 72135235      	bres	21045,#1
 982                     ; 315 }
 985  000c 81            	ret	
1008                     ; 322 void USART_SendBreak(void)
1008                     ; 323 {
1009                     .text:	section	.text,new
1010  0000               _USART_SendBreak:
1014                     ; 324   USART->CR2 |= USART_CR2_SBK;
1016  0000 72105235      	bset	21045,#0
1017                     ; 325 }
1020  0004 81            	ret	
1054                     ; 332 void USART_SendData8(uint8_t Data)
1054                     ; 333 {
1055                     .text:	section	.text,new
1056  0000               _USART_SendData8:
1060                     ; 335   USART->DR = Data;
1062  0000 c75231        	ld	21041,a
1063                     ; 336 }
1066  0003 81            	ret	
1100                     ; 344 void USART_SendData9(uint16_t Data)
1100                     ; 345 {
1101                     .text:	section	.text,new
1102  0000               _USART_SendData9:
1104  0000 89            	pushw	x
1105       00000000      OFST:	set	0
1108                     ; 346   assert_param(IS_USART_DATA_9BITS(Data));
1110                     ; 348   USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1112  0001 721d5234      	bres	21044,#6
1113                     ; 349   USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1115  0005 54            	srlw	x
1116  0006 54            	srlw	x
1117  0007 9f            	ld	a,xl
1118  0008 a440          	and	a,#64
1119  000a ca5234        	or	a,21044
1120  000d c75234        	ld	21044,a
1121                     ; 350   USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1123  0010 7b02          	ld	a,(OFST+2,sp)
1124  0012 c75231        	ld	21041,a
1125                     ; 352 }
1128  0015 85            	popw	x
1129  0016 81            	ret	
1163                     ; 360 void USART_SetAddress(uint8_t Address)
1163                     ; 361 {
1164                     .text:	section	.text,new
1165  0000               _USART_SetAddress:
1167  0000 88            	push	a
1168       00000000      OFST:	set	0
1171                     ; 363   assert_param(IS_USART_ADDRESS(Address));
1173                     ; 366   USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1175  0001 c65237        	ld	a,21047
1176  0004 a4f0          	and	a,#240
1177  0006 c75237        	ld	21047,a
1178                     ; 368   USART->CR4 |= Address;
1180  0009 c65237        	ld	a,21047
1181  000c 1a01          	or	a,(OFST+1,sp)
1182  000e c75237        	ld	21047,a
1183                     ; 369 }
1186  0011 84            	pop	a
1187  0012 81            	ret	
1244                     ; 379 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1244                     ; 380 {
1245                     .text:	section	.text,new
1246  0000               _USART_WakeUpConfig:
1250                     ; 381   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1252                     ; 383   USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1254  0000 72175234      	bres	21044,#3
1255                     ; 384   USART->CR1 |= (uint8_t)USART_WakeUp;
1257  0004 ca5234        	or	a,21044
1258  0007 c75234        	ld	21044,a
1259                     ; 385 }
1262  000a 81            	ret	
1398                     ; 400 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1398                     ; 401 {
1399                     .text:	section	.text,new
1400  0000               _USART_GetFlagStatus:
1402  0000 89            	pushw	x
1403  0001 88            	push	a
1404       00000001      OFST:	set	1
1407                     ; 402   FlagStatus status = RESET;
1409                     ; 405   assert_param(IS_USART_FLAG(USART_FLAG));
1411                     ; 407   if (USART_FLAG == USART_FLAG_SBK)
1413  0002 a30101        	cpw	x,#257
1414  0005 2608          	jrne	L306
1415                     ; 409     if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1417  0007 9f            	ld	a,xl
1418  0008 c45235        	and	a,21045
1419  000b 270e          	jreq	L116
1420                     ; 412       status = SET;
1422  000d 2007          	jp	LC004
1423                     ; 417       status = RESET;
1424  000f               L306:
1425                     ; 422     if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1427  000f c65230        	ld	a,21040
1428  0012 1503          	bcp	a,(OFST+2,sp)
1429  0014 2704          	jreq	L316
1430                     ; 425       status = SET;
1432  0016               LC004:
1434  0016 a601          	ld	a,#1
1437  0018 2001          	jra	L116
1438  001a               L316:
1439                     ; 430       status = RESET;
1441  001a 4f            	clr	a
1442  001b               L116:
1443                     ; 434   return status;
1447  001b 5b03          	addw	sp,#3
1448  001d 81            	ret	
1471                     ; 454 void USART_ClearFlag(void)
1471                     ; 455 {
1472                     .text:	section	.text,new
1473  0000               _USART_ClearFlag:
1477                     ; 457   USART->SR = (uint8_t)~(USART_SR_RXNE);
1479  0000 35df5230      	mov	21040,#223
1480                     ; 458 }
1483  0004 81            	ret	
1565                     ; 472 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1565                     ; 473 {
1566                     .text:	section	.text,new
1567  0000               _USART_GetITStatus:
1569  0000 89            	pushw	x
1570  0001 89            	pushw	x
1571       00000002      OFST:	set	2
1574                     ; 474   ITStatus pendingbitstatus = RESET;
1576                     ; 475   uint8_t itpos = 0;
1578                     ; 476   uint8_t itmask1 = 0;
1580                     ; 477   uint8_t itmask2 = 0;
1582                     ; 478   uint8_t enablestatus = 0;
1584                     ; 481   assert_param(IS_USART_GET_IT(USART_IT));
1586                     ; 484   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1588  0002 9f            	ld	a,xl
1589  0003 a40f          	and	a,#15
1590  0005 5f            	clrw	x
1591  0006 97            	ld	xl,a
1592  0007 a601          	ld	a,#1
1593  0009 5d            	tnzw	x
1594  000a 2704          	jreq	L25
1595  000c               L45:
1596  000c 48            	sll	a
1597  000d 5a            	decw	x
1598  000e 26fc          	jrne	L45
1599  0010               L25:
1600  0010 6b01          	ld	(OFST-1,sp),a
1601                     ; 486   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1603  0012 7b04          	ld	a,(OFST+2,sp)
1604  0014 4e            	swap	a
1605  0015 a40f          	and	a,#15
1606  0017 6b02          	ld	(OFST+0,sp),a
1607                     ; 488   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1609  0019 5f            	clrw	x
1610  001a 97            	ld	xl,a
1611  001b a601          	ld	a,#1
1612  001d 5d            	tnzw	x
1613  001e 2704          	jreq	L65
1614  0020               L06:
1615  0020 48            	sll	a
1616  0021 5a            	decw	x
1617  0022 26fc          	jrne	L06
1618  0024               L65:
1619  0024 6b02          	ld	(OFST+0,sp),a
1620                     ; 492   if (USART_IT == USART_IT_PE)
1622  0026 1e03          	ldw	x,(OFST+1,sp)
1623  0028 a30100        	cpw	x,#256
1624  002b 2614          	jrne	L176
1625                     ; 495     enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1627  002d c65234        	ld	a,21044
1628  0030 1402          	and	a,(OFST+0,sp)
1629  0032 6b02          	ld	(OFST+0,sp),a
1630                     ; 498     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1632  0034 c65230        	ld	a,21040
1633  0037 1501          	bcp	a,(OFST-1,sp)
1634  0039 271c          	jreq	L107
1636  003b 7b02          	ld	a,(OFST+0,sp)
1637  003d 2718          	jreq	L107
1638                     ; 501       pendingbitstatus = SET;
1640  003f 2012          	jp	LC006
1641                     ; 506       pendingbitstatus = RESET;
1642  0041               L176:
1643                     ; 512     enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1645  0041 c65235        	ld	a,21045
1646  0044 1402          	and	a,(OFST+0,sp)
1647  0046 6b02          	ld	(OFST+0,sp),a
1648                     ; 514     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1650  0048 c65230        	ld	a,21040
1651  004b 1501          	bcp	a,(OFST-1,sp)
1652  004d 2708          	jreq	L107
1654  004f 7b02          	ld	a,(OFST+0,sp)
1655  0051 2704          	jreq	L107
1656                     ; 517       pendingbitstatus = SET;
1658  0053               LC006:
1660  0053 a601          	ld	a,#1
1662  0055 2001          	jra	L776
1663  0057               L107:
1664                     ; 522       pendingbitstatus = RESET;
1667  0057 4f            	clr	a
1668  0058               L776:
1669                     ; 527   return  pendingbitstatus;
1673  0058 5b04          	addw	sp,#4
1674  005a 81            	ret	
1698                     ; 546 void USART_ClearITPendingBit(void)
1698                     ; 547 {
1699                     .text:	section	.text,new
1700  0000               _USART_ClearITPendingBit:
1704                     ; 549   USART->SR = (uint8_t)~(USART_SR_RXNE);
1706  0000 35df5230      	mov	21040,#223
1707                     ; 550 }
1710  0004 81            	ret	
1723                     	xdef	_USART_ClearITPendingBit
1724                     	xdef	_USART_GetITStatus
1725                     	xdef	_USART_ClearFlag
1726                     	xdef	_USART_GetFlagStatus
1727                     	xdef	_USART_WakeUpConfig
1728                     	xdef	_USART_SetAddress
1729                     	xdef	_USART_SendData9
1730                     	xdef	_USART_SendData8
1731                     	xdef	_USART_SendBreak
1732                     	xdef	_USART_ReceiverWakeUpCmd
1733                     	xdef	_USART_ReceiveData9
1734                     	xdef	_USART_ReceiveData8
1735                     	xdef	_USART_ITConfig
1736                     	xdef	_USART_Cmd
1737                     	xdef	_USART_ClockInit
1738                     	xdef	_USART_Init
1739                     	xdef	_USART_DeInit
1740                     	xref	_CLK_GetClockFreq
1741                     	xref.b	c_lreg
1742                     	xref.b	c_x
1761                     	xref	c_lursh
1762                     	xref	c_ltor
1763                     	xref	c_rtol
1764                     	xref	c_ludv
1765                     	end
