   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 114                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 58 {
 116                     .text:	section	.text,new
 117  0000               _GPIO_DeInit:
 121                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 63 }
 136  0007 81            	ret	
 292                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 292                     ; 99                uint8_t GPIO_Pin,
 292                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 292                     ; 101 {
 293                     .text:	section	.text,new
 294  0000               _GPIO_Init:
 296  0000 89            	pushw	x
 297       00000000      OFST:	set	0
 300                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 302                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 304                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 306  0001 7b06          	ld	a,(OFST+6,sp)
 307  0003 2a18          	jrpl	L541
 308                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 310  0005 a510          	bcp	a,#16
 311  0007 2705          	jreq	L741
 312                     ; 117       GPIOx->ODR |= GPIO_Pin;
 314  0009 f6            	ld	a,(x)
 315  000a 1a05          	or	a,(OFST+5,sp)
 317  000c 2006          	jra	L151
 318  000e               L741:
 319                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 321  000e 1e01          	ldw	x,(OFST+1,sp)
 322  0010 7b05          	ld	a,(OFST+5,sp)
 323  0012 43            	cpl	a
 324  0013 f4            	and	a,(x)
 325  0014               L151:
 326  0014 f7            	ld	(x),a
 327                     ; 123     GPIOx->DDR |= GPIO_Pin;
 329  0015 1e01          	ldw	x,(OFST+1,sp)
 330  0017 e602          	ld	a,(2,x)
 331  0019 1a05          	or	a,(OFST+5,sp)
 333  001b 2007          	jra	L351
 334  001d               L541:
 335                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 337  001d 1e01          	ldw	x,(OFST+1,sp)
 338  001f 7b05          	ld	a,(OFST+5,sp)
 339  0021 43            	cpl	a
 340  0022 e402          	and	a,(2,x)
 341  0024               L351:
 342  0024 e702          	ld	(2,x),a
 343                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 345  0026 7b06          	ld	a,(OFST+6,sp)
 346  0028 a540          	bcp	a,#64
 347  002a 2706          	jreq	L551
 348                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 350  002c e603          	ld	a,(3,x)
 351  002e 1a05          	or	a,(OFST+5,sp)
 353  0030 2005          	jra	L751
 354  0032               L551:
 355                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 357  0032 7b05          	ld	a,(OFST+5,sp)
 358  0034 43            	cpl	a
 359  0035 e403          	and	a,(3,x)
 360  0037               L751:
 361  0037 e703          	ld	(3,x),a
 362                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 364  0039 7b06          	ld	a,(OFST+6,sp)
 365  003b a520          	bcp	a,#32
 366  003d 2706          	jreq	L161
 367                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 369  003f e604          	ld	a,(4,x)
 370  0041 1a05          	or	a,(OFST+5,sp)
 372  0043 2005          	jra	L361
 373  0045               L161:
 374                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 376  0045 7b05          	ld	a,(OFST+5,sp)
 377  0047 43            	cpl	a
 378  0048 e404          	and	a,(4,x)
 379  004a               L361:
 380  004a e704          	ld	(4,x),a
 381                     ; 154 }
 384  004c 85            	popw	x
 385  004d 81            	ret	
 431                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 431                     ; 164 {
 432                     .text:	section	.text,new
 433  0000               _GPIO_Write:
 435  0000 89            	pushw	x
 436       00000000      OFST:	set	0
 439                     ; 165   GPIOx->ODR = GPIO_PortVal;
 441  0001 7b05          	ld	a,(OFST+5,sp)
 442  0003 1e01          	ldw	x,(OFST+1,sp)
 443  0005 f7            	ld	(x),a
 444                     ; 166 }
 447  0006 85            	popw	x
 448  0007 81            	ret	
 608                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 608                     ; 186 {
 609                     .text:	section	.text,new
 610  0000               _GPIO_WriteBit:
 612  0000 89            	pushw	x
 613       00000000      OFST:	set	0
 616                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 618                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 620                     ; 191   if (GPIO_BitVal != RESET)
 622  0001 7b06          	ld	a,(OFST+6,sp)
 623  0003 2714          	jreq	L303
 624                     ; 193     SetBit(GPIOx->ODR, GPIO_Pin);
 626  0005 7b05          	ld	a,(OFST+5,sp)
 627  0007 905f          	clrw	y
 628  0009 9097          	ld	yl,a
 629  000b a601          	ld	a,#1
 630  000d 905d          	tnzw	y
 631  000f 2705          	jreq	L41
 632  0011               L61:
 633  0011 48            	sll	a
 634  0012 905a          	decw	y
 635  0014 26fb          	jrne	L61
 636  0016               L41:
 637  0016 fa            	or	a,(x)
 639  0017 2015          	jra	L503
 640  0019               L303:
 641                     ; 198     ClrBit(GPIOx->ODR, GPIO_Pin);
 643  0019 1e01          	ldw	x,(OFST+1,sp)
 644  001b 7b05          	ld	a,(OFST+5,sp)
 645  001d 905f          	clrw	y
 646  001f 9097          	ld	yl,a
 647  0021 a601          	ld	a,#1
 648  0023 905d          	tnzw	y
 649  0025 2705          	jreq	L02
 650  0027               L22:
 651  0027 48            	sll	a
 652  0028 905a          	decw	y
 653  002a 26fb          	jrne	L22
 654  002c               L02:
 655  002c 43            	cpl	a
 656  002d f4            	and	a,(x)
 657  002e               L503:
 658  002e f7            	ld	(x),a
 659                     ; 200 }
 662  002f 85            	popw	x
 663  0030 81            	ret	
 709                     ; 218 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 709                     ; 219 {
 710                     .text:	section	.text,new
 711  0000               _GPIO_SetBits:
 713  0000 89            	pushw	x
 714       00000000      OFST:	set	0
 717                     ; 220   GPIOx->ODR |= GPIO_Pin;
 719  0001 f6            	ld	a,(x)
 720  0002 1a05          	or	a,(OFST+5,sp)
 721  0004 f7            	ld	(x),a
 722                     ; 221 }
 725  0005 85            	popw	x
 726  0006 81            	ret	
 772                     ; 239 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 772                     ; 240 {
 773                     .text:	section	.text,new
 774  0000               _GPIO_ResetBits:
 776  0000 89            	pushw	x
 777       00000000      OFST:	set	0
 780                     ; 241   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 782  0001 7b05          	ld	a,(OFST+5,sp)
 783  0003 43            	cpl	a
 784  0004 f4            	and	a,(x)
 785  0005 f7            	ld	(x),a
 786                     ; 242 }
 789  0006 85            	popw	x
 790  0007 81            	ret	
 836                     ; 251 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 836                     ; 252 {
 837                     .text:	section	.text,new
 838  0000               _GPIO_ToggleBits:
 840  0000 89            	pushw	x
 841       00000000      OFST:	set	0
 844                     ; 253   GPIOx->ODR ^= GPIO_Pin;
 846  0001 f6            	ld	a,(x)
 847  0002 1805          	xor	a,(OFST+5,sp)
 848  0004 f7            	ld	(x),a
 849                     ; 254 }
 852  0005 85            	popw	x
 853  0006 81            	ret	
 890                     ; 262 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 890                     ; 263 {
 891                     .text:	section	.text,new
 892  0000               _GPIO_ReadInputData:
 896                     ; 264   return ((uint8_t)GPIOx->IDR);
 898  0000 e601          	ld	a,(1,x)
 901  0002 81            	ret	
 939                     ; 273 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 939                     ; 274 {
 940                     .text:	section	.text,new
 941  0000               _GPIO_ReadOutputData:
 945                     ; 275   return ((uint8_t)GPIOx->ODR);
 947  0000 f6            	ld	a,(x)
 950  0001 81            	ret	
 999                     ; 294 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 999                     ; 295 {
1000                     .text:	section	.text,new
1001  0000               _GPIO_ReadInputDataBit:
1003  0000 89            	pushw	x
1004       00000000      OFST:	set	0
1007                     ; 296   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1009  0001 e601          	ld	a,(1,x)
1010  0003 1405          	and	a,(OFST+5,sp)
1013  0005 85            	popw	x
1014  0006 81            	ret	
1063                     ; 315 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1063                     ; 316 {
1064                     .text:	section	.text,new
1065  0000               _GPIO_ReadOutputDataBit:
1067  0000 89            	pushw	x
1068       00000000      OFST:	set	0
1071                     ; 317   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1073  0001 f6            	ld	a,(x)
1074  0002 1405          	and	a,(OFST+5,sp)
1077  0004 85            	popw	x
1078  0005 81            	ret	
1155                     ; 337 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1155                     ; 338 {
1156                     .text:	section	.text,new
1157  0000               _GPIO_ExternalPullUpConfig:
1159  0000 89            	pushw	x
1160       00000000      OFST:	set	0
1163                     ; 340   assert_param(IS_GPIO_PIN(GPIO_Pin));
1165                     ; 341   assert_param(IS_FUNCTIONAL_STATE(NewState));
1167                     ; 343   if (NewState != DISABLE) /* External Pull-Up Set*/
1169  0001 7b06          	ld	a,(OFST+6,sp)
1170  0003 2706          	jreq	L355
1171                     ; 345     GPIOx->CR1 |= GPIO_Pin;
1173  0005 e603          	ld	a,(3,x)
1174  0007 1a05          	or	a,(OFST+5,sp)
1176  0009 2007          	jra	L555
1177  000b               L355:
1178                     ; 348     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1180  000b 1e01          	ldw	x,(OFST+1,sp)
1181  000d 7b05          	ld	a,(OFST+5,sp)
1182  000f 43            	cpl	a
1183  0010 e403          	and	a,(3,x)
1184  0012               L555:
1185  0012 e703          	ld	(3,x),a
1186                     ; 350 }
1189  0014 85            	popw	x
1190  0015 81            	ret	
1203                     	xdef	_GPIO_ExternalPullUpConfig
1204                     	xdef	_GPIO_ReadOutputDataBit
1205                     	xdef	_GPIO_ReadInputDataBit
1206                     	xdef	_GPIO_ReadOutputData
1207                     	xdef	_GPIO_ReadInputData
1208                     	xdef	_GPIO_ToggleBits
1209                     	xdef	_GPIO_ResetBits
1210                     	xdef	_GPIO_SetBits
1211                     	xdef	_GPIO_WriteBit
1212                     	xdef	_GPIO_Write
1213                     	xdef	_GPIO_Init
1214                     	xdef	_GPIO_DeInit
1233                     	end
