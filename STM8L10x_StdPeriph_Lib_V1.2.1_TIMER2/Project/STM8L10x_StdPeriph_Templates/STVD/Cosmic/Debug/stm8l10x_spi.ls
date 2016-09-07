   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 55 void SPI_DeInit(void)
  48                     ; 56 {
  50                     .text:	section	.text,new
  51  0000               _SPI_DeInit:
  55                     ; 57   SPI->CR1 = SPI_CR1_RESET_VALUE;
  57  0000 725f5200      	clr	20992
  58                     ; 58   SPI->CR2 = SPI_CR2_RESET_VALUE;
  60  0004 725f5201      	clr	20993
  61                     ; 59   SPI->ICR = SPI_ICR_RESET_VALUE;
  63  0008 725f5202      	clr	20994
  64                     ; 60   SPI->SR = SPI_SR_RESET_VALUE;
  66  000c 35025203      	mov	20995,#2
  67                     ; 61 }
  70  0010 81            	ret	
 374                     ; 103 void SPI_Init(SPI_FirstBit_TypeDef SPI_FirstBit, SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 374                     ; 104               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL, SPI_CPHA_TypeDef SPI_CPHA,
 374                     ; 105               SPI_DirectionMode_TypeDef SPI_DirectionMode, SPI_NSS_TypeDef SPI_NSS)
 374                     ; 106 {
 375                     .text:	section	.text,new
 376  0000               _SPI_Init:
 378  0000 89            	pushw	x
 379       00000000      OFST:	set	0
 382                     ; 109   assert_param(IS_SPI_FIRST_BIT(SPI_FirstBit));
 384                     ; 110   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 386                     ; 111   assert_param(IS_SPI_MODE(SPI_Mode));
 388                     ; 112   assert_param(IS_SPI_CPOL(SPI_CPOL));
 390                     ; 113   assert_param(IS_SPI_CPHA(SPI_CPHA));
 392                     ; 114   assert_param(IS_SPI_DIRECTION_MODE(SPI_DirectionMode));
 394                     ; 115   assert_param(IS_SPI_NSS(SPI_NSS));
 396                     ; 118   SPI->CR1 = (uint8_t)((uint8_t)(SPI_FirstBit) |
 396                     ; 119                        (uint8_t)(SPI_BaudRatePrescaler) |
 396                     ; 120                        (uint8_t)(SPI_CPOL) |
 396                     ; 121                        (uint8_t)(SPI_CPHA));
 398  0001 9f            	ld	a,xl
 399  0002 1a01          	or	a,(OFST+1,sp)
 400  0004 1a06          	or	a,(OFST+6,sp)
 401  0006 1a07          	or	a,(OFST+7,sp)
 402  0008 c75200        	ld	20992,a
 403                     ; 124   SPI->CR2 = (uint8_t)((uint8_t)(SPI_DirectionMode) | (uint8_t)(SPI_NSS));
 405  000b 7b08          	ld	a,(OFST+8,sp)
 406  000d 1a09          	or	a,(OFST+9,sp)
 407  000f c75201        	ld	20993,a
 408                     ; 126   if (SPI_Mode == SPI_Mode_Master)
 410  0012 7b05          	ld	a,(OFST+5,sp)
 411  0014 a104          	cp	a,#4
 412  0016 2606          	jrne	L771
 413                     ; 128     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 415  0018 72105201      	bset	20993,#0
 417  001c 2004          	jra	L102
 418  001e               L771:
 419                     ; 132     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 421  001e 72115201      	bres	20993,#0
 422  0022               L102:
 423                     ; 136   SPI->CR1 |= (uint8_t)(SPI_Mode);
 425  0022 c65200        	ld	a,20992
 426  0025 1a05          	or	a,(OFST+5,sp)
 427  0027 c75200        	ld	20992,a
 428                     ; 137 }
 431  002a 85            	popw	x
 432  002b 81            	ret	
 487                     ; 145 void SPI_Cmd(FunctionalState NewState)
 487                     ; 146 {
 488                     .text:	section	.text,new
 489  0000               _SPI_Cmd:
 493                     ; 149   assert_param(IS_FUNCTIONAL_STATE(NewState));
 495                     ; 151   if (NewState != DISABLE)
 497  0000 4d            	tnz	a
 498  0001 2705          	jreq	L132
 499                     ; 153     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral */
 501  0003 721c5200      	bset	20992,#6
 504  0007 81            	ret	
 505  0008               L132:
 506                     ; 157     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral */
 508  0008 721d5200      	bres	20992,#6
 509                     ; 160 }
 512  000c 81            	ret	
 614                     ; 174 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 614                     ; 175 {
 615                     .text:	section	.text,new
 616  0000               _SPI_ITConfig:
 618  0000 89            	pushw	x
 619  0001 88            	push	a
 620       00000001      OFST:	set	1
 623                     ; 176   uint8_t itpos = 0;
 625                     ; 178   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 627                     ; 179   assert_param(IS_FUNCTIONAL_STATE(NewState));
 629                     ; 182   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 631  0002 9e            	ld	a,xh
 632  0003 a40f          	and	a,#15
 633  0005 5f            	clrw	x
 634  0006 97            	ld	xl,a
 635  0007 a601          	ld	a,#1
 636  0009 5d            	tnzw	x
 637  000a 2704          	jreq	L41
 638  000c               L61:
 639  000c 48            	sll	a
 640  000d 5a            	decw	x
 641  000e 26fc          	jrne	L61
 642  0010               L41:
 643  0010 6b01          	ld	(OFST+0,sp),a
 644                     ; 184   if (NewState != DISABLE)
 646  0012 0d03          	tnz	(OFST+2,sp)
 647  0014 2707          	jreq	L303
 648                     ; 186     SPI->ICR |= itpos; /* Enable interrupt*/
 650  0016 c65202        	ld	a,20994
 651  0019 1a01          	or	a,(OFST+0,sp)
 653  001b 2004          	jra	L503
 654  001d               L303:
 655                     ; 190     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 657  001d 43            	cpl	a
 658  001e c45202        	and	a,20994
 659  0021               L503:
 660  0021 c75202        	ld	20994,a
 661                     ; 192 }
 664  0024 5b03          	addw	sp,#3
 665  0026 81            	ret	
 699                     ; 199 void SPI_SendData(uint8_t Data)
 699                     ; 200 {
 700                     .text:	section	.text,new
 701  0000               _SPI_SendData:
 705                     ; 201   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 707  0000 c75204        	ld	20996,a
 708                     ; 202 }
 711  0003 81            	ret	
 734                     ; 209 uint8_t SPI_ReceiveData(void)
 734                     ; 210 {
 735                     .text:	section	.text,new
 736  0000               _SPI_ReceiveData:
 740                     ; 211   return ((uint8_t)SPI->DR); /* Return the data in the DR register */
 742  0000 c65204        	ld	a,20996
 745  0003 81            	ret	
 781                     ; 221 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 781                     ; 222 {
 782                     .text:	section	.text,new
 783  0000               _SPI_NSSInternalSoftwareCmd:
 787                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 789                     ; 227   if (NewState != DISABLE)
 791  0000 4d            	tnz	a
 792  0001 2705          	jreq	L353
 793                     ; 229     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software */
 795  0003 72105201      	bset	20993,#0
 798  0007 81            	ret	
 799  0008               L353:
 800                     ; 233     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software */
 802  0008 72115201      	bres	20993,#0
 803                     ; 236 }
 806  000c 81            	ret	
 862                     ; 246 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
 862                     ; 247 {
 863                     .text:	section	.text,new
 864  0000               _SPI_BiDirectionalLineConfig:
 868                     ; 250   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 870                     ; 251   if (SPI_Direction != SPI_Direction_Rx)
 872  0000 4d            	tnz	a
 873  0001 2705          	jreq	L504
 874                     ; 253     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 876  0003 721c5201      	bset	20993,#6
 879  0007 81            	ret	
 880  0008               L504:
 881                     ; 257     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 883  0008 721d5201      	bres	20993,#6
 884                     ; 259 }
 887  000c 81            	ret	
1001                     ; 275 FlagStatus SPI_GetFlagStatus(SPI_FLAG_TypeDef SPI_FLAG)
1001                     ; 276 {
1002                     .text:	section	.text,new
1003  0000               _SPI_GetFlagStatus:
1005  0000 88            	push	a
1006       00000001      OFST:	set	1
1009                     ; 277   FlagStatus status = RESET;
1011                     ; 279   assert_param(IS_SPI_FLAG(SPI_FLAG));
1013                     ; 282   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1015  0001 c45203        	and	a,20995
1016  0004 2702          	jreq	L364
1017                     ; 284     status = SET; /* SPI_FLAG is set */
1019  0006 a601          	ld	a,#1
1021  0008               L364:
1022                     ; 288     status = RESET; /* SPI_FLAG is reset*/
1024                     ; 292   return status;
1028  0008 5b01          	addw	sp,#1
1029  000a 81            	ret	
1052                     ; 306 void SPI_ClearFlag(void)
1052                     ; 307 {
1053                     .text:	section	.text,new
1054  0000               _SPI_ClearFlag:
1058                     ; 309   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1060  0000 35f75203      	mov	20995,#247
1061                     ; 310 }
1064  0004 81            	ret	
1146                     ; 323 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1146                     ; 324 {
1147                     .text:	section	.text,new
1148  0000               _SPI_GetITStatus:
1150  0000 88            	push	a
1151  0001 89            	pushw	x
1152       00000002      OFST:	set	2
1155                     ; 325   ITStatus pendingbitstatus = RESET;
1157                     ; 326   uint8_t itpos = 0;
1159                     ; 327   uint8_t itmask1 = 0;
1161                     ; 328   uint8_t itmask2 = 0;
1163                     ; 329   uint8_t enablestatus = 0;
1165                     ; 330   assert_param(IS_SPI_GET_IT(SPI_IT));
1167                     ; 332   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1169  0002 a40f          	and	a,#15
1170  0004 5f            	clrw	x
1171  0005 97            	ld	xl,a
1172  0006 a601          	ld	a,#1
1173  0008 5d            	tnzw	x
1174  0009 2704          	jreq	L63
1175  000b               L04:
1176  000b 48            	sll	a
1177  000c 5a            	decw	x
1178  000d 26fc          	jrne	L04
1179  000f               L63:
1180  000f 6b01          	ld	(OFST-1,sp),a
1181                     ; 335   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1183  0011 7b03          	ld	a,(OFST+1,sp)
1184  0013 4e            	swap	a
1185  0014 a40f          	and	a,#15
1186  0016 6b02          	ld	(OFST+0,sp),a
1187                     ; 337   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1189  0018 5f            	clrw	x
1190  0019 97            	ld	xl,a
1191  001a a601          	ld	a,#1
1192  001c 5d            	tnzw	x
1193  001d 2704          	jreq	L24
1194  001f               L44:
1195  001f 48            	sll	a
1196  0020 5a            	decw	x
1197  0021 26fc          	jrne	L44
1198  0023               L24:
1199                     ; 339   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1201  0023 c45203        	and	a,20995
1202  0026 6b02          	ld	(OFST+0,sp),a
1203                     ; 341   if (((SPI->ICR & itpos) != (uint8_t)RESET) && enablestatus)
1205  0028 c65202        	ld	a,20994
1206  002b 1501          	bcp	a,(OFST-1,sp)
1207  002d 2708          	jreq	L145
1209  002f 7b02          	ld	a,(OFST+0,sp)
1210  0031 2704          	jreq	L145
1211                     ; 344     pendingbitstatus = SET;
1213  0033 a601          	ld	a,#1
1215  0035 2001          	jra	L345
1216  0037               L145:
1217                     ; 349     pendingbitstatus = RESET;
1219  0037 4f            	clr	a
1220  0038               L345:
1221                     ; 352   return  pendingbitstatus;
1225  0038 5b03          	addw	sp,#3
1226  003a 81            	ret	
1250                     ; 367 void SPI_ClearITPendingBit(void)
1250                     ; 368 {
1251                     .text:	section	.text,new
1252  0000               _SPI_ClearITPendingBit:
1256                     ; 370   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1258  0000 35f75203      	mov	20995,#247
1259                     ; 371 }
1262  0004 81            	ret	
1275                     	xdef	_SPI_ClearITPendingBit
1276                     	xdef	_SPI_ClearFlag
1277                     	xdef	_SPI_GetITStatus
1278                     	xdef	_SPI_GetFlagStatus
1279                     	xdef	_SPI_ReceiveData
1280                     	xdef	_SPI_SendData
1281                     	xdef	_SPI_BiDirectionalLineConfig
1282                     	xdef	_SPI_NSSInternalSoftwareCmd
1283                     	xdef	_SPI_ITConfig
1284                     	xdef	_SPI_Cmd
1285                     	xdef	_SPI_Init
1286                     	xdef	_SPI_DeInit
1305                     	end
