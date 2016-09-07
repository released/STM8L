   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 57 uint8_t ITC_GetCPUCC(void)
  48                     ; 58 {
  50                     .text:	section	.text,new
  51  0000               _ITC_GetCPUCC:
  55                     ; 60   _asm("push cc");
  58  0000 8a            	push	cc
  60                     ; 61   _asm("pop a");
  63  0001 84            	pop	a
  65                     ; 62   return; /* Ignore compiler warning, the returned value is in A register */
  68  0002 81            	ret	
  91                     ; 76 void ITC_DeInit(void)
  91                     ; 77 {
  92                     .text:	section	.text,new
  93  0000               _ITC_DeInit:
  97                     ; 78   ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
  99  0000 35ff7f70      	mov	32624,#255
 100                     ; 79   ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
 102  0004 35ff7f71      	mov	32625,#255
 103                     ; 80   ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
 105  0008 35ff7f72      	mov	32626,#255
 106                     ; 81   ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 108  000c 35ff7f73      	mov	32627,#255
 109                     ; 82   ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 111  0010 35ff7f74      	mov	32628,#255
 112                     ; 83   ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 114  0014 35ff7f75      	mov	32629,#255
 115                     ; 84   ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 117  0018 35ff7f76      	mov	32630,#255
 118                     ; 85   ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 120  001c 35ff7f77      	mov	32631,#255
 121                     ; 86 }
 124  0020 81            	ret	
 149                     ; 93 uint8_t ITC_GetSoftIntStatus(void)
 149                     ; 94 {
 150                     .text:	section	.text,new
 151  0000               _ITC_GetSoftIntStatus:
 155                     ; 95   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 157  0000 cd0000        	call	_ITC_GetCPUCC
 159  0003 a428          	and	a,#40
 162  0005 81            	ret	
 417                     .const:	section	.text
 418  0000               L42:
 419  0000 0022          	dc.w	L14
 420  0002 004c          	dc.w	L702
 421  0004 004c          	dc.w	L702
 422  0006 0027          	dc.w	L34
 423  0008 004c          	dc.w	L702
 424  000a 0027          	dc.w	L34
 425  000c 0027          	dc.w	L34
 426  000e 002c          	dc.w	L54
 427  0010 002c          	dc.w	L54
 428  0012 002c          	dc.w	L54
 429  0014 002c          	dc.w	L54
 430  0016 0031          	dc.w	L74
 431  0018 0031          	dc.w	L74
 432  001a 0031          	dc.w	L74
 433  001c 0031          	dc.w	L74
 434  001e 004c          	dc.w	L702
 435  0020 004c          	dc.w	L702
 436  0022 0036          	dc.w	L15
 437  0024 0036          	dc.w	L15
 438  0026 003b          	dc.w	L35
 439  0028 003b          	dc.w	L35
 440  002a 003b          	dc.w	L35
 441  002c 004c          	dc.w	L702
 442  002e 004c          	dc.w	L702
 443  0030 0040          	dc.w	L55
 444  0032 0040          	dc.w	L55
 445  0034 0040          	dc.w	L55
 446  0036 0045          	dc.w	L75
 447  0038 0045          	dc.w	L75
 448                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 448                     ; 127 {
 449                     .text:	section	.text,new
 450  0000               _ITC_GetSoftwarePriority:
 452  0000 88            	push	a
 453  0001 89            	pushw	x
 454       00000002      OFST:	set	2
 457                     ; 128   uint8_t Value = 0;
 459  0002 0f02          	clr	(OFST+0,sp)
 460                     ; 129   uint8_t Mask = 0;
 462                     ; 132   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 464                     ; 135   Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 466  0004 a403          	and	a,#3
 467  0006 48            	sll	a
 468  0007 5f            	clrw	x
 469  0008 97            	ld	xl,a
 470  0009 a603          	ld	a,#3
 471  000b 5d            	tnzw	x
 472  000c 2704          	jreq	L61
 473  000e               L02:
 474  000e 48            	sll	a
 475  000f 5a            	decw	x
 476  0010 26fc          	jrne	L02
 477  0012               L61:
 478  0012 6b01          	ld	(OFST-1,sp),a
 479                     ; 137   switch (IRQn)
 481  0014 7b03          	ld	a,(OFST+1,sp)
 483                     ; 185     default:
 483                     ; 186       break;
 484  0016 4a            	dec	a
 485  0017 a11d          	cp	a,#29
 486  0019 2431          	jruge	L702
 487  001b 5f            	clrw	x
 488  001c 97            	ld	xl,a
 489  001d 58            	sllw	x
 490  001e de0000        	ldw	x,(L42,x)
 491  0021 fc            	jp	(x)
 492  0022               L14:
 493                     ; 139     case FLASH_IRQn:
 493                     ; 140       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 495  0022 c67f70        	ld	a,32624
 496                     ; 141       break;
 498  0025 2021          	jp	LC001
 499  0027               L34:
 500                     ; 143     case AWU_IRQn:
 500                     ; 144     case EXTIB_IRQn:
 500                     ; 145     case EXTID_IRQn:
 500                     ; 146       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 502  0027 c67f71        	ld	a,32625
 503                     ; 147       break;
 505  002a 201c          	jp	LC001
 506  002c               L54:
 507                     ; 149     case EXTI0_IRQn:
 507                     ; 150     case EXTI1_IRQn:
 507                     ; 151     case EXTI2_IRQn:
 507                     ; 152     case EXTI3_IRQn:
 507                     ; 153       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 509  002c c67f72        	ld	a,32626
 510                     ; 154       break;
 512  002f 2017          	jp	LC001
 513  0031               L74:
 514                     ; 156     case EXTI4_IRQn:
 514                     ; 157     case EXTI5_IRQn:
 514                     ; 158     case EXTI6_IRQn:
 514                     ; 159     case EXTI7_IRQn:
 514                     ; 160       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 516  0031 c67f73        	ld	a,32627
 517                     ; 161       break;
 519  0034 2012          	jp	LC001
 520  0036               L15:
 521                     ; 163     case COMP_IRQn:
 521                     ; 164     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 521                     ; 165       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 523  0036 c67f74        	ld	a,32628
 524                     ; 166       break;
 526  0039 200d          	jp	LC001
 527  003b               L35:
 528                     ; 168     case TIM2_CAP_IRQn:
 528                     ; 169     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 528                     ; 170     case TIM3_CAP_IRQn:
 528                     ; 171       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 530  003b c67f75        	ld	a,32629
 531                     ; 172       break;
 533  003e 2008          	jp	LC001
 534  0040               L55:
 535                     ; 174     case TIM4_UPD_OVF_IRQn:
 535                     ; 175     case SPI_IRQn:
 535                     ; 176     case USART_TX_IRQn:
 535                     ; 177       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 537  0040 c67f76        	ld	a,32630
 538                     ; 178       break;
 540  0043 2003          	jp	LC001
 541  0045               L75:
 542                     ; 180     case USART_RX_IRQn:
 542                     ; 181     case I2C_IRQn:
 542                     ; 182       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 544  0045 c67f77        	ld	a,32631
 545  0048               LC001:
 546  0048 1401          	and	a,(OFST-1,sp)
 547  004a 6b02          	ld	(OFST+0,sp),a
 548                     ; 183       break;
 550                     ; 185     default:
 550                     ; 186       break;
 552  004c               L702:
 553                     ; 189   Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 555  004c 7b03          	ld	a,(OFST+1,sp)
 556  004e a403          	and	a,#3
 557  0050 48            	sll	a
 558  0051 5f            	clrw	x
 559  0052 97            	ld	xl,a
 560  0053 7b02          	ld	a,(OFST+0,sp)
 561  0055 5d            	tnzw	x
 562  0056 2704          	jreq	L62
 563  0058               L03:
 564  0058 44            	srl	a
 565  0059 5a            	decw	x
 566  005a 26fc          	jrne	L03
 567  005c               L62:
 568                     ; 191   return((ITC_PriorityLevel_TypeDef)Value);
 572  005c 5b03          	addw	sp,#3
 573  005e 81            	ret	
 637                     	switch	.const
 638  003a               L64:
 639  003a 0037          	dc.w	L112
 640  003c 00c5          	dc.w	L762
 641  003e 00c5          	dc.w	L762
 642  0040 0049          	dc.w	L312
 643  0042 00c5          	dc.w	L762
 644  0044 0049          	dc.w	L312
 645  0046 0049          	dc.w	L312
 646  0048 005b          	dc.w	L512
 647  004a 005b          	dc.w	L512
 648  004c 005b          	dc.w	L512
 649  004e 005b          	dc.w	L512
 650  0050 006d          	dc.w	L712
 651  0052 006d          	dc.w	L712
 652  0054 006d          	dc.w	L712
 653  0056 006d          	dc.w	L712
 654  0058 00c5          	dc.w	L762
 655  005a 00c5          	dc.w	L762
 656  005c 007f          	dc.w	L122
 657  005e 007f          	dc.w	L122
 658  0060 0091          	dc.w	L322
 659  0062 0091          	dc.w	L322
 660  0064 0091          	dc.w	L322
 661  0066 00c5          	dc.w	L762
 662  0068 00c5          	dc.w	L762
 663  006a 00a3          	dc.w	L522
 664  006c 00a3          	dc.w	L522
 665  006e 00a3          	dc.w	L522
 666  0070 00b5          	dc.w	L722
 667  0072 00b5          	dc.w	L722
 668                     ; 234 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 668                     ; 235 {
 669                     .text:	section	.text,new
 670  0000               _ITC_SetSoftwarePriority:
 672  0000 89            	pushw	x
 673  0001 89            	pushw	x
 674       00000002      OFST:	set	2
 677                     ; 236   uint8_t Mask = 0;
 679                     ; 237   uint8_t NewPriority = 0;
 681                     ; 240   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 683                     ; 241   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 685                     ; 244   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 687                     ; 248   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 689  0002 9e            	ld	a,xh
 690  0003 a403          	and	a,#3
 691  0005 48            	sll	a
 692  0006 5f            	clrw	x
 693  0007 97            	ld	xl,a
 694  0008 a603          	ld	a,#3
 695  000a 5d            	tnzw	x
 696  000b 2704          	jreq	L43
 697  000d               L63:
 698  000d 48            	sll	a
 699  000e 5a            	decw	x
 700  000f 26fc          	jrne	L63
 701  0011               L43:
 702  0011 43            	cpl	a
 703  0012 6b01          	ld	(OFST-1,sp),a
 704                     ; 251   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 706  0014 7b03          	ld	a,(OFST+1,sp)
 707  0016 a403          	and	a,#3
 708  0018 48            	sll	a
 709  0019 5f            	clrw	x
 710  001a 97            	ld	xl,a
 711  001b 7b04          	ld	a,(OFST+2,sp)
 712  001d 5d            	tnzw	x
 713  001e 2704          	jreq	L04
 714  0020               L24:
 715  0020 48            	sll	a
 716  0021 5a            	decw	x
 717  0022 26fc          	jrne	L24
 718  0024               L04:
 719  0024 6b02          	ld	(OFST+0,sp),a
 720                     ; 253   switch (IRQn)
 722  0026 7b03          	ld	a,(OFST+1,sp)
 724                     ; 309     default:
 724                     ; 310       break;
 725  0028 4a            	dec	a
 726  0029 a11d          	cp	a,#29
 727  002b 2503cc00c5    	jruge	L762
 728  0030 5f            	clrw	x
 729  0031 97            	ld	xl,a
 730  0032 58            	sllw	x
 731  0033 de003a        	ldw	x,(L64,x)
 732  0036 fc            	jp	(x)
 733  0037               L112:
 734                     ; 255     case FLASH_IRQn:
 734                     ; 256       ITC->ISPR1 &= Mask;
 736  0037 c67f70        	ld	a,32624
 737  003a 1401          	and	a,(OFST-1,sp)
 738  003c c77f70        	ld	32624,a
 739                     ; 257       ITC->ISPR1 |= NewPriority;
 741  003f c67f70        	ld	a,32624
 742  0042 1a02          	or	a,(OFST+0,sp)
 743  0044 c77f70        	ld	32624,a
 744                     ; 258       break;
 746  0047 207c          	jra	L762
 747  0049               L312:
 748                     ; 260     case AWU_IRQn:
 748                     ; 261     case EXTIB_IRQn:
 748                     ; 262     case EXTID_IRQn:
 748                     ; 263       ITC->ISPR2 &= Mask;
 750  0049 c67f71        	ld	a,32625
 751  004c 1401          	and	a,(OFST-1,sp)
 752  004e c77f71        	ld	32625,a
 753                     ; 264       ITC->ISPR2 |= NewPriority;
 755  0051 c67f71        	ld	a,32625
 756  0054 1a02          	or	a,(OFST+0,sp)
 757  0056 c77f71        	ld	32625,a
 758                     ; 265       break;
 760  0059 206a          	jra	L762
 761  005b               L512:
 762                     ; 267     case EXTI0_IRQn:
 762                     ; 268     case EXTI1_IRQn:
 762                     ; 269     case EXTI2_IRQn:
 762                     ; 270     case EXTI3_IRQn:
 762                     ; 271       ITC->ISPR3 &= Mask;
 764  005b c67f72        	ld	a,32626
 765  005e 1401          	and	a,(OFST-1,sp)
 766  0060 c77f72        	ld	32626,a
 767                     ; 272       ITC->ISPR3 |= NewPriority;
 769  0063 c67f72        	ld	a,32626
 770  0066 1a02          	or	a,(OFST+0,sp)
 771  0068 c77f72        	ld	32626,a
 772                     ; 273       break;
 774  006b 2058          	jra	L762
 775  006d               L712:
 776                     ; 275     case EXTI4_IRQn:
 776                     ; 276     case EXTI5_IRQn:
 776                     ; 277     case EXTI6_IRQn:
 776                     ; 278     case EXTI7_IRQn:
 776                     ; 279       ITC->ISPR4 &= Mask;
 778  006d c67f73        	ld	a,32627
 779  0070 1401          	and	a,(OFST-1,sp)
 780  0072 c77f73        	ld	32627,a
 781                     ; 280       ITC->ISPR4 |= NewPriority;
 783  0075 c67f73        	ld	a,32627
 784  0078 1a02          	or	a,(OFST+0,sp)
 785  007a c77f73        	ld	32627,a
 786                     ; 281       break;
 788  007d 2046          	jra	L762
 789  007f               L122:
 790                     ; 283     case COMP_IRQn:
 790                     ; 284     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 790                     ; 285       ITC->ISPR5 &= Mask;
 792  007f c67f74        	ld	a,32628
 793  0082 1401          	and	a,(OFST-1,sp)
 794  0084 c77f74        	ld	32628,a
 795                     ; 286       ITC->ISPR5 |= NewPriority;
 797  0087 c67f74        	ld	a,32628
 798  008a 1a02          	or	a,(OFST+0,sp)
 799  008c c77f74        	ld	32628,a
 800                     ; 287       break;
 802  008f 2034          	jra	L762
 803  0091               L322:
 804                     ; 289     case TIM2_CAP_IRQn:
 804                     ; 290     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 804                     ; 291     case TIM3_CAP_IRQn:
 804                     ; 292       ITC->ISPR6 &= Mask;
 806  0091 c67f75        	ld	a,32629
 807  0094 1401          	and	a,(OFST-1,sp)
 808  0096 c77f75        	ld	32629,a
 809                     ; 293       ITC->ISPR6 |= NewPriority;
 811  0099 c67f75        	ld	a,32629
 812  009c 1a02          	or	a,(OFST+0,sp)
 813  009e c77f75        	ld	32629,a
 814                     ; 294       break;
 816  00a1 2022          	jra	L762
 817  00a3               L522:
 818                     ; 296     case TIM4_UPD_OVF_IRQn:
 818                     ; 297     case SPI_IRQn:
 818                     ; 298     case USART_TX_IRQn:
 818                     ; 299       ITC->ISPR7 &= Mask;
 820  00a3 c67f76        	ld	a,32630
 821  00a6 1401          	and	a,(OFST-1,sp)
 822  00a8 c77f76        	ld	32630,a
 823                     ; 300       ITC->ISPR7 |= NewPriority;
 825  00ab c67f76        	ld	a,32630
 826  00ae 1a02          	or	a,(OFST+0,sp)
 827  00b0 c77f76        	ld	32630,a
 828                     ; 301       break;
 830  00b3 2010          	jra	L762
 831  00b5               L722:
 832                     ; 303     case USART_RX_IRQn:
 832                     ; 304     case I2C_IRQn:
 832                     ; 305       ITC->ISPR8 &= Mask;
 834  00b5 c67f77        	ld	a,32631
 835  00b8 1401          	and	a,(OFST-1,sp)
 836  00ba c77f77        	ld	32631,a
 837                     ; 306       ITC->ISPR8 |= NewPriority;
 839  00bd c67f77        	ld	a,32631
 840  00c0 1a02          	or	a,(OFST+0,sp)
 841  00c2 c77f77        	ld	32631,a
 842                     ; 307       break;
 844                     ; 309     default:
 844                     ; 310       break;
 846  00c5               L762:
 847                     ; 312 }
 850  00c5 5b04          	addw	sp,#4
 851  00c7 81            	ret	
 864                     	xdef	_ITC_SetSoftwarePriority
 865                     	xdef	_ITC_GetSoftwarePriority
 866                     	xdef	_ITC_GetSoftIntStatus
 867                     	xdef	_ITC_DeInit
 868                     	xdef	_ITC_GetCPUCC
 887                     	end
