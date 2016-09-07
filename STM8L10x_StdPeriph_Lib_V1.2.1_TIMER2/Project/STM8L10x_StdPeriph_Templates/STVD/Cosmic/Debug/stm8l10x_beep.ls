   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  48                     ; 92 void BEEP_DeInit(void)
  48                     ; 93 {
  50                     .text:	section	.text,new
  51  0000               _BEEP_DeInit:
  55                     ; 94   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  57  0000 351f50f3      	mov	20723,#31
  58                     ; 95 }
  61  0004 81            	ret	
 126                     ; 104 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 126                     ; 105 {
 127                     .text:	section	.text,new
 128  0000               _BEEP_Init:
 130  0000 88            	push	a
 131       00000000      OFST:	set	0
 134                     ; 108   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 136                     ; 111   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 138  0001 c650f3        	ld	a,20723
 139  0004 a41f          	and	a,#31
 140  0006 a11f          	cp	a,#31
 141  0008 260c          	jrne	L15
 142                     ; 113     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 144  000a c650f3        	ld	a,20723
 145  000d a4e0          	and	a,#224
 146  000f c750f3        	ld	20723,a
 147                     ; 114     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 149  0012 721050f3      	bset	20723,#0
 150  0016               L15:
 151                     ; 118   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 153  0016 c650f3        	ld	a,20723
 154  0019 a43f          	and	a,#63
 155  001b c750f3        	ld	20723,a
 156                     ; 119   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 158  001e c650f3        	ld	a,20723
 159  0021 1a01          	or	a,(OFST+1,sp)
 160  0023 c750f3        	ld	20723,a
 161                     ; 121 }
 164  0026 84            	pop	a
 165  0027 81            	ret	
 220                     ; 129 void BEEP_Cmd(FunctionalState NewState)
 220                     ; 130 {
 221                     .text:	section	.text,new
 222  0000               _BEEP_Cmd:
 226                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 228                     ; 134   if (NewState != DISABLE)
 230  0000 4d            	tnz	a
 231  0001 2705          	jreq	L101
 232                     ; 137     BEEP->CSR |= BEEP_CSR_BEEPEN;
 234  0003 721a50f3      	bset	20723,#5
 237  0007 81            	ret	
 238  0008               L101:
 239                     ; 142     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 241  0008 721b50f3      	bres	20723,#5
 242                     ; 144 }
 245  000c 81            	ret	
 298                     .const:	section	.text
 299  0000               L41:
 300  0000 000003e8      	dc.l	1000
 301                     ; 185 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 301                     ; 186 {
 302                     .text:	section	.text,new
 303  0000               _BEEP_LSICalibrationConfig:
 305  0000 5206          	subw	sp,#6
 306       00000006      OFST:	set	6
 309                     ; 192   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 311                     ; 194   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 313  0002 96            	ldw	x,sp
 314  0003 1c0009        	addw	x,#OFST+3
 315  0006 cd0000        	call	c_ltor
 317  0009 ae0000        	ldw	x,#L41
 318  000c cd0000        	call	c_ludv
 320  000f be02          	ldw	x,c_lreg+2
 321  0011 1f03          	ldw	(OFST-3,sp),x
 322                     ; 198   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 324  0013 c650f3        	ld	a,20723
 325  0016 a4e0          	and	a,#224
 326  0018 c750f3        	ld	20723,a
 327                     ; 200   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 329  001b 54            	srlw	x
 330  001c 54            	srlw	x
 331  001d 54            	srlw	x
 332  001e 1f05          	ldw	(OFST-1,sp),x
 333                     ; 202   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 335  0020 58            	sllw	x
 336  0021 58            	sllw	x
 337  0022 58            	sllw	x
 338  0023 1f01          	ldw	(OFST-5,sp),x
 339  0025 1e03          	ldw	x,(OFST-3,sp)
 340  0027 72f001        	subw	x,(OFST-5,sp)
 341  002a 1605          	ldw	y,(OFST-1,sp)
 342  002c 9058          	sllw	y
 343  002e 905c          	incw	y
 344  0030 cd0000        	call	c_imul
 346  0033 1605          	ldw	y,(OFST-1,sp)
 347  0035 9058          	sllw	y
 348  0037 9058          	sllw	y
 349  0039 bf00          	ldw	c_x,x
 350  003b 9058          	sllw	y
 351  003d 90b300        	cpw	y,c_x
 352  0040 7b06          	ld	a,(OFST+0,sp)
 353  0042 2504          	jrult	L331
 354                     ; 204     BEEP->CSR |= (uint8_t)(A - 2U);
 356  0044 a002          	sub	a,#2
 358  0046 2001          	jra	L531
 359  0048               L331:
 360                     ; 208     BEEP->CSR |= (uint8_t)(A - 1U);
 362  0048 4a            	dec	a
 363  0049               L531:
 364  0049 ca50f3        	or	a,20723
 365  004c c750f3        	ld	20723,a
 366                     ; 211 }
 369  004f 5b06          	addw	sp,#6
 370  0051 81            	ret	
 383                     	xdef	_BEEP_LSICalibrationConfig
 384                     	xdef	_BEEP_Cmd
 385                     	xdef	_BEEP_Init
 386                     	xdef	_BEEP_DeInit
 387                     	xref.b	c_lreg
 388                     	xref.b	c_x
 407                     	xref	c_imul
 408                     	xref	c_ludv
 409                     	xref	c_ltor
 410                     	end
