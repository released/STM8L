   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  83                     ; 157 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
  83                     ; 158 {
  85                     .text:	section	.text,new
  86  0000               _FLASH_SetProgrammingTime:
  90                     ; 160   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
  92                     ; 162   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  94  0000 72115050      	bres	20560,#0
  95                     ; 163   FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
  97  0004 ca5050        	or	a,20560
  98  0007 c75050        	ld	20560,a
  99                     ; 164 }
 102  000a 81            	ret	
 127                     ; 171 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 127                     ; 172 {
 128                     .text:	section	.text,new
 129  0000               _FLASH_GetProgrammingTime:
 133                     ; 173   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 135  0000 c65050        	ld	a,20560
 136  0003 a401          	and	a,#1
 139  0005 81            	ret	
 162                     ; 215 void FLASH_DeInit(void)
 162                     ; 216 {
 163                     .text:	section	.text,new
 164  0000               _FLASH_DeInit:
 168                     ; 217   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 170  0000 725f5050      	clr	20560
 171                     ; 218   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 173  0004 725f5051      	clr	20561
 174                     ; 219   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 176  0008 35405054      	mov	20564,#64
 177                     ; 220   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 179  000c c65054        	ld	a,20564
 180                     ; 221 }
 183  000f 81            	ret	
 239                     ; 231 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 239                     ; 232 {
 240                     .text:	section	.text,new
 241  0000               _FLASH_Unlock:
 243  0000 88            	push	a
 244       00000000      OFST:	set	0
 247                     ; 234   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 249                     ; 237   if (FLASH_MemType == FLASH_MemType_Program)
 251  0001 a1fd          	cp	a,#253
 252  0003 2608          	jrne	L501
 253                     ; 239     FLASH->PUKR = FLASH_RASS_KEY1;
 255  0005 35565052      	mov	20562,#86
 256                     ; 240     FLASH->PUKR = FLASH_RASS_KEY2;
 258  0009 35ae5052      	mov	20562,#174
 259  000d               L501:
 260                     ; 243   if (FLASH_MemType == FLASH_MemType_Data)
 262  000d 7b01          	ld	a,(OFST+1,sp)
 263  000f a1f7          	cp	a,#247
 264  0011 2608          	jrne	L701
 265                     ; 245     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 267  0013 35ae5053      	mov	20563,#174
 268                     ; 246     FLASH->DUKR = FLASH_RASS_KEY1;
 270  0017 35565053      	mov	20563,#86
 271  001b               L701:
 272                     ; 248 }
 275  001b 84            	pop	a
 276  001c 81            	ret	
 311                     ; 258 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 311                     ; 259 {
 312                     .text:	section	.text,new
 313  0000               _FLASH_Lock:
 317                     ; 261   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 319                     ; 263   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 321  0000 c45054        	and	a,20564
 322  0003 c75054        	ld	20564,a
 323                     ; 264 }
 326  0006 81            	ret	
 369                     ; 272 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 369                     ; 273 {
 370                     .text:	section	.text,new
 371  0000               _FLASH_ProgramByte:
 373  0000 89            	pushw	x
 374       00000000      OFST:	set	0
 377                     ; 275   assert_param(IS_FLASH_ADDRESS(Address));
 379                     ; 277   *(PointerAttr uint8_t*) (uint16_t)Address = Data;  
 381  0001 1e01          	ldw	x,(OFST+1,sp)
 382  0003 7b05          	ld	a,(OFST+5,sp)
 383  0005 f7            	ld	(x),a
 384                     ; 278 }
 387  0006 85            	popw	x
 388  0007 81            	ret	
 422                     ; 285 void FLASH_EraseByte(uint16_t Address)
 422                     ; 286 {
 423                     .text:	section	.text,new
 424  0000               _FLASH_EraseByte:
 428                     ; 288   assert_param(IS_FLASH_ADDRESS(Address));
 430                     ; 290   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 432  0000 7f            	clr	(x)
 433                     ; 291 }
 437  0001 81            	ret	
 480                     ; 299 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 480                     ; 300 {
 481                     .text:	section	.text,new
 482  0000               _FLASH_ProgramWord:
 484  0000 89            	pushw	x
 485       00000000      OFST:	set	0
 488                     ; 302   assert_param(IS_FLASH_ADDRESS(Address));
 490                     ; 305   FLASH->CR2 |= FLASH_CR2_WPRG;
 492  0001 721c5051      	bset	20561,#6
 493                     ; 308   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 495  0005 1e01          	ldw	x,(OFST+1,sp)
 496  0007 7b05          	ld	a,(OFST+5,sp)
 497  0009 f7            	ld	(x),a
 498                     ; 310   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 500  000a 7b06          	ld	a,(OFST+6,sp)
 501  000c e701          	ld	(1,x),a
 502                     ; 312   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 504  000e 7b07          	ld	a,(OFST+7,sp)
 505  0010 e702          	ld	(2,x),a
 506                     ; 314   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 508  0012 7b08          	ld	a,(OFST+8,sp)
 509  0014 e703          	ld	(3,x),a
 510                     ; 315 }
 513  0016 85            	popw	x
 514  0017 81            	ret	
 548                     ; 322 uint8_t FLASH_ReadByte(uint16_t Address)
 548                     ; 323 {
 549                     .text:	section	.text,new
 550  0000               _FLASH_ReadByte:
 554                     ; 325   assert_param(IS_FLASH_ADDRESS(Address));
 556                     ; 328   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 558  0000 f6            	ld	a,(x)
 561  0001 81            	ret	
 618                     ; 358 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 618                     ; 359 {
 619                     .text:	section	.text,new
 620  0000               _FLASH_GetReadOutProtectionStatus:
 622  0000 88            	push	a
 623       00000001      OFST:	set	1
 626                     ; 360   FunctionalState state = DISABLE;
 628                     ; 362   if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 630  0001 c64800        	ld	a,18432
 631  0004 a1aa          	cp	a,#170
 632  0006 2604          	jrne	L552
 633                     ; 365     state = ENABLE;
 635  0008 a601          	ld	a,#1
 637  000a 2001          	jra	L752
 638  000c               L552:
 639                     ; 370     state = DISABLE;
 641  000c 4f            	clr	a
 642  000d               L752:
 643                     ; 373     return state;
 647  000d 5b01          	addw	sp,#1
 648  000f 81            	ret	
 682                     ; 381 uint16_t FLASH_GetBootSize(void)
 682                     ; 382 {
 683                     .text:	section	.text,new
 684  0000               _FLASH_GetBootSize:
 686  0000 89            	pushw	x
 687       00000002      OFST:	set	2
 690                     ; 383   uint16_t temp = 0;
 692                     ; 386   temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 694  0001 c64802        	ld	a,18434
 695  0004 97            	ld	xl,a
 696  0005 a640          	ld	a,#64
 697  0007 42            	mul	x,a
 698                     ; 389   if (OPT->OPT2_BOOTSIZE > 0x7F)
 700  0008 c64802        	ld	a,18434
 701  000b a180          	cp	a,#128
 702  000d 2503          	jrult	L772
 703                     ; 391     temp = 8192;
 705  000f ae2000        	ldw	x,#8192
 706  0012               L772:
 707                     ; 395   return(temp);
 711  0012 5b02          	addw	sp,#2
 712  0014 81            	ret	
 746                     ; 403 uint16_t FLASH_GetDataSize(void)
 746                     ; 404 {
 747                     .text:	section	.text,new
 748  0000               _FLASH_GetDataSize:
 750  0000 89            	pushw	x
 751       00000002      OFST:	set	2
 754                     ; 405   uint16_t temp = 0;
 756                     ; 408   temp = (uint16_t)((uint16_t)OPT->OPT3_DATASIZE * (uint16_t)64);
 758  0001 c64803        	ld	a,18435
 759  0004 5f            	clrw	x
 760  0005 97            	ld	xl,a
 761  0006 58            	sllw	x
 762  0007 58            	sllw	x
 763  0008 58            	sllw	x
 764  0009 58            	sllw	x
 765  000a 58            	sllw	x
 766  000b 58            	sllw	x
 767                     ; 411   if (OPT->OPT3_DATASIZE > 0x20)
 769  000c c64803        	ld	a,18435
 770  000f a121          	cp	a,#33
 771  0011 2503          	jrult	L713
 772                     ; 413     temp = 2048;
 774  0013 ae0800        	ldw	x,#2048
 775  0016               L713:
 776                     ; 417   return(temp);
 780  0016 5b02          	addw	sp,#2
 781  0018 81            	ret	
 816                     ; 441 void FLASH_ITConfig(FunctionalState NewState)
 816                     ; 442 {
 817                     .text:	section	.text,new
 818  0000               _FLASH_ITConfig:
 822                     ; 444   assert_param(IS_FUNCTIONAL_STATE(NewState));
 824                     ; 446   if (NewState != DISABLE)
 826  0000 4d            	tnz	a
 827  0001 2705          	jreq	L733
 828                     ; 448     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 830  0003 72125050      	bset	20560,#1
 833  0007 81            	ret	
 834  0008               L733:
 835                     ; 452     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 837  0008 72135050      	bres	20560,#1
 838                     ; 454 }
 841  000c 81            	ret	
 943                     ; 467 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 943                     ; 468 {
 944                     .text:	section	.text,new
 945  0000               _FLASH_GetFlagStatus:
 947  0000 88            	push	a
 948       00000001      OFST:	set	1
 951                     ; 469   FlagStatus status = RESET;
 953                     ; 471   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 955                     ; 474   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 957  0001 c45054        	and	a,20564
 958  0004 2702          	jreq	L114
 959                     ; 476     status = SET; /* FLASH_FLAG is set*/
 961  0006 a601          	ld	a,#1
 963  0008               L114:
 964                     ; 480     status = RESET; /* FLASH_FLAG is reset*/
 966                     ; 484   return status;
 970  0008 5b01          	addw	sp,#1
 971  000a 81            	ret	
1065                     ; 602 IN_RAM(void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer))
1065                     ; 603 {
1066                     .text:	section	.text,new
1067  0000               _FLASH_ProgramBlock:
1069  0000 89            	pushw	x
1070  0001 5204          	subw	sp,#4
1071       00000004      OFST:	set	4
1074                     ; 604   uint16_t Count = 0;
1076                     ; 605   uint16_t StartAddress = 0;
1078                     ; 608   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1080                     ; 609   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1082                     ; 612   if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1084  0003 9f            	ld	a,xl
1085  0004 4d            	tnz	a
1086  0005 2606          	jrne	L364
1087                     ; 615     FLASH->CR2 |= FLASH_CR2_PRG;
1089  0007 72105051      	bset	20561,#0
1091  000b 2004          	jra	L564
1092  000d               L364:
1093                     ; 620     FLASH->CR2 |= FLASH_CR2_FPRG;
1095  000d 72185051      	bset	20561,#4
1096  0011               L564:
1097                     ; 622   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1099                     ; 624   StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1101  0011 7b05          	ld	a,(OFST+1,sp)
1102  0013 5f            	clrw	x
1103  0014 97            	ld	xl,a
1104  0015 58            	sllw	x
1105  0016 58            	sllw	x
1106  0017 58            	sllw	x
1107  0018 58            	sllw	x
1108  0019 58            	sllw	x
1109  001a 58            	sllw	x
1110  001b 1c8000        	addw	x,#32768
1111  001e 1f01          	ldw	(OFST-3,sp),x
1112                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1114  0020 5f            	clrw	x
1115  0021 1f03          	ldw	(OFST-1,sp),x
1116  0023               L764:
1117                     ; 629     *((PointerAttr uint8_t*) (uint16_t)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1119  0023 1e09          	ldw	x,(OFST+5,sp)
1120  0025 72fb03        	addw	x,(OFST-1,sp)
1121  0028 f6            	ld	a,(x)
1122  0029 1e01          	ldw	x,(OFST-3,sp)
1123  002b 72fb03        	addw	x,(OFST-1,sp)
1124  002e f7            	ld	(x),a
1125                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1127  002f 1e03          	ldw	x,(OFST-1,sp)
1128  0031 5c            	incw	x
1129  0032 1f03          	ldw	(OFST-1,sp),x
1132  0034 a30040        	cpw	x,#64
1133  0037 25ea          	jrult	L764
1134                     ; 631 }
1137  0039 5b06          	addw	sp,#6
1138  003b 81            	ret	
1191                     ; 643 IN_RAM(void FLASH_EraseBlock(uint8_t BlockNum))
1191                     ; 644 {
1192                     .text:	section	.text,new
1193  0000               _FLASH_EraseBlock:
1195  0000 5204          	subw	sp,#4
1196       00000004      OFST:	set	4
1199                     ; 646   uint16_t StartAddress = 0;
1201                     ; 648   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1203                     ; 650   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1205                     ; 652   pwFlash = (PointerAttr uint32_t *)(uint16_t)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1207  0002 5f            	clrw	x
1208  0003 97            	ld	xl,a
1209  0004 58            	sllw	x
1210  0005 58            	sllw	x
1211  0006 58            	sllw	x
1212  0007 58            	sllw	x
1213  0008 58            	sllw	x
1214  0009 58            	sllw	x
1215  000a 1c8000        	addw	x,#32768
1216  000d 1f01          	ldw	(OFST-3,sp),x
1217                     ; 655   FLASH->CR2 |= FLASH_CR2_ERASE;
1219  000f 721a5051      	bset	20561,#5
1220                     ; 657   *pwFlash = (uint32_t)0;
1222  0013 4f            	clr	a
1223  0014 e703          	ld	(3,x),a
1224  0016 e702          	ld	(2,x),a
1225  0018 e701          	ld	(1,x),a
1226  001a f7            	ld	(x),a
1227                     ; 658 }
1230  001b 5b04          	addw	sp,#4
1231  001d 81            	ret	
1306                     ; 670 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(void))
1306                     ; 671 {
1307                     .text:	section	.text,new
1308  0000               _FLASH_WaitForLastOperation:
1310  0000 5203          	subw	sp,#3
1311       00000003      OFST:	set	3
1314                     ; 672   uint16_t timeout = OPERATION_TIMEOUT;
1316  0002 ae1000        	ldw	x,#4096
1317  0005 1f01          	ldw	(OFST-2,sp),x
1318                     ; 673   uint8_t My_FlagStatus = 0x00;
1320  0007 0f03          	clr	(OFST+0,sp)
1322  0009 200a          	jra	L365
1323  000b               L755:
1324                     ; 678     My_FlagStatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1326  000b c65054        	ld	a,20564
1327  000e a405          	and	a,#5
1328  0010 6b03          	ld	(OFST+0,sp),a
1329                     ; 679     timeout--;
1331  0012 5a            	decw	x
1332  0013 1f01          	ldw	(OFST-2,sp),x
1333  0015               L365:
1334                     ; 676   while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1336  0015 7b03          	ld	a,(OFST+0,sp)
1337  0017 2604          	jrne	L765
1339  0019 1e01          	ldw	x,(OFST-2,sp)
1340  001b 26ee          	jrne	L755
1341  001d               L765:
1342                     ; 682   if (timeout == 0x00)
1344  001d 1e01          	ldw	x,(OFST-2,sp)
1345  001f 2602          	jrne	L175
1346                     ; 684     My_FlagStatus = (uint8_t)FLASH_Status_TimeOut;
1348  0021 a602          	ld	a,#2
1349  0023               L175:
1350                     ; 687   return((FLASH_Status_TypeDef)My_FlagStatus);
1354  0023 5b03          	addw	sp,#3
1355  0025 81            	ret	
1368                     	xdef	_FLASH_WaitForLastOperation
1369                     	xdef	_FLASH_EraseBlock
1370                     	xdef	_FLASH_ProgramBlock
1371                     	xdef	_FLASH_GetFlagStatus
1372                     	xdef	_FLASH_ITConfig
1373                     	xdef	_FLASH_GetReadOutProtectionStatus
1374                     	xdef	_FLASH_GetDataSize
1375                     	xdef	_FLASH_GetBootSize
1376                     	xdef	_FLASH_ReadByte
1377                     	xdef	_FLASH_ProgramWord
1378                     	xdef	_FLASH_EraseByte
1379                     	xdef	_FLASH_ProgramByte
1380                     	xdef	_FLASH_Lock
1381                     	xdef	_FLASH_Unlock
1382                     	xdef	_FLASH_DeInit
1383                     	xdef	_FLASH_SetProgrammingTime
1384                     	xdef	_FLASH_GetProgrammingTime
1403                     	end
