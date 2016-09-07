   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 122 void I2C_DeInit(void)
  48                     ; 123 {
  50                     .text:	section	.text,new
  51  0000               _I2C_DeInit:
  55                     ; 124   I2C->CR1 = I2C_CR1_RESET_VALUE;
  57  0000 725f5210      	clr	21008
  58                     ; 125   I2C->CR2 = I2C_CR2_RESET_VALUE;
  60  0004 725f5211      	clr	21009
  61                     ; 126   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  63  0008 725f5212      	clr	21010
  64                     ; 127   I2C->OARL = I2C_OARL_RESET_VALUE;
  66  000c 725f5213      	clr	21011
  67                     ; 128   I2C->OARH = I2C_OARH_RESET_VALUE;
  69  0010 725f5214      	clr	21012
  70                     ; 129   I2C->ITR = I2C_ITR_RESET_VALUE;
  72  0014 725f521a      	clr	21018
  73                     ; 130   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  75  0018 725f521b      	clr	21019
  76                     ; 131   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  78  001c 725f521c      	clr	21020
  79                     ; 132   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  81  0020 3502521d      	mov	21021,#2
  82                     ; 133 }
  85  0024 81            	ret	
 259                     .const:	section	.text
 260  0000               L21:
 261  0000 000f4240      	dc.l	1000000
 262  0004               L41:
 263  0004 000186a1      	dc.l	100001
 264  0008               L61:
 265  0008 00000004      	dc.l	4
 266                     ; 157 void I2C_Init(uint32_t OutputClockFrequency, uint16_t OwnAddress,
 266                     ; 158               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef I2C_Ack,
 266                     ; 159               I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 266                     ; 160 {
 267                     .text:	section	.text,new
 268  0000               _I2C_Init:
 270  0000 520c          	subw	sp,#12
 271       0000000c      OFST:	set	12
 274                     ; 161   uint32_t result = 0x0004;
 276                     ; 162   uint16_t tmpval = 0;
 278                     ; 163   uint8_t tmpccrh = 0;
 280  0002 0f07          	clr	(OFST-5,sp)
 281                     ; 164   uint8_t input_clock = 0;
 283                     ; 167   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 285                     ; 168   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 287                     ; 169   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 289                     ; 170   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 291                     ; 171   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 293                     ; 174   input_clock = (uint8_t)(CLK_GetClockFreq() / 1000000);
 295  0004 cd0000        	call	_CLK_GetClockFreq
 297  0007 ae0000        	ldw	x,#L21
 298  000a cd0000        	call	c_ludv
 300  000d b603          	ld	a,c_lreg+3
 301  000f 6b08          	ld	(OFST-4,sp),a
 302                     ; 178   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 304  0011 c65212        	ld	a,21010
 305  0014 a4c0          	and	a,#192
 306  0016 c75212        	ld	21010,a
 307                     ; 180   I2C->FREQR |= input_clock;
 309  0019 c65212        	ld	a,21010
 310  001c 1a08          	or	a,(OFST-4,sp)
 311  001e c75212        	ld	21010,a
 312                     ; 184   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 314  0021 72115210      	bres	21008,#0
 315                     ; 187   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 317  0025 c6521c        	ld	a,21020
 318  0028 a430          	and	a,#48
 319  002a c7521c        	ld	21020,a
 320                     ; 188   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 322  002d 725f521b      	clr	21019
 323                     ; 191   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 325  0031 96            	ldw	x,sp
 326  0032 1c000f        	addw	x,#OFST+3
 327  0035 cd0000        	call	c_ltor
 329  0038 ae0004        	ldw	x,#L41
 330  003b cd0000        	call	c_lcmp
 332  003e 2576          	jrult	L721
 333                     ; 194     tmpccrh = I2C_CCRH_FS;
 335  0040 a680          	ld	a,#128
 336  0042 6b07          	ld	(OFST-5,sp),a
 337                     ; 196     if (I2C_DutyCycle == I2C_DutyCycle_2)
 339  0044 96            	ldw	x,sp
 340  0045 0d15          	tnz	(OFST+9,sp)
 341  0047 2623          	jrne	L131
 342                     ; 199       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 344  0049 1c000f        	addw	x,#OFST+3
 345  004c cd0000        	call	c_ltor
 347  004f a603          	ld	a,#3
 348  0051 cd0000        	call	c_smul
 350  0054 96            	ldw	x,sp
 351  0055 5c            	incw	x
 352  0056 cd0000        	call	c_rtol
 354  0059 7b08          	ld	a,(OFST-4,sp)
 355  005b cd0138        	call	LC001
 357  005e 96            	ldw	x,sp
 358  005f 5c            	incw	x
 359  0060 cd0000        	call	c_ludv
 361  0063 96            	ldw	x,sp
 362  0064 1c0009        	addw	x,#OFST-3
 363  0067 cd0000        	call	c_rtol
 366  006a 2027          	jra	L331
 367  006c               L131:
 368                     ; 204       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 370  006c 1c000f        	addw	x,#OFST+3
 371  006f cd0000        	call	c_ltor
 373  0072 a619          	ld	a,#25
 374  0074 cd0000        	call	c_smul
 376  0077 96            	ldw	x,sp
 377  0078 5c            	incw	x
 378  0079 cd0000        	call	c_rtol
 380  007c 7b08          	ld	a,(OFST-4,sp)
 381  007e cd0138        	call	LC001
 383  0081 96            	ldw	x,sp
 384  0082 5c            	incw	x
 385  0083 cd0000        	call	c_ludv
 387  0086 96            	ldw	x,sp
 388  0087 1c0009        	addw	x,#OFST-3
 389  008a cd0000        	call	c_rtol
 391                     ; 206       tmpccrh |= I2C_CCRH_DUTY;
 393  008d 7b07          	ld	a,(OFST-5,sp)
 394  008f aa40          	or	a,#64
 395  0091 6b07          	ld	(OFST-5,sp),a
 396  0093               L331:
 397                     ; 210     if (result < (uint16_t)0x0001)
 399  0093 96            	ldw	x,sp
 400  0094 1c0009        	addw	x,#OFST-3
 401  0097 cd0000        	call	c_lzmp
 403  009a 2608          	jrne	L531
 404                     ; 213       result = (uint16_t)0x0001;
 406  009c ae0001        	ldw	x,#1
 407  009f 1f0b          	ldw	(OFST-1,sp),x
 408  00a1 5f            	clrw	x
 409  00a2 1f09          	ldw	(OFST-3,sp),x
 410  00a4               L531:
 411                     ; 219     tmpval = ((input_clock * 3) / 10) + 1;
 413  00a4 7b08          	ld	a,(OFST-4,sp)
 414  00a6 97            	ld	xl,a
 415  00a7 a603          	ld	a,#3
 416  00a9 42            	mul	x,a
 417  00aa a60a          	ld	a,#10
 418  00ac cd0000        	call	c_sdivx
 420  00af 5c            	incw	x
 421  00b0 1f05          	ldw	(OFST-7,sp),x
 422                     ; 220     I2C->TRISER = (uint8_t)tmpval;
 424  00b2 7b06          	ld	a,(OFST-6,sp)
 426  00b4 2046          	jra	L731
 427  00b6               L721:
 428                     ; 226     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 430  00b6 96            	ldw	x,sp
 431  00b7 1c000f        	addw	x,#OFST+3
 432  00ba cd0000        	call	c_ltor
 434  00bd 3803          	sll	c_lreg+3
 435  00bf 3902          	rlc	c_lreg+2
 436  00c1 3901          	rlc	c_lreg+1
 437  00c3 96            	ldw	x,sp
 438  00c4 3900          	rlc	c_lreg
 439  00c6 5c            	incw	x
 440  00c7 cd0000        	call	c_rtol
 442  00ca 7b08          	ld	a,(OFST-4,sp)
 443  00cc ad6a          	call	LC001
 445  00ce 96            	ldw	x,sp
 446  00cf 5c            	incw	x
 447  00d0 cd0000        	call	c_ludv
 449  00d3 b602          	ld	a,c_lreg+2
 450  00d5 97            	ld	xl,a
 451  00d6 b603          	ld	a,c_lreg+3
 452  00d8 cd0000        	call	c_uitol
 454  00db 96            	ldw	x,sp
 455  00dc 1c0009        	addw	x,#OFST-3
 456  00df cd0000        	call	c_rtol
 458                     ; 229     if (result < (uint16_t)0x0004)
 460  00e2 96            	ldw	x,sp
 461  00e3 1c0009        	addw	x,#OFST-3
 462  00e6 cd0000        	call	c_ltor
 464  00e9 ae0008        	ldw	x,#L61
 465  00ec cd0000        	call	c_lcmp
 467  00ef 2408          	jruge	L141
 468                     ; 232       result = (uint16_t)0x0004;
 470  00f1 ae0004        	ldw	x,#4
 471  00f4 1f0b          	ldw	(OFST-1,sp),x
 472  00f6 5f            	clrw	x
 473  00f7 1f09          	ldw	(OFST-3,sp),x
 474  00f9               L141:
 475                     ; 238      I2C->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 477  00f9 7b08          	ld	a,(OFST-4,sp)
 478  00fb 4c            	inc	a
 479  00fc               L731:
 480  00fc c7521d        	ld	21021,a
 481                     ; 242   I2C->CCRL = (uint8_t)result;
 483  00ff 7b0c          	ld	a,(OFST+0,sp)
 484  0101 c7521b        	ld	21019,a
 485                     ; 243   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 487  0104 7b07          	ld	a,(OFST-5,sp)
 488  0106 c7521c        	ld	21020,a
 489                     ; 246     I2C->CR1 |= I2C_CR1_PE;
 491  0109 72105210      	bset	21008,#0
 492                     ; 249   I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 494  010d 72155211      	bres	21009,#2
 495                     ; 252   I2C->CR2 |= (uint8_t)I2C_Ack;
 497  0111 c65211        	ld	a,21009
 498  0114 1a16          	or	a,(OFST+10,sp)
 499  0116 c75211        	ld	21009,a
 500                     ; 255     I2C->OARL = (uint8_t)(OwnAddress);
 502  0119 7b14          	ld	a,(OFST+8,sp)
 503  011b c75213        	ld	21011,a
 504                     ; 256     I2C->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF) |
 504                     ; 257                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 506  011e 7b13          	ld	a,(OFST+7,sp)
 507  0120 a403          	and	a,#3
 508  0122 97            	ld	xl,a
 509  0123 4f            	clr	a
 510  0124 02            	rlwa	x,a
 511  0125 4f            	clr	a
 512  0126 01            	rrwa	x,a
 513  0127 48            	sll	a
 514  0128 59            	rlcw	x
 515  0129 9f            	ld	a,xl
 516  012a 6b04          	ld	(OFST-8,sp),a
 517  012c 7b17          	ld	a,(OFST+11,sp)
 518  012e aa40          	or	a,#64
 519  0130 1a04          	or	a,(OFST-8,sp)
 520  0132 c75214        	ld	21012,a
 521                     ; 258 }
 524  0135 5b0c          	addw	sp,#12
 525  0137 81            	ret	
 526  0138               LC001:
 527  0138 b703          	ld	c_lreg+3,a
 528  013a 3f02          	clr	c_lreg+2
 529  013c 3f01          	clr	c_lreg+1
 530  013e 3f00          	clr	c_lreg
 531  0140 ae0000        	ldw	x,#L21
 532  0143 cc0000        	jp	c_lmul
 587                     ; 266 void I2C_Cmd(FunctionalState NewState)
 587                     ; 267 {
 588                     .text:	section	.text,new
 589  0000               _I2C_Cmd:
 593                     ; 269   assert_param(IS_FUNCTIONAL_STATE(NewState));
 595                     ; 271   if (NewState != DISABLE)
 597  0000 4d            	tnz	a
 598  0001 2705          	jreq	L171
 599                     ; 274     I2C->CR1 |= I2C_CR1_PE;
 601  0003 72105210      	bset	21008,#0
 604  0007 81            	ret	
 605  0008               L171:
 606                     ; 279     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 608  0008 72115210      	bres	21008,#0
 609                     ; 281 }
 612  000c 81            	ret	
 647                     ; 289 void I2C_GeneralCallCmd(FunctionalState NewState)
 647                     ; 290 {
 648                     .text:	section	.text,new
 649  0000               _I2C_GeneralCallCmd:
 653                     ; 292   assert_param(IS_FUNCTIONAL_STATE(NewState));
 655                     ; 294   if (NewState != DISABLE)
 657  0000 4d            	tnz	a
 658  0001 2705          	jreq	L312
 659                     ; 297     I2C->CR1 |= I2C_CR1_ENGC;
 661  0003 721c5210      	bset	21008,#6
 664  0007 81            	ret	
 665  0008               L312:
 666                     ; 302     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 668  0008 721d5210      	bres	21008,#6
 669                     ; 304 }
 672  000c 81            	ret	
 707                     ; 314 void I2C_GenerateSTART(FunctionalState NewState)
 707                     ; 315 {
 708                     .text:	section	.text,new
 709  0000               _I2C_GenerateSTART:
 713                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 715                     ; 319   if (NewState != DISABLE)
 717  0000 4d            	tnz	a
 718  0001 2705          	jreq	L532
 719                     ; 322     I2C->CR2 |= I2C_CR2_START;
 721  0003 72105211      	bset	21009,#0
 724  0007 81            	ret	
 725  0008               L532:
 726                     ; 327     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 728  0008 72115211      	bres	21009,#0
 729                     ; 329 }
 732  000c 81            	ret	
 767                     ; 337 void I2C_GenerateSTOP(FunctionalState NewState)
 767                     ; 338 {
 768                     .text:	section	.text,new
 769  0000               _I2C_GenerateSTOP:
 773                     ; 340   assert_param(IS_FUNCTIONAL_STATE(NewState));
 775                     ; 342   if (NewState != DISABLE)
 777  0000 4d            	tnz	a
 778  0001 2705          	jreq	L752
 779                     ; 345     I2C->CR2 |= I2C_CR2_STOP;
 781  0003 72125211      	bset	21009,#1
 784  0007 81            	ret	
 785  0008               L752:
 786                     ; 350     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 788  0008 72135211      	bres	21009,#1
 789                     ; 352 }
 792  000c 81            	ret	
 828                     ; 362 void I2C_SoftwareResetCmd(FunctionalState NewState)
 828                     ; 363 {
 829                     .text:	section	.text,new
 830  0000               _I2C_SoftwareResetCmd:
 834                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 836                     ; 367   if (NewState != DISABLE)
 838  0000 4d            	tnz	a
 839  0001 2705          	jreq	L103
 840                     ; 370     I2C->CR2 |= I2C_CR2_SWRST;
 842  0003 721e5211      	bset	21009,#7
 845  0007 81            	ret	
 846  0008               L103:
 847                     ; 375     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 849  0008 721f5211      	bres	21009,#7
 850                     ; 377 }
 853  000c 81            	ret	
 889                     ; 385 void I2C_StretchClockCmd(FunctionalState NewState)
 889                     ; 386 {
 890                     .text:	section	.text,new
 891  0000               _I2C_StretchClockCmd:
 895                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 897                     ; 390   if (NewState != DISABLE)
 899  0000 4d            	tnz	a
 900  0001 2705          	jreq	L323
 901                     ; 393     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 903  0003 721f5210      	bres	21008,#7
 906  0007 81            	ret	
 907  0008               L323:
 908                     ; 398     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 910  0008 721e5210      	bset	21008,#7
 911                     ; 400 }
 914  000c 81            	ret	
 950                     ; 408 void I2C_AcknowledgeConfig(FunctionalState NewState)
 950                     ; 409 {
 951                     .text:	section	.text,new
 952  0000               _I2C_AcknowledgeConfig:
 956                     ; 411   assert_param(IS_FUNCTIONAL_STATE(NewState));
 958                     ; 413   if (NewState != DISABLE)
 960  0000 4d            	tnz	a
 961  0001 2705          	jreq	L543
 962                     ; 416     I2C->CR2 |= I2C_CR2_ACK;
 964  0003 72145211      	bset	21009,#2
 967  0007 81            	ret	
 968  0008               L543:
 969                     ; 421     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 971  0008 72155211      	bres	21009,#2
 972                     ; 423 }
 975  000c 81            	ret	
1033                     ; 434 void I2C_AckPositionConfig(I2C_AckPosition_TypeDef I2C_AckPosition)
1033                     ; 435 {
1034                     .text:	section	.text,new
1035  0000               _I2C_AckPositionConfig:
1039                     ; 437   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1041                     ; 440   I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1043  0000 72175211      	bres	21009,#3
1044                     ; 443   I2C->CR2 |= (uint8_t)I2C_AckPosition;
1046  0004 ca5211        	or	a,21009
1047  0007 c75211        	ld	21009,a
1048                     ; 444 }
1051  000a 81            	ret	
1087                     ; 454 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1087                     ; 455 {
1088                     .text:	section	.text,new
1089  0000               _I2C_FastModeDutyCycleConfig:
1093                     ; 457   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1095                     ; 459   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1097  0000 a140          	cp	a,#64
1098  0002 2605          	jrne	L514
1099                     ; 462     I2C->CCRH |= I2C_CCRH_DUTY;
1101  0004 721c521c      	bset	21020,#6
1104  0008 81            	ret	
1105  0009               L514:
1106                     ; 467     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1108  0009 721d521c      	bres	21020,#6
1109                     ; 469 }
1112  000d 81            	ret	
1179                     ; 481 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1179                     ; 482 {
1180                     .text:	section	.text,new
1181  0000               _I2C_Send7bitAddress:
1183  0000 89            	pushw	x
1184       00000000      OFST:	set	0
1187                     ; 484   assert_param(IS_I2C_ADDRESS(Address));
1189                     ; 485   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1191                     ; 488   if (I2C_Direction != I2C_Direction_Transmitter)
1193  0001 9f            	ld	a,xl
1194  0002 4d            	tnz	a
1195  0003 2706          	jreq	L354
1196                     ; 491     Address |= OAR1_ADD0_Set;
1198  0005 7b01          	ld	a,(OFST+1,sp)
1199  0007 aa01          	or	a,#1
1201  0009 2004          	jra	L554
1202  000b               L354:
1203                     ; 496     Address &= OAR1_ADD0_Reset;
1205  000b 7b01          	ld	a,(OFST+1,sp)
1206  000d a4fe          	and	a,#254
1207  000f               L554:
1208                     ; 499   I2C->DR = Address;
1210  000f c75216        	ld	21014,a
1211                     ; 500 }
1214  0012 85            	popw	x
1215  0013 81            	ret	
1249                     ; 523 void I2C_SendData(uint8_t Data)
1249                     ; 524 {
1250                     .text:	section	.text,new
1251  0000               _I2C_SendData:
1255                     ; 526   I2C->DR = Data;
1257  0000 c75216        	ld	21014,a
1258                     ; 527 }
1261  0003 81            	ret	
1284                     ; 534 uint8_t I2C_ReceiveData(void)
1284                     ; 535 {
1285                     .text:	section	.text,new
1286  0000               _I2C_ReceiveData:
1290                     ; 537   return ((uint8_t)I2C->DR);
1292  0000 c65216        	ld	a,21014
1295  0003 81            	ret	
1451                     ; 648 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1451                     ; 649 {
1452                     .text:	section	.text,new
1453  0000               _I2C_ITConfig:
1455  0000 89            	pushw	x
1456       00000000      OFST:	set	0
1459                     ; 651   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1461                     ; 652   assert_param(IS_FUNCTIONAL_STATE(NewState));
1463                     ; 654   if (NewState != DISABLE)
1465  0001 7b05          	ld	a,(OFST+5,sp)
1466  0003 2706          	jreq	L175
1467                     ; 657     I2C->ITR |= (uint8_t)I2C_IT;
1469  0005 9f            	ld	a,xl
1470  0006 ca521a        	or	a,21018
1472  0009 2006          	jra	L375
1473  000b               L175:
1474                     ; 662     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1476  000b 7b02          	ld	a,(OFST+2,sp)
1477  000d 43            	cpl	a
1478  000e c4521a        	and	a,21018
1479  0011               L375:
1480  0011 c7521a        	ld	21018,a
1481                     ; 664 }
1484  0014 85            	popw	x
1485  0015 81            	ret	
1709                     ; 700 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1709                     ; 701 {
1710                     .text:	section	.text,new
1711  0000               _I2C_CheckEvent:
1713  0000 89            	pushw	x
1714  0001 5206          	subw	sp,#6
1715       00000006      OFST:	set	6
1718                     ; 702   uint16_t lastevent = 0;
1720                     ; 703   uint8_t flag1= 0;
1722                     ; 704   uint8_t flag2= 0;
1724                     ; 705   ErrorStatus status = ERROR;
1726                     ; 708   assert_param(IS_I2C_EVENT(I2C_Event));
1728                     ; 710   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1730  0003 a30004        	cpw	x,#4
1731  0006 260e          	jrne	L507
1732                     ; 713       lastevent = (uint16_t)(I2C->SR2& I2C_SR2_AF);
1734  0008 c65218        	ld	a,21016
1735  000b a404          	and	a,#4
1736  000d 5f            	clrw	x
1737  000e 02            	rlwa	x,a
1738  000f 1f04          	ldw	(OFST-2,sp),x
1739  0011 01            	rrwa	x,a
1741  0012 1e04          	ldw	x,(OFST-2,sp)
1742  0014 201c          	jra	L707
1743  0016               L507:
1744                     ; 718     flag1 = I2C->SR1;
1746  0016 c65217        	ld	a,21015
1747  0019 6b03          	ld	(OFST-3,sp),a
1748                     ; 719     flag2 = I2C->SR3;
1750  001b c65219        	ld	a,21017
1751  001e 6b06          	ld	(OFST+0,sp),a
1752                     ; 720     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1754  0020 5f            	clrw	x
1755  0021 7b03          	ld	a,(OFST-3,sp)
1756  0023 97            	ld	xl,a
1757  0024 1f01          	ldw	(OFST-5,sp),x
1758  0026 5f            	clrw	x
1759  0027 7b06          	ld	a,(OFST+0,sp)
1760  0029 97            	ld	xl,a
1761  002a 7b02          	ld	a,(OFST-4,sp)
1762  002c 01            	rrwa	x,a
1763  002d 1a01          	or	a,(OFST-5,sp)
1764  002f 01            	rrwa	x,a
1765  0030 1f04          	ldw	(OFST-2,sp),x
1766  0032               L707:
1767                     ; 724   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1769  0032 01            	rrwa	x,a
1770  0033 1408          	and	a,(OFST+2,sp)
1771  0035 01            	rrwa	x,a
1772  0036 1407          	and	a,(OFST+1,sp)
1773  0038 01            	rrwa	x,a
1774  0039 1307          	cpw	x,(OFST+1,sp)
1775  003b 2604          	jrne	L117
1776                     ; 727     status = SUCCESS;
1778  003d a601          	ld	a,#1
1780  003f 2001          	jra	L317
1781  0041               L117:
1782                     ; 732     status = ERROR;
1784  0041 4f            	clr	a
1785  0042               L317:
1786                     ; 736   return status;
1790  0042 5b08          	addw	sp,#8
1791  0044 81            	ret	
1844                     ; 754 I2C_Event_TypeDef I2C_GetLastEvent(void)
1844                     ; 755 {
1845                     .text:	section	.text,new
1846  0000               _I2C_GetLastEvent:
1848  0000 5206          	subw	sp,#6
1849       00000006      OFST:	set	6
1852                     ; 756   __IO uint16_t lastevent = 0;
1854  0002 5f            	clrw	x
1855  0003 1f05          	ldw	(OFST-1,sp),x
1856                     ; 757   uint16_t flag1 = 0;
1858                     ; 758   uint16_t flag2 = 0;
1860                     ; 760   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1862  0005 7205521805    	btjf	21016,#2,L347
1863                     ; 762     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1865  000a ae0004        	ldw	x,#4
1867  000d 2013          	jra	L547
1868  000f               L347:
1869                     ; 767     flag1 = I2C->SR1;
1871  000f c65217        	ld	a,21015
1872  0012 97            	ld	xl,a
1873  0013 1f01          	ldw	(OFST-5,sp),x
1874                     ; 768     flag2 = I2C->SR3;
1876  0015 c65219        	ld	a,21017
1877  0018 5f            	clrw	x
1878  0019 97            	ld	xl,a
1879  001a 1f03          	ldw	(OFST-3,sp),x
1880                     ; 771     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1882  001c 7b02          	ld	a,(OFST-4,sp)
1883  001e 01            	rrwa	x,a
1884  001f 1a01          	or	a,(OFST-5,sp)
1885  0021 01            	rrwa	x,a
1886  0022               L547:
1887  0022 1f05          	ldw	(OFST-1,sp),x
1888                     ; 774   return (I2C_Event_TypeDef)lastevent;
1890  0024 1e05          	ldw	x,(OFST-1,sp)
1893  0026 5b06          	addw	sp,#6
1894  0028 81            	ret	
2096                     ; 805 FlagStatus I2C_GetFlagStatus(I2C_FLAG_TypeDef I2C_FLAG)
2096                     ; 806 {
2097                     .text:	section	.text,new
2098  0000               _I2C_GetFlagStatus:
2100  0000 89            	pushw	x
2101  0001 89            	pushw	x
2102       00000002      OFST:	set	2
2105                     ; 807   uint8_t tempreg = 0;
2107  0002 0f02          	clr	(OFST+0,sp)
2108                     ; 808   uint8_t regindex = 0;
2110                     ; 809   FlagStatus bitstatus = RESET;
2112                     ; 812   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
2114                     ; 815   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
2116  0004 9e            	ld	a,xh
2117  0005 6b01          	ld	(OFST-1,sp),a
2118                     ; 818   switch (regindex)
2121                     ; 834     default:
2121                     ; 835       break;
2122  0007 4a            	dec	a
2123  0008 2708          	jreq	L747
2124  000a 4a            	dec	a
2125  000b 270a          	jreq	L157
2126  000d 4a            	dec	a
2127  000e 270c          	jreq	L357
2128  0010 200f          	jra	L7601
2129  0012               L747:
2130                     ; 821     case 0x01:
2130                     ; 822       tempreg = (uint8_t)I2C->SR1;
2132  0012 c65217        	ld	a,21015
2133                     ; 823       break;
2135  0015 2008          	jp	LC002
2136  0017               L157:
2137                     ; 826     case 0x02:
2137                     ; 827       tempreg = (uint8_t)I2C->SR2;
2139  0017 c65218        	ld	a,21016
2140                     ; 828       break;
2142  001a 2003          	jp	LC002
2143  001c               L357:
2144                     ; 831     case 0x03:
2144                     ; 832       tempreg = (uint8_t)I2C->SR3;
2146  001c c65219        	ld	a,21017
2147  001f               LC002:
2148  001f 6b02          	ld	(OFST+0,sp),a
2149                     ; 833       break;
2151                     ; 834     default:
2151                     ; 835       break;
2153  0021               L7601:
2154                     ; 839   if ((tempreg & (uint8_t)I2C_FLAG) != 0)
2156  0021 7b04          	ld	a,(OFST+2,sp)
2157  0023 1502          	bcp	a,(OFST+0,sp)
2158  0025 2704          	jreq	L1701
2159                     ; 842     bitstatus = SET;
2161  0027 a601          	ld	a,#1
2163  0029 2001          	jra	L3701
2164  002b               L1701:
2165                     ; 847     bitstatus = RESET;
2167  002b 4f            	clr	a
2168  002c               L3701:
2169                     ; 850   return bitstatus;
2173  002c 5b04          	addw	sp,#4
2174  002e 81            	ret	
2218                     ; 879 void I2C_ClearFlag(I2C_FLAG_TypeDef I2C_FLAG)
2218                     ; 880 {
2219                     .text:	section	.text,new
2220  0000               _I2C_ClearFlag:
2222  0000 89            	pushw	x
2223       00000002      OFST:	set	2
2226                     ; 881   uint16_t flagpos = 0;
2228                     ; 883   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
2230                     ; 886   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2232  0001 01            	rrwa	x,a
2233  0002 5f            	clrw	x
2234  0003 02            	rlwa	x,a
2235  0004 1f01          	ldw	(OFST-1,sp),x
2236                     ; 888   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2238  0006 7b02          	ld	a,(OFST+0,sp)
2239  0008 43            	cpl	a
2240  0009 c75218        	ld	21016,a
2241                     ; 889 }
2244  000c 85            	popw	x
2245  000d 81            	ret	
2309                     ; 910 ITStatus I2C_GetITStatus(I2C_IT_TypeDef I2C_IT)
2309                     ; 911 {
2310                     .text:	section	.text,new
2311  0000               _I2C_GetITStatus:
2313  0000 89            	pushw	x
2314  0001 5204          	subw	sp,#4
2315       00000004      OFST:	set	4
2318                     ; 912   ITStatus bitstatus = RESET;
2320                     ; 913   __IO uint8_t enablestatus = 0;
2322  0003 0f03          	clr	(OFST-1,sp)
2323                     ; 914   uint16_t tempregister = 0;
2325                     ; 917   assert_param(IS_I2C_GET_IT(I2C_IT));
2327                     ; 919   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
2329  0005 01            	rrwa	x,a
2330  0006 9f            	ld	a,xl
2331  0007 a407          	and	a,#7
2332  0009 97            	ld	xl,a
2333  000a 4f            	clr	a
2334  000b 02            	rlwa	x,a
2335  000c 4f            	clr	a
2336  000d 01            	rrwa	x,a
2337  000e 9f            	ld	a,xl
2338  000f 5f            	clrw	x
2339  0010 97            	ld	xl,a
2340  0011 1f01          	ldw	(OFST-3,sp),x
2341                     ; 922   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2343  0013 c6521a        	ld	a,21018
2344  0016 1402          	and	a,(OFST-2,sp)
2345  0018 6b03          	ld	(OFST-1,sp),a
2346                     ; 924   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
2348  001a 7b05          	ld	a,(OFST+1,sp)
2349  001c a430          	and	a,#48
2350  001e 97            	ld	xl,a
2351  001f 4f            	clr	a
2352  0020 02            	rlwa	x,a
2353  0021 a30100        	cpw	x,#256
2354  0024 260d          	jrne	L1511
2355                     ; 927     if (((I2C->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2357  0026 c65217        	ld	a,21015
2358  0029 1506          	bcp	a,(OFST+2,sp)
2359  002b 2715          	jreq	L1611
2361  002d 0d03          	tnz	(OFST-1,sp)
2362  002f 2711          	jreq	L1611
2363                     ; 930       bitstatus = SET;
2365  0031 200b          	jp	LC004
2366                     ; 935       bitstatus = RESET;
2367  0033               L1511:
2368                     ; 941     if (((I2C->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2370  0033 c65218        	ld	a,21016
2371  0036 1506          	bcp	a,(OFST+2,sp)
2372  0038 2708          	jreq	L1611
2374  003a 0d03          	tnz	(OFST-1,sp)
2375  003c 2704          	jreq	L1611
2376                     ; 944       bitstatus = SET;
2378  003e               LC004:
2380  003e a601          	ld	a,#1
2382  0040 2001          	jra	L7511
2383  0042               L1611:
2384                     ; 949       bitstatus = RESET;
2387  0042 4f            	clr	a
2388  0043               L7511:
2389                     ; 953   return  bitstatus;
2393  0043 5b06          	addw	sp,#6
2394  0045 81            	ret	
2439                     ; 982 void I2C_ClearITPendingBit(I2C_IT_TypeDef I2C_IT)
2439                     ; 983 {
2440                     .text:	section	.text,new
2441  0000               _I2C_ClearITPendingBit:
2443  0000 89            	pushw	x
2444       00000002      OFST:	set	2
2447                     ; 984   uint16_t flagpos = 0;
2449                     ; 987   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
2451                     ; 990   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
2453  0001 01            	rrwa	x,a
2454  0002 5f            	clrw	x
2455  0003 02            	rlwa	x,a
2456  0004 1f01          	ldw	(OFST-1,sp),x
2457                     ; 993   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2459  0006 7b02          	ld	a,(OFST+0,sp)
2460  0008 43            	cpl	a
2461  0009 c75218        	ld	21016,a
2462                     ; 994 }
2465  000c 85            	popw	x
2466  000d 81            	ret	
2479                     	xdef	_I2C_ClearITPendingBit
2480                     	xdef	_I2C_GetITStatus
2481                     	xdef	_I2C_ClearFlag
2482                     	xdef	_I2C_GetFlagStatus
2483                     	xdef	_I2C_GetLastEvent
2484                     	xdef	_I2C_CheckEvent
2485                     	xdef	_I2C_ITConfig
2486                     	xdef	_I2C_ReceiveData
2487                     	xdef	_I2C_SendData
2488                     	xdef	_I2C_Send7bitAddress
2489                     	xdef	_I2C_FastModeDutyCycleConfig
2490                     	xdef	_I2C_AckPositionConfig
2491                     	xdef	_I2C_AcknowledgeConfig
2492                     	xdef	_I2C_GenerateSTOP
2493                     	xdef	_I2C_GenerateSTART
2494                     	xdef	_I2C_StretchClockCmd
2495                     	xdef	_I2C_SoftwareResetCmd
2496                     	xdef	_I2C_GeneralCallCmd
2497                     	xdef	_I2C_Cmd
2498                     	xdef	_I2C_Init
2499                     	xdef	_I2C_DeInit
2500                     	xref	_CLK_GetClockFreq
2501                     	xref.b	c_lreg
2502                     	xref.b	c_x
2521                     	xref	c_uitol
2522                     	xref	c_sdivx
2523                     	xref	c_lzmp
2524                     	xref	c_rtol
2525                     	xref	c_smul
2526                     	xref	c_lmul
2527                     	xref	c_lcmp
2528                     	xref	c_ltor
2529                     	xref	c_ludv
2530                     	end
