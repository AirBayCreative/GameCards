//****************************************
// Generated code
//****************************************

.lfile 'rebuild.s'
.code

//****************************************
// Function: __ZN13XmlConnectionC1Ev
//****************************************

.func __ZN13XmlConnectionC1Ev_3, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\XmlConnection.cpp'
.line 5
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_3:
.line 5
	ld r14,&__ZTV13XmlConnection_3+8
	ld [i0],r14
	ld r14,&__ZTV13XmlConnection_3+36
	ld [i0,4],r14
LBE3_3:
	pop fr,fr
	ret

//****************************************
// Function: __ZN13XmlConnection5parseEPN6MAUtil10ConnectionEP10XCListenerPN3Mtx11XmlListenerEPN4MAUI5LabelE
//****************************************

.func __ZN13XmlConnection5parseEPN6MAUtil10ConnectionEP10XCListenerPN3Mtx11XmlListenerEPN4MAUI5LabelE_3, 5, void
.line 7
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB4_3:
.line 8
	ld r14,[fr]
	ld [i0,2128],r14
.line 9
	ld [i0,68],i1
.line 10
	ld [i0,72],i2
.line 11
	add i0,#0x8
	ld i1,d0
	add i1,#0x4
	ld i2,i3
	call &__ZN3Mtx7Context4initEPNS_11MtxListenerEPNS_11XmlListenerE_100
.line 12
	ld i0,[d0,68]
	ld i1,d0
	call &__ZN6MAUtil10Connection11setListenerEPNS_18ConnectionListenerE_62
.line 13
	ld i1,d0
	add i1,#0x4c
	ld [d0,2124],i1
.line 14
	ld i0,[d0,68]
	ld i2,#0x7ff
	call &__ZN6MAUtil10Connection4recvEPvi_62
LBE4_3:
	pop rt,d0
	ret

//****************************************
// Function: __ZN13XmlConnectionD1Ev
//****************************************

.func __ZN13XmlConnectionD1Ev_3, 1, void
.line 16
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_3:
.line 16
	ld r14,&__ZTV13XmlConnection_3+8
	ld [i0],r14
	ld r14,&__ZTV13XmlConnection_3+36
	ld [i0,4],r14
LBE6_3:
	pop fr,fr
	ret

//****************************************
// Function: __ZN13XmlConnection17connWriteFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN13XmlConnection17connWriteFinishedEPN6MAUtil10ConnectionEi_3, 3, void
.line 19
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 19
	pop fr,fr
	ret

//****************************************
// Function: __ZN13XmlConnection16connRecvFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN13XmlConnection16connRecvFinishedEPN6MAUtil10ConnectionEi_3, 3, void
.line 21
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB7_3:
.line 22
	ld r14,[i0,68]
	jc ne,r14,i1,&L20_3
.line 23
	ld r14,#0x0
	jc lt,i2,r14,&L21_3
.line 27
	ld r14,[i0,2124]
	add i2,r14
	ld r14,#0x0
	ld.b [i2],r14
.line 28
	ld i1,i0
	add i1,#0x4c
	ld [i0,2124],i1
.line 29
	add i0,#0x8
	call &__ZN3Mtx7Context4feedEPc_100
.line 30
	ld i1,[d0,2124]
	ld i2,d0
	sub i2,i1
	ld i0,[d0,68]
	add i2,#0x84b
	call &__ZN6MAUtil10Connection4recvEPvi_62
LBE7_3:
.line 31
	pop rt,d0
	ret
L21_3:
.line 24
	ld i0,[i0,72]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,i2
	call d0
LBE8_3:
.line 31
	pop rt,d0
	ret
L20_3:
.line 22
	ld i0,&LC0_3
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x16
	call &_bfeHandler_28

//****************************************
// Function: __ZThn4_N13XmlConnection14mtxDataRemainsEPKci
//****************************************

.func __ZThn4_N13XmlConnection14mtxDataRemainsEPKci_3, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\XmlConnection.h'
.line 13
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 13
	add i0,#0xfffffffc
	call &__ZN13XmlConnection14mtxDataRemainsEPKci_3
	pop rt,fr
	ret

//****************************************
// Function: __ZN13XmlConnection14mtxDataRemainsEPKci
//****************************************

.func __ZN13XmlConnection14mtxDataRemainsEPKci_3, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\XmlConnection.cpp'
.line 33
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i2
LBB10_3:
.line 34
	add i0,#0x4c
	jc eq,i0,i1,&L24_3
.line 35
	syscall 5
L24_3:
.line 37
	add d0,d1
	add d0,#0x4c
	ld [d1,2124],d0
LBE10_3:
	pop rt,d1
	ret

//****************************************
// Function: __Z10setPaddingPN4MAUI6WidgetE
//****************************************

.func __Z10setPaddingPN4MAUI6WidgetE_4, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Util.cpp'
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB2_4:
.line 24
	ld r14,[i0]
	ld d0,[r14,60]
	ld i1,#0x5
	call d0
LBE2_4:
	pop rt,d0
	ret

//****************************************
// Function: __Z15createEditLabelN6MAUtil11BasicStringIcEEi
//****************************************

.func __Z15createEditLabelN6MAUtil11BasicStringIcEEi_4, 2, int
.line 32
	push rt,d2
	sub sp,#0x14
	ld fr,sp
	add fr,#0x28
	ld d2,i0
	ld d0,i1
LBB5_4:
.line 33
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld [sp],d0
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d2
	ld [sp,12],r14
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
.line 34
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinEditBox_4]
	call d0
.line 35
	ld i0,d1
	call &__Z10setPaddingPN4MAUI6WidgetE_4
LBE6_4:
.line 37
	ld r14,d1
	add sp,#0x14
	pop rt,d2
	ret

//****************************************
// Function: __Z14createSubLabelN6MAUtil11BasicStringIcEEi
//****************************************

.func __Z14createSubLabelN6MAUtil11BasicStringIcEEi_4, 2, int
.line 39
	push rt,d2
	sub sp,#0x14
	ld fr,sp
	add fr,#0x28
	ld d2,i0
	ld d0,i1
LBB7_4:
.line 40
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld [sp],d0
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d2
	ld [sp,12],r14
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
.line 41
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_90
.line 42
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 43
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinList_4]
	call d0
LBE8_4:
.line 45
	ld r14,d1
	add sp,#0x14
	pop rt,d2
	ret

//****************************************
// Function: __Z16createSoftKeyBariPKcS0_S0_
//****************************************

.func __Z16createSoftKeyBariPKcS0_S0__4, 4, int
.line 50
	push rt,d6
	sub sp,#0x18
	ld fr,sp
	add fr,#0x3c
	ld d4,i0
	ld d0,i1
	ld d6,i2
	ld d5,i3
LBB9_4:
.line 51
	ld i0,#0x9c
	call &__Znwm_21
	ld d2,r14
	ld [sp],d4
	ld r0,#0x0
	ld [sp,4],r0
	ld r14,#0x3
	ld [sp,8],r14
	ld r0,#0x1
	ld [sp,12],r0
	ld i0,d2
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_91
.line 54
	ld d3,fr
	add d3,#0xffffffd8
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld [sp],d4
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d3
	ld [sp,12],r14
	ld r0,[zr,_gFontWhite_4]
	ld [sp,16],r0
	ld i0,d1
	ld i1,r14
	ld i2,r14
	ld i3,[zr,_scrWidth_4]
	div i3,#0x3
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 55
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_90
.line 56
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 57
	ld.b d0,[d0]
	xb r14,d0
	ld r0,#0x0
	jc ne,r14,r0,&L10_4
L6_4:
.line 60
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
.line 62
	ld i0,d3
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld [sp],d4
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d3
	ld [sp,12],r14
	ld r0,[zr,_gFontWhite_4]
	ld [sp,16],r0
	ld i0,d1
	ld i1,r14
	ld i2,r14
	ld i3,[zr,_scrWidth_4]
	div i3,#0x3
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 63
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_90
.line 64
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 65
	ld.b d5,[d5]
	xb r14,d5
	ld r0,#0x0
	jc ne,r14,r0,&L11_4
L7_4:
.line 68
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
.line 70
	ld i0,d3
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld [sp],d4
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d3
	ld [sp,12],r14
	ld r0,[zr,_gFontWhite_4]
	ld [sp,16],r0
	ld i0,d1
	ld i1,r14
	ld i2,r14
	ld i3,[zr,_scrWidth_4]
	div i3,#0x3
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_90
.line 72
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 73
	ld.b d6,[d6]
	xb r14,d6
	ld r0,#0x0
	jc ne,r14,r0,&L12_4
.line 76
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
LBE10_4:
.line 79
	ld r14,d2
	add sp,#0x18
	pop rt,d6
	ret
L10_4:
.line 58
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinButton_4]
	call d0
	jp &L6_4
L12_4:
.line 74
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinButton_4]
	call d0
.line 76
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
LBE12_4:
.line 79
	ld r14,d2
	add sp,#0x18
	pop rt,d6
	ret
L11_4:
.line 66
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinButton_4]
	call d0
	jp &L7_4

//****************************************
// Function: __Z16createMainLayoutPKcS0_S0_b
//****************************************

.func __Z16createMainLayoutPKcS0_S0_b_4, 4, int
.line 91
	push rt,d4
	sub sp,#0x18
	ld fr,sp
	add fr,#0x34
	ld d0,i0
	ld d1,i1
	ld d2,i2
LBB18_4:
.line 92
	ld i0,#0x9c
	call &__Znwm_21
	ld d4,r14
	ld r0,[zr,_scrHeight_4]
	ld [sp],r0
	ld r14,#0x0
	ld [sp,4],r14
	ld r0,#0x1
	ld [sp,8],r0
	ld r14,#0x2
	ld [sp,12],r14
	ld i0,d4
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_91
.line 94
	ld i0,#0x2a
	ld i1,d0
	ld i2,d1
	ld i3,d2
	call &__Z16createSoftKeyBariPKcS0_S0__4
	ld [zr,_softKeys_4],r14
.line 95
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC0_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d3,r14
	ld i3,[zr,_scrWidth_4]
	ld r14,[zr,_scrHeight_4]
	ld r0,#0x0
	jc lt,r14,r0,&L17_4
L16_4:
	sra r14,#0x2
	ld [sp],r14
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d0
	ld [sp,12],r14
	ld r0,[zr,_gFontWhite_4]
	ld [sp,16],r0
	ld i0,d3
	ld i1,r14
	ld i2,r14
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 97
	ld i0,[zr,_softKeys_4]
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_21
	ld d2,r14
	ld [sp],d0
	ld [sp,4],d4
	ld r14,#0x1
	ld [sp,8],r14
	ld [sp,12],r14
	ld r0,#0x1
	ld.b [sp,16],r0
	ld i0,d2
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_92
.line 99
	ld i0,#0x1
	syscall 50
.line 101
	xh d0,r14
.line 103
	ld i0,#0x84
	call &__Znwm_21
	ld d1,r14
	ld [sp],d0
	ld r14,#0x0
	ld [sp,4],r14
	ld r0,#0x0
	ld.b [sp,8],r0
	ld.b [sp,12],r0
	ld r14,#0x1
	ld [sp,16],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_88
	ld [zr,_image_4],d1
.line 104
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
.line 106
	ld i0,d3
	ld i1,#0x1
	call &__ZN4MAUI5Label12setAutoSizeYEb_90
.line 107
	ld i0,d3
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_90
.line 108
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d3
	call d0
.line 110
	ld i0,[zr,_softKeys_4]
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,r14
	ld i0,d3
	call &__ZNK4MAUI6Widget9getHeightEv_95
	add d0,r14
	ld d1,[zr,_scrHeight_4]
	sub d1,d0
	ld i0,#0xb4
	call &__Znwm_21
	ld d3,r14
	ld [sp],d1
	ld r0,#0x0
	ld [sp,4],r0
	ld r14,#0x1
	ld [sp,8],r14
	ld [sp,12],r14
	ld.b [sp,16],r0
	ld i0,d3
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_92
.line 111
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d3
	call d0
.line 112
	ld i0,d2
	call &__Z10setPaddingPN4MAUI6WidgetE_4
.line 115
	ld r14,[d4]
	ld d0,[r14]
	ld i0,d4
	ld i1,[zr,_softKeys_4]
	call d0
LBE19_4:
.line 118
	ld r14,d4
	add sp,#0x18
	pop rt,d4
	ret
L17_4:
.line 95
	add r14,#0x3
	jp &L16_4

//****************************************
// Function: __Z16createMainLayoutPKcS0_b
//****************************************

.func __Z16createMainLayoutPKcS0_b_4, 3, int
.line 81
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i3,i2
LBB22_4:
.line 82
	ld i2,&LC0_4
	call &__Z16createMainLayoutPKcS0_S0_b_4
LBE22_4:
.line 83
	pop rt,fr
	ret

//****************************************
// Function: __Z17createImageLayoutPKc
//****************************************

.func __Z17createImageLayoutPKc_4, 1, int
.line 120
	push rt,d3
	sub sp,#0x14
	ld fr,sp
	add fr,#0x2c
	ld d0,i0
LBB23_4:
.line 121
	ld i0,#0x9c
	call &__Znwm_21
	ld d3,r14
	ld r14,[zr,_scrHeight_4]
	ld [sp],r14
	ld r14,#0x0
	ld [sp,4],r14
	ld r14,#0x1
	ld [sp,8],r14
	ld r14,#0x2
	ld [sp,12],r14
	ld i0,d3
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_91
.line 122
	ld i0,#0x2a
	ld i1,d0
	ld i2,&LC0_4
	ld i3,i2
	call &__Z16createSoftKeyBariPKcS0_S0__4
	ld [zr,_softKeys_4],r14
.line 123
	ld i0,r14
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_21
	ld d2,r14
	ld [sp],d0
	ld [sp,4],d3
	ld r14,#0x1
	ld [sp,8],r14
	ld [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d2
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_92
.line 124
	ld i0,#0x1
	syscall 50
.line 126
	xh d0,r14
.line 128
	ld i0,#0x84
	call &__Znwm_21
	ld d1,r14
	ld [sp],d0
	ld r14,#0x0
	ld [sp,4],r14
	ld.b [sp,8],r14
	ld.b [sp,12],r14
	ld r14,#0x1
	ld [sp,16],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_88
	ld [zr,_image_4],d1
.line 129
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
.line 130
	ld i0,[zr,_softKeys_4]
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_21
	ld d1,r14
	ld [sp],d0
	ld r14,#0x0
	ld [sp,4],r14
	ld r14,#0x1
	ld [sp,8],r14
	ld [sp,12],r14
	ld r14,#0x0
	ld.b [sp,16],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_92
.line 131
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
.line 132
	ld i0,d2
	call &__Z10setPaddingPN4MAUI6WidgetE_4
.line 135
	ld r14,[d3]
	ld d0,[r14]
	ld i0,d3
	ld i1,[zr,_softKeys_4]
	call d0
LBE24_4:
.line 138
	ld r14,d3
	add sp,#0x14
	pop rt,d3
	ret

//****************************************
// Function: __Z17createImageLayoutPKcS0_S0_
//****************************************

.func __Z17createImageLayoutPKcS0_S0__4, 3, int
.line 140
	push rt,d3
	sub sp,#0x14
	ld fr,sp
	add fr,#0x2c
	ld d0,i0
	ld d2,i1
	ld d3,i2
LBB25_4:
.line 141
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld r14,[zr,_scrHeight_4]
	ld [sp],r14
	ld r14,#0x0
	ld [sp,4],r14
	ld r14,#0x1
	ld [sp,8],r14
	ld r14,#0x2
	ld [sp,12],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_91
.line 142
	ld i0,#0x2a
	ld i1,d0
	ld i2,d2
	ld i3,d3
	call &__Z16createSoftKeyBariPKcS0_S0__4
	ld [zr,_softKeys_4],r14
.line 143
	ld i0,r14
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_21
	ld d2,r14
	ld [sp],d0
	ld [sp,4],d1
	ld r14,#0x1
	ld [sp,8],r14
	ld [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d2
	ld i1,#0x0
	ld i2,i1
	ld i3,[zr,_scrWidth_4]
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_92
.line 144
	ld i0,d2
	call &__Z10setPaddingPN4MAUI6WidgetE_4
.line 146
	ld r14,[d1]
	ld d0,[r14]
	ld i0,d1
	ld i1,[zr,_softKeys_4]
	call d0
LBE26_4:
.line 149
	ld r14,d1
	add sp,#0x14
	pop rt,d3
	ret

//****************************************
// Function: __Z8saveDataPKcS0_
//****************************************

.func __Z8saveDataPKcS0__4, 2, void
.line 151
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i1
LBB27_4:
.line 152
	ld i1,#0x1
	syscall 64
	ld d1,r14
LBB29_4:
.line 153
	ld.b r0,[d0]
	xb r14,r0
	ld r0,#0x0
	jc eq,r14,r0,&L27_4
LBB30_4:
.line 155
	ld r14,#0x0
	jc le,d1,r14,&L23_4
LBB32_4:
.line 156
	syscall 58
	ld d2,r14
.line 157
	ld i0,d0
	call &_strlen_34
	ld i0,d2
	ld i1,r14
	syscall 57
	ld r0,#0x1
	jc eq,r14,r0,&L28_4
.line 161
	ld i0,d1
	ld i1,#0x0
L26_4:
	syscall 67
L23_4:
.line 164
	pop rt,d2
	ret
L27_4:
.line 154
	ld i0,d1
	ld i1,#0x1
LBB36_4:
.line 161
	syscall 67
	jp &L23_4
L28_4:
.line 158
	ld i0,d0
	call &_strlen_34
	ld i0,d2
	ld i1,d0
	ld i2,#0x0
	ld i3,r14
	syscall 62
.line 159
	ld i0,d1
	ld i1,d2
	syscall 65
.line 161
	ld i0,d1
	ld i1,#0x0
	jp &L26_4

//****************************************
// Function: __Z8saveFilePKci
//****************************************

.func __Z8saveFilePKci_4, 2, void
.line 167
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i1
LBB39_4:
.line 168
	ld i1,#0x1
	syscall 64
	ld d0,r14
.line 169
	ld r14,#0x0
	jc le,d0,r14,&L30_4
.line 170
	ld i0,d0
	ld i1,d1
	syscall 65
L30_4:
.line 172
	ld i0,d0
	ld i1,#0x0
	syscall 67
LBE40_4:
	pop rt,d1
	ret

//****************************************
// Function: __Z7getDataPKc
//****************************************

.func __Z7getDataPKc_4, 1, int
.line 176
	push rt,d4
	ld fr,sp
	add fr,#0x1c
LBB41_4:
.line 177
	ld i1,#0x0
	syscall 64
	ld d4,r14
.line 178
	syscall 58
	ld d3,r14
.line 192
	ld d0,&LC0_4
LBB43_4:
.line 179
	ld r14,#0x0
	jc le,d4,r14,&L31_4
LBB44_4:
.line 180
	ld i0,d4
	ld i1,d3
	syscall 66
.line 181
	ld i0,d3
	syscall 60
	ld d2,r14
LBB45_4:
.line 182
	ld r14,#0x0
	jc le,d2,r14,&L31_4
LBB46_4:
.line 183
	ld d1,d2
	add d1,#0x1
	ld i0,d1
	call &__Znam_20
	ld d0,r14
.line 184
	ld i0,r14
	ld i1,#0x0
	ld i2,d1
	syscall 4
.line 185
	ld i0,d3
	ld i1,d0
	ld i2,#0x0
	ld i3,d2
	syscall 61
.line 186
	ld i0,d4
	ld i1,#0x0
	syscall 67
L31_4:
.line 193
	ld r14,d0
	pop rt,d4
	ret

//****************************************
// Function: __Z11returnImagePN4MAUI5ImageEii
//****************************************

.func __Z11returnImagePN4MAUI5ImageEii_4, 3, void
.line 196
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d0,i1
LBB47_4:
.line 197
	syscall 58
	ld d2,r14
.line 198
	ld i0,d0
	syscall 60
	ld i0,d2
	ld i1,d0
	ld i2,#0x0
	ld i3,r14
	syscall 54
.line 199
	ld i0,d1
	ld i1,d2
	call &__ZN4MAUI5Image11setResourceEi_88
.line 200
	ld r14,[d1]
	ld d0,[r14,12]
	ld i0,d1
	call d0
.line 201
	ld i0,d1
	call &__ZN4MAUI6Widget14requestRepaintEv_95
.line 202
	syscall 44
LBE48_4:
.line 204
	pop rt,d2
	ret

//****************************************
// Function: __Z13retrieveThumbPN4MAUI5ImageEP4CardP10ImageCache
//****************************************

.func __Z13retrieveThumbPN4MAUI5ImageEP4CardP10ImageCache_4, 3, void
.line 208
	push rt,d5
	sub sp,#0x10
	ld fr,sp
	add fr,#0x30
	ld d5,i0
	ld d3,i1
	ld d4,i2
LBB49_4:
.line 209
	ld r0,#0x0
	jc eq,i1,r0,&L36_4
LBB51_4:
.line 212
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	call &__ZN4Card8getThumbEv_15
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i1,&LC1_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d2,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,#0xffffffff
	jc eq,d2,r14,&L42_4
LBB52_4:
.line 227
	ld i0,#0x10
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x0
	ld [sp],r14
	ld i0,d0
	ld i1,d5
	ld i2,d3
	ld i3,#0x40
	call &__ZN17ImageCacheRequestC1EPN4MAUI5ImageEP4Cardii_11
.line 228
	ld i0,d4
	ld i1,d0
	call &__ZN10ImageCache7requestEP17ImageCacheRequest_12
L36_4:
.line 230
	add sp,#0x10
	pop rt,d5
	ret
L42_4:
.line 213
	add d0,#0xfffffff8
	ld i0,d0
	ld i1,d3
	call &__ZN4Card8getThumbEv_15
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,#0x0
	syscall 64
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 214
	syscall 58
	ld d0,r14
LBB57_4:
.line 215
	ld r0,#0x0
	jc le,d1,r0,&L36_4
LBB58_4:
.line 217
	ld i0,d1
	ld i1,r14
	syscall 66
.line 218
	ld i0,d0
	syscall 60
.line 219
	ld r0,#0x0
	jc le,r14,r0,&L40_4
.line 220
	ld i0,d5
	ld i1,d0
	ld i2,#0x40
	call &__Z11returnImagePN4MAUI5ImageEii_4
L40_4:
.line 222
	ld i0,d1
	ld i1,#0x0
	syscall 67
LBE58_4:
.line 230
	add sp,#0x10
	pop rt,d5
	ret

//****************************************
// Function: __Z13retrieveFrontPN4MAUI5ImageEP4CardiP10ImageCache
//****************************************

.func __Z13retrieveFrontPN4MAUI5ImageEP4CardiP10ImageCache_4, 4, void
.line 235
	push rt,d6
	sub sp,#0x10
	ld fr,sp
	add fr,#0x34
	ld d5,i0
	ld d3,i1
	ld d6,i2
	ld d4,i3
LBB59_4:
.line 236
	ld r0,#0x0
	jc eq,i1,r0,&L43_4
LBB61_4:
.line 239
	ld d0,fr
	add d0,#0xffffffd8
	ld i0,d0
	call &__ZN4Card8getFrontEv_15
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,&LC1_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d2,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,#0xffffffff
	jc eq,d2,r14,&L49_4
LBB62_4:
.line 254
	ld i0,#0x10
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x1
	ld [sp],r14
	ld i0,d0
	ld i1,d5
	ld i2,d3
	ld i3,d6
	call &__ZN17ImageCacheRequestC1EPN4MAUI5ImageEP4Cardii_11
.line 255
	ld i0,d4
	ld i1,d0
	call &__ZN10ImageCache7requestEP17ImageCacheRequest_12
L43_4:
.line 257
	add sp,#0x10
	pop rt,d6
	ret
L49_4:
.line 240
	syscall 58
	ld d2,r14
.line 241
	add d0,#0xfffffff8
	ld i0,d0
	ld i1,d3
	call &__ZN4Card8getFrontEv_15
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,#0x0
	syscall 64
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 242
	ld r0,#0xfffffffb
	jc eq,d1,r0,&L43_4
.line 244
	ld i0,d1
	ld i1,d2
	syscall 66
.line 245
	ld i0,d1
	ld i1,#0x0
	syscall 67
.line 247
	ld i0,d2
	syscall 60
	ld r0,#0x0
	jc le,r14,r0,&L43_4
.line 248
	ld i0,d5
	ld i1,d2
	ld i2,d6
	call &__Z11returnImagePN4MAUI5ImageEii_4
	jp &L43_4

//****************************************
// Function: __Z12retrieveBackPN4MAUI5ImageEP4CardiP10ImageCache
//****************************************

.func __Z12retrieveBackPN4MAUI5ImageEP4CardiP10ImageCache_4, 4, void
.line 259
	push rt,d6
	sub sp,#0x10
	ld fr,sp
	add fr,#0x34
	ld d5,i0
	ld d3,i1
	ld d6,i2
	ld d4,i3
LBB67_4:
.line 260
	ld r0,#0x0
	jc eq,i1,r0,&L50_4
LBB69_4:
.line 263
	ld d0,fr
	add d0,#0xffffffd8
	ld i0,d0
	call &__ZN4Card7getBackEv_15
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,&LC1_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d2,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,#0xffffffff
	jc eq,d2,r14,&L56_4
LBB70_4:
.line 278
	ld i0,#0x10
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x2
	ld [sp],r14
	ld i0,d0
	ld i1,d5
	ld i2,d3
	ld i3,d6
	call &__ZN17ImageCacheRequestC1EPN4MAUI5ImageEP4Cardii_11
.line 279
	ld i0,d4
	ld i1,d0
	call &__ZN10ImageCache7requestEP17ImageCacheRequest_12
L50_4:
.line 281
	add sp,#0x10
	pop rt,d6
	ret
L56_4:
.line 264
	syscall 58
	ld d2,r14
.line 265
	add d0,#0xfffffff8
	ld i0,d0
	ld i1,d3
	call &__ZN4Card7getBackEv_15
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,#0x0
	syscall 64
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 266
	ld r0,#0xfffffffb
	jc eq,d1,r0,&L50_4
.line 268
	ld i0,d1
	ld i1,d2
	syscall 66
.line 269
	ld i0,d1
	ld i1,#0x0
	syscall 67
.line 271
	ld i0,d2
	syscall 60
	ld r0,#0x0
	jc le,r14,r0,&L50_4
.line 272
	ld i0,d5
	ld i1,d2
	ld i2,d6
	call &__Z11returnImagePN4MAUI5ImageEii_4
	jp &L50_4

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_4, 2, void
.line 281
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext1_4:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L93_4
L57_4:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Util.cpp'
.line 281
	add sp,#0x4
	pop rt,d0
	ret
L93_4:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L94_4
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L57_4
	ld i0,&_TRADE_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L95_4:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Util.cpp'
.line 281
	add sp,#0x4
	pop rt,d0
	ret
L94_4:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_4
	ld i1,&LC2_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_4
	ld i1,&LC3_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC4_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC5_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC6_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC7_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L95_4

//****************************************
// Function: __GLOBAL__I_gFontBlue
//****************************************

.func __GLOBAL__I_gFontBlue_4, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Util.cpp'
.line 282
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 282
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_4
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D_gFontBlue
//****************************************

.func __GLOBAL__D_gFontBlue_4, 0, void
.line 283
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 283
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_4
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_5, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_5, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_5, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_5, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_5, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_5, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreenC1EPN4MAUI6ScreenEP4FeedP4Card
//****************************************

.func __ZN18TradeOptionsScreenC1EPN4MAUI6ScreenEP4FeedP4Card_5, 4, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 8
	push rt,d4
	sub sp,#0x4
	ld fr,sp
	add fr,#0x20
	ld d0,i0
	ld d3,i1
	ld d1,i2
	ld d2,i3
LBB8_5:
.line 8
	call &__ZN4MAUI6ScreenC2Ev_94
LBB9_5:
	ld d4,d0
	add d4,#0xc
LBE9_5:
	ld r14,&__ZTV18TradeOptionsScreen_5+8
	ld [d0],r14
	ld r14,&__ZTV18TradeOptionsScreen_5+68
	ld [d0,4],r14
	ld r14,&__ZTV18TradeOptionsScreen_5+96
	ld [d4],r14
	ld [d0,16],d1
	ld [d0,36],d3
	ld [d0,40],d2
.line 9
	ld i0,#0xc
	call &__Znwm_21
	ld d1,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_94
	ld [d0,32],d1
.line 10
	ld i0,[zr,_back_5]
	ld i1,[zr,_select_5]
	ld i2,#0x0
	call &__Z16createMainLayoutPKcS0_b_4
	ld [d0,20],r14
LBB10_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB12_5:
	ld r14,[r14,8]
LBE12_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB13_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE13_5:
	ld r14,[r14]
	ld [d0,24],r14
Ltext8_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 12
	ld d2,fr
	add d2,#0xffffffe0
	ld i0,d2
	ld i1,[zr,_sendToFriendlbl_5]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d0,28],r14
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 13
	ld i0,[d0,28]
	ld i1,d4
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 14
	ld i0,[d0,24]
	ld r14,[i0]
	ld d1,[r14]
	ld i1,[d0,28]
	call d1
.line 15
	ld i0,d2
	ld i1,[zr,_redeemlbl_5]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d0,28],r14
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 16
	ld i0,[d0,28]
	ld i1,d4
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 17
	ld i0,[d0,24]
	ld r14,[i0]
	ld d1,[r14]
	ld i1,[d0,28]
	call d1
.line 18
	ld i0,[d0,24]
	ld i1,#0x0
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
.line 20
	ld i0,d0
	ld i1,[d0,20]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
LBE8_5:
	add sp,#0x4
	pop rt,d4
	ret

//****************************************
// Function: __ZThn4_N18TradeOptionsScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N18TradeOptionsScreen19pointerReleaseEventE9MAPoint2d_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeOptionsScreen.h'
.line 16
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 16
	add i0,#0xfffffffc
	call &__ZN18TradeOptionsScreen19pointerReleaseEventE9MAPoint2d_5
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN18TradeOptionsScreen19pointerReleaseEventE9MAPoint2d_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 51
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
LBB14_5:
.line 52
	ld.b r14,[i0,46]
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L25_5
.line 54
	ld.b r1,[i0,45]
	and r1,#0xff
	jc eq,r1,r14,&L20_5
.line 55
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 57
	call d0
L17_5:
.line 59
	pop rt,d0
	ret
L20_5:
.line 56
	ld.b r14,[i0,44]
	and r14,#0xff
	jc eq,r14,r1,&L17_5
.line 57
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L17_5
L25_5:
.line 53
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 57
	call d0
	jp &L17_5

//****************************************
// Function: __ZN18TradeOptionsScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN18TradeOptionsScreen10locateItemE9MAPoint2d_5, 3, void
.line 62
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
LBB16_5:
.line 63
	ld r0,#0x0
	ld.b [i0,44],r0
.line 64
	ld.b [i0,45],r0
.line 65
	ld.b [i0,46],r0
LBB18_5:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-28],i1
	ld [fr,-24],i2
LBE19_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 69
	ld d2,#0x0
LBB21_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB24_5:
	ld r14,[r14,8]
LBE24_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB25_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB26_5:
.line 258
	ld r14,[r14]
LBE26_5:
.line 359
	jc le,r14,d2,&L55_5
L42_5:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_5:
	ld r14,[r14,8]
LBE30_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB32_5:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE32_5:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L56_5
Ltext14_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 69
	add d2,#0x1
L58_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB36_5:
	ld r14,[r14,8]
LBE36_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB37_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE37_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB38_5:
.line 258
	ld r14,[r14]
LBE38_5:
.line 359
	jc gt,r14,d2,&L42_5
L55_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 77
	ld d2,#0x0
	jp &L43_5
L54_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB42_5:
	ld r14,[r14,8]
	add r14,#0x4
LBE42_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB43_5:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE43_5:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L57_5
Ltext18_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 77
	add d2,#0x1
L43_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB46_5:
	ld r14,[r14,8]
	add r14,#0x4
LBE46_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB47_5:
.line 258
	ld r14,[r14]
LBE47_5:
.line 359
	jc gt,r14,d2,&L54_5
L26_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 89
	add sp,#0x8
	pop rt,d2
	ret
L56_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB53_5:
	ld r14,[r14,8]
LBE53_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB54_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE54_5:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
Ltext22_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 74
	ld r14,#0x1
	ld.b [d1,44],r14
.line 69
	add d2,#0x1
	jp &L58_5
L57_5:
.line 81
	jc ne,d2,r0,&L51_5
.line 82
	ld r14,#0x1
	ld.b [d1,45],r14
LBE55_5:
.line 89
	add sp,#0x8
	pop rt,d2
	ret
L51_5:
.line 83
	ld r0,#0x2
	jc ne,d2,r0,&L26_5
.line 84
	ld r14,#0x1
	ld.b [d1,46],r14
	jp &L26_5

//****************************************
// Function: __ZThn4_N18TradeOptionsScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N18TradeOptionsScreen16pointerMoveEventE9MAPoint2d_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeOptionsScreen.h'
.line 16
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 16
	add i0,#0xfffffffc
	call &__ZN18TradeOptionsScreen16pointerMoveEventE9MAPoint2d_5
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN18TradeOptionsScreen16pointerMoveEventE9MAPoint2d_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 46
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB59_5:
.line 47
	call &__ZN18TradeOptionsScreen10locateItemE9MAPoint2d_5
LBE59_5:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N18TradeOptionsScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N18TradeOptionsScreen17pointerPressEventE9MAPoint2d_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeOptionsScreen.h'
.line 16
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 16
	add i0,#0xfffffffc
	call &__ZN18TradeOptionsScreen17pointerPressEventE9MAPoint2d_5
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN18TradeOptionsScreen17pointerPressEventE9MAPoint2d_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 41
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB60_5:
.line 42
	call &__ZN18TradeOptionsScreen10locateItemE9MAPoint2d_5
LBE60_5:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn12_N18TradeOptionsScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZThn12_N18TradeOptionsScreen16selectionChangedEPN4MAUI6WidgetEb_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeOptionsScreen.h'
.line 16
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 16
	add i0,#0xfffffff4
	call &__ZN18TradeOptionsScreen16selectionChangedEPN4MAUI6WidgetEb_5
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZN18TradeOptionsScreen16selectionChangedEPN4MAUI6WidgetEb_5, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 91
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i0,i1
LBB61_5:
.line 92
	and i2,#0xff
	ld r14,#0x0
	jc eq,i2,r14,&L65_5
.line 93
	ld i1,[zr,_gFontBlue_4]
.line 95
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE61_5:
.line 97
	pop rt,fr
	ret
L65_5:
.line 95
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE62_5:
.line 97
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreen13keyPressEventEi
//****************************************

.func __ZN18TradeOptionsScreen13keyPressEventEi_5, 2, void
.line 99
	push rt,d7
	sub sp,#0x28
	ld fr,sp
	add fr,#0x50
	ld d6,i0
LBB63_5:
.line 100
	case i1,#0x111,#0xd,#L85_5,#L68_5
.data
	.align 4
L85_5:
	.word L84_5
	.word L83_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L68_5
	.word L71_5
	.word L82_5
	.word L71_5


.code
L71_5:
.line 103
	ld i0,[i0,24]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
	ld [d6,48],r14
LBB67_5:
.line 104
	ld r0,#0x0
	jc ne,r14,r0,&L72_5
.line 105
	ld i0,[d6,32]
	jc eq,i0,r14,&L73_5
.line 106
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L73_5:
.line 108
	ld i0,#0x3c
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d6
	ld i2,[d6,16]
	ld i3,[d6,40]
	call &__ZN23TradeFriendDetailScreenC1EPN4MAUI6ScreenEP4FeedP4Card_6
	ld [d6,32],d0
.line 109
	ld r14,[d0]
	ld d1,[r14,28]
	ld i0,d0
	call d1
L68_5:
.line 129
	add sp,#0x28
	pop rt,d7
	ret
L83_5:
.line 123
	ld i0,[i0,24]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox14selectNextItemEb_92
LBE71_5:
.line 129
	add sp,#0x28
	pop rt,d7
	ret
L84_5:
.line 126
	ld i0,[i0,24]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox18selectPreviousItemEb_92
LBE75_5:
.line 129
	add sp,#0x28
	pop rt,d7
	ret
L82_5:
.line 120
	ld i0,[i0,36]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
LBE79_5:
.line 129
	add sp,#0x28
	pop rt,d7
	ret
L72_5:
.line 110
	ld r0,#0x1
	jc ne,r14,r0,&L68_5
LBB87_5:
.line 111
	ld d2,fr
	add d2,#0xffffffd0
	ld d3,fr
	add d3,#0xffffffcc
LBB88_5:
.sourcefile 'c:\MoSync\include\MAUtil\String.h'
.line 389
	ld d1,[zr,_sure_you_want_to_redeem_5]
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,[d6,40]
	call &__ZN4Card7getTextEv_15
LBB89_5:
	ld d4,fr
	add d4,#0xffffffc8
	ld d0,fr
	add d0,#0xffffffc0
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,d0
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE89_5:
	ld i0,d0
	ld i1,&LC6_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,d4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d7,fr
	add d7,#0xffffffbc
	ld i0,d7
	ld i1,[zr,_voucherlbl_5]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d3
	ld i2,d7
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d1,fr
	add d1,#0xffffffb8
	ld i0,d1
	ld i1,&LC7_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext30_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 112
	ld i0,[d6,32]
	ld r14,#0x0
	jc ne,i0,r14,&L86_5
L79_5:
.line 115
	ld i0,d1
	ld i1,#0xffffffd4
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d7
	ld i1,&LC8_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x8d0
	call &__Znwm_21
	ld d0,r14
	ld i2,[d6,16]
	ld i3,[d6,40]
	ld [sp],d1
	ld [sp,4],d7
	ld i0,r14
	ld i1,d6
	call &__ZN23TradeConfirmationScreenC1EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9__7
	ld [d6,32],d0
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 116
	ld i0,[d6,32]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L68_5
L86_5:
.line 113
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L79_5

//****************************************
// Function: __ZThn4_N18TradeOptionsScreenD0Ev
//****************************************

.func __ZThn4_N18TradeOptionsScreenD0Ev_5, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeOptionsScreen.h'
.line 16
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 16
	add i0,#0xfffffffc
	call &__ZN18TradeOptionsScreenD0Ev_5
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreenD0Ev
//****************************************

.func __ZN18TradeOptionsScreenD0Ev_5, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 23
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB90_5:
.line 23
	ld r0,&__ZTV18TradeOptionsScreen_5+8
	ld [i0],r0
	ld r2,&__ZTV18TradeOptionsScreen_5+68
	ld [i0,4],r2
	ld r14,&__ZTV18TradeOptionsScreen_5+96
	ld [i0,12],r14
LBB91_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,20]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB92_5:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L166_5
	ld r1,[d0]
L91_5:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L151_5
	ld i0,[d0,8]
L101_5:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L101_5
L151_5:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE95_5:
.line 306
	ld i0,[d1,24]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB101_5:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L167_5
	ld r1,[d0]
L105_5:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L155_5
	ld i0,[d0,8]
L115_5:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L115_5
L155_5:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE104_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 26
	ld i0,[d1,24]
	jc ne,i0,r14,&L168_5
.line 27
	ld i0,[d1,20]
	ld r0,#0x0
	jc ne,i0,r0,&L169_5
L121_5:
.line 28
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L170_5
L122_5:
.line 32
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L171_5
L125_5:
.line 37
	ld i0,[d1,28]
	ld r2,#0x0
	jc ne,i0,r2,&L172_5
L143_5:
.line 38
	ld i0,[d1,32]
	ld r14,#0x0
	jc ne,i0,r14,&L173_5
L145_5:
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE90_5:
.line 39
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret
L168_5:
.line 26
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 27
	ld i0,[d1,20]
	ld r0,#0x0
	jc eq,i0,r0,&L121_5
L169_5:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 28
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L122_5
L170_5:
.line 29
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 30
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 32
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L125_5
L171_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB111_5:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L174_5
	ld r1,[d0]
L127_5:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L159_5
	ld i0,[d0,8]
L137_5:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L137_5
L159_5:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE114_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 34
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L175_5
.line 35
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L178_5:
.line 37
	ld i0,[d1,28]
	ld r2,#0x0
	jc eq,i0,r2,&L143_5
L172_5:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 38
	ld i0,[d1,32]
	ld r14,#0x0
	jc eq,i0,r14,&L145_5
L173_5:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE109_5:
.line 39
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret
L167_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB128_5:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L163_5
	ld i0,[d0,8]
L109_5:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L109_5
L153_5:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L176_5
.line 300
	ld [d0,8],d2
	jp &L105_5
L166_5:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB137_5:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L161_5
	ld i0,[d0,8]
L95_5:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L95_5
L149_5:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L177_5
.line 300
	ld [d0,8],d2
	jp &L91_5
L175_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 34
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 35
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L178_5
L177_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L91_5
L176_5:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L105_5
L174_5:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d2,r14
LBB162_5:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L165_5
	ld i0,[d0,8]
L131_5:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L131_5
L157_5:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L179_5
.line 300
	ld [d0,8],d2
	jp &L127_5
L179_5:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L127_5
L163_5:
	ld i0,[d0,8]
	jp &L153_5
L161_5:
	ld i0,[d0,8]
	jp &L149_5
L165_5:
	ld i0,[d0,8]
	jp &L157_5

//****************************************
// Function: __ZThn4_N18TradeOptionsScreenD1Ev
//****************************************

.func __ZThn4_N18TradeOptionsScreenD1Ev_5, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeOptionsScreen.h'
.line 16
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 16
	add i0,#0xfffffffc
	call &__ZN18TradeOptionsScreenD1Ev_5
	pop rt,fr
	ret

//****************************************
// Function: __ZN18TradeOptionsScreenD1Ev
//****************************************

.func __ZN18TradeOptionsScreenD1Ev_5, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 23
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB163_5:
.line 23
	ld r0,&__ZTV18TradeOptionsScreen_5+8
	ld [i0],r0
	ld r2,&__ZTV18TradeOptionsScreen_5+68
	ld [i0,4],r2
	ld r14,&__ZTV18TradeOptionsScreen_5+96
	ld [i0,12],r14
LBB164_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,20]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB165_5:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L259_5
	ld r1,[d0]
L184_5:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L244_5
	ld i0,[d0,8]
L194_5:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L194_5
L244_5:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE168_5:
.line 306
	ld i0,[d1,24]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB174_5:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L260_5
	ld r1,[d0]
L198_5:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L248_5
	ld i0,[d0,8]
L208_5:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L208_5
L248_5:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE177_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 26
	ld i0,[d1,24]
	jc ne,i0,r14,&L261_5
.line 27
	ld i0,[d1,20]
	ld r0,#0x0
	jc ne,i0,r0,&L262_5
L214_5:
.line 28
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L263_5
L215_5:
.line 32
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L264_5
L218_5:
.line 37
	ld i0,[d1,28]
	ld r2,#0x0
	jc ne,i0,r2,&L265_5
L236_5:
.line 38
	ld i0,[d1,32]
	ld r14,#0x0
	jc ne,i0,r14,&L266_5
L238_5:
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE163_5:
.line 39
	pop rt,d2
	ret
L261_5:
.line 26
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 27
	ld i0,[d1,20]
	ld r0,#0x0
	jc eq,i0,r0,&L214_5
L262_5:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 28
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L215_5
L263_5:
.line 29
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 30
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 32
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L218_5
L264_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB184_5:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L267_5
	ld r1,[d0]
L220_5:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L252_5
	ld i0,[d0,8]
L230_5:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L230_5
L252_5:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE187_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 34
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L268_5
.line 35
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L271_5:
.line 37
	ld i0,[d1,28]
	ld r2,#0x0
	jc eq,i0,r2,&L236_5
L265_5:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 38
	ld i0,[d1,32]
	ld r14,#0x0
	jc eq,i0,r14,&L238_5
L266_5:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE182_5:
.line 39
	pop rt,d2
	ret
L260_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB201_5:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L256_5
	ld i0,[d0,8]
L202_5:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L202_5
L246_5:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L269_5
.line 300
	ld [d0,8],d2
	jp &L198_5
L259_5:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB210_5:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L254_5
	ld i0,[d0,8]
L188_5:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L188_5
L242_5:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L270_5
.line 300
	ld [d0,8],d2
	jp &L184_5
L268_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 34
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 35
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L271_5
L270_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L184_5
L269_5:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L198_5
L267_5:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d2,r14
LBB235_5:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L258_5
	ld i0,[d0,8]
L224_5:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L224_5
L250_5:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L272_5
.line 300
	ld [d0,8],d2
	jp &L220_5
L272_5:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L220_5
L256_5:
	ld i0,[d0,8]
	jp &L246_5
L254_5:
	ld i0,[d0,8]
	jp &L242_5
L258_5:
	ld i0,[d0,8]
	jp &L250_5

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_5, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 129
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext58_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L401_5
L365_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 129
	add sp,#0x4
	pop rt,d0
	ret
L401_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L402_5
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L365_5
	ld i0,&_TRADE_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L403_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 129
	add sp,#0x4
	pop rt,d0
	ret
L402_5:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_5
	ld i1,&LC9_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_5
	ld i1,&LC10_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC11_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC12_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC13_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC14_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L403_5

//****************************************
// Function: __GLOBAL__I__ZN18TradeOptionsScreenC2EPN4MAUI6ScreenEP4FeedP4Card
//****************************************

.func __GLOBAL__I__ZN18TradeOptionsScreenC2EPN4MAUI6ScreenEP4FeedP4Card_5, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeOptionsScreen.cpp'
.line 130
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 130
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_5
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN18TradeOptionsScreenC2EPN4MAUI6ScreenEP4FeedP4Card
//****************************************

.func __GLOBAL__D__ZN18TradeOptionsScreenC2EPN4MAUI6ScreenEP4FeedP4Card_5, 0, void
.line 131
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 131
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_5
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_6, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_6, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_6, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_6, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_6, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_6, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreenC1EPN4MAUI6ScreenEP4FeedP4Card
//****************************************

.func __ZN23TradeFriendDetailScreenC1EPN4MAUI6ScreenEP4FeedP4Card_6, 4, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 5
	push rt,d6
	sub sp,#0x30
	ld fr,sp
	add fr,#0x54
	ld d4,i0
	ld d2,i1
	ld d0,i2
	ld d1,i3
LBB11_6:
.line 6
	call &__ZN4MAUI6ScreenC2Ev_94
LBB12_6:
	ld d6,d4
	add d6,#0xc
LBE12_6:
	ld r0,&__ZTV23TradeFriendDetailScreen_6+8
	ld [d4],r0
	ld r14,&__ZTV23TradeFriendDetailScreen_6+68
	ld [d4,4],r14
	ld r0,&__ZTV23TradeFriendDetailScreen_6+96
	ld [d6],r0
	ld [d4,16],d0
	ld [d4,48],d2
	ld [d4,52],d1
LBB13_6:
.line 7
	ld i0,#0xc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_94
	ld [d4,44],d0
.line 8
	ld i0,[zr,_back_6]
	ld i1,[zr,_continuelbl_6]
	ld i2,#0x0
	call &__Z16createMainLayoutPKcS0_b_4
	ld [d4,20],r14
LBB14_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB16_6:
	ld r14,[r14,8]
LBE16_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB17_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE17_6:
	ld r14,[r14]
	ld [d4,24],r14
Ltext8_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 11
	ld i0,[d4,20]
	ld i1,#0x1
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_95
.line 13
	ld d5,fr
	add d5,#0xffffffd8
	ld i0,d5
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	ld r14,[zr,_scrHeight_4]
	ld r0,#0x0
	jc lt,r14,r0,&L20_6
L19_6:
	sra r14,#0x3
	ld [sp],r14
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d5
	ld [sp,12],r14
	ld r0,[zr,_gFontWhite_4]
	ld [sp,16],r0
	ld i0,d0
	ld i1,r14
	ld i2,r14
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d4,36],d0
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 14
	ld i0,[d4,36]
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d0
.line 15
	ld i0,[d4,36]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_90
.line 16
	ld i0,d5
	ld i1,[zr,_phoneNumlbl_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 17
	ld d0,fr
	add d0,#0xffffffd4
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i1,&LC7_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d5
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0x9c
	call &__Znwm_21
	ld d2,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld r14,#0x18
	ld [sp],r14
	ld r0,#0x0
	ld [sp,4],r0
	ld [sp,8],d0
	ld [sp,12],r0
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d2
	ld i1,r0
	ld i2,r0
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d4,28],d2
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 18
	ld i0,[d4,28]
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d0
.line 20
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,#0x30
	call &__Z15createEditLabelN6MAUtil11BasicStringIcEEi_4
	ld [d4,32],r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 21
	ld i0,[d4,32]
	call &__ZNK4MAUI6Widget8getWidthEv_95
	ld d3,r14
	add d3,#0xfffffff6
	ld i0,[d4,32]
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,r14
	add d0,#0xfffffff6
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xd4
	call &__Znwm_21
	ld d2,r14
	ld [sp],d0
	ld r0,[d4,32]
	ld [sp,4],r0
	ld [sp,8],d1
	ld r14,#0x0
	ld [sp,12],r14
	ld r0,[zr,_gFontBlue_4]
	ld [sp,16],r0
	ld r14,#0x1
	ld.b [sp,20],r14
	ld r0,#0x0
	ld.b [sp,24],r0
	ld r14,#0x40
	ld [sp,28],r14
	ld r0,#0x1
	ld [sp,32],r0
	ld i0,d2
	ld i1,#0x0
	ld i2,#0x6
	ld i3,d3
	call &__ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE_85
	ld [d4,40],d2
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 22
	ld i0,[d4,40]
	ld i1,#0x0
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_85
.line 23
	ld i0,[d4,40]
	ld i1,#0x0
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_95
.line 24
	ld i0,[d4,32]
	ld i1,d6
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 26
	ld i0,[d4,24]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d4,28]
	call d0
.line 27
	ld i0,[d4,24]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d4,32]
	call d0
.line 28
	ld i0,[d4,24]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d4,36]
	call d0
.line 30
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d4,40]
	ld i1,d1
	call &__ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_85
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 32
	ld i0,d4
	ld i1,[d4,20]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
.line 34
	ld i0,[d4,40]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE13_6:
	add sp,#0x30
	pop rt,d6
	ret
L20_6:
.line 13
	add r14,#0x7
	jp &L19_6

//****************************************
// Function: __ZThn4_N23TradeFriendDetailScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N23TradeFriendDetailScreen19pointerReleaseEventE9MAPoint2d_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeFriendDetailScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeFriendDetailScreen19pointerReleaseEventE9MAPoint2d_6
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN23TradeFriendDetailScreen19pointerReleaseEventE9MAPoint2d_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 68
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
LBB20_6:
.line 69
	ld.b r14,[i0,58]
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L29_6
.line 71
	ld.b r1,[i0,57]
	and r1,#0xff
	jc eq,r1,r14,&L25_6
.line 72
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 74
	call d0
L22_6:
.line 76
	pop rt,d0
	ret
L25_6:
.line 73
	ld.b r14,[i0,56]
	and r14,#0xff
	jc eq,r14,r1,&L22_6
.line 74
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L22_6
L29_6:
.line 70
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 74
	call d0
	jp &L22_6

//****************************************
// Function: __ZN23TradeFriendDetailScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN23TradeFriendDetailScreen10locateItemE9MAPoint2d_6, 3, void
.line 79
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
LBB22_6:
.line 80
	ld r0,#0x0
	ld.b [i0,56],r0
.line 81
	ld.b [i0,57],r0
.line 82
	ld.b [i0,58],r0
LBB24_6:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-28],i1
	ld [fr,-24],i2
LBE25_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 86
	ld d2,#0x0
LBB27_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_6:
	ld r14,[r14,8]
LBE30_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB32_6:
.line 258
	ld r14,[r14]
LBE32_6:
.line 359
	jc le,r14,d2,&L59_6
L46_6:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB36_6:
	ld r14,[r14,8]
LBE36_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB37_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE37_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB38_6:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE38_6:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L60_6
Ltext14_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 86
	add d2,#0x1
L62_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB42_6:
	ld r14,[r14,8]
LBE42_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB43_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE43_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB44_6:
.line 258
	ld r14,[r14]
LBE44_6:
.line 359
	jc gt,r14,d2,&L46_6
L59_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 94
	ld d2,#0x0
	jp &L47_6
L58_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB48_6:
	ld r14,[r14,8]
	add r14,#0x4
LBE48_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB49_6:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE49_6:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L61_6
Ltext18_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 94
	add d2,#0x1
L47_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB52_6:
	ld r14,[r14,8]
	add r14,#0x4
LBE52_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB53_6:
.line 258
	ld r14,[r14]
LBE53_6:
.line 359
	jc gt,r14,d2,&L58_6
L30_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 106
	add sp,#0x8
	pop rt,d2
	ret
L60_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB59_6:
	ld r14,[r14,8]
LBE59_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB60_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE60_6:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
Ltext22_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 91
	ld r14,#0x1
	ld.b [d1,56],r14
.line 86
	add d2,#0x1
	jp &L62_6
L61_6:
.line 98
	jc ne,d2,r0,&L55_6
.line 99
	ld r14,#0x1
	ld.b [d1,57],r14
LBE61_6:
.line 106
	add sp,#0x8
	pop rt,d2
	ret
L55_6:
.line 100
	ld r0,#0x2
	jc ne,d2,r0,&L30_6
.line 101
	ld r14,#0x1
	ld.b [d1,58],r14
	jp &L30_6

//****************************************
// Function: __ZThn4_N23TradeFriendDetailScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N23TradeFriendDetailScreen16pointerMoveEventE9MAPoint2d_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeFriendDetailScreen.h'
.line 17
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeFriendDetailScreen16pointerMoveEventE9MAPoint2d_6
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN23TradeFriendDetailScreen16pointerMoveEventE9MAPoint2d_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 63
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB65_6:
.line 64
	call &__ZN23TradeFriendDetailScreen10locateItemE9MAPoint2d_6
LBE65_6:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N23TradeFriendDetailScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N23TradeFriendDetailScreen17pointerPressEventE9MAPoint2d_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeFriendDetailScreen.h'
.line 17
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeFriendDetailScreen17pointerPressEventE9MAPoint2d_6
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN23TradeFriendDetailScreen17pointerPressEventE9MAPoint2d_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 58
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB66_6:
.line 59
	call &__ZN23TradeFriendDetailScreen10locateItemE9MAPoint2d_6
LBE66_6:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn12_N23TradeFriendDetailScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZThn12_N23TradeFriendDetailScreen16selectionChangedEPN4MAUI6WidgetEb_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeFriendDetailScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffff4
	call &__ZN23TradeFriendDetailScreen16selectionChangedEPN4MAUI6WidgetEb_6
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZN23TradeFriendDetailScreen16selectionChangedEPN4MAUI6WidgetEb_6, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 109
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i0,i1
LBB67_6:
.line 110
	and i2,#0xff
	ld r14,#0x0
	jc eq,i2,r14,&L69_6
.line 111
	ld i1,[zr,_gFontBlue_4]
.line 113
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE67_6:
.line 115
	pop rt,fr
	ret
L69_6:
.line 113
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE68_6:
.line 115
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreen13keyPressEventEi
//****************************************

.func __ZN23TradeFriendDetailScreen13keyPressEventEi_6, 2, void
.line 117
	push rt,d7
	sub sp,#0x38
	ld fr,sp
	add fr,#0x60
	ld d7,i0
LBB69_6:
.line 118
	case i1,#0x111,#0xd,#L85_6,#L72_6
.data
	.align 4
L85_6:
	.word L84_6
	.word L84_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L72_6
	.word L84_6
	.word L82_6
	.word L75_6


.code
L84_6:
.line 145
	ld i0,[i0,40]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
L72_6:
.line 149
	add sp,#0x38
	pop rt,d7
	ret
L75_6:
.line 124
	ld i0,[i0,40]
	call &__ZNK4MAUI7EditBox7getTextEv_85
	ld d0,r14
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d1
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld d4,d0
	and d4,#0xff
	ld r14,#0x0
	jc ne,d4,r14,&L87_6
LBB78_6:
.line 129
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d7,36]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffffc0
	add i1,fr
	call d0
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 130
	ld d2,fr
	add d2,#0xffffffc4
	ld d3,fr
	add d3,#0xffffffc8
LBB79_6:
.sourcefile 'c:\MoSync\include\MAUtil\String.h'
.line 389
	ld d0,[zr,_sure_you_want_to_send_6]
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,[d7,52]
	call &__ZN4Card7getTextEv_15
LBB80_6:
	ld d1,fr
	add d1,#0xffffffb4
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,d1
	ld i2,#0xffffffb8
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE80_6:
	ld i0,d1
	ld i1,[zr,_friend_with_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,#0xffffffbc
	add i1,fr
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,[zr,_phoneNumlbl_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,#0xffffffb0
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d5,fr
	add d5,#0xffffffac
	ld i0,d5
	ld i1,&LC9_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,#0xffffffcc
	add i1,fr
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,[d7,40]
	call &__ZNK4MAUI7EditBox7getTextEv_85
	ld i0,d2
	ld i1,d3
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d6,fr
	add d6,#0xffffffa8
	ld i0,d6
	ld i1,&LC10_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,d2
	ld i2,d6
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext30_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 131
	ld i0,[d7,44]
	jc eq,i0,d4,&L79_6
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L79_6:
.line 134
	ld i0,[d7,40]
	call &__ZNK4MAUI7EditBox7getTextEv_85
	ld i0,d6
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
.line 135
	ld i0,d6
	ld i1,&LC11_6
	ld i2,#0x8
	call &__ZN6MAUtil11BasicStringIcE6appendEPKci_81
.line 136
	ld i0,d5
	ld i1,#0xffffffc0
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0x8d0
	call &__Znwm_21
	ld d0,r14
	ld i2,[d7,16]
	ld i3,[d7,52]
	ld [sp],d5
	ld r14,#0xffffffb0
	add r14,fr
	ld [sp,4],r14
	ld i0,d0
	ld i1,d7
	call &__ZN23TradeConfirmationScreenC1EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9__7
	ld [d7,44],d0
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 137
	ld i0,[d7,44]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L88_6:
.line 149
	add sp,#0x38
	pop rt,d7
	ret
L82_6:
.line 141
	ld i0,[i0,48]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
LBE84_6:
.line 149
	add sp,#0x38
	pop rt,d7
	ret
L87_6:
.line 125
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,[zr,_no_contact_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 126
	ld d2,fr
	add d2,#0xffffffcc
	ld d3,fr
	add d3,#0xffffffc8
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,[zr,_phoneNumlbl_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,#0xffffffc4
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	add d1,#0xffffffec
	ld i0,d1
	ld i1,&LC8_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d3
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,[d7,36]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d2
	call d0
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd0
LBE90_6:
.line 137
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L88_6

//****************************************
// Function: __ZThn4_N23TradeFriendDetailScreenD0Ev
//****************************************

.func __ZThn4_N23TradeFriendDetailScreenD0Ev_6, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeFriendDetailScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeFriendDetailScreenD0Ev_6
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreenD0Ev
//****************************************

.func __ZN23TradeFriendDetailScreenD0Ev_6, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 37
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB92_6:
.line 37
	ld r0,&__ZTV23TradeFriendDetailScreen_6+8
	ld [i0],r0
	ld r2,&__ZTV23TradeFriendDetailScreen_6+68
	ld [i0,4],r2
	ld r14,&__ZTV23TradeFriendDetailScreen_6+96
	ld [i0,12],r14
LBB93_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,20]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB94_6:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L172_6
	ld r1,[d0]
L93_6:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L157_6
	ld i0,[d0,8]
L103_6:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L103_6
L157_6:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE97_6:
.line 306
	ld i0,[d1,24]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB103_6:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L173_6
	ld r1,[d0]
L107_6:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L161_6
	ld i0,[d0,8]
L117_6:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L117_6
L161_6:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE106_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 41
	ld i0,[d1,24]
	jc ne,i0,r14,&L174_6
.line 42
	ld i0,[d1,20]
	ld r0,#0x0
	jc ne,i0,r0,&L175_6
L123_6:
.line 43
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L176_6
L124_6:
.line 47
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L177_6
L127_6:
.line 52
	ld i0,[d1,28]
	ld r2,#0x0
	jc ne,i0,r2,&L178_6
L145_6:
.line 53
	ld i0,[d1,32]
	ld r14,#0x0
	jc ne,i0,r14,&L179_6
L147_6:
.line 54
	ld i0,[d1,36]
	ld r0,#0x0
	jc ne,i0,r0,&L180_6
L149_6:
.line 55
	ld i0,[d1,44]
	ld r2,#0x0
	jc ne,i0,r2,&L181_6
L151_6:
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE92_6:
.line 56
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret
L174_6:
.line 41
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 42
	ld i0,[d1,20]
	ld r0,#0x0
	jc eq,i0,r0,&L123_6
L175_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 43
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L124_6
L176_6:
.line 44
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 45
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 47
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L127_6
L177_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB113_6:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L182_6
	ld r1,[d0]
L129_6:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L165_6
	ld i0,[d0,8]
L139_6:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L139_6
L165_6:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE116_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 49
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L183_6
.line 50
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L186_6:
.line 52
	ld i0,[d1,28]
	ld r2,#0x0
	jc eq,i0,r2,&L145_6
L178_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld i0,[d1,32]
	ld r14,#0x0
	jc eq,i0,r14,&L147_6
L179_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 54
	ld i0,[d1,36]
	ld r0,#0x0
	jc eq,i0,r0,&L149_6
L180_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 55
	ld i0,[d1,44]
	ld r2,#0x0
	jc eq,i0,r2,&L151_6
L181_6:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE111_6:
.line 56
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret
L173_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB130_6:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L169_6
	ld i0,[d0,8]
L111_6:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L111_6
L159_6:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L184_6
.line 300
	ld [d0,8],d2
	jp &L107_6
L172_6:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB139_6:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L167_6
	ld i0,[d0,8]
L97_6:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L97_6
L155_6:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L185_6
.line 300
	ld [d0,8],d2
	jp &L93_6
L183_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 49
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 50
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L186_6
L185_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L93_6
L184_6:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L107_6
L182_6:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d2,r14
LBB164_6:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L171_6
	ld i0,[d0,8]
L133_6:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L133_6
L163_6:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L187_6
.line 300
	ld [d0,8],d2
	jp &L129_6
L187_6:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L129_6
L169_6:
	ld i0,[d0,8]
	jp &L159_6
L167_6:
	ld i0,[d0,8]
	jp &L155_6
L171_6:
	ld i0,[d0,8]
	jp &L163_6

//****************************************
// Function: __ZThn4_N23TradeFriendDetailScreenD1Ev
//****************************************

.func __ZThn4_N23TradeFriendDetailScreenD1Ev_6, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeFriendDetailScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeFriendDetailScreenD1Ev_6
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeFriendDetailScreenD1Ev
//****************************************

.func __ZN23TradeFriendDetailScreenD1Ev_6, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 37
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB165_6:
.line 37
	ld r0,&__ZTV23TradeFriendDetailScreen_6+8
	ld [i0],r0
	ld r2,&__ZTV23TradeFriendDetailScreen_6+68
	ld [i0,4],r2
	ld r14,&__ZTV23TradeFriendDetailScreen_6+96
	ld [i0,12],r14
LBB166_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,20]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB167_6:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L271_6
	ld r1,[d0]
L192_6:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L256_6
	ld i0,[d0,8]
L202_6:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L202_6
L256_6:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE170_6:
.line 306
	ld i0,[d1,24]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB176_6:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L272_6
	ld r1,[d0]
L206_6:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L260_6
	ld i0,[d0,8]
L216_6:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L216_6
L260_6:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE179_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 41
	ld i0,[d1,24]
	jc ne,i0,r14,&L273_6
.line 42
	ld i0,[d1,20]
	ld r0,#0x0
	jc ne,i0,r0,&L274_6
L222_6:
.line 43
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L275_6
L223_6:
.line 47
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L276_6
L226_6:
.line 52
	ld i0,[d1,28]
	ld r2,#0x0
	jc ne,i0,r2,&L277_6
L244_6:
.line 53
	ld i0,[d1,32]
	ld r14,#0x0
	jc ne,i0,r14,&L278_6
L246_6:
.line 54
	ld i0,[d1,36]
	ld r0,#0x0
	jc ne,i0,r0,&L279_6
L248_6:
.line 55
	ld i0,[d1,44]
	ld r2,#0x0
	jc ne,i0,r2,&L280_6
L250_6:
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE165_6:
.line 56
	pop rt,d2
	ret
L273_6:
.line 41
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 42
	ld i0,[d1,20]
	ld r0,#0x0
	jc eq,i0,r0,&L222_6
L274_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 43
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L223_6
L275_6:
.line 44
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 45
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 47
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L226_6
L276_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB186_6:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L281_6
	ld r1,[d0]
L228_6:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L264_6
	ld i0,[d0,8]
L238_6:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L238_6
L264_6:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE189_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 49
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L282_6
.line 50
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L285_6:
.line 52
	ld i0,[d1,28]
	ld r2,#0x0
	jc eq,i0,r2,&L244_6
L277_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld i0,[d1,32]
	ld r14,#0x0
	jc eq,i0,r14,&L246_6
L278_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 54
	ld i0,[d1,36]
	ld r0,#0x0
	jc eq,i0,r0,&L248_6
L279_6:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 55
	ld i0,[d1,44]
	ld r2,#0x0
	jc eq,i0,r2,&L250_6
L280_6:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE184_6:
.line 56
	pop rt,d2
	ret
L272_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB203_6:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L268_6
	ld i0,[d0,8]
L210_6:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L210_6
L258_6:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L283_6
.line 300
	ld [d0,8],d2
	jp &L206_6
L271_6:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d2,r14
LBB212_6:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L266_6
	ld i0,[d0,8]
L196_6:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L196_6
L254_6:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L284_6
.line 300
	ld [d0,8],d2
	jp &L192_6
L282_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 49
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 50
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L285_6
L284_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L192_6
L283_6:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L206_6
L281_6:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d2,r14
LBB237_6:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L270_6
	ld i0,[d0,8]
L232_6:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L232_6
L262_6:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L286_6
.line 300
	ld [d0,8],d2
	jp &L228_6
L286_6:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L228_6
L268_6:
	ld i0,[d0,8]
	jp &L258_6
L266_6:
	ld i0,[d0,8]
	jp &L254_6
L270_6:
	ld i0,[d0,8]
	jp &L262_6

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_6, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 149
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext58_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L421_6
L385_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 149
	add sp,#0x4
	pop rt,d0
	ret
L421_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L422_6
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L385_6
	ld i0,&_TRADE_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L423_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 149
	add sp,#0x4
	pop rt,d0
	ret
L422_6:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_6
	ld i1,&LC12_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_6
	ld i1,&LC13_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC14_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC15_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC16_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC17_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L423_6

//****************************************
// Function: __GLOBAL__I__ZN23TradeFriendDetailScreenC2EPN4MAUI6ScreenEP4FeedP4Card
//****************************************

.func __GLOBAL__I__ZN23TradeFriendDetailScreenC2EPN4MAUI6ScreenEP4FeedP4Card_6, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeFriendDetailScreen.cpp'
.line 150
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 150
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_6
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN23TradeFriendDetailScreenC2EPN4MAUI6ScreenEP4FeedP4Card
//****************************************

.func __GLOBAL__D__ZN23TradeFriendDetailScreenC2EPN4MAUI6ScreenEP4FeedP4Card_6, 0, void
.line 151
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 151
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_6
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_7, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener16selectionChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener16selectionChangedEPNS_6WidgetEb_7, 3, void
.line 63
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 63
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_7, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_7, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_7, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_7, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_7, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreenC1EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9_
//****************************************

.func __ZN23TradeConfirmationScreenC1EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9__7, 6, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 8
	push rt,d3
	sub sp,#0x14
	ld fr,sp
	add fr,#0x2c
	ld d0,i0
	ld d3,i1
	ld d1,i2
	ld d2,i3
LBB8_7:
.line 8
	call &__ZN4MAUI6ScreenC2Ev_94
LBB9_7:
	ld i1,d0
	add i1,#0x10
LBE9_7:
	ld r14,&__ZTV23TradeConfirmationScreen_7+8
	ld [d0],r14
	ld r14,&__ZTV23TradeConfirmationScreen_7+108
	ld [d0,4],r14
	ld r14,&__ZTV23TradeConfirmationScreen_7+136
	ld [d0,12],r14
	ld r14,&__ZTV23TradeConfirmationScreen_7+160
	ld [i1],r14
	ld r14,&__ZTV23TradeConfirmationScreen_7+188
	ld [d0,20],r14
	ld r14,&__ZTV23TradeConfirmationScreen_7+200
	ld [d0,24],r14
	ld [d0,28],d1
	ld [d0,48],d3
	ld [d0,52],d2
	ld i0,d0
	add i0,#0x3c
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_62
	ld i0,d0
	add i0,#0x64
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d0
	add i0,#0x8b8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d0
	add i0,#0x8bc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d0
	add i0,#0x8c0
	ld i1,[fr,4]
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x8c4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d0
	add i0,#0x8c8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d0
	add i0,#0x8cc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
.line 9
	ld r14,#0x0
	ld.b [d0,59],r14
.line 10
	ld i0,#0xc
	call &__Znwm_21
	ld d1,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_94
	ld [d0,44],d1
.line 12
	ld i0,[zr,_back_7]
	ld i1,[zr,_confirm_7]
	ld i2,#0x0
	call &__Z16createMainLayoutPKcS0_b_4
	ld [d0,32],r14
LBB10_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d2,#0x0
LBB12_7:
	ld r14,[r14,8]
LBE12_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB13_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE13_7:
	ld r14,[r14]
	ld [d0,36],r14
Ltext8_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 14
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld r14,#0x64
	ld [sp],r14
	ld [sp,4],d2
	ld r14,[fr]
	ld [sp,8],r14
	ld [sp,12],d2
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d1
	ld i1,d2
	ld i2,d2
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d0,40],d1
.line 15
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_90
.line 16
	ld i0,[d0,40]
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 17
	ld i0,[d0,40]
	ld r14,[i0]
	ld d1,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d1
.line 18
	ld i0,[d0,40]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_90
.line 19
	ld i0,[d0,36]
	ld r14,[i0]
	ld d1,[r14]
	ld i1,[d0,40]
	call d1
.line 21
	ld i0,d0
	ld i1,[d0,32]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
LBE8_7:
	add sp,#0x14
	pop rt,d3
	ret

//****************************************
// Function: __ZThn4_N23TradeConfirmationScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N23TradeConfirmationScreen19pointerReleaseEventE9MAPoint2d_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeConfirmationScreen19pointerReleaseEventE9MAPoint2d_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN23TradeConfirmationScreen19pointerReleaseEventE9MAPoint2d_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 59
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
LBB14_7:
.line 60
	ld.b r14,[i0,58]
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L35_7
.line 62
	ld.b r1,[i0,57]
	and r1,#0xff
	jc eq,r1,r14,&L30_7
.line 63
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 65
	call d0
L27_7:
.line 67
	pop rt,d0
	ret
L30_7:
.line 64
	ld.b r14,[i0,56]
	and r14,#0xff
	jc eq,r14,r1,&L27_7
.line 65
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L27_7
L35_7:
.line 61
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 65
	call d0
	jp &L27_7

//****************************************
// Function: __ZN23TradeConfirmationScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN23TradeConfirmationScreen10locateItemE9MAPoint2d_7, 3, void
.line 70
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
LBB16_7:
.line 71
	ld r0,#0x0
	ld.b [i0,56],r0
.line 72
	ld.b [i0,57],r0
.line 73
	ld.b [i0,58],r0
LBB18_7:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-28],i1
	ld [fr,-24],i2
LBE19_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 77
	ld d2,#0x0
LBB21_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB24_7:
	ld r14,[r14,8]
LBE24_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB25_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB26_7:
.line 258
	ld r14,[r14]
LBE26_7:
.line 359
	jc le,r14,d2,&L65_7
L52_7:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_7:
	ld r14,[r14,8]
LBE30_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB32_7:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE32_7:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L66_7
Ltext14_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 77
	add d2,#0x1
L68_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB36_7:
	ld r14,[r14,8]
LBE36_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB37_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE37_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB38_7:
.line 258
	ld r14,[r14]
LBE38_7:
.line 359
	jc gt,r14,d2,&L52_7
L65_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 85
	ld d2,#0x0
	jp &L53_7
L64_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB42_7:
	ld r14,[r14,8]
	add r14,#0x4
LBE42_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB43_7:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE43_7:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L67_7
Ltext18_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 85
	add d2,#0x1
L53_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB46_7:
	ld r14,[r14,8]
	add r14,#0x4
LBE46_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB47_7:
.line 258
	ld r14,[r14]
LBE47_7:
.line 359
	jc gt,r14,d2,&L64_7
L36_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 97
	add sp,#0x8
	pop rt,d2
	ret
L66_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB53_7:
	ld r14,[r14,8]
LBE53_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB54_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE54_7:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
Ltext22_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 82
	ld r14,#0x1
	ld.b [d1,56],r14
.line 77
	add d2,#0x1
	jp &L68_7
L67_7:
.line 89
	jc ne,d2,r0,&L61_7
.line 90
	ld r14,#0x1
	ld.b [d1,57],r14
LBE55_7:
.line 97
	add sp,#0x8
	pop rt,d2
	ret
L61_7:
.line 91
	ld r0,#0x2
	jc ne,d2,r0,&L36_7
.line 92
	ld r14,#0x1
	ld.b [d1,58],r14
	jp &L36_7

//****************************************
// Function: __ZThn4_N23TradeConfirmationScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N23TradeConfirmationScreen16pointerMoveEventE9MAPoint2d_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeConfirmationScreen16pointerMoveEventE9MAPoint2d_7
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN23TradeConfirmationScreen16pointerMoveEventE9MAPoint2d_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 54
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB59_7:
.line 55
	call &__ZN23TradeConfirmationScreen10locateItemE9MAPoint2d_7
LBE59_7:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N23TradeConfirmationScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N23TradeConfirmationScreen17pointerPressEventE9MAPoint2d_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeConfirmationScreen17pointerPressEventE9MAPoint2d_7
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN23TradeConfirmationScreen17pointerPressEventE9MAPoint2d_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 49
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB60_7:
.line 50
	call &__ZN23TradeConfirmationScreen10locateItemE9MAPoint2d_7
LBE60_7:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen13keyPressEventEi
//****************************************

.func __ZN23TradeConfirmationScreen13keyPressEventEi_7, 2, void
.line 99
	push rt,d5
	sub sp,#0x18
	ld fr,sp
	add fr,#0x38
	ld d4,i0
LBB61_7:
.line 100
	ld r0,#0x11d
	jc eq,i1,r0,&L79_7
	ld r14,#0x11e
	jc eq,i1,r14,&L80_7
L73_7:
.line 130
	add sp,#0x18
	pop rt,d5
	ret
L80_7:
.line 102
	ld.b d5,[i0,59]
	and d5,#0xff
	ld r0,#0x0
	jc ne,d5,r0,&L73_7
LBB69_7:
.line 104
	ld r14,#0x1
	ld.b [i0,59],r14
.line 106
	ld d1,fr
	add d1,#0xffffffdc
	ld i0,d1
	ld i1,[zr,_sending_card_message_7]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d4,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 108
	ld i0,#0xff
	call &__Znam_20
	ld d0,r14
.line 109
	ld i0,r14
	ld i1,d5
	ld i2,#0xff
	syscall 4
.line 110
	ld i0,&_TRADE_7
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d3,r14
	ld i0,d4
	add i0,#0x8c0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d2,r14
	ld i0,d1
	ld i1,[d4,52]
	call &__ZN4Card5getIdEv_15
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld [sp],d3
	ld r0,[zr,_trade_by_detail_7]
	ld [sp,4],r0
	ld [sp,8],d2
	ld r0,[zr,_trade_cardid_7]
	ld [sp,12],r0
	ld [sp,16],r14
	ld i0,d0
	ld i1,&LC8_7
	call &_sprintf_37
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 112
	ld [sp],d0
	ld i0,&LC9_7
	call &_lprintfln_37
.line 113
	ld d2,d4
	add d2,#0x3c
	ld i0,d2
	ld i1,d0
	ld i2,#0x1
	call &__ZN6MAUtil14HttpConnection6createEPKci_62
	ld d0,r14
.line 115
	ld i0,d1
	ld i1,[d4,28]
	call &__ZN4Feed11getUsernameEv_14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,[zr,_auth_user_7]
	ld i2,r14
	call &__ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2__62
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 116
	ld i0,d1
	ld i1,[d4,28]
	call &__ZN4Feed10getEncryptEv_14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,[zr,_auth_pw_7]
	ld i2,r14
	call &__ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2__62
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 118
	jc lt,d0,d5,&L73_7
.line 121
	ld i0,d2
	call &__ZN6MAUtil14HttpConnection6finishEv_62
	jp &L73_7
L79_7:
.line 127
	ld i0,[i0,48]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
LBE67_7:
.line 130
	add sp,#0x18
	pop rt,d5
	ret

//****************************************
// Function: __ZThn16_N23TradeConfirmationScreen12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZThn16_N23TradeConfirmationScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffff0
	call &__ZN23TradeConfirmationScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZN23TradeConfirmationScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 132
	push rt,d3
	sub sp,#0x858
	ld fr,sp
	add fr,#0x870
	ld d2,i0
	ld d3,i1
LBB70_7:
.line 133
	ld r14,#0xc8
	jc eq,i2,r14,&L88_7
.line 139
	add i0,#0x3c
	call &__ZN6MAUtil10Connection5closeEv_62
LBE70_7:
.line 141
	add sp,#0x858
	pop rt,d3
	ret
L88_7:
.line 134
	ld r14,#0x0
	ld.b [i0,59],r14
LBB72_7:
.line 136
	ld d0,i0
	add d0,#0x64
	ld d1,fr
	add d1,#0xfffff794
	ld i0,d1
	call &__ZN13XmlConnectionC1Ev_3
LBB73_7:
	ld i0,d2
	add i0,#0x6c
	ld i1,fr
	add i1,#0xfffff79c
	ld i2,#0x3c
	syscall 5
	ld r14,[fr,-2088]
	ld [d0,68],r14
	ld r14,[fr,-2084]
	ld [d0,72],r14
	ld i0,d2
	add i0,#0xb0
	ld i1,fr
	add i1,#0xfffff7e0
	ld i2,#0x800
	syscall 5
	ld r14,[fr,-32]
	ld [d0,2124],r14
	ld r14,[fr,-28]
	ld [d0,2128],r14
LBE73_7:
	ld i0,d1
	call &__ZN13XmlConnectionD1Ev_3
.line 137
	ld r14,#0x0
	ld [sp],r14
	ld i0,d0
	ld i1,d3
	ld i2,d2
	add i2,#0x14
	ld i3,d2
	add i3,#0x18
	call &__ZN13XmlConnection5parseEPN6MAUtil10ConnectionEP10XCListenerPN3Mtx11XmlListenerEPN4MAUI5LabelE_3
LBE71_7:
.line 141
	add sp,#0x858
	pop rt,d3
	ret

//****************************************
// Function: __ZThn16_N23TradeConfirmationScreen16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZThn16_N23TradeConfirmationScreen16connReadFinishedEPN6MAUtil10ConnectionEi_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffff0
	call &__ZN23TradeConfirmationScreen16connReadFinishedEPN6MAUtil10ConnectionEi_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN23TradeConfirmationScreen16connReadFinishedEPN6MAUtil10ConnectionEi_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 143
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 143
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N23TradeConfirmationScreen11xcConnErrorEi
//****************************************

.func __ZThn20_N23TradeConfirmationScreen11xcConnErrorEi_7, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN23TradeConfirmationScreen11xcConnErrorEi_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen11xcConnErrorEi
//****************************************

.func __ZN23TradeConfirmationScreen11xcConnErrorEi_7, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 145
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 145
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen11mtxEncodingEPKc
//****************************************

.func __ZThn24_N23TradeConfirmationScreen11mtxEncodingEPKc_7, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen11mtxEncodingEPKc_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen11mtxEncodingEPKc
//****************************************

.func __ZN23TradeConfirmationScreen11mtxEncodingEPKc_7, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 149
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 149
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen11mtxTagStartEPKci
//****************************************

.func __ZThn24_N23TradeConfirmationScreen11mtxTagStartEPKci_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen11mtxTagStartEPKci_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen11mtxTagStartEPKci
//****************************************

.func __ZN23TradeConfirmationScreen11mtxTagStartEPKci_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 152
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB74_7:
.line 153
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8b8
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE74_7:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen10mtxTagAttrEPKcS1_
//****************************************

.func __ZThn24_N23TradeConfirmationScreen10mtxTagAttrEPKcS1__7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen10mtxTagAttrEPKcS1__7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen10mtxTagAttrEPKcS1_
//****************************************

.func __ZN23TradeConfirmationScreen10mtxTagAttrEPKcS1__7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 156
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 156
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen10mtxTagDataEPKci
//****************************************

.func __ZThn24_N23TradeConfirmationScreen10mtxTagDataEPKci_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen10mtxTagDataEPKci_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen10mtxTagDataEPKci
//****************************************

.func __ZN23TradeConfirmationScreen10mtxTagDataEPKci_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 159
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d2,i0
LBB75_7:
.line 160
	ld i0,i1
	ld i1,&LC10_7
	syscall 6
	ld d0,r14
	ld r14,#0x0
	jc ne,d0,r14,&L101_7
.line 161
	ld i0,&LC11_7
	call &_lprintfln_37
.line 162
	ld i0,[d2,44]
	jc eq,i0,d0,&L102_7
.line 163
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L102_7:
.line 165
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x28
	call &__Znwm_21
	ld d1,r14
	ld i0,r14
	ld i1,[d2,28]
	ld i2,d0
	call &__ZN19TradeCompleteScreenC1EP4FeedN6MAUtil11BasicStringIcEE_8
	ld [d2,44],d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 166
	ld i0,[d2,44]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
LBE75_7:
.line 171
	add sp,#0x4
	pop rt,d2
	ret
L101_7:
.line 169
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,[zr,_error_sending_card_message_7]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,40]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE76_7:
.line 171
	add sp,#0x4
	pop rt,d2
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen9mtxTagEndEPKci
//****************************************

.func __ZThn24_N23TradeConfirmationScreen9mtxTagEndEPKci_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen9mtxTagEndEPKci_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen9mtxTagEndEPKci
//****************************************

.func __ZN23TradeConfirmationScreen9mtxTagEndEPKci_7, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 173
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 173
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen13mtxParseErrorEv
//****************************************

.func __ZThn24_N23TradeConfirmationScreen13mtxParseErrorEv_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen13mtxParseErrorEv_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen13mtxParseErrorEv
//****************************************

.func __ZN23TradeConfirmationScreen13mtxParseErrorEv_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 176
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 176
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen14mtxEmptyTagEndEv
//****************************************

.func __ZThn24_N23TradeConfirmationScreen14mtxEmptyTagEndEv_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen14mtxEmptyTagEndEv_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen14mtxEmptyTagEndEv
//****************************************

.func __ZN23TradeConfirmationScreen14mtxEmptyTagEndEv_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 179
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 179
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N23TradeConfirmationScreen14mtxTagStartEndEv
//****************************************

.func __ZThn24_N23TradeConfirmationScreen14mtxTagStartEndEv_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN23TradeConfirmationScreen14mtxTagStartEndEv_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreen14mtxTagStartEndEv
//****************************************

.func __ZN23TradeConfirmationScreen14mtxTagStartEndEv_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 182
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 182
	pop fr,fr
	ret

//****************************************
// Function: __ZThn4_N23TradeConfirmationScreenD0Ev
//****************************************

.func __ZThn4_N23TradeConfirmationScreenD0Ev_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeConfirmationScreenD0Ev_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreenD0Ev
//****************************************

.func __ZN23TradeConfirmationScreenD0Ev_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 24
	push rt,d6
	sub sp,#0x4
	ld fr,sp
	add fr,#0x28
	ld d6,i0
LBB77_7:
.line 24
	ld r0,&__ZTV23TradeConfirmationScreen_7+8
	ld [i0],r0
	ld r2,&__ZTV23TradeConfirmationScreen_7+108
	ld [i0,4],r2
	ld r14,&__ZTV23TradeConfirmationScreen_7+136
	ld [i0,12],r14
	ld r0,&__ZTV23TradeConfirmationScreen_7+160
	ld [i0,16],r0
	ld r2,&__ZTV23TradeConfirmationScreen_7+188
	ld [i0,20],r2
	ld r14,&__ZTV23TradeConfirmationScreen_7+200
	ld [i0,24],r14
LBB78_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,32]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB79_7:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L197_7
	ld r1,[d0]
L118_7:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L182_7
	ld i0,[d0,8]
L128_7:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L128_7
L182_7:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE82_7:
.line 306
	ld i0,[d6,36]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB88_7:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L198_7
	ld r1,[d0]
L132_7:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L186_7
	ld i0,[d0,8]
L142_7:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L142_7
L186_7:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE91_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 28
	ld i0,[d6,36]
	jc ne,i0,r14,&L199_7
.line 29
	ld i0,[d6,32]
	ld r0,#0x0
	jc ne,i0,r0,&L200_7
L148_7:
.line 30
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L201_7
L149_7:
.line 34
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L202_7
L152_7:
.line 39
	ld i0,[d6,40]
	ld r2,#0x0
	jc ne,i0,r2,&L203_7
L170_7:
.line 40
	ld i0,[d6,44]
	ld r14,#0x0
	jc ne,i0,r14,&L204_7
L172_7:
.line 41
	ld d0,fr
	add d0,#0xffffffd8
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d5,d6
	add d5,#0x8b8
	ld i0,d5
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 42
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d4,d6
	add d4,#0x8bc
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 43
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d3,d6
	add d3,#0x8c4
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 44
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d2,d6
	add d2,#0x8c8
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 45
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d6
	add d1,#0x8cc
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	add i0,#0x8c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	add i0,#0x64
	call &__ZN13XmlConnectionD1Ev_3
LBB96_7:
.line 8
	ld i0,d6
	add i0,#0x3c
LBB97_7:
	ld r0,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r0
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE97_7:
	ld i0,d6
	call &__ZN4MAUI6ScreenD2Ev_94
LBE77_7:
.line 46
	ld i0,d6
	call &__ZdlPv_23
	add sp,#0x4
	pop rt,d6
	ret
L199_7:
.line 28
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 29
	ld i0,[d6,32]
	ld r0,#0x0
	jc eq,i0,r0,&L148_7
L200_7:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 30
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L149_7
L201_7:
.line 31
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 32
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 34
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L152_7
L202_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB100_7:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L205_7
	ld r1,[d0]
L154_7:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L190_7
	ld i0,[d0,8]
L164_7:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L164_7
L190_7:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE103_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 36
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L206_7
.line 37
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L209_7:
.line 39
	ld i0,[d6,40]
	ld r2,#0x0
	jc eq,i0,r2,&L170_7
L203_7:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 40
	ld i0,[d6,44]
	ld r14,#0x0
	jc eq,i0,r14,&L172_7
L204_7:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L172_7
L198_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB116_7:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L194_7
	ld i0,[d0,8]
L136_7:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L136_7
L184_7:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L207_7
.line 300
	ld [d0,8],d1
	jp &L132_7
L197_7:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB125_7:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L192_7
	ld i0,[d0,8]
L122_7:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L122_7
L180_7:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L208_7
.line 300
	ld [d0,8],d1
	jp &L118_7
L206_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 36
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 37
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L209_7
L208_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L118_7
L207_7:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L132_7
L205_7:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB150_7:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L196_7
	ld i0,[d0,8]
L158_7:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L158_7
L188_7:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L210_7
.line 300
	ld [d0,8],d1
	jp &L154_7
L210_7:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L154_7
L194_7:
	ld i0,[d0,8]
	jp &L184_7
L192_7:
	ld i0,[d0,8]
	jp &L180_7
L196_7:
	ld i0,[d0,8]
	jp &L188_7

//****************************************
// Function: __ZThn4_N23TradeConfirmationScreenD1Ev
//****************************************

.func __ZThn4_N23TradeConfirmationScreenD1Ev_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeConfirmationScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN23TradeConfirmationScreenD1Ev_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN23TradeConfirmationScreenD1Ev
//****************************************

.func __ZN23TradeConfirmationScreenD1Ev_7, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 24
	push rt,d6
	sub sp,#0x4
	ld fr,sp
	add fr,#0x28
	ld d6,i0
LBB151_7:
.line 24
	ld r0,&__ZTV23TradeConfirmationScreen_7+8
	ld [i0],r0
	ld r2,&__ZTV23TradeConfirmationScreen_7+108
	ld [i0,4],r2
	ld r14,&__ZTV23TradeConfirmationScreen_7+136
	ld [i0,12],r14
	ld r0,&__ZTV23TradeConfirmationScreen_7+160
	ld [i0,16],r0
	ld r2,&__ZTV23TradeConfirmationScreen_7+188
	ld [i0,20],r2
	ld r14,&__ZTV23TradeConfirmationScreen_7+200
	ld [i0,24],r14
LBB152_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,32]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB153_7:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L294_7
	ld r1,[d0]
L215_7:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L279_7
	ld i0,[d0,8]
L225_7:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L225_7
L279_7:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE156_7:
.line 306
	ld i0,[d6,36]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB162_7:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L295_7
	ld r1,[d0]
L229_7:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L283_7
	ld i0,[d0,8]
L239_7:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L239_7
L283_7:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE165_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 28
	ld i0,[d6,36]
	jc ne,i0,r14,&L296_7
.line 29
	ld i0,[d6,32]
	ld r0,#0x0
	jc ne,i0,r0,&L297_7
L245_7:
.line 30
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L298_7
L246_7:
.line 34
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L299_7
L249_7:
.line 39
	ld i0,[d6,40]
	ld r2,#0x0
	jc ne,i0,r2,&L300_7
L267_7:
.line 40
	ld i0,[d6,44]
	ld r14,#0x0
	jc ne,i0,r14,&L301_7
L269_7:
.line 41
	ld d0,fr
	add d0,#0xffffffd8
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d5,d6
	add d5,#0x8b8
	ld i0,d5
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 42
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d4,d6
	add d4,#0x8bc
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 43
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d3,d6
	add d3,#0x8c4
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 44
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d2,d6
	add d2,#0x8c8
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 45
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d6
	add d1,#0x8cc
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	add i0,#0x8c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	add i0,#0x64
	call &__ZN13XmlConnectionD1Ev_3
LBB170_7:
.line 8
	ld i0,d6
	add i0,#0x3c
LBB171_7:
	ld r0,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r0
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE171_7:
	ld i0,d6
	call &__ZN4MAUI6ScreenD2Ev_94
LBE151_7:
.line 46
	add sp,#0x4
	pop rt,d6
	ret
L296_7:
.line 28
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 29
	ld i0,[d6,32]
	ld r0,#0x0
	jc eq,i0,r0,&L245_7
L297_7:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 30
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L246_7
L298_7:
.line 31
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 32
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 34
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L249_7
L299_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB174_7:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L302_7
	ld r1,[d0]
L251_7:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L287_7
	ld i0,[d0,8]
L261_7:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L261_7
L287_7:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE177_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 36
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L303_7
.line 37
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L306_7:
.line 39
	ld i0,[d6,40]
	ld r2,#0x0
	jc eq,i0,r2,&L267_7
L300_7:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 40
	ld i0,[d6,44]
	ld r14,#0x0
	jc eq,i0,r14,&L269_7
L301_7:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L269_7
L295_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB190_7:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L291_7
	ld i0,[d0,8]
L233_7:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L233_7
L281_7:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L304_7
.line 300
	ld [d0,8],d1
	jp &L229_7
L294_7:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB199_7:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L289_7
	ld i0,[d0,8]
L219_7:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L219_7
L277_7:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L305_7
.line 300
	ld [d0,8],d1
	jp &L215_7
L303_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 36
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 37
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L306_7
L305_7:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L215_7
L304_7:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L229_7
L302_7:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB224_7:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L293_7
	ld i0,[d0,8]
L255_7:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L255_7
L285_7:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L307_7
.line 300
	ld [d0,8],d1
	jp &L251_7
L307_7:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L251_7
L291_7:
	ld i0,[d0,8]
	jp &L281_7
L289_7:
	ld i0,[d0,8]
	jp &L277_7
L293_7:
	ld i0,[d0,8]
	jp &L285_7

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_7, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 183
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext76_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L440_7
L404_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 183
	add sp,#0x4
	pop rt,d0
	ret
L440_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L441_7
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L404_7
	ld i0,&_TRADE_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L442_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 183
	add sp,#0x4
	pop rt,d0
	ret
L441_7:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_7
	ld i1,&LC13_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_7
	ld i1,&LC14_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC15_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC16_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC17_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC18_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L442_7

//****************************************
// Function: __GLOBAL__I__ZN23TradeConfirmationScreenC2EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9_
//****************************************

.func __GLOBAL__I__ZN23TradeConfirmationScreenC2EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9__7, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeConfirmationScreen.cpp'
.line 184
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 184
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_7
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN23TradeConfirmationScreenC2EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9_
//****************************************

.func __GLOBAL__D__ZN23TradeConfirmationScreenC2EPN4MAUI6ScreenEP4FeedP4CardN6MAUtil11BasicStringIcEES9__7, 0, void
.line 185
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 185
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_7
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_8, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_8, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_8, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_8, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_8, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_8, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreenC1EP4FeedN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN19TradeCompleteScreenC1EP4FeedN6MAUtil11BasicStringIcEE_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 6
	push rt,d3
	sub sp,#0x18
	ld fr,sp
	add fr,#0x30
	ld d1,i0
	ld d0,i1
	ld d2,i2
LBB8_8:
.line 6
	call &__ZN4MAUI6ScreenC2Ev_94
	ld r0,&__ZTV19TradeCompleteScreen_8+8
	ld [d1],r0
	ld r14,&__ZTV19TradeCompleteScreen_8+68
	ld [d1,4],r14
	ld r0,&__ZTV19TradeCompleteScreen_8+96
	ld [d1,12],r0
	ld [d1,16],d0
	ld i0,d1
	add i0,#0x20
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
.line 7
	ld i0,&LC2_8
	ld i1,[zr,_continuelbl_8]
	ld i2,#0x0
	call &__Z16createMainLayoutPKcS0_b_4
	ld [d1,20],r14
LBB9_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB11_8:
	ld r14,[r14,8]
LBE11_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB12_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE12_8:
	ld r14,[r14]
	ld [d1,24],r14
Ltext8_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 10
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,#0x0
	jc ne,r14,r0,&L19_8
	ld d3,fr
	add d3,#0xffffffe4
	ld i0,d3
	ld i1,[zr,_card_sent_message_8]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
L20_8:
	ld i0,#0x9c
	call &__Znwm_21
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld r14,#0x64
	ld [sp],r14
	ld r0,#0x0
	ld [sp,4],r0
	ld [sp,8],d3
	ld [sp,12],r0
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d0
	ld i1,r0
	ld i2,r0
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d1,28],d0
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 11
	ld i0,[d1,28]
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_90
.line 12
	ld i0,[d1,28]
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 13
	ld i0,[d1,28]
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d0
.line 14
	ld i0,[d1,28]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_90
.line 15
	ld i0,[d1,24]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d1,28]
	call d0
.line 17
	ld i0,d1
	ld i1,[d1,20]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
LBE8_8:
	add sp,#0x18
	pop rt,d3
	ret
L19_8:
.line 10
	ld d3,fr
	add d3,#0xffffffe4
	ld i0,d3
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	jp &L20_8

//****************************************
// Function: __ZThn4_N19TradeCompleteScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N19TradeCompleteScreen19pointerReleaseEventE9MAPoint2d_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeCompleteScreen.h'
.line 15
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 15
	add i0,#0xfffffffc
	call &__ZN19TradeCompleteScreen19pointerReleaseEventE9MAPoint2d_8
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN19TradeCompleteScreen19pointerReleaseEventE9MAPoint2d_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 49
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
LBB14_8:
.line 50
	ld.b r14,[i0,38]
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L29_8
.line 52
	ld.b r1,[i0,37]
	and r1,#0xff
	jc eq,r1,r14,&L25_8
.line 53
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 55
	call d0
L22_8:
.line 57
	pop rt,d0
	ret
L25_8:
.line 54
	ld.b r14,[i0,36]
	and r14,#0xff
	jc eq,r14,r1,&L22_8
.line 55
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L22_8
L29_8:
.line 51
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 55
	call d0
	jp &L22_8

//****************************************
// Function: __ZN19TradeCompleteScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN19TradeCompleteScreen10locateItemE9MAPoint2d_8, 3, void
.line 60
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
LBB16_8:
.line 61
	ld r0,#0x0
	ld.b [i0,36],r0
.line 62
	ld.b [i0,37],r0
.line 63
	ld.b [i0,38],r0
LBB18_8:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-28],i1
	ld [fr,-24],i2
LBE19_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 67
	ld d2,#0x0
LBB21_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB24_8:
	ld r14,[r14,8]
LBE24_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB25_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB26_8:
.line 258
	ld r14,[r14]
LBE26_8:
.line 359
	jc le,r14,d2,&L59_8
L46_8:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_8:
	ld r14,[r14,8]
LBE30_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB32_8:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE32_8:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L36_8
	jc le,d2,r0,&L36_8
LBB33_8:
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB35_8:
	ld r14,[r14,8]
LBE35_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB36_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE36_8:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
Ltext14_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 72
	ld r14,#0x1
	ld.b [d1,36],r14
L36_8:
.line 67
	add d2,#0x1
LBB37_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB40_8:
	ld r14,[r14,8]
LBE40_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB41_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE41_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB42_8:
.line 258
	ld r14,[r14]
LBE42_8:
.line 359
	jc gt,r14,d2,&L46_8
L59_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 75
	ld d2,#0x0
	jp &L47_8
L58_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB46_8:
	ld r14,[r14,8]
	add r14,#0x4
LBE46_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB47_8:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE47_8:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L60_8
Ltext18_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 75
	add d2,#0x1
L47_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB50_8:
	ld r14,[r14,8]
	add r14,#0x4
LBE50_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB51_8:
.line 258
	ld r14,[r14]
LBE51_8:
.line 359
	jc gt,r14,d2,&L58_8
L30_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 87
	add sp,#0x8
	pop rt,d2
	ret
L60_8:
.line 79
	jc ne,d2,r0,&L55_8
.line 80
	ld r14,#0x1
	ld.b [d1,37],r14
LBE54_8:
.line 87
	add sp,#0x8
	pop rt,d2
	ret
L55_8:
.line 81
	ld r0,#0x2
	jc ne,d2,r0,&L30_8
.line 82
	ld r14,#0x1
	ld.b [d1,38],r14
	jp &L30_8

//****************************************
// Function: __ZThn4_N19TradeCompleteScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N19TradeCompleteScreen16pointerMoveEventE9MAPoint2d_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeCompleteScreen.h'
.line 15
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 15
	add i0,#0xfffffffc
	call &__ZN19TradeCompleteScreen16pointerMoveEventE9MAPoint2d_8
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN19TradeCompleteScreen16pointerMoveEventE9MAPoint2d_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 44
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB58_8:
.line 45
	call &__ZN19TradeCompleteScreen10locateItemE9MAPoint2d_8
LBE58_8:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N19TradeCompleteScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N19TradeCompleteScreen17pointerPressEventE9MAPoint2d_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeCompleteScreen.h'
.line 15
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 15
	add i0,#0xfffffffc
	call &__ZN19TradeCompleteScreen17pointerPressEventE9MAPoint2d_8
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN19TradeCompleteScreen17pointerPressEventE9MAPoint2d_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 39
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB59_8:
.line 40
	call &__ZN19TradeCompleteScreen10locateItemE9MAPoint2d_8
LBE59_8:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn12_N19TradeCompleteScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZThn12_N19TradeCompleteScreen16selectionChangedEPN4MAUI6WidgetEb_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeCompleteScreen.h'
.line 15
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 15
	add i0,#0xfffffff4
	call &__ZN19TradeCompleteScreen16selectionChangedEPN4MAUI6WidgetEb_8
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZN19TradeCompleteScreen16selectionChangedEPN4MAUI6WidgetEb_8, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 89
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i0,i1
LBB60_8:
.line 90
	and i2,#0xff
	ld r14,#0x0
	jc eq,i2,r14,&L67_8
.line 91
	ld i1,[zr,_gFontBlue_4]
.line 93
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE60_8:
.line 95
	pop rt,fr
	ret
L67_8:
.line 93
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE61_8:
.line 95
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreen13keyPressEventEi
//****************************************

.func __ZN19TradeCompleteScreen13keyPressEventEi_8, 2, void
.line 97
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB62_8:
.line 98
	ld r14,#0x11e
	jc eq,i1,r14,&L73_8
LBE62_8:
.line 105
	pop rt,fr
	ret
L73_8:
.line 100
	ld i0,[zr,_orig_4]
	call &__ZN15AlbumLoadScreen7refreshEv_18
LBE63_8:
.line 105
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N19TradeCompleteScreenD0Ev
//****************************************

.func __ZThn4_N19TradeCompleteScreenD0Ev_8, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeCompleteScreen.h'
.line 15
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 15
	add i0,#0xfffffffc
	call &__ZN19TradeCompleteScreenD0Ev_8
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreenD0Ev
//****************************************

.func __ZN19TradeCompleteScreenD0Ev_8, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 20
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d2,i0
LBB64_8:
.line 20
	ld r0,&__ZTV19TradeCompleteScreen_8+8
	ld [i0],r0
	ld r2,&__ZTV19TradeCompleteScreen_8+68
	ld [i0,4],r2
	ld r14,&__ZTV19TradeCompleteScreen_8+96
	ld [i0,12],r14
LBB65_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,20]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB66_8:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L151_8
	ld r1,[d0]
L78_8:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L136_8
	ld i0,[d0,8]
L88_8:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L88_8
L136_8:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE69_8:
.line 306
	ld i0,[d2,24]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB75_8:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L152_8
	ld r1,[d0]
L92_8:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L140_8
	ld i0,[d0,8]
L102_8:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L102_8
L140_8:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE78_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 24
	ld i0,[d2,24]
	jc ne,i0,r14,&L153_8
.line 25
	ld i0,[d2,20]
	ld r0,#0x0
	jc ne,i0,r0,&L154_8
L108_8:
.line 26
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L155_8
L109_8:
.line 30
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L156_8
L112_8:
.line 35
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,&LC2_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc ne,i0,r2,&L157_8
L130_8:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_94
LBE64_8:
.line 37
	ld i0,d2
	call &__ZdlPv_23
	add sp,#0x4
	pop rt,d2
	ret
L153_8:
.line 24
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 25
	ld i0,[d2,20]
	ld r0,#0x0
	jc eq,i0,r0,&L108_8
L154_8:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 26
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L109_8
L155_8:
.line 27
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 28
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 30
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L112_8
L156_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB85_8:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L158_8
	ld r1,[d0]
L114_8:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L144_8
	ld i0,[d0,8]
L124_8:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L124_8
L144_8:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE88_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 32
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L159_8
.line 33
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L162_8:
.line 35
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,&LC2_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc eq,i0,r2,&L130_8
L157_8:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_94
LBE83_8:
.line 37
	ld i0,d2
	call &__ZdlPv_23
	add sp,#0x4
	pop rt,d2
	ret
L152_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB102_8:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L148_8
	ld i0,[d0,8]
L96_8:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L96_8
L138_8:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L160_8
.line 300
	ld [d0,8],d1
	jp &L92_8
L151_8:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB111_8:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L146_8
	ld i0,[d0,8]
L82_8:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L82_8
L134_8:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L161_8
.line 300
	ld [d0,8],d1
	jp &L78_8
L159_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 32
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 33
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L162_8
L161_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L78_8
L160_8:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L92_8
L158_8:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB136_8:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L150_8
	ld i0,[d0,8]
L118_8:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L118_8
L142_8:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L163_8
.line 300
	ld [d0,8],d1
	jp &L114_8
L163_8:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L114_8
L148_8:
	ld i0,[d0,8]
	jp &L138_8
L146_8:
	ld i0,[d0,8]
	jp &L134_8
L150_8:
	ld i0,[d0,8]
	jp &L142_8

//****************************************
// Function: __ZThn4_N19TradeCompleteScreenD1Ev
//****************************************

.func __ZThn4_N19TradeCompleteScreenD1Ev_8, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\TradeCompleteScreen.h'
.line 15
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 15
	add i0,#0xfffffffc
	call &__ZN19TradeCompleteScreenD1Ev_8
	pop rt,fr
	ret

//****************************************
// Function: __ZN19TradeCompleteScreenD1Ev
//****************************************

.func __ZN19TradeCompleteScreenD1Ev_8, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 20
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d2,i0
LBB137_8:
.line 20
	ld r0,&__ZTV19TradeCompleteScreen_8+8
	ld [i0],r0
	ld r2,&__ZTV19TradeCompleteScreen_8+68
	ld [i0,4],r2
	ld r14,&__ZTV19TradeCompleteScreen_8+96
	ld [i0,12],r14
LBB138_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,20]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB139_8:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L241_8
	ld r1,[d0]
L168_8:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L226_8
	ld i0,[d0,8]
L178_8:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L178_8
L226_8:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE142_8:
.line 306
	ld i0,[d2,24]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB148_8:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L242_8
	ld r1,[d0]
L182_8:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L230_8
	ld i0,[d0,8]
L192_8:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L192_8
L230_8:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE151_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 24
	ld i0,[d2,24]
	jc ne,i0,r14,&L243_8
.line 25
	ld i0,[d2,20]
	ld r0,#0x0
	jc ne,i0,r0,&L244_8
L198_8:
.line 26
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L245_8
L199_8:
.line 30
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L246_8
L202_8:
.line 35
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,&LC2_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc ne,i0,r2,&L247_8
L220_8:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_94
LBE137_8:
.line 37
	add sp,#0x4
	pop rt,d2
	ret
L243_8:
.line 24
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 25
	ld i0,[d2,20]
	ld r0,#0x0
	jc eq,i0,r0,&L198_8
L244_8:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 26
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L199_8
L245_8:
.line 27
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 28
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 30
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L202_8
L246_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB158_8:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L248_8
	ld r1,[d0]
L204_8:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L234_8
	ld i0,[d0,8]
L214_8:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L214_8
L234_8:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE161_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 32
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L249_8
.line 33
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L252_8:
.line 35
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,&LC2_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc eq,i0,r2,&L220_8
L247_8:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_94
LBE156_8:
.line 37
	add sp,#0x4
	pop rt,d2
	ret
L242_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB175_8:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L238_8
	ld i0,[d0,8]
L186_8:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L186_8
L228_8:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L250_8
.line 300
	ld [d0,8],d1
	jp &L182_8
L241_8:
.line 291
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB184_8:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L236_8
	ld i0,[d0,8]
L172_8:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L172_8
L224_8:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L251_8
.line 300
	ld [d0,8],d1
	jp &L168_8
L249_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 32
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 33
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L252_8
L251_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L168_8
L250_8:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L182_8
L248_8:
.line 291
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB209_8:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L240_8
	ld i0,[d0,8]
L208_8:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L208_8
L232_8:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L253_8
.line 300
	ld [d0,8],d1
	jp &L204_8
L253_8:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L204_8
L238_8:
	ld i0,[d0,8]
	jp &L228_8
L236_8:
	ld i0,[d0,8]
	jp &L224_8
L240_8:
	ld i0,[d0,8]
	jp &L232_8

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_8, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 105
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext54_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L379_8
L343_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 105
	add sp,#0x4
	pop rt,d0
	ret
L379_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L380_8
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L343_8
	ld i0,&_TRADE_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L381_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 105
	add sp,#0x4
	pop rt,d0
	ret
L380_8:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_8
	ld i1,&LC3_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_8
	ld i1,&LC4_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC5_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC6_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC7_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC8_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L381_8

//****************************************
// Function: __GLOBAL__I__ZN19TradeCompleteScreenC2EP4FeedN6MAUtil11BasicStringIcEE
//****************************************

.func __GLOBAL__I__ZN19TradeCompleteScreenC2EP4FeedN6MAUtil11BasicStringIcEE_8, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\TradeCompleteScreen.cpp'
.line 106
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 106
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_8
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN19TradeCompleteScreenC2EP4FeedN6MAUtil11BasicStringIcEE
//****************************************

.func __GLOBAL__D__ZN19TradeCompleteScreenC2EP4FeedN6MAUtil11BasicStringIcEE_8, 0, void
.line 107
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 107
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_8
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_9, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_9, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_9, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_9, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di_9, 4, void
.line 71
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 71
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di_9, 4, void
.line 72
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 72
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di_9, 4, void
.line 73
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 73
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_9, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_9, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZThn12_N5Login16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZThn12_N5Login16selectionChangedEPN4MAUI6WidgetEb_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xfffffff4
	call &__ZN5Login16selectionChangedEPN4MAUI6WidgetEb_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZN5Login16selectionChangedEPN4MAUI6WidgetEb_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 44
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld i0,i1
LBB2_9:
.line 45
	ld d1,i2
	and d1,#0xff
	ld r14,#0x0
	jc eq,d1,r14,&L13_9
LBB3_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB4_9:
	ld r14,[r14,8]
LBE4_9:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
LBE2_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 50
	pop rt,d1
	ret
L13_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB7_9:
	ld r14,[r14,8]
LBE7_9:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,d1
	call d0
LBE5_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 50
	pop rt,d1
	ret

//****************************************
// Function: __ZThn4_N5Login19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N5Login19pointerReleaseEventE9MAPoint2d_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xfffffffc
	call &__ZN5Login19pointerReleaseEventE9MAPoint2d_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN5Login19pointerReleaseEventE9MAPoint2d_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 63
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
LBB8_9:
.line 64
	ld.b r14,[i0,2326]
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L27_9
.line 66
	ld.b r1,[i0,2325]
	and r1,#0xff
	jc eq,r1,r14,&L23_9
.line 67
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 69
	call d0
L20_9:
.line 71
	pop rt,d0
	ret
L23_9:
.line 68
	ld.b r14,[i0,2324]
	and r14,#0xff
	jc eq,r14,r1,&L20_9
.line 69
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L20_9
L27_9:
.line 65
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 69
	call d0
	jp &L20_9

//****************************************
// Function: __ZN5Login10locateItemE9MAPoint2d
//****************************************

.func __ZN5Login10locateItemE9MAPoint2d_9, 3, void
.line 74
	push rt,d4
	sub sp,#0xc
	ld fr,sp
	add fr,#0x28
	ld d1,i0
	ld d2,i1
	ld d3,i2
LBB10_9:
.line 75
	ld d4,fr
	add d4,#0xffffffe0
	ld i0,d4
	ld i1,[zr,_truesz_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d0,d1
	add d0,#0x910
	ld i0,d0
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 76
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed8setTouchEPKc_14
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L58_9
L29_9:
.line 79
	ld r14,#0x0
	ld.b [d1,2324],r14
.line 80
	ld.b [d1,2325],r14
.line 81
	ld.b [d1,2326],r14
LBB12_9:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-40],d2
	ld [fr,-36],d3
LBE13_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 85
	ld d2,#0x0
	jp &L33_9
L45_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB18_9:
	ld r14,[r14,8]
LBE18_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB19_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE19_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB20_9:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE20_9:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffd8
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L59_9
Ltext15_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 85
	add d2,#0x1
L33_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB24_9:
	ld r14,[r14,8]
LBE24_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB25_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB26_9:
.line 265
	ld r14,[r14]
LBE26_9:
.line 366
	jc gt,r14,d2,&L45_9
LBE14_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 94
	ld d2,#0x0
	jp &L46_9
L57_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_9:
	ld r14,[r14,8]
	add r14,#0x4
LBE30_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_9:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE31_9:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffd8
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L60_9
Ltext19_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 94
	add d2,#0x1
L46_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB34_9:
	ld r14,[r14,8]
	add r14,#0x4
LBE34_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB35_9:
.line 265
	ld r14,[r14]
LBE35_9:
.line 366
	jc gt,r14,d2,&L57_9
	jp &L28_9
L59_9:
.line 362
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB39_9:
	ld r14,[r14,8]
LBE39_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB40_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE40_9:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
Ltext21_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 90
	ld r14,#0x1
	ld.b [d1,2324],r14
L28_9:
.line 106
	add sp,#0xc
	pop rt,d4
	ret
L58_9:
.line 77
	ld i0,d4
	ld i1,[d1,2332]
	call &__ZN4Feed6getAllEv_14
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[zr,_FEED_9]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L29_9
L60_9:
.line 98
	jc ne,d2,r0,&L54_9
.line 99
	ld r14,#0x1
	ld.b [d1,2325],r14
LBE43_9:
.line 106
	add sp,#0xc
	pop rt,d4
	ret
L54_9:
.line 100
	ld r0,#0x2
	jc ne,d2,r0,&L28_9
.line 101
	ld r14,#0x1
	ld.b [d1,2326],r14
	jp &L28_9

//****************************************
// Function: __ZThn4_N5Login16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N5Login16pointerMoveEventE9MAPoint2d_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 21
	add i0,#0xfffffffc
	call &__ZN5Login16pointerMoveEventE9MAPoint2d_9
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN5Login16pointerMoveEventE9MAPoint2d_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 58
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB47_9:
.line 59
	call &__ZN5Login10locateItemE9MAPoint2d_9
LBE47_9:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N5Login17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N5Login17pointerPressEventE9MAPoint2d_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 21
	add i0,#0xfffffffc
	call &__ZN5Login17pointerPressEventE9MAPoint2d_9
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN5Login17pointerPressEventE9MAPoint2d_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 53
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB48_9:
.line 54
	call &__ZN5Login10locateItemE9MAPoint2d_9
LBE48_9:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login4showEv
//****************************************

.func __ZN5Login4showEv_9, 1, void
.line 108
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB49_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[i0,40]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d1,40]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB51_9:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE51_9:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
Ltext27_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 110
	ld i0,d1
	call &__ZN4MAUI6Screen4showEv_94
LBE49_9:
	pop rt,d1
	ret

//****************************************
// Function: __ZN5Login4hideEv
//****************************************

.func __ZN5Login4hideEv_9, 1, void
.line 113
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB52_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[i0,40]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d1,40]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB54_9:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE54_9:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x0
	call d0
Ltext29_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 115
	ld i0,d1
	call &__ZN4MAUI6Screen4hideEv_94
LBE52_9:
	pop rt,d1
	ret

//****************************************
// Function: __ZN5Login7connectE8MABtAddr6MAUUID
//****************************************

.func __ZN5Login7connectE8MABtAddr6MAUUID_9, 7, void
.line 125
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB55_9:
.line 126
	add i0,#0x34
	ld i1,fr
	add i1,#0xfffffff0
	ld i2,fr
	call &__ZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUID_67
LBE55_9:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn16_N5Login25btDeviceDiscoveryFinishedEi
//****************************************

.func __ZThn16_N5Login25btDeviceDiscoveryFinishedEi_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xfffffff0
	call &__ZN5Login25btDeviceDiscoveryFinishedEi_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login25btDeviceDiscoveryFinishedEi
//****************************************

.func __ZN5Login25btDeviceDiscoveryFinishedEi_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 139
	push rt,d1
	sub sp,#0x1c
	ld fr,sp
	add fr,#0x2c
	ld d1,i0
LBB56_9:
.line 140
	ld r0,#0x0
	ld.b [i0,2340],r0
.line 141
	ld r1,#0x0
	ld [i0,140],r1
LBB57_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 265
	ld r0,i0
	add r0,#0x7c
LBB58_9:
	ld r14,[r0]
LBE58_9:
	jc le,r14,r1,&L72_9
LBB59_9:
.line 362
	ld r14,#0x1
	ld [i0,140],r14
LBB60_9:
	ld r14,[r0,8]
LBE60_9:
	ld [i0,136],r14
Ltext33_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 144
	ld.b r0,[r14,4]
	ld.b [fr,-24],r0
	ld.b r1,[r14,5]
	ld.b [fr,-23],r1
	ld.b r0,[r14,6]
	ld.b [fr,-22],r0
	ld.b r1,[r14,7]
	ld.b [fr,-21],r1
	ld.b r0,[r14,8]
	ld.b [fr,-20],r0
	ld.b r14,[r14,9]
	ld.b [fr,-19],r14
	ld i0,sp
	ld i1,&_sUuid_9
	ld i2,#0x10
	syscall 5
	ld i0,d1
	ld i1,[fr,-24]
	ld.h i2,[fr,-20]
	and i2,#0xffff
	call &__ZN5Login7connectE8MABtAddr6MAUUID_9
LBE56_9:
.line 148
	add sp,#0x1c
	pop rt,d1
	ret
L72_9:
.line 146
	ld d0,fr
	add d0,#0xffffffe4
	ld i0,d0
	ld i1,&LC15_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d1,44]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE61_9:
.line 148
	add sp,#0x1c
	pop rt,d1
	ret

//****************************************
// Function: __ZN5Login13keyPressEventEi
//****************************************

.func __ZN5Login13keyPressEventEi_9, 2, void
.line 156
	push rt,d2
	sub sp,#0x108
	ld fr,sp
	add fr,#0x11c
	ld d1,i0
	ld d0,i1
LBB62_9:
.line 157
	ld r0,#0x0
	ld.b [i0,2327],r0
.line 158
	ld i0,[i0,40]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB64_9:
.line 159
	case d0,#0x111,#0xd,#L85_9,#L76_9
.data
	.align 4
L85_9:
	.word L83_9
	.word L83_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L76_9
	.word L81_9
	.word L79_9


.code
L83_9:
.line 178
	ld i0,[d1,40]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
L76_9:
.line 183
	add sp,#0x108
	pop rt,d2
	ret
L79_9:
.line 163
	ld d2,fr
	add d2,#0xffffffe8
	ld i0,d2
	ld i1,&LC16_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d1,48]
	ld i1,d2
	call &__ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_85
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB70_9:
.line 165
	ld.b r14,[d1,2340]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L76_9
LBB71_9:
.line 166
	ld r14,#0x1
	ld.b [d1,2340],r14
.line 167
	ld i0,#0xc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN6MAUtil19BluetoothDiscovererC1Ev_68
	ld [d1,120],d0
.line 169
	ld i0,d0
	ld i1,d1
	add i1,#0x10
	ld i2,#0x1
	call &__ZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEb_68
	ld d0,fr
	add d0,#0xfffffee8
	ld [sp],r14
	ld i0,d0
	ld i1,&LC17_9
	call &_sprintf_37
.line 170
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d1,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d2
	call d0
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L76_9
L81_9:
.line 174
	ld i0,#0x0
	syscall 2

//****************************************
// Function: __ZThn28_N5Login15connectFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZThn28_N5Login15connectFinishedEPN6MAUtil10ConnectionEi_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe4
	call &__ZN5Login15connectFinishedEPN6MAUtil10ConnectionEi_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login15connectFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN5Login15connectFinishedEPN6MAUtil10ConnectionEi_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 185
	push rt,d3
	sub sp,#0x870
	ld fr,sp
	add fr,#0x888
	ld d2,i0
	ld d3,i1
LBB72_9:
.line 186
	ld r0,#0xc8
	jc eq,i2,r0,&L89_9
	ld r14,#0x1
	jc eq,i2,r14,&L89_9
.line 190
	ld r14,#0x14
	jc eq,i2,r14,&L99_9
.line 197
	ld d0,fr
	add d0,#0xfffff788
	ld i0,d0
	ld i1,[zr,_no_connect_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,44]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 198
	ld r14,#0x0
	ld.b [d2,2340],r14
L87_9:
.line 200
	add sp,#0x870
	pop rt,d3
	ret
L99_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 265
	ld r1,i0
	add r1,#0x7c
LBB75_9:
	ld r14,[r1]
LBE75_9:
	ld r0,[i0,140]
	jc le,r14,r0,&L87_9
LBB76_9:
.line 362
	add r0,#0x1
	ld [i0,140],r0
	ld r14,r0
	add r14,#0xffffffff
LBB77_9:
	mul r14,#0xc
	ld r1,[r1,8]
	add r14,r1
LBE77_9:
	ld [i0,136],r14
Ltext37_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 193
	ld.b r0,[r14,4]
	ld.b [fr,-2164],r0
	ld.b r0,[r14,5]
	ld.b [fr,-2163],r0
	ld.b r0,[r14,6]
	ld.b [fr,-2162],r0
	ld.b r0,[r14,7]
	ld.b [fr,-2161],r0
	ld.b r0,[r14,8]
	ld.b [fr,-2160],r0
	ld.b r14,[r14,9]
	ld.b [fr,-2159],r14
	ld i0,sp
	ld i1,&_sUuid_9
	ld i2,#0x10
	syscall 5
	ld i0,d2
	ld i1,[fr,-2164]
	ld.h i2,[fr,-2160]
	and i2,#0xffff
	call &__ZN5Login7connectE8MABtAddr6MAUUID_9
	jp &L87_9
L89_9:
.line 187
	ld i0,[d2,48]
	call &__ZNK4MAUI7EditBox7getTextEv_85
	ld i0,r14
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,r14
	ld i0,[d2,48]
	call &__ZNK4MAUI7EditBox7getTextEv_85
	ld i0,r14
	call &__ZNK6MAUtil11BasicStringIcE4sizeEv_81
	ld i0,d2
	add i0,#0x34
	ld i1,d0
	ld i2,r14
	call &__ZN6MAUtil10Connection5writeEPKvi_62
LBB78_9:
.line 188
	ld d0,d2
	add d0,#0x90
	ld d1,fr
	add d1,#0xfffff794
	ld i0,d1
	call &__ZN13XmlConnectionC1Ev_3
LBB79_9:
	ld i0,d2
	add i0,#0x98
	ld i1,fr
	add i1,#0xfffff79c
	ld i2,#0x3c
	syscall 5
	ld r0,[fr,-2088]
	ld [d0,68],r0
	ld r14,[fr,-2084]
	ld [d0,72],r14
	ld i0,d2
	add i0,#0xdc
	ld i1,fr
	add i1,#0xfffff7e0
	ld i2,#0x800
	syscall 5
	ld r0,[fr,-32]
	ld [d0,2124],r0
	ld r14,[fr,-28]
	ld [d0,2128],r14
LBE79_9:
	ld i0,d1
	call &__ZN13XmlConnectionD1Ev_3
.line 189
	ld r0,[d2,44]
	ld [sp],r0
	ld i0,d0
	ld i1,d3
	ld i2,d2
	add i2,#0x14
	ld i3,d2
	add i3,#0x18
	call &__ZN13XmlConnection5parseEPN6MAUtil10ConnectionEP10XCListenerPN3Mtx11XmlListenerEPN4MAUI5LabelE_3
LBE73_9:
.line 200
	add sp,#0x870
	pop rt,d3
	ret

//****************************************
// Function: __ZThn28_N5Login17connWriteFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZThn28_N5Login17connWriteFinishedEPN6MAUtil10ConnectionEi_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe4
	call &__ZN5Login17connWriteFinishedEPN6MAUtil10ConnectionEi_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login17connWriteFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN5Login17connWriteFinishedEPN6MAUtil10ConnectionEi_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 202
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 202
	pop fr,fr
	ret

//****************************************
// Function: __ZThn28_N5Login16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZThn28_N5Login16connReadFinishedEPN6MAUtil10ConnectionEi_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe4
	call &__ZN5Login16connReadFinishedEPN6MAUtil10ConnectionEi_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN5Login16connReadFinishedEPN6MAUtil10ConnectionEi_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 204
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 204
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N5Login11xcConnErrorEi
//****************************************

.func __ZThn20_N5Login11xcConnErrorEi_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffec
	call &__ZN5Login11xcConnErrorEi_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login11xcConnErrorEi
//****************************************

.func __ZN5Login11xcConnErrorEi_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 206
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB80_9:
.line 207
	ld r14,#0x0
	ld.b [i0,2340],r14
LBE80_9:
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N5Login11mtxEncodingEPKc
//****************************************

.func __ZThn24_N5Login11mtxEncodingEPKc_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login11mtxEncodingEPKc_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login11mtxEncodingEPKc
//****************************************

.func __ZN5Login11mtxEncodingEPKc_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 210
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 210
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N5Login11mtxTagStartEPKci
//****************************************

.func __ZThn24_N5Login11mtxTagStartEPKci_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login11mtxTagStartEPKci_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login11mtxTagStartEPKci
//****************************************

.func __ZN5Login11mtxTagStartEPKci_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 213
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB81_9:
.line 214
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8e4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE81_9:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZThn24_N5Login10mtxTagAttrEPKcS1_
//****************************************

.func __ZThn24_N5Login10mtxTagAttrEPKcS1__9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login10mtxTagAttrEPKcS1__9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login10mtxTagAttrEPKcS1_
//****************************************

.func __ZN5Login10mtxTagAttrEPKcS1__9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 217
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 217
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N5Login10mtxTagDataEPKci
//****************************************

.func __ZThn24_N5Login10mtxTagDataEPKci_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login10mtxTagDataEPKci_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login10mtxTagDataEPKci
//****************************************

.func __ZN5Login10mtxTagDataEPKci_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 220
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
LBB82_9:
.line 221
	ld d0,i0
	add d0,#0x8e4
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_username_9]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L114_9
.line 222
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x904
L123_9:
.line 230
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L113_9:
.line 232
	add sp,#0x4
	pop rt,d2
	ret
L114_9:
.line 223
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_credits_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L113_9
.line 225
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_email_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L113_9
.line 227
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_handle_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L113_9
.line 229
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_error_9]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L113_9
.line 230
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x90c
	jp &L123_9

//****************************************
// Function: __ZThn24_N5Login9mtxTagEndEPKci
//****************************************

.func __ZThn24_N5Login9mtxTagEndEPKci_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login9mtxTagEndEPKci_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login9mtxTagEndEPKci
//****************************************

.func __ZN5Login9mtxTagEndEPKci_9, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 234
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d0,i1
LBB84_9:
.line 235
	ld i0,i1
	ld i1,[zr,_xml_status_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L133_9
.line 243
	ld i0,d0
	ld i1,[zr,_xml_error_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L134_9
.line 248
	ld.b r0,[d1,2327]
	and r0,#0xff
	ld r14,#0x0
	jc ne,r0,r14,&L125_9
.line 249
	ld r14,[d1,44]
	jc eq,r14,r0,&L125_9
.line 250
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	ld i1,&LC18_9
	jp &L132_9
L134_9:
.line 244
	ld r14,#0x1
	ld.b [d1,2327],r14
.line 245
	ld d0,d1
	add d0,#0x90c
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed15setUnsuccessfulEPKc_14
.line 246
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	ld i1,r14
L132_9:
.line 250
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d1,44]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L125_9:
.line 254
	add sp,#0x4
	pop rt,d1
	ret
L133_9:
.line 236
	ld i0,[d1,2332]
	ld i1,[zr,_success_9]
	call &__ZN4Feed15setUnsuccessfulEPKc_14
.line 237
	ld i0,d1
	add i0,#0x910
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed8setTouchEPKc_14
.line 238
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x90c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 239
	ld i0,d0
	ld i1,[d1,2332]
	call &__ZN4Feed6getAllEv_14
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[zr,_FEED_9]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 240
	ld i0,[zr,_ALBUM_9]
	call &__Z7getDataPKc_4
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed8setAlbumEPKc_14
.line 241
	ld i0,#0x8d4
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,[d1,2332]
	call &__ZN15AlbumLoadScreenC1EP4Feed_18
	ld [d1,2336],d0
.line 242
	ld r14,[d0]
	ld d1,[r14,28]
	ld i0,d0
	call d1
LBE85_9:
.line 254
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZThn24_N5Login13mtxParseErrorEv
//****************************************

.func __ZThn24_N5Login13mtxParseErrorEv_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login13mtxParseErrorEv_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login13mtxParseErrorEv
//****************************************

.func __ZN5Login13mtxParseErrorEv_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 256
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 256
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N5Login14mtxEmptyTagEndEv
//****************************************

.func __ZThn24_N5Login14mtxEmptyTagEndEv_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login14mtxEmptyTagEndEv_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login14mtxEmptyTagEndEv
//****************************************

.func __ZN5Login14mtxEmptyTagEndEv_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 259
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 259
	pop fr,fr
	ret

//****************************************
// Function: __ZThn24_N5Login14mtxTagStartEndEv
//****************************************

.func __ZThn24_N5Login14mtxTagStartEndEv_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xffffffe8
	call &__ZN5Login14mtxTagStartEndEv_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login14mtxTagStartEndEv
//****************************************

.func __ZN5Login14mtxTagStartEndEv_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 262
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 262
	pop fr,fr
	ret

//****************************************
// Function: __ZThn4_N5LoginD0Ev
//****************************************

.func __ZThn4_N5LoginD0Ev_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xfffffffc
	call &__ZN5LoginD0Ev_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5LoginD0Ev
//****************************************

.func __ZN5LoginD0Ev_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 42
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB88_9:
.line 42
	ld r14,&__ZTV5Login_9+8
	ld [i0],r14
	ld r14,&__ZTV5Login_9+124
	ld [i0,4],r14
	ld r14,&__ZTV5Login_9+164
	ld [i0,12],r14
	ld r14,&__ZTV5Login_9+188
	ld [i0,16],r14
	ld r14,&__ZTV5Login_9+204
	ld [i0,20],r14
	ld r14,&__ZTV5Login_9+216
	ld [i0,24],r14
	ld r14,&__ZTV5Login_9+260
	ld [i0,28],r14
	add i0,#0x910
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x90c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x908
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x904
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x900
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8fc
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8f8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8f4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8f0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8ec
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8e8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8e4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x90
	call &__ZN13XmlConnectionD1Ev_3
LBB89_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 142
	ld d2,d1
	add d2,#0x7c
LBB90_9:
.line 143
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L186_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
	jc eq,i0,d0,&L181_9
L189_9:
	add d0,#0xfffffff4
LBB91_9:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
LBE92_9:
	jc ne,i0,d0,&L189_9
L181_9:
	add i0,#0xfffffffc
	call &__ZdaPv_22
L186_9:
	ld i0,d1
	add i0,#0x34
	call &__ZN6MAUtil19BluetoothConnectionD1Ev_67
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE88_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 42
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret

//****************************************
// Function: __ZThn4_N5LoginD1Ev
//****************************************

.func __ZThn4_N5LoginD1Ev_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xfffffffc
	call &__ZN5LoginD1Ev_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5LoginD1Ev
//****************************************

.func __ZN5LoginD1Ev_9, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 42
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB93_9:
.line 42
	ld r14,&__ZTV5Login_9+8
	ld [i0],r14
	ld r14,&__ZTV5Login_9+124
	ld [i0,4],r14
	ld r14,&__ZTV5Login_9+164
	ld [i0,12],r14
	ld r14,&__ZTV5Login_9+188
	ld [i0,16],r14
	ld r14,&__ZTV5Login_9+204
	ld [i0,20],r14
	ld r14,&__ZTV5Login_9+216
	ld [i0,24],r14
	ld r14,&__ZTV5Login_9+260
	ld [i0,28],r14
	add i0,#0x910
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x90c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x908
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x904
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x900
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8fc
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8f8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8f4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8f0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8ec
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8e8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x8e4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	add i0,#0x90
	call &__ZN13XmlConnectionD1Ev_3
LBB94_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 142
	ld d2,d1
	add d2,#0x7c
LBB95_9:
.line 143
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L202_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
	jc eq,i0,d0,&L197_9
L205_9:
	add d0,#0xfffffff4
LBB96_9:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
LBE97_9:
	jc ne,i0,d0,&L205_9
L197_9:
	add i0,#0xfffffffc
	call &__ZdaPv_22
L202_9:
	ld i0,d1
	add i0,#0x34
	call &__ZN6MAUtil19BluetoothConnectionD1Ev_67
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE93_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 42
	pop rt,d2
	ret

//****************************************
// Function: __ZN5LoginC1EP4Feed
//****************************************

.func __ZN5LoginC1EP4Feed_9, 2, void
.line 12
	push rt,d7
	sub sp,#0x30
	ld fr,sp
	add fr,#0x58
	ld d3,i0
	ld d5,i1
LBB103_9:
.line 12
	call &__ZN4MAUI6ScreenC2Ev_94
LBB104_9:
	ld d6,d3
	add d6,#0xc
LBE104_9:
	ld i1,d3
	add i1,#0x1c
LBE105_9:
	ld r0,&__ZTV5Login_9+8
	ld [d3],r0
	ld r14,&__ZTV5Login_9+124
	ld [d3,4],r14
	ld r0,&__ZTV5Login_9+164
	ld [d6],r0
	ld r14,&__ZTV5Login_9+188
	ld [d3,16],r14
	ld r0,&__ZTV5Login_9+204
	ld [d3,20],r0
	ld r14,&__ZTV5Login_9+216
	ld [d3,24],r14
	ld r0,&__ZTV5Login_9+260
	ld [i1],r0
	ld i0,d3
	add i0,#0x34
	call &__ZN6MAUtil19BluetoothConnectionC1EPNS_18ConnectionListenerE_67
LBB106_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 104
	ld d2,d3
	add d2,#0x7c
LBB107_9:
.line 109
	ld i0,#0x34
	call &__Znam_20
	ld d4,r14
	add d4,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d4
	ld d1,#0x3
L232_9:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBE109_9:
	add d0,#0xc
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L232_9
	ld [d2,8],d4
.line 111
	ld r0,#0x4
	ld [d2,4],r0
.line 113
	ld r14,#0x0
	ld [d2],r14
LBE107_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 12
	ld i0,d3
	add i0,#0x90
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d3
	add i0,#0x8e4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x8e8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x8ec
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x8f0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x8f4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x8f8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x8fc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x900
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x904
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x908
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d3
	add i0,#0x90c
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld d7,d3
	add d7,#0x910
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld [d3,2332],d5
.line 13
	ld r0,#0x0
	ld.b [d3,2340],r0
.line 14
	ld i0,[zr,_exit_9]
	ld i1,[zr,_login_9]
	ld i2,r0
	call &__Z16createMainLayoutPKcS0_b_4
	ld [d3,36],r14
.line 16
	ld i0,r14
	ld i1,#0x1
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_95
LBB110_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[d3,36]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB112_9:
	ld r14,[r14,8]
LBE112_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB113_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE113_9:
	ld r14,[r14]
	ld [d3,40],r14
Ltext73_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 19
	ld d4,fr
	add d4,#0xffffffd4
	ld i0,d4
	ld i1,[zr,_userlbl_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld r14,#0x18
	ld [sp],r14
	ld r0,#0x0
	ld [sp,4],r0
	ld [sp,8],d4
	ld [sp,12],r0
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d0
	ld i1,r0
	ld i2,r0
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d3,44],d0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 20
	ld i0,[d3,40]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d3,44]
	call d0
.line 22
	ld i0,d4
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,#0x30
	call &__Z15createEditLabelN6MAUtil11BasicStringIcEEi_4
	ld [d3,44],r14
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 23
	ld i0,[d3,44]
	call &__ZNK4MAUI6Widget8getWidthEv_95
	ld d2,r14
	add d2,#0xfffffff6
	ld i0,[d3,44]
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld d0,r14
	add d0,#0xfffffff6
	ld i0,d4
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xd4
	call &__Znwm_21
	ld d1,r14
	ld [sp],d0
	ld r0,[d3,44]
	ld [sp,4],r0
	ld [sp,8],d4
	ld r14,#0x0
	ld [sp,12],r14
	ld r0,[zr,_gFontBlue_4]
	ld [sp,16],r0
	ld r14,#0x1
	ld.b [sp,20],r14
	ld r0,#0x0
	ld.b [sp,24],r0
	ld r14,#0x40
	ld [sp,28],r14
	ld r0,#0x1
	ld [sp,32],r0
	ld i0,d1
	ld i1,#0x0
	ld i2,#0xc
	ld i3,d2
	call &__ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE_85
	ld [d3,48],d1
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 24
	ld i0,[d3,48]
	ld i1,#0x0
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_85
.line 25
	ld i0,[d3,48]
	ld i1,#0x0
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_95
.line 26
	ld i0,[d3,44]
	ld i1,d6
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 27
	ld i0,[d3,40]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d3,44]
	call d0
.line 29
	ld i0,d4
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0x9c
	call &__Znwm_21
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	ld r14,[zr,_scrHeight_4]
	ld r0,#0x0
	jc lt,r14,r0,&L241_9
L236_9:
	sra r14,#0x3
	ld [sp],r14
	ld r14,#0x0
	ld [sp,4],r14
	ld [sp,8],d4
	ld [sp,12],r14
	ld r0,[zr,_gFontWhite_4]
	ld [sp,16],r0
	ld i0,d0
	ld i1,r14
	ld i2,r14
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d3,44],d0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 30
	ld i0,[d3,44]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_90
.line 31
	ld i0,[d3,40]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d3,44]
	call d0
.line 33
	ld i0,[d3,40]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
.line 35
	ld i0,d4
	ld i1,d5
	call &__ZN4Feed15getUnsuccessfulEv_14
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i1,[zr,_success_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,d1
	call &__ZNK6MAUtil11BasicStringIcEneERKS1__81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	and d0,#0xff
	add d1,#0xfffffffc
	ld r14,#0x0
	jc ne,d0,r14,&L242_9
.line 38
	ld i0,d1
	ld i1,[zr,_falsesz_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 39
	ld i0,d3
	ld i1,[d3,36]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
LBE103_9:
	add sp,#0x30
	pop rt,d7
	ret
L242_9:
.line 36
	ld i0,d1
	ld i1,d5
	call &__ZN4Feed15getUnsuccessfulEv_14
	ld i0,[d3,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 38
	ld i0,d1
	ld i1,[zr,_falsesz_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 39
	ld i0,d3
	ld i1,[d3,36]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
LBE114_9:
	add sp,#0x30
	pop rt,d7
	ret
L241_9:
.line 29
	add r14,#0x7
	jp &L236_9

//****************************************
// Function: __ZThn16_N5Login11btNewDeviceERKN6MAUtil8BtDeviceE
//****************************************

.func __ZThn16_N5Login11btNewDeviceERKN6MAUtil8BtDeviceE_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Login.h'
.line 21
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 21
	add i0,#0xfffffff0
	call &__ZN5Login11btNewDeviceERKN6MAUtil8BtDeviceE_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN5Login11btNewDeviceERKN6MAUtil8BtDeviceE
//****************************************

.func __ZN5Login11btNewDeviceERKN6MAUtil8BtDeviceE_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 129
	push rt,d6
	sub sp,#0x108
	ld fr,sp
	add fr,#0x12c
	ld d2,i0
	ld d3,i1
LBB129_9:
.line 131
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,fr
	add d0,#0xfffffedc
	ld [sp],r14
	ld i0,d0
	ld i1,&LC19_9
	call &_sprintf_37
.line 132
	ld d1,fr
	add d1,#0xfffffed8
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 133
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,&LC20_9
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L321_9
LBE130_9:
.line 137
	add sp,#0x108
	pop rt,d6
	ret
L321_9:
.line 134
	ld i0,d1
	ld i1,&LC21_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB133_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 167
	add d2,#0x7c
LBB134_9:
.line 168
	ld r1,[d2,4]
	ld r14,r1
	add r14,#0xffffffff
	ld r0,[d2]
	jc lt,r0,r14,&L316_9
.line 169
	ld r14,#0x0
	jc eq,r1,r14,&L269_9
LBB135_9:
.line 293
	ld d5,r1
	add d5,r1
LBB136_9:
.line 295
	jc lt,r1,d5,&L322_9
L316_9:
	ld i0,[d2,8]
L268_9:
.line 174
	ld d0,r0
	mul d0,#0xc
	add d0,i0
	add r0,#0x1
	ld [d2],r0
LBB139_9:
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld.b r0,[d3,4]
	ld.b [d0,4],r0
	ld.b r14,[d3,5]
	ld.b [d0,5],r14
	ld.b r0,[d3,6]
	ld.b [d0,6],r0
	ld.b r14,[d3,7]
	ld.b [d0,7],r14
	ld.b r0,[d3,8]
	ld.b [d0,8],r0
	ld.b d3,[d3,9]
	ld.b [d0,9],d3
LBE139_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 137
	add sp,#0x108
	pop rt,d6
	ret
L322_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,d5
	mul i0,#0xc
	add i0,#0x4
	call &__Znam_20
	ld d6,r14
	add d6,#0x4
	ld [r14],d5
	ld d1,d6
	ld d0,d5
	jp &L317_9
L323_9:
.line 109
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBE148_9:
.line 298
	add d1,#0xc
L317_9:
	add d0,#0xffffffff
	ld r0,#0xffffffff
	jc ne,d0,r0,&L323_9
LBB149_9:
.line 300
	ld d4,#0x0
L318_9:
	ld r0,[d2]
	jc le,r0,d4,&L312_9
LBB150_9:
.line 174
	ld r14,d4
	mul r14,#0xc
	ld d1,r14
	add d1,d6
	ld d0,[d2,8]
	add d0,r14
LBB151_9:
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld.b r14,[d0,4]
	ld.b [d1,4],r14
	ld.b r0,[d0,5]
	ld.b [d1,5],r0
	ld.b r14,[d0,6]
	ld.b [d1,6],r14
	ld.b r0,[d0,7]
	ld.b [d1,7],r0
	ld.b r14,[d0,8]
	ld.b [d1,8],r14
	ld.b d0,[d0,9]
	ld.b [d1,9],d0
LBE151_9:
.line 300
	add d4,#0x1
	jp &L318_9
L269_9:
.line 298
	ld i0,#0x34
	call &__Znam_20
	ld d5,r14
	add d5,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d5
	ld d1,#0x3
L292_9:
	ld r14,#0xffffffff
	jc eq,d1,r14,&L293_9
LBB155_9:
.line 109
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBE156_9:
.line 298
	add d0,#0xc
	add d1,#0xffffffff
	jp &L292_9
L293_9:
.line 300
	ld d4,#0x0
L319_9:
	ld r0,[d2]
	jc le,r0,d4,&L314_9
LBB158_9:
.line 174
	ld r14,d4
	mul r14,#0xc
	ld d1,r14
	add d1,d5
	ld d0,[d2,8]
	add d0,r14
LBB159_9:
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld.b r0,[d0,4]
	ld.b [d1,4],r0
	ld.b r14,[d0,5]
	ld.b [d1,5],r14
	ld.b r0,[d0,6]
	ld.b [d1,6],r0
	ld.b r14,[d0,7]
	ld.b [d1,7],r14
	ld.b r0,[d0,8]
	ld.b [d1,8],r0
	ld.b d0,[d0,9]
	ld.b [d1,9],d0
LBE159_9:
.line 300
	add d4,#0x1
	jp &L319_9
L314_9:
.line 304
	ld r14,#0x4
	ld [d2,4],r14
.line 305
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L303_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
L304_9:
	jc eq,i0,d0,&L305_9
	add d0,#0xfffffff4
LBB160_9:
.line 143
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
	jp &L304_9
L305_9:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d2]
L303_9:
.line 307
	ld i0,d5
	ld [d2,8],i0
	jp &L268_9
L312_9:
.line 304
	ld [d2,4],d5
.line 305
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L283_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
L284_9:
	jc eq,i0,d0,&L285_9
	add d0,#0xfffffff4
LBB165_9:
.line 143
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
	jp &L284_9
L285_9:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d2]
L283_9:
.line 307
	ld i0,d6
LBE164_9:
	ld [d2,8],i0
	jp &L268_9

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_9, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 321
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext84_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L360_9
L324_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 321
	add sp,#0x4
	pop rt,d0
	ret
L360_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L361_9
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L324_9
	ld i0,&_TRADE_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L362_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 321
	add sp,#0x4
	pop rt,d0
	ret
L361_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_9
	ld i1,&LC22_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_9
	ld i1,&LC23_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC24_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC25_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC26_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC27_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L362_9

//****************************************
// Function: __GLOBAL__I__ZN5LoginC2EP4Feed
//****************************************

.func __GLOBAL__I__ZN5LoginC2EP4Feed_9, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 322
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 322
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_9
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN5LoginC2EP4Feed
//****************************************

.func __GLOBAL__D__ZN5LoginC2EP4Feed_9, 0, void
.line 323
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 323
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_9
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_10, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_10, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_10, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN11ImageScreenC1EPN4MAUI6ScreenEiP4FeedbP4Card
//****************************************

.func __ZN11ImageScreenC1EPN4MAUI6ScreenEiP4FeedbP4Card_10, 6, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 6
	push rt,d5
	sub sp,#0x14
	ld fr,sp
	add fr,#0x34
	ld d1,i0
	ld d0,i1
	ld d4,i2
	ld d2,i3
	ld.b d5,[fr]
	ld d3,[fr,4]
LBB10_10:
.line 6
	call &__ZN4MAUI6ScreenC2Ev_94
	ld r0,&__ZTV11ImageScreen_10+8
	ld [d1],r0
	ld r14,&__ZTV11ImageScreen_10+64
	ld [d1,4],r14
	ld [d1,12],d0
	ld [d1,20],d4
	ld [d1,24],d3
	ld [d1,28],d2
	ld.b [d1,48],d5
.line 8
	ld i0,#0xc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_94
	ld [d1,16],d0
.line 9
	ld i0,[zr,_back_10]
	call &__Z17createImageLayoutPKc_4
	ld i0,r14
	ld [d1,36],r14
LBB11_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB13_10:
	ld r14,[r14,8]
LBE13_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB14_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE14_10:
	ld i0,[r14]
	ld [d1,40],i0
Ltext9_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 11
	call &__ZNK4MAUI6Widget9getHeightEv_95
	add r14,#0xffffffba
	ld [d1,44],r14
.line 12
	ld r0,#0x0
	jc eq,d3,r0,&L20_10
.line 13
	ld i0,d2
	call &__ZN4Feed15getTouchEnabledEv_14
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L28_10
.line 16
	ld i0,[zr,_back_10]
	ld i1,[zr,_tradelbl_10]
	ld i2,[zr,_flipit_10]
L27_10:
	call &__Z17createImageLayoutPKcS0_S0__4
	ld i0,r14
	ld [d1,36],r14
LBB15_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB16_10:
	ld r14,[r14,8]
LBE16_10:
	ld i0,[r14]
	ld [d1,40],i0
Ltext11_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 19
	call &__ZNK4MAUI6Widget9getHeightEv_95
	ld [d1,44],r14
L20_10:
.line 21
	ld i0,#0x84
	call &__Znwm_21
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xfffffff6
	ld r14,[d1,44]
	ld [sp],r14
	ld r0,[d1,40]
	ld [sp,4],r0
	ld r14,#0x0
	ld.b [sp,8],r14
	ld.b [sp,12],r14
	ld [sp,16],d4
	ld i0,d0
	ld i1,#0x0
	ld i2,i1
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_88
	ld [d1,32],d0
.line 23
	ld i0,d1
	ld i1,[d1,36]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
.line 25
	ld r0,#0x0
	jc eq,d3,r0,&L17_10
.line 26
	ld r14,d5
	and r14,#0xff
	jc eq,r14,r0,&L25_10
.line 27
	ld i0,#0x44c
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN10ImageCacheC1Ev_12
	ld i0,[d1,32]
	ld i1,d3
	ld i2,[d1,44]
	add i2,#0xfffffff6
	ld i3,d0
	call &__Z12retrieveBackPN4MAUI5ImageEP4CardiP10ImageCache_4
L17_10:
.line 32
	add sp,#0x14
	pop rt,d5
	ret
L28_10:
.line 14
	ld i0,[zr,_back_10]
	ld i1,[zr,_tradelbl_10]
	ld i2,&LC3_10
	jp &L27_10
L25_10:
.line 29
	ld i0,#0x44c
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN10ImageCacheC1Ev_12
	ld i0,[d1,32]
	ld i1,d3
	ld i2,[d1,44]
	add i2,#0xfffffff6
	ld i3,d0
	call &__Z13retrieveFrontPN4MAUI5ImageEP4CardiP10ImageCache_4
LBE17_10:
.line 32
	add sp,#0x14
	pop rt,d5
	ret

//****************************************
// Function: __ZThn4_N11ImageScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N11ImageScreen19pointerReleaseEventE9MAPoint2d_10, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\ImageScreen.h'
.line 19
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 19
	add i0,#0xfffffffc
	call &__ZN11ImageScreen19pointerReleaseEventE9MAPoint2d_10
	pop rt,fr
	ret

//****************************************
// Function: __ZN11ImageScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN11ImageScreen19pointerReleaseEventE9MAPoint2d_10, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 45
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
LBB18_10:
.line 46
	ld.b r14,[i0,50]
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L37_10
.line 49
	ld.b r1,[i0,49]
	and r1,#0xff
	jc eq,r1,r14,&L32_10
.line 50
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 55
	call d0
L30_10:
.line 58
	pop rt,d0
	ret
L32_10:
.line 53
	ld r14,[i0,24]
	jc eq,r14,r1,&L30_10
.line 54
	ld.b r14,[i0,51]
	and r14,#0xff
	jc eq,r14,r1,&L30_10
.line 55
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L30_10
L37_10:
.line 47
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 55
	call d0
	jp &L30_10

//****************************************
// Function: __ZN11ImageScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN11ImageScreen10locateItemE9MAPoint2d_10, 3, void
.line 61
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
LBB20_10:
.line 62
	ld r0,#0x0
	ld.b [i0,51],r0
.line 63
	ld.b [i0,49],r0
.line 64
	ld.b [i0,50],r0
LBB22_10:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-28],i1
	ld [fr,-24],i2
LBE23_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 68
	ld r14,[i0,24]
LBB25_10:
.line 69
	ld d2,r14
LBE26_10:
.line 68
	ld r0,#0x0
	jc eq,r14,r0,&L43_10
LBB27_10:
.line 84
	ld d2,#0x0
LBB29_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 258
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_10:
	ld r14,[r14]
LBE30_10:
	jc le,r14,d2,&L83_10
L64_10:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB32_10:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE32_10:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L60_10
Ltext17_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 88
	ld r14,#0x1
	ld.b [d1,51],r14
L60_10:
.line 84
	add d2,#0x1
LBB33_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 258
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB34_10:
	ld r14,[r14]
LBE34_10:
	jc gt,r14,d2,&L64_10
L83_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 92
	ld d2,#0x0
	jp &L65_10
L78_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB38_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE38_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB39_10:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE39_10:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L82_10
Ltext21_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 92
	add d2,#0x1
L65_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB42_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE42_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB43_10:
.line 258
	ld r14,[r14]
LBE43_10:
.line 359
	jc gt,r14,d2,&L78_10
L38_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 107
	add sp,#0x8
	pop rt,d2
	ret
L56_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB51_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE51_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB52_10:
	ld r0,d2
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE52_10:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffe4
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L82_10
Ltext25_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 69
	add d2,#0x1
L43_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB55_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE55_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB56_10:
.line 258
	ld r14,[r14]
LBE56_10:
.line 359
	jc gt,r14,d2,&L56_10
	jp &L38_10
L82_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 96
	jc ne,d2,r0,&L73_10
.line 97
	ld r14,#0x1
	ld.b [d1,49],r14
LBE58_10:
.line 107
	add sp,#0x8
	pop rt,d2
	ret
L73_10:
.line 98
	ld r0,#0x1
	jc eq,d2,r0,&L84_10
.line 100
	ld r14,#0x2
	jc ne,d2,r14,&L38_10
.line 101
	ld r0,#0x1
	ld.b [d1,50],r0
	jp &L38_10
L84_10:
.line 99
	ld.b [d1,51],d2
	jp &L38_10

//****************************************
// Function: __ZThn4_N11ImageScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N11ImageScreen16pointerMoveEventE9MAPoint2d_10, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\ImageScreen.h'
.line 19
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 19
	add i0,#0xfffffffc
	call &__ZN11ImageScreen16pointerMoveEventE9MAPoint2d_10
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN11ImageScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN11ImageScreen16pointerMoveEventE9MAPoint2d_10, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 40
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB64_10:
.line 41
	call &__ZN11ImageScreen10locateItemE9MAPoint2d_10
LBE64_10:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N11ImageScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N11ImageScreen17pointerPressEventE9MAPoint2d_10, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\ImageScreen.h'
.line 19
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 19
	add i0,#0xfffffffc
	call &__ZN11ImageScreen17pointerPressEventE9MAPoint2d_10
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN11ImageScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN11ImageScreen17pointerPressEventE9MAPoint2d_10, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 35
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB65_10:
.line 36
	call &__ZN11ImageScreen10locateItemE9MAPoint2d_10
LBE65_10:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN11ImageScreen13keyPressEventEi
//****************************************

.func __ZN11ImageScreen13keyPressEventEi_10, 2, void
.line 128
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB66_10:
.line 129
	ld r0,#0x11d
	jc eq,i1,r0,&L98_10
	jc gt,i1,r0,&L103_10
	ld r14,#0x11c
	jc eq,i1,r14,&L97_10
L89_10:
.line 162
	pop rt,d1
	ret
L103_10:
.line 129
	ld r0,#0x11e
	jc ne,i1,r0,&L89_10
.line 131
	ld r14,[i0,24]
	ld r0,#0x0
	jc eq,r14,r0,&L89_10
.line 132
	ld i0,[i0,16]
	jc ne,i0,r0,&L104_10
L93_10:
.line 135
	ld i0,#0x34
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d1
	ld i2,[d1,28]
	ld i3,[d1,24]
	call &__ZN18TradeOptionsScreenC1EPN4MAUI6ScreenEP4FeedP4Card_5
	ld [d1,16],d0
.line 136
	ld r14,[d0]
	ld d1,[r14,28]
	ld i0,d0
	call d1
LBE67_10:
.line 162
	pop rt,d1
	ret
L98_10:
.line 158
	ld i0,[d1,12]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
LBE68_10:
.line 162
	pop rt,d1
	ret
L97_10:
.line 143
	ld r14,[i0,24]
	ld r0,#0x0
	jc eq,r14,r0,&L98_10
.line 144
	ld.b r14,[i0,48]
	xor r14,#0x1
	ld.b [i0,48],r14
.line 145
	ld i0,[i0,32]
	call &__ZNK4MAUI5Image11getResourceEv_88
	ld r0,#0xc
	jc eq,r14,r0,&L99_10
.line 146
	ld i0,[d1,32]
	call &__ZNK4MAUI5Image11getResourceEv_88
	ld i0,r14
	syscall 59
L99_10:
.line 148
	ld i0,[d1,32]
	ld i1,#0xc
	call &__ZN4MAUI5Image11setResourceEi_88
.line 149
	ld i0,[d1,32]
	ld r14,[i0]
	ld d0,[r14,12]
	call d0
.line 150
	ld i0,[d1,32]
	call &__ZN4MAUI6Widget14requestRepaintEv_95
.line 151
	syscall 44
.line 152
	ld.b r14,[d1,48]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L100_10
.line 153
	ld i0,#0x44c
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN10ImageCacheC1Ev_12
	ld i0,[d1,32]
	ld i1,[d1,24]
	ld i2,[d1,44]
	add i2,#0xfffffff6
	ld i3,d0
	call &__Z12retrieveBackPN4MAUI5ImageEP4CardiP10ImageCache_4
LBE69_10:
.line 162
	pop rt,d1
	ret
L104_10:
.line 133
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L93_10
L100_10:
.line 155
	ld i0,#0x44c
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN10ImageCacheC1Ev_12
	ld i0,[d1,32]
	ld i1,[d1,24]
	ld i2,[d1,44]
	add i2,#0xfffffff6
	ld i3,d0
	call &__Z13retrieveFrontPN4MAUI5ImageEP4CardiP10ImageCache_4
LBE70_10:
.line 162
	pop rt,d1
	ret

//****************************************
// Function: __ZThn4_N11ImageScreenD0Ev
//****************************************

.func __ZThn4_N11ImageScreenD0Ev_10, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\ImageScreen.h'
.line 19
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 19
	add i0,#0xfffffffc
	call &__ZN11ImageScreenD0Ev_10
	pop rt,fr
	ret

//****************************************
// Function: __ZN11ImageScreenD0Ev
//****************************************

.func __ZN11ImageScreenD0Ev_10, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 109
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB71_10:
.line 109
	ld r0,&__ZTV11ImageScreen_10+8
	ld [i0],r0
	ld r2,&__ZTV11ImageScreen_10+64
	ld [i0,4],r2
.line 110
	ld i0,[i0,32]
	call &__ZNK4MAUI5Image11getResourceEv_88
	ld r0,#0xc
	jc eq,r14,r0,&L108_10
.line 111
	ld i0,[d1,32]
	call &__ZNK4MAUI5Image11getResourceEv_88
	ld i0,r14
	syscall 59
L108_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB73_10:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L143_10
	ld r1,[d0]
L110_10:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L140_10
	ld i0,[d0,8]
L120_10:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L120_10
L140_10:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE76_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 114
	ld i0,[d1,40]
	jc ne,i0,r14,&L144_10
.line 115
	ld i0,[d1,36]
	ld r0,#0x0
	jc ne,i0,r0,&L145_10
L126_10:
.line 116
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L146_10
L127_10:
.line 120
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L147_10
L130_10:
.line 124
	ld r14,#0xffffffff
	ld [d1,20],r14
.line 125
	ld i0,[d1,16]
	ld r0,#0x0
	jc ne,i0,r0,&L148_10
L134_10:
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE71_10:
.line 126
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret
L144_10:
.line 114
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 115
	ld i0,[d1,36]
	ld r0,#0x0
	jc eq,i0,r0,&L126_10
L145_10:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 116
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L127_10
L146_10:
.line 117
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 118
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 120
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L130_10
L147_10:
.line 121
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 122
	ld r2,#0x0
	ld [zr,_softKeys_4],r2
.line 124
	ld r14,#0xffffffff
	ld [d1,20],r14
.line 125
	ld i0,[d1,16]
	ld r0,#0x0
	jc eq,i0,r0,&L134_10
L148_10:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE81_10:
.line 126
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d2
	ret
L143_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r2
	call &__Znam_20
	ld d2,r14
LBB91_10:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L142_10
	ld i0,[d0,8]
L114_10:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L114_10
L138_10:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L149_10
.line 300
	ld [d0,8],d2
	jp &L110_10
L149_10:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L110_10
L142_10:
	ld i0,[d0,8]
	jp &L138_10

//****************************************
// Function: __ZThn4_N11ImageScreenD1Ev
//****************************************

.func __ZThn4_N11ImageScreenD1Ev_10, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\ImageScreen.h'
.line 19
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 19
	add i0,#0xfffffffc
	call &__ZN11ImageScreenD1Ev_10
	pop rt,fr
	ret

//****************************************
// Function: __ZN11ImageScreenD1Ev
//****************************************

.func __ZN11ImageScreenD1Ev_10, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 109
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB92_10:
.line 109
	ld r0,&__ZTV11ImageScreen_10+8
	ld [i0],r0
	ld r2,&__ZTV11ImageScreen_10+64
	ld [i0,4],r2
.line 110
	ld i0,[i0,32]
	call &__ZNK4MAUI5Image11getResourceEv_88
	ld r0,#0xc
	jc eq,r14,r0,&L153_10
.line 111
	ld i0,[d1,32]
	call &__ZNK4MAUI5Image11getResourceEv_88
	ld i0,r14
	syscall 59
L153_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB94_10:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L188_10
	ld r1,[d0]
L155_10:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L185_10
	ld i0,[d0,8]
L165_10:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L165_10
L185_10:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE97_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 114
	ld i0,[d1,40]
	jc ne,i0,r14,&L189_10
.line 115
	ld i0,[d1,36]
	ld r0,#0x0
	jc ne,i0,r0,&L190_10
L171_10:
.line 116
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L191_10
L172_10:
.line 120
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L192_10
L175_10:
.line 124
	ld r14,#0xffffffff
	ld [d1,20],r14
.line 125
	ld i0,[d1,16]
	ld r0,#0x0
	jc ne,i0,r0,&L193_10
L179_10:
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE92_10:
.line 126
	pop rt,d2
	ret
L189_10:
.line 114
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 115
	ld i0,[d1,36]
	ld r0,#0x0
	jc eq,i0,r0,&L171_10
L190_10:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 116
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L172_10
L191_10:
.line 117
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 118
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 120
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L175_10
L192_10:
.line 121
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 122
	ld r2,#0x0
	ld [zr,_softKeys_4],r2
.line 124
	ld r14,#0xffffffff
	ld [d1,20],r14
.line 125
	ld i0,[d1,16]
	ld r0,#0x0
	jc eq,i0,r0,&L179_10
L193_10:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_94
LBE102_10:
.line 126
	pop rt,d2
	ret
L188_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r2
	call &__Znam_20
	ld d2,r14
LBB112_10:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L187_10
	ld i0,[d0,8]
L159_10:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L159_10
L183_10:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L194_10
.line 300
	ld [d0,8],d2
	jp &L155_10
L194_10:
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L155_10
L187_10:
	ld i0,[d0,8]
	jp &L183_10

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_10, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 162
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext47_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L275_10
L239_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 162
	add sp,#0x4
	pop rt,d0
	ret
L275_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L276_10
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L239_10
	ld i0,&_TRADE_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L277_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 162
	add sp,#0x4
	pop rt,d0
	ret
L276_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_10
	ld i1,&LC4_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_10
	ld i1,&LC5_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC6_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC7_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC8_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC9_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L277_10

//****************************************
// Function: __GLOBAL__I__ZN11ImageScreenC2EPN4MAUI6ScreenEiP4FeedbP4Card
//****************************************

.func __GLOBAL__I__ZN11ImageScreenC2EPN4MAUI6ScreenEiP4FeedbP4Card_10, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 163
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 163
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_10
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN11ImageScreenC2EPN4MAUI6ScreenEiP4FeedbP4Card
//****************************************

.func __GLOBAL__D__ZN11ImageScreenC2EPN4MAUI6ScreenEiP4FeedbP4Card_10, 0, void
.line 164
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 164
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_10
	pop rt,fr
	ret

//****************************************
// Function: __ZN17ImageCacheRequestC1EPN4MAUI5ImageEP4Cardii
//****************************************

.func __ZN17ImageCacheRequestC1EPN4MAUI5ImageEP4Cardii_11, 5, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCacheRequest.cpp'
.line 4
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_11:
.line 4
	ld [i0],i2
	ld [i0,4],i1
	ld [i0,8],i3
	ld r14,[fr]
	ld [i0,12],r14
LBE3_11:
	pop fr,fr
	ret

//****************************************
// Function: __ZN17ImageCacheRequestD1Ev
//****************************************

.func __ZN17ImageCacheRequestD1Ev_11, 1, void
.line 6
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 6
	pop fr,fr
	ret

//****************************************
// Function: __ZN17ImageCacheRequest6getUrlEv
//****************************************

.func __ZN17ImageCacheRequest6getUrlEv_11, 2, int
.line 9
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB4_11:
.line 10
	ld r14,[i1,12]
	ld r0,#0x1
	jc eq,r14,r0,&L12_11
	jc le,r14,r0,&L16_11
	ld r0,#0x2
	jc eq,r14,r0,&L13_11
L10_11:
.line 18
	ld i0,d0
	ld i1,&LC0_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
L9_11:
.line 19
	ld r14,d0
	pop rt,d0
	ret
L16_11:
.line 10
	ld r0,#0x0
	jc ne,r14,r0,&L10_11
.line 12
	ld i1,[i1]
	call &__ZN4Card8getThumbEv_15
	jp &L9_11
L12_11:
.line 14
	ld i1,[i1]
	call &__ZN4Card8getFrontEv_15
LBE5_11:
.line 19
	ld r14,d0
	pop rt,d0
	ret
L13_11:
.line 16
	ld i1,[i1]
	call &__ZN4Card7getBackEv_15
LBE6_11:
.line 19
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN17ImageCacheRequest11getSaveNameEv
//****************************************

.func __ZN17ImageCacheRequest11getSaveNameEv_11, 2, int
.line 22
	push rt,d4
	sub sp,#0xc
	ld fr,sp
	add fr,#0x28
	ld d4,i0
	ld d3,i1
LBB7_11:
.line 23
	ld r14,[i1,12]
	ld r0,#0x1
	jc eq,r14,r0,&L20_11
	jc le,r14,r0,&L25_11
	ld r0,#0x2
	jc eq,r14,r0,&L21_11
L18_11:
.line 34
	ld i0,d4
	ld i1,&LC0_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBE7_11:
.line 35
	ld r14,d4
	add sp,#0xc
	pop rt,d4
	ret
L25_11:
.line 23
	ld r0,#0x0
	jc ne,r14,r0,&L18_11
.line 25
	ld d0,fr
	add d0,#0xffffffe0
	ld d2,fr
	add d2,#0xffffffdc
	ld i0,d2
	ld i1,[i1]
	call &__ZN4Card5getIdEv_15
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i1,&LC1_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d3]
	ld i1,r14
	call &__ZN4Card8setThumbEPKc_15
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 26
	ld i0,d1
	ld i1,[d3]
	call &__ZN4Card5getIdEv_15
	ld i0,d2
	ld i1,&LC1_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,d1
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
LBB9_11:
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
LBE9_11:
.line 32
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L26_11:
.line 35
	ld r14,d4
	add sp,#0xc
	pop rt,d4
	ret
L20_11:
.line 28
	ld d2,fr
	add d2,#0xffffffd8
	ld d1,fr
	add d1,#0xffffffdc
	ld i0,d1
	ld i1,[i1]
	call &__ZN4Card5getIdEv_15
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC2_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d3]
	ld i1,r14
	call &__ZN4Card8setFrontEPKc_15
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 29
	ld i0,d2
	ld i1,[d3]
	call &__ZN4Card5getIdEv_15
	ld i0,d1
	ld i1,&LC2_11
L23_11:
.line 32
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
LBB12_11:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L26_11
L21_11:
.line 31
	ld d2,fr
	add d2,#0xffffffd8
	ld d1,fr
	add d1,#0xffffffdc
	ld i0,d1
	ld i1,[i1]
	call &__ZN4Card5getIdEv_15
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC3_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d3]
	ld i1,r14
	call &__ZN4Card7setBackEPKc_15
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 32
	ld i0,d2
	ld i1,[d3]
	call &__ZN4Card5getIdEv_15
	ld i0,d1
	ld i1,&LC3_11
	jp &L23_11

//****************************************
// Function: __ZN17ImageCacheRequest8getImageEv
//****************************************

.func __ZN17ImageCacheRequest8getImageEv_11, 1, int
.line 38
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 40
	ld r14,[i0,4]
	pop fr,fr
	ret

//****************************************
// Function: __ZN17ImageCacheRequest9getHeightEv
//****************************************

.func __ZN17ImageCacheRequest9getHeightEv_11, 1, int
.line 43
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 45
	ld r14,[i0,8]
	pop fr,fr
	ret

//****************************************
// Function: __ZN10ImageCache7processEv
//****************************************

.func __ZN10ImageCache7processEv_12, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 27
	push rt,d2
	sub sp,#0x2c
	ld fr,sp
	add fr,#0x40
	ld d1,i0
LBB2_12:
.line 29
	ld.b r0,[i0,56]
	and r0,#0xff
	ld r14,#0x0
	jc ne,r0,r14,&L1_12
LBB4_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 258
	ld r1,i0
	add r1,#0x4
LBB5_12:
	ld r14,[r1]
LBE5_12:
	jc eq,r14,r0,&L1_12
Ltext2_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 36
	ld r14,#0x1
	ld.b [i0,56],r14
LBB6_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld r14,[r1,8]
LBE7_12:
	ld r14,[r14]
	ld [i0,1096],r14
LBB8_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 41
	ld d2,i0
	add d2,#0x10
	ld d0,fr
	add d0,#0xffffffc4
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_62
LBB9_12:
	ld r14,[fr,-56]
	ld [d2,4],r14
LBE13_12:
	ld r14,[fr,-52]
	ld [d2,8],r14
	ld r14,[fr,-48]
	ld [d2,12],r14
	ld r14,[fr,-44]
	ld [d2,16],r14
	ld r14,[fr,-40]
	ld [d2,20],r14
	ld r14,[fr,-36]
	ld [d2,24],r14
	ld r14,[fr,-32]
	ld [d2,28],r14
	ld r14,[fr,-28]
	ld r15,[fr,-24]
	ld [d2,32],r14
	ld [d2,36],r15
LBE11_12:
.line 9
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [d0],r14
	ld i0,d0
	call &__ZN6MAUtil10ConnectionD2Ev_62
.line 42
	add d0,#0xfffffffc
	ld i0,d0
	ld i1,[d1,1096]
	call &__ZN17ImageCacheRequest6getUrlEv_11
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,r14
	ld i2,#0x1
	call &__ZN6MAUtil14HttpConnection6createEPKci_62
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 43
	ld r14,#0x0
	jc lt,d1,r14,&L1_12
.line 46
	ld i0,d2
	call &__ZN6MAUtil14HttpConnection6finishEv_62
L1_12:
.line 48
	add sp,#0x2c
	pop rt,d2
	ret

//****************************************
// Function: __ZN10ImageCache12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZN10ImageCache12httpFinishedEPN6MAUtil14HttpConnectionEi_12, 3, void
.line 62
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
LBB14_12:
.line 63
	ld i0,#0x4
	call &__Znwm_21
	ld d2,r14
	ld i0,r14
	ld i1,&LC0_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 64
	ld d3,d1
	add d3,#0x10
	ld i0,d3
	ld i1,&LC1_12
	ld i2,d2
	call &__ZN6MAUtil14HttpConnection17getResponseHeaderEPKcPNS_11BasicStringIcEE_62
	ld d0,r14
.line 65
	ld r0,#0x0
	ld [d1,1092],r0
.line 66
	ld [d1,1088],r0
.line 67
	syscall 58
	ld [d1,1084],r14
.line 68
	ld r14,#0xfffffff0
	jc eq,d0,r14,&L18_12
.line 71
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	call &_atoi_33
	ld [d1,1092],r14
L18_12:
.line 73
	ld r0,#0x0
	jc ne,d2,r0,&L26_12
L20_12:
.line 74
	ld i0,[d1,1084]
	ld i1,[d1,1092]
	syscall 57
.line 78
	ld i2,[d1,1092]
	ld r14,#0x3ff
	jc gt,i2,r14,&L23_12
	ld r0,#0x0
	jc ne,i2,r0,&L22_12
L23_12:
.line 79
	ld i0,d3
	ld i1,d1
	add i1,#0x39
	ld i2,#0x400
.line 82
	call &__ZN6MAUtil10Connection4recvEPvi_62
LBE15_12:
.line 84
	pop rt,d3
	ret
L26_12:
.line 73
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZdlPv_23
	jp &L20_12
L22_12:
.line 81
	ld r14,d1
	add r14,i2
	ld r0,#0x0
	ld.b [r14,57],r0
.line 82
	ld i0,d3
	ld i1,d1
	add i1,#0x39
	call &__ZN6MAUtil10Connection4recvEPvi_62
LBE17_12:
.line 84
	pop rt,d3
	ret

//****************************************
// Function: __ZN10ImageCacheD1Ev
//****************************************

.func __ZN10ImageCacheD1Ev_12, 1, void
.line 14
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB18_12:
.line 14
	ld r14,&__ZTV10ImageCache_12+8
	ld [i0],r14
LBB19_12:
.line 9
	add i0,#0x10
LBB20_12:
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r14
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE20_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 136
	ld i0,[d0,12]
	ld r14,#0x0
	jc ne,i0,r14,&L39_12
LBE22_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 15
	pop rt,d0
	ret
L39_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_22
LBE25_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 15
	pop rt,d0
	ret

//****************************************
// Function: __ZN10ImageCacheC1Ev
//****************************************

.func __ZN10ImageCacheC1Ev_12, 1, void
.line 8
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB34_12:
.line 9
	ld r14,&__ZTV10ImageCache_12+8
	ld [i0],r14
LBB35_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x4
LBB36_12:
.line 109
	ld i0,#0x10
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r14,#0x0
	ld [d0],r14
LBE36_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 9
	ld i0,d1
	add i0,#0x10
	ld i1,d1
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_62
.line 10
	ld r14,#0x0
	ld.b [d1,56],r14
LBE34_12:
	pop rt,d1
	ret

//****************************************
// Function: __ZN10ImageCache7requestEP17ImageCacheRequest
//****************************************

.func __ZN10ImageCache7requestEP17ImageCacheRequest_12, 2, void
.line 18
	push rt,d3
	sub sp,#0x4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld [fr,-28],i1
LBB40_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 160
	ld d1,i0
	add d1,#0x4
LBB42_12:
.line 161
	ld d0,[d1,4]
	ld r14,d0
	add r14,#0xffffffff
	ld r1,[d1]
	jc lt,r1,r14,&L87_12
.line 162
	ld r0,#0x0
	jc eq,d0,r0,&L63_12
LBB43_12:
.line 286
	ld d2,d0
	add d2,d0
LBB44_12:
.line 288
	jc lt,d0,d2,&L91_12
L87_12:
	ld i0,[d1,8]
LBE45_12:
.line 167
	ld r14,r1
	sll r14,#0x2
	add r14,i0
	ld r0,[fr,-28]
	ld [r14],r0
	add r1,#0x1
	ld [d1],r1
LBE42_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 23
	ld i0,d3
	call &__ZN10ImageCache7processEv_12
LBE40_12:
	add sp,#0x4
	pop rt,d3
	ret
L63_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,#0x10
	call &__Znam_20
	ld d2,r14
LBB52_12:
.line 293
	ld r2,d0
	ld r1,[d1]
	jc le,r1,d0,&L89_12
	ld i0,[d1,8]
L78_12:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L78_12
L85_12:
.line 297
	ld r0,#0x4
	ld [d1,4],r0
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L92_12
.line 300
	ld i0,d2
L90_12:
	ld [d1,8],i0
L94_12:
.line 167
	ld r14,r1
	sll r14,#0x2
	add r14,i0
	ld r0,[fr,-28]
	ld [r14],r0
	add r1,#0x1
	ld [d1],r1
LBE48_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 23
	ld i0,d3
	call &__ZN10ImageCache7processEv_12
LBE46_12:
	add sp,#0x4
	pop rt,d3
	ret
L91_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x2
	call &__Znam_20
	ld d0,r14
LBB59_12:
.line 293
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L88_12
	ld i0,[d1,8]
L69_12:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L69_12
L83_12:
.line 297
	ld [d1,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L93_12
.line 300
	ld i0,d0
L95_12:
	ld [d1,8],i0
	jp &L94_12
L89_12:
	ld i0,[d1,8]
	jp &L85_12
L92_12:
.line 298
	call &__ZdaPv_22
	ld r1,[d1]
.line 300
	ld i0,d2
	jp &L90_12
L93_12:
.line 298
	call &__ZdaPv_22
	ld r1,[d1]
.line 300
	ld i0,d0
	jp &L95_12
L88_12:
	ld i0,[d1,8]
	jp &L83_12

//****************************************
// Function: __ZN10ImageCache19finishedDownloadingEv
//****************************************

.func __ZN10ImageCache19finishedDownloadingEv_12, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 51
	push rt,d3
	sub sp,#0x4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
LBB66_12:
.line 53
	ld d0,fr
	add d0,#0xffffffe4
	ld i0,d0
	ld i1,[d1,1096]
	call &__ZN17ImageCacheRequest11getSaveNameEv_11
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[d1,1084]
	call &__Z8saveFilePKci_4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 54
	ld i0,[d1,1096]
	call &__ZN17ImageCacheRequest8getImageEv_11
	ld d0,r14
	ld i0,[d1,1096]
	call &__ZN17ImageCacheRequest9getHeightEv_11
	ld i0,d0
	ld i1,[d1,1084]
	ld i2,r14
	call &__Z11returnImagePN4MAUI5ImageEii_4
.line 55
	ld d0,[d1,1096]
	ld r2,#0x0
	jc ne,d0,r2,&L125_12
L98_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 209
	ld d0,d1
	add d0,#0x4
LBB68_12:
.line 190
	ld i0,[d0,8]
	ld r14,i0
LBB70_12:
.line 334
	ld r1,[d0]
	ld r0,r1
	sll r0,#0x2
	add r0,i0
LBE73_12:
.line 199
	add r0,#0xfffffffc
	jc eq,r0,i0,&L119_12
L102_12:
.line 198
	ld r2,[r14,4]
	ld [r14],r2
.line 199
	add r14,#0x4
	jc ne,r0,r14,&L102_12
L119_12:
.line 265
	ld d2,r1
	add d2,#0xffffffff
LBB75_12:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d2,&L126_12
L104_12:
.line 274
	ld r0,d2
	jc le,r1,d2,&L123_12
L114_12:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L114_12
L123_12:
.line 278
	ld [d0],d2
LBE76_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 57
	ld r14,#0x0
	ld.b [d1,56],r14
.line 58
	ld i0,[d1,1084]
	syscall 59
.line 59
	ld i0,d1
	call &__ZN10ImageCache7processEv_12
LBE66_12:
	add sp,#0x4
	pop rt,d3
	ret
L126_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x2
	call &__Znam_20
	ld d3,r14
LBB93_12:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L124_12
	ld i0,[d0,8]
L108_12:
.line 294
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d3
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r2,#0x1
	jc gt,r1,r2,&L108_12
L121_12:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L127_12
.line 300
	ld i0,d3
	ld [d0,8],d3
	jp &L104_12
L125_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 55
	ld i0,d0
	call &__ZN17ImageCacheRequestD1Ev_11
	ld i0,d0
	call &__ZdlPv_23
	jp &L98_12
L127_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_22
	ld r1,[d0]
.line 300
	ld i0,d3
	ld [d0,8],d3
	jp &L104_12
L124_12:
	ld i0,[d0,8]
	jp &L121_12

//****************************************
// Function: __ZN10ImageCache16connRecvFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN10ImageCache16connRecvFinishedEPN6MAUtil10ConnectionEi_12, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 86
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld i3,i2
LBB105_12:
.line 87
	ld r0,#0x0
	jc lt,i2,r0,&L129_12
.line 88
	ld i2,[i0,1088]
	add i2,i3
	ld [i0,1088],i2
.line 90
	ld r14,[i0,1092]
	sub r14,i2
	jc lt,r14,r0,&L128_12
.line 92
	ld d0,i0
	add d0,#0x39
	ld i0,[i0,1084]
	ld i1,d0
	sub i2,i3
	syscall 62
.line 93
	ld i0,d1
	add i0,#0x10
	ld i1,d0
	ld i2,#0x400
	call &__ZN6MAUtil10Connection4recvEPvi_62
L128_12:
.line 103
	pop rt,d1
	ret
L129_12:
.line 95
	ld r14,#0xfffffffa
	jc eq,i2,r14,&L134_12
.line 101
	ld r0,#0x0
	ld.b [i0,56],r0
LBE106_12:
.line 103
	pop rt,d1
	ret
L134_12:
.line 96
	ld r0,#0x0
	ld [i0,1092],r0
.line 97
	call &__ZN10ImageCache19finishedDownloadingEv_12
.line 99
	ld r14,#0x0
	ld.b [d1,56],r14
LBE107_12:
.line 103
	pop rt,d1
	ret

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_12, 2, void
.line 103
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext29_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L171_12
L135_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 103
	add sp,#0x4
	pop rt,d0
	ret
L171_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L172_12
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L135_12
	ld i0,&_TRADE_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L173_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 103
	add sp,#0x4
	pop rt,d0
	ret
L172_12:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_12
	ld i1,&LC2_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_12
	ld i1,&LC3_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC4_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC5_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC6_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC7_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L173_12

//****************************************
// Function: __GLOBAL__I__ZN10ImageCacheC2Ev
//****************************************

.func __GLOBAL__I__ZN10ImageCacheC2Ev_12, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageCache.cpp'
.line 104
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 104
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_12
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN10ImageCacheC2Ev
//****************************************

.func __GLOBAL__D__ZN10ImageCacheC2Ev_12, 0, void
.line 105
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 105
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_12
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6Moblet13keyPressEventEii
//****************************************

.func __ZThn148_N6MAUtil6Moblet13keyPressEventEii_13, 3, void
.sourcefile 'c:\MoSync\include\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6Moblet13keyPressEventEii_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet13keyPressEventEii
//****************************************

.func __ZN6MAUtil6Moblet13keyPressEventEii_13, 3, void
.line 54
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 54
	pop fr,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6Moblet15keyReleaseEventEii
//****************************************

.func __ZThn148_N6MAUtil6Moblet15keyReleaseEventEii_13, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6Moblet15keyReleaseEventEii_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet15keyReleaseEventEii
//****************************************

.func __ZN6MAUtil6Moblet15keyReleaseEventEii_13, 3, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn152_N6MAUtil6Moblet17pointerPressEventE9MAPoint2d_13, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d_13, 3, void
.line 63
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 63
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn152_N6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_13, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_13, 3, void
.line 68
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 68
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn152_N6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_13, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_13, 3, void
.line 73
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 73
	pop fr,fr
	ret

//****************************************
// Function: __ZThn160_N6MAUtil6Moblet11customEventERK7MAEvent
//****************************************

.func __ZThn160_N6MAUtil6Moblet11customEventERK7MAEvent_13, 2, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff60
	call &__ZN6MAUtil6Moblet11customEventERK7MAEvent_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet11customEventERK7MAEvent
//****************************************

.func __ZN6MAUtil6Moblet11customEventERK7MAEvent_13, 2, void
.line 84
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 84
	pop fr,fr
	ret

//****************************************
// Function: __ZThn148_N10MAUIMoblet13keyPressEventEi
//****************************************

.func __ZThn148_N10MAUIMoblet13keyPressEventEi_13, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\GameCards.h'
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff6c
	call &__ZN10MAUIMoblet13keyPressEventEi_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN10MAUIMoblet13keyPressEventEi
//****************************************

.func __ZN10MAUIMoblet13keyPressEventEi_13, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 46
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 46
	pop fr,fr
	ret

//****************************************
// Function: __ZThn148_N10MAUIMoblet15keyReleaseEventEi
//****************************************

.func __ZThn148_N10MAUIMoblet15keyReleaseEventEi_13, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\GameCards.h'
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff6c
	call &__ZN10MAUIMoblet15keyReleaseEventEi_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN10MAUIMoblet15keyReleaseEventEi
//****************************************

.func __ZN10MAUIMoblet15keyReleaseEventEi_13, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 49
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 49
	pop fr,fr
	ret

//****************************************
// Function: __ZThn156_N10MAUIMoblet10closeEventEv
//****************************************

.func __ZThn156_N10MAUIMoblet10closeEventEv_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\GameCards.h'
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff64
	call &__ZN10MAUIMoblet10closeEventEv_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN10MAUIMoblet10closeEventEv
//****************************************

.func __ZN10MAUIMoblet10closeEventEv_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 52
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 52
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6_
//****************************************

.func __ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__13, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\collection_common.h'
.line 43
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
LBB2_13:
.line 44
	call &__ZNK6MAUtil11BasicStringIcEltERKS1__81
	ld d0,r14
	and d0,#0xff
.line 45
	ld r0,#0xffffffff
.line 44
	ld r14,#0x0
	jc ne,d0,r14,&L19_13
.line 46
	ld i0,d1
	ld i1,d2
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__81
	and r14,#0xff
.line 47
	ld r0,#0x0
.line 46
	jc eq,r14,d0,&L25_13
L19_13:
.line 49
	ld r14,r0
	pop rt,d2
	ret
L25_13:
	ld r0,#0x1
LBE3_13:
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_13, 1, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 78
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_13:
.line 79
	call &_dict_free_nodes_60
LBE4_13:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_13, 1, void
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_13:
.line 74
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_13
LBE5_13:
	pop rt,fr
	ret

//****************************************
// Function: __ZThn152_N10MAUIMobletD0Ev
//****************************************

.func __ZThn152_N10MAUIMobletD0Ev_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\GameCards.h'
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff68
	call &__ZN10MAUIMobletD0Ev_13
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N10MAUIMobletD0Ev
//****************************************

.func __ZThn148_N10MAUIMobletD0Ev_13, 1, void
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff6c
	call &__ZN10MAUIMobletD0Ev_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN10MAUIMobletD0Ev
//****************************************

.func __ZN10MAUIMobletD0Ev_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 36
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
LBB6_13:
.line 36
	ld r14,&__ZTV10MAUIMoblet_13+8
	ld [i0],r14
	ld r14,&__ZTV10MAUIMoblet_13+68
	ld [i0,148],r14
	ld r14,&__ZTV10MAUIMoblet_13+104
	ld [i0,152],r14
	ld r14,&__ZTV10MAUIMoblet_13+132
	ld [i0,156],r14
	ld r14,&__ZTV10MAUIMoblet_13+144
	ld [i0,160],r14
LBB7_13:
.line 9
	ld d1,i0
	add d1,#0xa8
LBB8_13:
	add i0,#0xbc
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_13
LBE12_13:
	ld i0,d0
	add i0,#0xb4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0xb0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0xac
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE8_13:
	ld r14,&__ZTVN6MAUtil6MobletE_77+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+60
	ld [d0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+96
	ld [d0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+124
	ld [d0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+136
	ld [d0,160],r14
	ld i0,d0
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_73
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_73
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_73
LBE14_13:
.line 36
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d1
	ret

//****************************************
// Function: __ZThn152_N10MAUIMobletD1Ev
//****************************************

.func __ZThn152_N10MAUIMobletD1Ev_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\GameCards.h'
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff68
	call &__ZN10MAUIMobletD1Ev_13
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N10MAUIMobletD1Ev
//****************************************

.func __ZThn148_N10MAUIMobletD1Ev_13, 1, void
.line 12
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 12
	add i0,#0xffffff6c
	call &__ZN10MAUIMobletD1Ev_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN10MAUIMobletD1Ev
//****************************************

.func __ZN10MAUIMobletD1Ev_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 36
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
LBB15_13:
.line 36
	ld r14,&__ZTV10MAUIMoblet_13+8
	ld [i0],r14
	ld r14,&__ZTV10MAUIMoblet_13+68
	ld [i0,148],r14
	ld r14,&__ZTV10MAUIMoblet_13+104
	ld [i0,152],r14
	ld r14,&__ZTV10MAUIMoblet_13+132
	ld [i0,156],r14
	ld r14,&__ZTV10MAUIMoblet_13+144
	ld [i0,160],r14
LBB16_13:
.line 9
	ld d1,i0
	add d1,#0xa8
LBB17_13:
	add i0,#0xbc
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_13
LBE21_13:
	ld i0,d0
	add i0,#0xb4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0xb0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0xac
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE17_13:
	ld r14,&__ZTVN6MAUtil6MobletE_77+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+60
	ld [d0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+96
	ld [d0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+124
	ld [d0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+136
	ld [d0,160],r14
	ld i0,d0
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_73
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_73
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_73
LBE23_13:
.line 36
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E_13, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 38
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i2,i1
LBB33_13:
.line 39
	ld i1,#0xffffffff
	call &_dict_init_60
LBE33_13:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei_13, 3, void
.line 43
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB34_13:
.line 44
	ld [i0,52],i2
.line 45
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E_13
LBE34_13:
	pop rt,fr
	ret

//****************************************
// Function: __ZN10MAUIMobletC1Ev
//****************************************

.func __ZN10MAUIMobletC1Ev_13, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 9
	push rt,d2
	sub sp,#0x14
	ld fr,sp
	add fr,#0x28
	ld d1,i0
LBB35_13:
.line 9
	call &__ZN6MAUtil6MobletC2Ev_77
	ld r14,&__ZTV10MAUIMoblet_13+8
	ld [d1],r14
	ld r14,&__ZTV10MAUIMoblet_13+68
	ld [d1,148],r14
	ld r14,&__ZTV10MAUIMoblet_13+104
	ld [d1,152],r14
	ld r14,&__ZTV10MAUIMoblet_13+132
	ld [d1,156],r14
	ld r14,&__ZTV10MAUIMoblet_13+144
	ld [d1,160],r14
LBB36_13:
	ld d2,d1
	add d2,#0xa8
LBB37_13:
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d1
	add i0,#0xac
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d1
	add i0,#0xb0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d1
	add i0,#0xb4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBB38_13:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 46
	ld i0,d1
	add i0,#0xbc
	ld i1,&__ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__13
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei_13
LBE41_13:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 10
	ld i0,#0xc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,#0x2
	call &__ZN4MAUI4FontC1Ei_87
	ld [zr,_gFontWhite_4],d0
.line 13
	ld i0,#0xc4
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x20
	ld [sp],r14
	ld r14,#0x10
	ld [sp,4],r14
	ld r14,#0x20
	ld [sp,8],r14
	ld r14,#0x1
	ld.b [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d0
	ld i1,#0x3
	ld i2,i1
	ld i3,#0x10
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_96
	ld [zr,_gSkinEditBox_4],d0
.line 14
	ld i0,#0xc4
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x20
	ld [sp],r14
	ld r14,#0x10
	ld [sp,4],r14
	ld r14,#0x20
	ld [sp,8],r14
	ld r14,#0x1
	ld.b [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d0
	ld i1,#0x4
	ld i2,i1
	ld i3,#0x10
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_96
	ld [zr,_gSkinButton_4],d0
.line 15
	ld i0,#0xc4
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x20
	ld [sp],r14
	ld r14,#0x10
	ld [sp,4],r14
	ld r14,#0x20
	ld [sp,8],r14
	ld r14,#0x1
	ld.b [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d0
	ld i1,#0x5
	ld i2,i1
	ld i3,#0x10
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_96
	ld [zr,_gSkinBack_4],d0
.line 16
	ld i0,#0xc4
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x20
	ld [sp],r14
	ld r14,#0x10
	ld [sp,4],r14
	ld r14,#0x20
	ld [sp,8],r14
	ld r14,#0x1
	ld.b [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d0
	ld i1,#0x6
	ld i2,#0x7
	ld i3,#0x10
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_96
	ld [zr,_gSkinList_4],d0
.line 17
	ld i0,#0xc4
	call &__Znwm_21
	ld d0,r14
	ld r14,#0x20
	ld [sp],r14
	ld r14,#0x10
	ld [sp,4],r14
	ld r14,#0x20
	ld [sp,8],r14
	ld r14,#0x1
	ld.b [sp,12],r14
	ld.b [sp,16],r14
	ld i0,d0
	ld i1,#0x8
	ld i2,#0x9
	ld i3,#0x10
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_96
	ld [zr,_gSkinAlbum_4],d0
.line 18
	call &__ZN4MAUI6Engine12getSingletonEv_86
	ld d0,r14
.line 19
	ld i0,r14
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI6Engine14setDefaultFontEPNS_4FontE_86
.line 20
	ld i0,d0
	ld i1,[zr,_gSkinBack_4]
	call &__ZN4MAUI6Engine14setDefaultSkinEPNS_10WidgetSkinE_86
.line 21
	syscall 46
.line 22
	ld r0,r14
	sra r0,#0x10
	ld [zr,_scrWidth_4],r0
.line 23
	xh r14,r14
	ld [zr,_scrHeight_4],r14
.line 31
	ld i0,#0x928
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d2
	call &__ZN5LoginC1EP4Feed_9
	ld [d1,252],d0
.line 32
	ld r14,[d0]
	ld d1,[r14,28]
	ld i0,d0
	call d1
LBE42_13:
	add sp,#0x14
	pop rt,d2
	ret

//****************************************
// Function: _MAMain
//****************************************

.func _MAMain_13, 0, int
.line 55
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB43_13:
.line 56
	ld i0,#0x100
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN10MAUIMobletC1Ev_13
	ld i0,d0
	call &__ZN6MAUtil6Moblet3runEPS0__77
LBE43_13:
.line 58
	ld r14,#0x0
	pop rt,d0
	ret

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_13, 2, void
.line 58
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext20_13:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L132_13
L96_13:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 58
	add sp,#0x4
	pop rt,d0
	ret
L132_13:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L133_13
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L96_13
	ld i0,&_TRADE_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L134_13:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 58
	add sp,#0x4
	pop rt,d0
	ret
L133_13:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_13
	ld i1,&LC0_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_13
	ld i1,&LC1_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC2_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC3_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC4_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC5_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L134_13

//****************************************
// Function: __GLOBAL__I_moblet
//****************************************

.func __GLOBAL__I_moblet_13, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\GameCards.cpp'
.line 59
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 59
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_13
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D_moblet
//****************************************

.func __GLOBAL__D_moblet_13, 0, void
.line 60
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 60
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_13
	pop rt,fr
	ret

//****************************************
// Function: __ZN4Feed9setLoadedEb
//****************************************

.func __ZN4Feed9setLoadedEb_14, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Feed.cpp'
.line 4
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB2_14:
.line 5
	ld.b [i0,81],i1
LBE2_14:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4Feed15setTouchEnabledEb
//****************************************

.func __ZN4Feed15setTouchEnabledEb_14, 2, int
.line 17
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_14:
.line 18
	ld.b r0,[i0,80]
	and r0,#0xff
	ld r14,i1
	and r14,#0xff
.line 22
	ld r15,#0x0
.line 18
	jc eq,r0,r14,&L3_14
.line 19
	ld.b [i0,80],i1
.line 20
	ld r15,#0x1
L3_14:
.line 23
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZN4Feed8setTouchEPKc
//****************************************

.func __ZN4Feed8setTouchEPKc_14, 2, int
.line 12
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d2,i0
LBB4_14:
.line 13
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d2
	add d1,#0xc
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 14
	ld i0,d0
	ld i1,[zr,_truesz_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__81
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed15setTouchEnabledEb_14
	ld d1,r14
	and d1,#0xff
LBB5_14:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE5_14:
.line 15
	ld r14,d1
	add sp,#0x4
	pop rt,d2
	ret

//****************************************
// Function: __ZN4Feed11setUsernameEPKc
//****************************************

.func __ZN4Feed11setUsernameEPKc_14, 2, void
.line 25
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB6_14:
.line 26
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE6_14:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Feed11getUsernameEv
//****************************************

.func __ZN4Feed11getUsernameEv_14, 2, int
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB7_14:
.line 30
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE7_14:
.line 31
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Feed10setEncryptEPKc
//****************************************

.func __ZN4Feed10setEncryptEPKc_14, 2, void
.line 33
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB8_14:
.line 34
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE8_14:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Feed10getEncryptEv
//****************************************

.func __ZN4Feed10getEncryptEv_14, 2, int
.line 37
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB9_14:
.line 38
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE9_14:
.line 39
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Feed15setUnsuccessfulEPKc
//****************************************

.func __ZN4Feed15setUnsuccessfulEPKc_14, 2, void
.line 41
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB10_14:
.line 42
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE10_14:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Feed15getUnsuccessfulEv
//****************************************

.func __ZN4Feed15getUnsuccessfulEv_14, 2, int
.line 45
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB11_14:
.line 46
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE11_14:
.line 47
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Feed15getTouchEnabledEv
//****************************************

.func __ZN4Feed15getTouchEnabledEv_14, 1, int
.line 53
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 55
	ld.b r14,[i0,80]
	and r14,#0xff
	pop fr,fr
	ret

//****************************************
// Function: __ZN4Feed6getAllEv
//****************************************

.func __ZN4Feed6getAllEv_14, 2, int
.line 57
	push rt,d7
	sub sp,#0x28
	ld fr,sp
	add fr,#0x50
	ld d7,i0
	ld d0,i1
LBB13_14:
.line 58
	ld d3,fr
	add d3,#0xffffffd4
	ld d4,fr
	add d4,#0xffffffd0
	ld d5,fr
	add d5,#0xffffffcc
	ld d6,fr
	add d6,#0xffffffc8
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,d0
	add i1,#0x4
	ld i2,#0xffffffbc
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,#0xffffffc0
	add i1,fr
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d2,fr
	add d2,#0xffffffb8
	ld i0,d2
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d6
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d5
	ld i1,d6
	ld i2,d0
	add i2,#0x8
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d1,fr
	add d1,#0xffffffb4
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,d5
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d3
	ld i1,d4
	ld i2,d0
	add i2,#0xc
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d0,fr
	add d0,#0xffffffb0
	ld i0,d0
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d7
	ld i1,d3
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
LBB14_14:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE14_14:
.line 59
	ld r14,d7
	add sp,#0x28
	pop rt,d7
	ret

//****************************************
// Function: __ZN4Feed6setAllEPKc
//****************************************

.func __ZN4Feed6setAllEPKc_14, 2, void
.line 61
	push rt,d5
	sub sp,#0xc
	ld fr,sp
	add fr,#0x2c
	ld d2,i0
LBB15_14:
.line 62
	ld.b r0,[i1]
	xb r14,r0
	ld r0,#0x0
	jc ne,r14,r0,&L17_14
.line 63
	ld i1,&LC3_14
L17_14:
.line 65
	ld d3,fr
	add d3,#0xffffffdc
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 66
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 67
	ld r14,#0xffffffff
	jc le,d0,r14,&L18_14
.line 68
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed11setUsernameEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 70
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed10setEncryptEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 72
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 74
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed15setUnsuccessfulEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 76
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed8setTouchEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 78
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 79
	ld i0,d2
	ld i1,#0x1
	call &__ZN4Feed9setLoadedEb_14
.line 80
	ld d5,#0x0
	ld i0,d1
	ld i1,d2
	call &__ZN4Feed11getUsernameEv_14
	ld d4,#0x0
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc le,r14,d4,&L21_14
	ld d0,fr
	add d0,#0xffffffd4
	ld i0,d0
	ld i1,d2
	call &__ZN4Feed10getEncryptEv_14
	ld d4,#0x1
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,#0x0
	jc le,r14,r0,&L21_14
L25_14:
	ld i0,fr
	add i0,#0xffffffd4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,d5
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L27_14
L24_14:
.line 90
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE16_14:
	add sp,#0xc
	pop rt,d5
	ret
L21_14:
.line 80
	ld d5,#0x1
	ld r14,#0x0
	jc ne,d4,r14,&L25_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,d5
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L24_14
L27_14:
.line 81
	ld i0,d2
	ld i1,&LC3_14
	call &__ZN4Feed11setUsernameEPKc_14
.line 82
	ld i0,d2
	ld i1,&LC3_14
	call &__ZN4Feed10setEncryptEPKc_14
.line 83
	ld i0,d2
	ld i1,#0x0
	call &__ZN4Feed9setLoadedEb_14
.line 90
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE18_14:
	add sp,#0xc
	pop rt,d5
	ret
L18_14:
.line 86
	ld i0,d2
	ld i1,#0x0
	call &__ZN4Feed9setLoadedEb_14
.line 87
	ld i0,d2
	ld i1,&LC3_14
	call &__ZN4Feed11setUsernameEPKc_14
.line 88
	ld i0,d2
	ld i1,&LC3_14
	call &__ZN4Feed10setEncryptEPKc_14
.line 89
	ld i0,d2
	ld i1,&LC3_14
	call &__ZN4Feed15setUnsuccessfulEPKc_14
.line 90
	ld i0,d2
	ld i1,[zr,_falsesz_14]
	call &__ZN4Feed8setTouchEPKc_14
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE20_14:
	add sp,#0xc
	pop rt,d5
	ret

//****************************************
// Function: __ZN4Feed8getAlbumEv
//****************************************

.func __ZN4Feed8getAlbumEv_14, 1, int
.line 98
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 100
	ld r14,[i0,16]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6_
//****************************************

.func __ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__14, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\collection_common.h'
.line 43
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
LBB22_14:
.line 44
	call &__ZNK6MAUtil11BasicStringIcEltERKS1__81
	ld d0,r14
	and d0,#0xff
.line 45
	ld r0,#0xffffffff
.line 44
	ld r14,#0x0
	jc ne,d0,r14,&L30_14
.line 46
	ld i0,d1
	ld i1,d2
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__81
	and r14,#0xff
.line 47
	ld r0,#0x0
.line 46
	jc eq,r14,d0,&L35_14
L30_14:
.line 49
	ld r14,r0
	pop rt,d2
	ret
L35_14:
	ld r0,#0x1
LBE23_14:
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorneERKS7_
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorneERKS7__14, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 325
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB24_14:
.line 326
	ld r15,#0x0
	ld r14,[i0]
	ld i1,[i1]
	jc eq,r14,i1,&L37_14
	ld r15,#0x1
L37_14:
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_14, 1, void
.line 78
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB26_14:
.line 79
	call &_dict_free_nodes_60
LBE26_14:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_14, 1, void
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB27_14:
.line 74
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_14
LBE27_14:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E_14, 2, void
.line 38
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i2,i1
LBB28_14:
.line 39
	ld i1,#0xffffffff
	call &_dict_init_60
LBE28_14:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei_14, 3, void
.line 43
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB29_14:
.line 44
	ld [i0,52],i2
.line 45
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E_14
LBE29_14:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorC1EPK6dict_t
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorC1EPK6dict_t_14, 2, void
.line 252
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB30_14:
.line 253
	ld r14,#0x0
	ld [i0],r14
	ld [i0,4],i1
LBE30_14:
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_14, 2, int
.line 128
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB31_14:
.line 129
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorC1EPK6dict_t_14
.line 130
	ld r14,#0x0
	ld [d0],r14
LBE32_14:
.line 131
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv_14, 2, int
.line 112
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB33_14:
.line 113
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorC1EPK6dict_t_14
.line 114
	ld i0,d0
	call &_dict_first_60
	ld [d1],r14
LBE34_14:
.line 115
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratordeEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratordeEv_14, 1, int
.line 272
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB35_14:
.line 273
	ld i0,[i0]
	ld r14,#0x0
	jc eq,i0,r14,&L51_14
LBE35_14:
.line 274
	ld r14,i0
	add r14,#0x18
	pop rt,fr
	ret
L51_14:
.line 273
	ld i0,&LC4_14
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x111
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5__14, 2, void
.line 32
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
LBB37_14:
.line 63
	add i0,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x1c
	ld i1,d1
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE39_14:
.line 34
	ld r14,#0x0
	ld [d0],r14
	ld [d0,4],r14
	ld [d0,8],r14
	ld [d0,12],r14
	ld [d0,16],r14
	ld [d0,20],r14
LBE37_14:
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorppEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorppEv_14, 1, int
.line 285
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB40_14:
.line 286
	ld i1,[i0]
	ld r14,#0x0
	jc eq,i1,r14,&L58_14
.line 287
	ld i0,[i0,4]
	call &_dict_next_60
	ld [d0],r14
LBE40_14:
.line 288
	ld r14,d0
	pop rt,d0
	ret
L58_14:
.line 286
	ld i0,&LC4_14
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x11e
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEaSERKS6_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEaSERKS6__14, 2, int
.line 57
	push rt,d7
	sub sp,#0x34
	ld fr,sp
	add fr,#0x5c
	ld d4,i0
	ld d7,i1
LBB42_14:
.line 58
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_14
.line 60
	ld d6,fr
	add d6,#0xffffffbc
	ld i0,d6
	ld i1,d4
	call &_dict_load_begin_60
.line 61
	ld d3,fr
	add d3,#0xffffffb4
	ld i0,d3
	ld i1,d7
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv_14
	ld d5,fr
	add d5,#0xffffffac
	jp &L60_14
L66_14:
.line 63
	ld d1,fr
	add d1,#0xffffffa4
	ld i0,d3
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratordeEv_14
	ld d0,r14
LBB47_14:
	ld i0,d1
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d2,fr
	add d2,#0xffffffa8
	ld i0,d2
	ld i1,d0
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE47_14:
	ld i0,#0x20
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5__14
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 65
	ld i0,d6
	ld i1,d0
	add d0,#0x18
	ld i2,[d4,52]
	add i2,d0
	call &_dict_load_next_60
.line 66
	ld i0,d3
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorppEv_14
L60_14:
	ld i0,d5
	ld i1,d7
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_14
	ld i0,d3
	ld i1,d5
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE13ConstIteratorneERKS7__14
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L66_14
.line 68
	ld i0,d6
	call &_dict_load_end_60
LBE43_14:
.line 69
	ld r14,d4
	add sp,#0x34
	pop rt,d7
	ret

//****************************************
// Function: __ZN4Feed8setAlbumEPKc
//****************************************

.func __ZN4Feed8setAlbumEPKc_14, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Feed.cpp'
.line 93
	push rt,d3
	sub sp,#0x3c
	ld fr,sp
	add fr,#0x54
	ld d2,i0
	ld d3,i1
LBB48_14:
.line 94
	ld d1,i0
	add d1,#0x14
LBB50_14:
	ld d0,fr
	add d0,#0xffffffac
LBB51_14:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 46
	ld i0,d0
	ld i1,&__ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__14
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei_14
LBE53_14:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Feed.cpp'
.line 94
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEaSERKS6__14
LBE56_14:
	ld.b r14,[fr,-28]
	ld.b [d1,56],r14
LBE54_14:
	ld i0,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_14
.line 95
	ld [d2,16],d1
.line 96
	ld i0,d1
	ld i1,d3
	call &__ZN6Albums6setAllEPKc_16
LBE48_14:
	add sp,#0x3c
	pop rt,d3
	ret

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_14, 2, void
.line 106
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext8_14:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L114_14
L78_14:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Feed.cpp'
.line 106
	add sp,#0x4
	pop rt,d0
	ret
L114_14:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L115_14
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L78_14
	ld i0,&_TRADE_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L116_14:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Feed.cpp'
.line 106
	add sp,#0x4
	pop rt,d0
	ret
L115_14:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_14
	ld i1,&LC5_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_14
	ld i1,&LC6_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC7_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC8_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC9_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC10_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L116_14

//****************************************
// Function: __GLOBAL__I__ZN4Feed9setLoadedEb
//****************************************

.func __GLOBAL__I__ZN4Feed9setLoadedEb_14, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Feed.cpp'
.line 107
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 107
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_14
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN4Feed9setLoadedEb
//****************************************

.func __GLOBAL__D__ZN4Feed9setLoadedEb_14, 0, void
.line 108
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 108
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_14
	pop rt,fr
	ret

//****************************************
// Function: __ZN4Card9setLoadedEb
//****************************************

.func __ZN4Card9setLoadedEb_15, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Card.cpp'
.line 4
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB2_15:
.line 5
	ld.b [i0,32],i1
LBE2_15:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4Card11getQuantityEv
//****************************************

.func __ZN4Card11getQuantityEv_15, 2, int
.line 12
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_15:
.line 13
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE3_15:
.line 14
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card11setQuantityEPKc
//****************************************

.func __ZN4Card11setQuantityEPKc_15, 2, void
.line 15
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB4_15:
.line 16
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE4_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card7getTextEv
//****************************************

.func __ZN4Card7getTextEv_15, 2, int
.line 19
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB5_15:
.line 20
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE5_15:
.line 21
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card7setTextEPKc
//****************************************

.func __ZN4Card7setTextEPKc_15, 2, void
.line 22
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB6_15:
.line 23
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE6_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card8getThumbEv
//****************************************

.func __ZN4Card8getThumbEv_15, 2, int
.line 26
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB7_15:
.line 27
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE7_15:
.line 28
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card8setThumbEPKc
//****************************************

.func __ZN4Card8setThumbEPKc_15, 2, void
.line 30
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB8_15:
.line 31
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE8_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card8getFrontEv
//****************************************

.func __ZN4Card8getFrontEv_15, 2, int
.line 34
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB9_15:
.line 35
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE9_15:
.line 36
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card8setFrontEPKc
//****************************************

.func __ZN4Card8setFrontEPKc_15, 2, void
.line 38
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB10_15:
.line 39
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0xc
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE10_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card7getBackEv
//****************************************

.func __ZN4Card7getBackEv_15, 2, int
.line 42
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB11_15:
.line 43
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE11_15:
.line 44
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card7setBackEPKc
//****************************************

.func __ZN4Card7setBackEPKc_15, 2, void
.line 46
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB12_15:
.line 47
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x10
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE12_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card5getIdEv
//****************************************

.func __ZN4Card5getIdEv_15, 2, int
.line 50
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB13_15:
.line 51
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE13_15:
.line 52
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card5setIdEPKc
//****************************************

.func __ZN4Card5setIdEPKc_15, 2, void
.line 54
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB14_15:
.line 55
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x14
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE14_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card7getRateEv
//****************************************

.func __ZN4Card7getRateEv_15, 2, int
.line 58
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB15_15:
.line 59
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE15_15:
.line 60
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card7setRateEPKc
//****************************************

.func __ZN4Card7setRateEPKc_15, 2, void
.line 62
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB16_15:
.line 63
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x18
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE16_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card8getValueEv
//****************************************

.func __ZN4Card8getValueEv_15, 2, int
.line 66
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB17_15:
.line 67
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE17_15:
.line 68
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4Card8setValueEPKc
//****************************************

.func __ZN4Card8setValueEPKc_15, 2, void
.line 70
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB18_15:
.line 71
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x1c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE18_15:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZN4Card6getAllEv
//****************************************

.func __ZN4Card6getAllEv_15, 2, int
.line 74
	push rt,d7
	sub sp,#0x7c
	ld fr,sp
	add fr,#0xa4
	ld [fr,-164],i0
	ld d0,i1
LBB19_15:
.line 75
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN4Card11getQuantityEv_15
	ld i0,#0xffffff98
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffa0
	add i0,fr
	ld i1,#0xffffff9c
	add i1,fr
	ld i2,#0xffffff98
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff94
	add i0,fr
	ld i1,d0
	call &__ZN4Card7getTextEv_15
	ld i0,#0xffffffa4
	add i0,fr
	ld i1,#0xffffffa0
	add i1,fr
	ld i2,#0xffffff94
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff90
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffa8
	add i0,fr
	ld i1,#0xffffffa4
	add i1,fr
	ld i2,#0xffffff90
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff8c
	add i0,fr
	ld i1,d0
	call &__ZN4Card8getThumbEv_15
	ld i0,#0xffffffac
	add i0,fr
	ld i1,#0xffffffa8
	add i1,fr
	ld i2,#0xffffff8c
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff88
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,#0xffffffac
	add i1,fr
	ld i2,#0xffffff88
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff84
	add i0,fr
	ld i1,d0
	call &__ZN4Card8getFrontEv_15
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,#0xffffffb0
	add i1,fr
	ld i2,#0xffffff84
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff80
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,#0xffffffb4
	add i1,fr
	ld i2,#0xffffff80
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d7,fr
	add d7,#0xffffff7c
	ld i0,d7
	ld i1,d0
	call &__ZN4Card7getBackEv_15
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,#0xffffffb8
	add i1,fr
	ld i2,d7
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d6,fr
	add d6,#0xffffff78
	ld i0,d6
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,#0xffffffbc
	add i1,fr
	ld i2,d6
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d5,fr
	add d5,#0xffffff74
	ld i0,d5
	ld i1,d0
	call &__ZN4Card5getIdEv_15
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,#0xffffffc0
	add i1,fr
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d4,fr
	add d4,#0xffffff70
	ld i0,d4
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffc8
	add i0,fr
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,d4
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d3,fr
	add d3,#0xffffff6c
	ld i0,d3
	ld i1,d0
	call &__ZN4Card7getRateEv_15
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,#0xffffffc8
	add i1,fr
	ld i2,d3
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d2,fr
	add d2,#0xffffff68
	ld i0,d2
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,#0xffffffcc
	add i1,fr
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d1,fr
	add d1,#0xffffff64
	ld i0,d1
	ld i1,d0
	call &__ZN4Card8getValueEv_15
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d0,fr
	add d0,#0xffffff60
	ld i0,d0
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-164]
	ld i1,#0xffffffd4
	add i1,fr
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
LBB20_15:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff80
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff84
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff88
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffac
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffa8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff90
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffa4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff94
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffa0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff98
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE20_15:
.line 76
	ld r14,[fr,-164]
	add sp,#0x7c
	pop rt,d7
	ret

//****************************************
// Function: __ZN4Card6setAllEPKc
//****************************************

.func __ZN4Card6setAllEPKc_15, 2, void
.line 78
	push rt,d5
	sub sp,#0xc
	ld fr,sp
	add fr,#0x2c
	ld d3,i0
LBB21_15:
.line 79
	ld d2,fr
	add d2,#0xffffffdc
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 80
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 81
	ld r0,#0xffffffff
	jc le,d0,r0,&L21_15
.line 82
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card11setQuantityEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 83
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 84
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 85
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card7setTextEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 86
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 87
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 88
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card8setThumbEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 89
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 90
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 91
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card8setFrontEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 92
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 93
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 94
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card7setBackEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 95
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 96
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 97
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card5setIdEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 98
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 99
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 100
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card7setRateEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 101
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 102
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 103
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN4Card8setValueEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 104
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 105
	ld i0,d3
	ld i1,#0x1
	call &__ZN4Card9setLoadedEb_15
.line 106
	ld d5,#0x0
	ld i0,d1
	ld i1,d3
	call &__ZN4Card7getTextEv_15
	ld d4,#0x0
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc le,r14,d4,&L24_15
	ld d0,fr
	add d0,#0xffffffd4
	ld i0,d0
	ld i1,d3
	call &__ZN4Card11getQuantityEv_15
	ld d4,#0x1
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,#0x0
	jc le,r14,r0,&L24_15
L28_15:
	ld i0,fr
	add i0,#0xffffffd4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,d5
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L32_15
L27_15:
.line 120
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE22_15:
	add sp,#0xc
	pop rt,d5
	ret
L24_15:
.line 106
	ld d5,#0x1
	ld r14,#0x0
	jc ne,d4,r14,&L28_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,d5
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L27_15
L32_15:
.line 107
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card11setQuantityEPKc_15
.line 108
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card7setTextEPKc_15
L29_15:
.line 120
	ld i0,d3
	ld i1,#0x0
	call &__ZN4Card9setLoadedEb_15
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE24_15:
	add sp,#0xc
	pop rt,d5
	ret
L21_15:
.line 112
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card11setQuantityEPKc_15
.line 113
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card7setTextEPKc_15
.line 114
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card8setThumbEPKc_15
.line 115
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card8setFrontEPKc_15
.line 116
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card7setBackEPKc_15
.line 117
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card5setIdEPKc_15
.line 118
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card7setRateEPKc_15
.line 119
	ld i0,d3
	ld i1,&LC1_15
	call &__ZN4Card8setValueEPKc_15
	jp &L29_15

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_15, 2, void
.line 122
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext1_15:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L69_15
L33_15:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Card.cpp'
.line 122
	add sp,#0x4
	pop rt,d0
	ret
L69_15:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L70_15
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L33_15
	ld i0,&_TRADE_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L71_15:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Card.cpp'
.line 122
	add sp,#0x4
	pop rt,d0
	ret
L70_15:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_15
	ld i1,&LC2_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_15
	ld i1,&LC3_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC4_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC5_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC6_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC7_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L71_15

//****************************************
// Function: __GLOBAL__I__ZN4Card9setLoadedEb
//****************************************

.func __GLOBAL__I__ZN4Card9setLoadedEb_15, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Card.cpp'
.line 123
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 123
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_15
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN4Card9setLoadedEb
//****************************************

.func __GLOBAL__D__ZN4Card9setLoadedEb_15, 0, void
.line 124
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 124
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_15
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7_
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 243
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_16:
.line 244
	ld r15,#0x0
	ld r14,[i0]
	ld i1,[i1]
	jc eq,r14,i1,&L4_16
	ld r15,#0x1
L4_16:
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4sizeEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4sizeEv_16, 1, int
.line 135
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 136
	ld r14,[i0,24]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6Albums4sizeEv
//****************************************

.func __ZN6Albums4sizeEv_16, 1, int
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 31
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_16:
.line 32
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4sizeEv_16
LBE4_16:
.line 33
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1EP6dict_t
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1EP6dict_t_16, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 174
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB5_16:
.line 175
	ld r14,#0x0
	ld [i0],r14
	ld [i0,4],i1
LBE5_16:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16, 2, int
.line 120
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB6_16:
.line 121
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1EP6dict_t_16
.line 122
	ld r14,#0x0
	ld [d0],r14
LBE7_16:
.line 123
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv_16, 2, int
.line 104
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB8_16:
.line 105
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1EP6dict_t_16
.line 106
	ld i0,d0
	call &_dict_first_60
	ld [d1],r14
LBE9_16:
.line 107
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1ERKS7_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1ERKS7__16, 2, void
.line 178
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB10_16:
.line 179
	ld r14,[i1]
	ld [i0],r14
	ld i1,[i1,4]
	ld [i0,4],i1
LBE10_16:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16, 1, int
.line 196
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB11_16:
.line 197
	ld i0,[i0]
	ld r14,#0x0
	jc eq,i0,r14,&L15_16
LBE11_16:
.line 198
	ld r14,i0
	add r14,#0x18
	pop rt,fr
	ret
L15_16:
.line 197
	ld i0,&LC3_16
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xc5
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4findERS3_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4findERS3__16, 3, int
.line 155
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d1,i1
	ld d2,i2
LBB13_16:
.line 156
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1EP6dict_t_16
.line 157
	ld i0,d1
	ld i1,d2
	call &_dict_lookup_60
	ld [d0],r14
LBE14_16:
.line 158
	ld r14,d0
	pop rt,d2
	ret

//****************************************
// Function: __ZN6Albums5getIdEN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN6Albums5getIdEN6MAUtil11BasicStringIcEE_16, 3, int
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 23
	push rt,d3
	sub sp,#0x10
	ld fr,sp
	add fr,#0x28
	ld d3,i0
	ld d1,i1
LBB15_16:
.line 24
	ld d2,fr
	add d2,#0xffffffe0
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4findERS3__16
.line 25
	ld d0,fr
	add d0,#0xffffffd8
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16
	ld i0,d2
	ld i1,d0
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L18_16
.line 26
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16
	ld i0,r14
	add i0,#0x4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
.line 28
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBE16_16:
.line 30
	ld r14,d3
	add sp,#0x10
	pop rt,d3
	ret
L18_16:
.line 28
	ld i0,d3
	ld i1,[zr,_demoid_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBE18_16:
.line 30
	ld r14,d3
	add sp,#0x10
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_16, 1, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 78
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB19_16:
.line 79
	call &_dict_free_nodes_60
LBE19_16:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6Albums8clearAllEv
//****************************************

.func __ZN6Albums8clearAllEv_16, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 51
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB20_16:
.line 52
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_16
LBE20_16:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEv_16, 1, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 203
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB24_16:
.line 204
	ld i1,[i0]
	ld r14,#0x0
	jc eq,i1,r14,&L29_16
.line 205
	ld i0,[i0,4]
	call &_dict_next_60
	ld [d0],r14
LBE24_16:
.line 206
	ld r14,d0
	pop rt,d0
	ret
L29_16:
.line 204
	ld i0,&LC3_16
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xcc
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEi
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEi_16, 3, int
.line 211
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB26_16:
.line 212
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1ERKS7__16
.line 213
	ld i0,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEv_16
LBE27_16:
.line 214
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZN6Albums6getIDsEv
//****************************************

.func __ZN6Albums6getIDsEv_16, 2, int
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 69
	push rt,d7
	sub sp,#0x20
	ld fr,sp
	add fr,#0x48
	ld d2,i0
	ld [fr,-72],i1
LBB28_16:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 109
	ld i0,#0x14
	call &__Znam_20
	ld d3,r14
	add d3,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d3
	ld d1,#0x3
L35_16:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L35_16
	ld [d2,8],d3
.line 111
	ld r0,#0x4
	ld [d2,4],r0
.line 113
	ld r14,#0x0
	ld [d2],r14
LBE31_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 71
	ld d6,fr
	add d6,#0xffffffd0
	ld i0,d6
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv_16
	ld d7,fr
	add d7,#0xffffffc8
	ld i0,d7
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16
	ld i0,d6
	ld i1,d7
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L85_16
L72_16:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 160
	ld i0,d6
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16
	ld i0,r14
	add i0,#0x4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBB34_16:
.line 161
	ld r1,[d2,4]
	ld r14,r1
	add r14,#0xffffffff
	ld r0,[d2]
	jc lt,r0,r14,&L80_16
.line 162
	ld r14,#0x0
	jc eq,r1,r14,&L41_16
LBB35_16:
.line 286
	ld d3,r1
	add d3,r1
LBB36_16:
.line 288
	jc lt,r1,d3,&L86_16
L80_16:
	ld i0,[d2,8]
L40_16:
.line 167
	add r0,#0x1
	ld [d2],r0
	add r0,#0xffffffff
	sll r0,#0x2
	add i0,r0
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
LBE34_16:
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext14_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 71
	ld i0,fr
	add i0,#0xffffffbc
	ld i1,d6
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEi_16
	ld i0,d7
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16
	ld i0,d6
	ld i1,d7
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L72_16
L85_16:
.line 75
	ld r14,d2
	add sp,#0x20
	pop rt,d7
	ret
L86_16:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,d3
	sll i0,#0x2
	add i0,#0x4
	call &__Znam_20
	ld d4,r14
	add d4,#0x4
	ld [r14],d3
	ld d1,d4
	ld d0,d3
	jp &L81_16
L87_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d1,#0x4
L81_16:
	add d0,#0xffffffff
	ld r0,#0xffffffff
	jc ne,d0,r0,&L87_16
LBB46_16:
.line 293
	ld d0,#0x0
	ld r0,[d2]
	jc le,r0,d0,&L76_16
L88_16:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d4
	ld i1,[d2,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 293
	add d0,#0x1
	ld r0,[d2]
	jc gt,r0,d0,&L88_16
L76_16:
.line 297
	ld [d2,4],d3
.line 298
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L53_16
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L55_16
L89_16:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
	jc ne,i0,d0,&L89_16
L55_16:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d2]
L53_16:
.line 300
	ld i0,d4
LBE45_16:
	ld [d2,8],i0
	jp &L40_16
L41_16:
.line 291
	ld i0,#0x14
	call &__Znam_20
	ld d3,r14
	add d3,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d3
	ld d1,#0x3
	ld r14,#0xffffffff
	jc eq,d1,r14,&L60_16
L90_16:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L90_16
L60_16:
.line 293
	ld d0,#0x0
	ld r0,[d2]
	jc le,r0,d0,&L78_16
L91_16:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d3
	ld i1,[d2,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 293
	add d0,#0x1
	ld r0,[d2]
	jc gt,r0,d0,&L91_16
L78_16:
.line 297
	ld r14,#0x4
	ld [d2,4],r14
.line 298
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L68_16
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L70_16
L92_16:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
	jc ne,i0,d0,&L92_16
L70_16:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d2]
L68_16:
.line 300
	ld i0,d3
	ld [d2,8],i0
	jp &L40_16

//****************************************
// Function: __ZN6Albums8getNamesEv
//****************************************

.func __ZN6Albums8getNamesEv_16, 2, int
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 61
	push rt,d7
	sub sp,#0x20
	ld fr,sp
	add fr,#0x48
	ld d2,i0
	ld [fr,-72],i1
LBB51_16:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 109
	ld i0,#0x14
	call &__Znam_20
	ld d3,r14
	add d3,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d3
	ld d1,#0x3
L97_16:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L97_16
	ld [d2,8],d3
.line 111
	ld r0,#0x4
	ld [d2,4],r0
.line 113
	ld r14,#0x0
	ld [d2],r14
LBE54_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 63
	ld d6,fr
	add d6,#0xffffffd0
	ld i0,d6
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv_16
	ld d7,fr
	add d7,#0xffffffc8
	ld i0,d7
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16
	ld i0,d6
	ld i1,d7
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L147_16
L134_16:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 160
	ld i0,d6
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16
	ld i0,r14
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBB57_16:
.line 161
	ld r1,[d2,4]
	ld r14,r1
	add r14,#0xffffffff
	ld r0,[d2]
	jc lt,r0,r14,&L142_16
.line 162
	ld r14,#0x0
	jc eq,r1,r14,&L103_16
LBB58_16:
.line 286
	ld d3,r1
	add d3,r1
LBB59_16:
.line 288
	jc lt,r1,d3,&L148_16
L142_16:
	ld i0,[d2,8]
L102_16:
.line 167
	add r0,#0x1
	ld [d2],r0
	add r0,#0xffffffff
	sll r0,#0x2
	add i0,r0
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
LBE57_16:
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext20_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 63
	ld i0,fr
	add i0,#0xffffffbc
	ld i1,d6
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEi_16
	ld i0,d7
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16
	ld i0,d6
	ld i1,d7
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L134_16
L147_16:
.line 68
	ld r14,d2
	add sp,#0x20
	pop rt,d7
	ret
L148_16:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,d3
	sll i0,#0x2
	add i0,#0x4
	call &__Znam_20
	ld d4,r14
	add d4,#0x4
	ld [r14],d3
	ld d1,d4
	ld d0,d3
	jp &L143_16
L149_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d1,#0x4
L143_16:
	add d0,#0xffffffff
	ld r0,#0xffffffff
	jc ne,d0,r0,&L149_16
LBB69_16:
.line 293
	ld d0,#0x0
	ld r0,[d2]
	jc le,r0,d0,&L138_16
L150_16:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d4
	ld i1,[d2,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 293
	add d0,#0x1
	ld r0,[d2]
	jc gt,r0,d0,&L150_16
L138_16:
.line 297
	ld [d2,4],d3
.line 298
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L115_16
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L117_16
L151_16:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
	jc ne,i0,d0,&L151_16
L117_16:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d2]
L115_16:
.line 300
	ld i0,d4
LBE68_16:
	ld [d2,8],i0
	jp &L102_16
L103_16:
.line 291
	ld i0,#0x14
	call &__Znam_20
	ld d3,r14
	add d3,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d3
	ld d1,#0x3
	ld r14,#0xffffffff
	jc eq,d1,r14,&L122_16
L152_16:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L152_16
L122_16:
.line 293
	ld d0,#0x0
	ld r0,[d2]
	jc le,r0,d0,&L140_16
L153_16:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d3
	ld i1,[d2,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 293
	add d0,#0x1
	ld r0,[d2]
	jc gt,r0,d0,&L153_16
L140_16:
.line 297
	ld r14,#0x4
	ld [d2,4],r14
.line 298
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L130_16
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L132_16
L154_16:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d2,8]
	jc ne,i0,d0,&L154_16
L132_16:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d2]
L130_16:
.line 300
	ld i0,d3
	ld [d2,8],i0
	jp &L102_16

//****************************************
// Function: __ZN6Albums6getAllEv
//****************************************

.func __ZN6Albums6getAllEv_16, 2, int
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 12
	push rt,d4
	sub sp,#0x1c
	ld fr,sp
	add fr,#0x38
	ld d1,i0
	ld d3,i1
LBB74_16:
.line 13
	ld i1,&LC4_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBB76_16:
.line 14
	ld d2,fr
	add d2,#0xffffffdc
	ld i0,d2
	ld i1,d3
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5beginEv_16
	ld d4,fr
	add d4,#0xffffffd4
	jp &L156_16
L159_16:
.line 16
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16
	ld i0,r14
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,fr
	add d0,#0xffffffd0
	ld i0,d0
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 17
	ld i0,d0
	ld i1,[zr,_delim_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 18
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16
	ld i0,r14
	add i0,#0x4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d0
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 19
	ld i0,d0
	ld i1,[zr,_newline_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 14
	ld i0,fr
	add i0,#0xffffffc8
	ld i1,d2
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorppEi_16
L156_16:
	ld i0,d4
	ld i1,d3
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE3endEv_16
	ld i0,d2
	ld i1,d4
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorneERKS7__16
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L159_16
LBE76_16:
.line 22
	ld r14,d1
	add sp,#0x1c
	pop rt,d4
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5__16, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 32
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
LBB77_16:
.line 86
	add i0,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x1c
	ld i1,d1
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE79_16:
.line 34
	ld r14,#0x0
	ld [d0],r14
	ld [d0,4],r14
	ld [d0,8],r14
	ld [d0,12],r14
	ld [d0,16],r14
	ld [d0,20],r14
LBE77_16:
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE6insertERKS5_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE6insertERKS5__16, 3, int
.line 84
	push rt,d4
	sub sp,#0x8
	ld fr,sp
	add fr,#0x24
	ld d4,i0
	ld d3,i1
	ld d2,i2
LBB80_16:
.line 85
	ld r14,#0x0
	ld [i0],r14
	ld [i0,4],r14
	ld.b [i0,8],r14
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorC1EP6dict_t_16
LBB82_16:
.line 86
	ld d0,fr
	add d0,#0xffffffdc
LBB83_16:
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d1,fr
	add d1,#0xffffffe0
	ld i0,d1
	ld i1,d2
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBE83_16:
	ld i0,#0x20
	call &__Znwm_21
	ld d2,r14
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5__16
Ltext24_16:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext25_16:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 87
	ld i0,d2
	ld i1,#0x0
	call &_dnode_init_60
.line 88
	ld d1,d2
	add d1,#0x18
.line 90
	ld i0,d3
	ld i1,d2
	ld i2,[d3,52]
	add i2,d1
	call &_dict_insert_60
	ld d0,r14
.line 91
	ld r14,#0x0
	jc eq,d0,r14,&L168_16
.line 92
	jc ne,d2,r14,&L179_16
L170_16:
.line 93
	ld [d4],d0
.line 94
	ld r14,#0x0
.line 97
	ld.b [d4,8],r14
LBE81_16:
.line 99
	ld r14,d4
	add sp,#0x8
	pop rt,d4
	ret
L179_16:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld i0,d2
	add i0,#0x1c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE89_16:
	ld i0,d2
	call &__ZdlPv_23
	jp &L170_16
L168_16:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 96
	ld [d4],d2
.line 97
	ld r14,#0x1
	ld.b [d4,8],r14
LBE85_16:
.line 99
	ld r14,d4
	add sp,#0x8
	pop rt,d4
	ret

//****************************************
// Function: __ZN6Albums8addAlbumEPKcS1_
//****************************************

.func __ZN6Albums8addAlbumEPKcS1__16, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 55
	push rt,d4
	sub sp,#0x1c
	ld fr,sp
	add fr,#0x38
	ld d4,i0
	ld d0,i2
LBB90_16:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld d3,fr
	add d3,#0xffffffd4
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d2,fr
	add d2,#0xffffffd0
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
LBB92_16:
.line 48
	ld r14,#0x0
	ld [fr,-56],r14
	ld [fr,-52],r14
	ld d0,fr
	add d0,#0xffffffc8
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d1,fr
	add d1,#0xffffffcc
	ld i0,d1
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,fr
	add i0,#0xffffffd8
	ld i1,d4
	ld i2,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE6insertERKS5__16
LBB94_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE96_16:
.line 47
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE90_16:
	add sp,#0x1c
	pop rt,d4
	ret

//****************************************
// Function: __ZN6Albums6setAllEPKc
//****************************************

.func __ZN6Albums6setAllEPKc_16, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 35
	push rt,d7
	sub sp,#0x34
	ld fr,sp
	add fr,#0x5c
	ld [fr,-92],i0
LBB97_16:
.line 36
	ld d5,fr
	add d5,#0xffffffd4
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 39
	ld d7,fr
	add d7,#0xffffffd0
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
.line 40
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld d6,fr
	add d6,#0xffffffc4
	jp &L186_16
L188_16:
.line 48
	ld i0,d4
	ld i1,d5
	ld i2,d2
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d5
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L186_16:
	ld i0,d6
	ld i1,[zr,_newline_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d5
	ld i1,d6
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d2,r14
	ld d1,r14
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,#0xffffffff
	jc le,d2,r14,&L195_16
.line 42
	ld d0,fr
	add d0,#0xffffffc0
	add d2,#0x1
	ld i0,d0
	ld i1,d5
	ld i2,#0x0
	ld i3,d1
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,d7
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 43
	ld i0,d0
	ld i1,[zr,_delim_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d7
	ld i1,d0
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d1,r14
	ld d3,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld d4,fr
	add d4,#0xffffffbc
	ld r14,#0x0
	jc eq,d1,r14,&L188_16
.line 44
	add d1,#0x1
	ld i0,d4
	ld i1,d7
	ld i2,r14
	ld i3,d3
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,#0xffffffc8
	add i0,fr
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 45
	ld i0,d4
	ld i1,d7
	ld i2,d1
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB99_16:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld r14,#0x0
	ld [fr,-88],r14
	ld [fr,-84],r14
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,#0xffffffc8
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d1,fr
	add d1,#0xffffffac
	ld i0,d1
	ld i1,#0xffffffcc
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,fr
	add i0,#0xffffffb0
	ld i1,[fr,-92]
	ld i2,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE6insertERKS5__16
LBB102_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L188_16
L195_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 48
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE98_16:
	add sp,#0x34
	pop rt,d7
	ret

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_16, 2, void
.line 75
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext33_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L232_16
L196_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 75
	add sp,#0x4
	pop rt,d0
	ret
L232_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L233_16
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L196_16
	ld i0,&_TRADE_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L234_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 75
	add sp,#0x4
	pop rt,d0
	ret
L233_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_16
	ld i1,&LC5_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_16
	ld i1,&LC6_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC7_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC8_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC9_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC10_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L234_16

//****************************************
// Function: __GLOBAL__I__ZN6Albums9setLoadedEb
//****************************************

.func __GLOBAL__I__ZN6Albums9setLoadedEb_16, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 76
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 76
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_16
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN6Albums9setLoadedEb
//****************************************

.func __GLOBAL__D__ZN6Albums9setLoadedEb_16, 0, void
.line 77
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 77
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_16
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_17, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_17, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_17, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_17, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di_17, 4, void
.line 71
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 71
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di_17, 4, void
.line 72
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 72
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di_17, 4, void
.line 73
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 73
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_17, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_17, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZThn4_N15AlbumViewScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N15AlbumViewScreen19pointerReleaseEventE9MAPoint2d_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN15AlbumViewScreen19pointerReleaseEventE9MAPoint2d_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN15AlbumViewScreen19pointerReleaseEventE9MAPoint2d_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 73
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB2_17:
.line 74
	ld r14,[i0,2284]
	ld r0,#0x8
	jc gt,r14,r0,&L13_17
.line 75
	ld.b r14,[i0,2290]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L21_17
.line 77
	ld.b r0,[i0,2289]
	and r0,#0xff
	jc eq,r0,r14,&L16_17
.line 78
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 80
	call d0
L13_17:
.line 83
	ld r14,#0x0
	ld [d1,2284],r14
LBE2_17:
	pop rt,d1
	ret
L16_17:
.line 79
	ld.b r14,[i0,2288]
	and r14,#0xff
	jc eq,r14,r0,&L13_17
.line 80
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L13_17
L21_17:
.line 76
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 80
	call d0
	jp &L13_17

//****************************************
// Function: __ZN15AlbumViewScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN15AlbumViewScreen10locateItemE9MAPoint2d_17, 3, void
.line 87
	push rt,d4
	sub sp,#0xc
	ld fr,sp
	add fr,#0x28
	ld d2,i0
	ld d3,i1
	ld d4,i2
LBB4_17:
.line 88
	ld i0,[i0,2292]
	ld i1,[zr,_truesz_17]
	call &__ZN4Feed8setTouchEPKc_14
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L50_17
L23_17:
.line 91
	ld r14,#0x0
	ld.b [d2,2288],r14
.line 92
	ld.b [d2,2289],r14
.line 93
	ld.b [d2,2290],r14
LBB6_17:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-40],d3
	ld [fr,-36],d4
LBE7_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 97
	ld d1,#0x0
LBB9_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB12_17:
	ld r14,[r14,8]
LBE12_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB13_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE13_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB14_17:
.line 265
	ld r14,[r14]
LBE14_17:
.line 366
	jc le,r14,d1,&L51_17
L37_17:
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB18_17:
	ld r14,[r14,8]
LBE18_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB19_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE19_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB20_17:
	ld r0,d1
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE20_17:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffd8
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L29_17
Ltext9_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 102
	ld r14,#0x1
	ld.b [d2,2288],r14
L29_17:
.line 97
	add d1,#0x1
LBB21_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB24_17:
	ld r14,[r14,8]
LBE24_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB25_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB26_17:
.line 265
	ld r14,[r14]
LBE26_17:
.line 366
	jc gt,r14,d1,&L37_17
L51_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 105
	ld d1,#0x0
	jp &L38_17
L49_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB30_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE30_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_17:
	ld r0,d1
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE31_17:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffd8
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L52_17
Ltext13_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 105
	add d1,#0x1
L38_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB34_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE34_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB35_17:
.line 265
	ld r14,[r14]
LBE35_17:
.line 366
	jc gt,r14,d1,&L49_17
L22_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 119
	add sp,#0xc
	pop rt,d4
	ret
L50_17:
.line 89
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,[d2,2292]
	call &__ZN4Feed6getAllEv_14
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[zr,_FEED_17]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L23_17
L52_17:
.line 109
	jc ne,d1,r0,&L46_17
.line 110
	ld r14,#0x1
	ld.b [d2,2289],r14
.line 111
	ld [d2,2284],d1
LBE38_17:
.line 119
	add sp,#0xc
	pop rt,d4
	ret
L46_17:
.line 112
	ld r0,#0x2
	jc ne,d1,r0,&L22_17
.line 113
	ld r14,#0x1
	ld.b [d2,2290],r14
.line 114
	ld r0,#0x0
	ld [d2,2284],r0
	jp &L22_17

//****************************************
// Function: __ZThn4_N15AlbumViewScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N15AlbumViewScreen16pointerMoveEventE9MAPoint2d_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 17
	add i0,#0xfffffffc
	call &__ZN15AlbumViewScreen16pointerMoveEventE9MAPoint2d_17
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN15AlbumViewScreen16pointerMoveEventE9MAPoint2d_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 67
	push rt,d0
	sub sp,#0x8
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld [fr,-20],i1
	ld [fr,-16],i2
LBB42_17:
.line 68
	call &__ZN15AlbumViewScreen10locateItemE9MAPoint2d_17
.line 69
	ld r14,[d0,2284]
	add r14,#0x1
	ld [d0,2284],r14
LBE42_17:
	add sp,#0x8
	pop rt,d0
	ret

//****************************************
// Function: __ZThn4_N15AlbumViewScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N15AlbumViewScreen17pointerPressEventE9MAPoint2d_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 17
	add i0,#0xfffffffc
	call &__ZN15AlbumViewScreen17pointerPressEventE9MAPoint2d_17
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN15AlbumViewScreen17pointerPressEventE9MAPoint2d_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 42
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB43_17:
.line 43
	call &__ZN15AlbumViewScreen10locateItemE9MAPoint2d_17
LBE43_17:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8_
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 243
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB44_17:
.line 244
	ld r15,#0x0
	ld r14,[i0]
	ld i1,[i1]
	jc eq,r14,i1,&L58_17
	ld r15,#0x1
L58_17:
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4sizeEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4sizeEv_17, 1, int
.line 135
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 136
	ld r14,[i0,24]
	pop fr,fr
	ret

//****************************************
// Function: __ZThn12_N15AlbumViewScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZThn12_N15AlbumViewScreen16selectionChangedEPN4MAUI6WidgetEb_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffff4
	call &__ZN15AlbumViewScreen16selectionChangedEPN4MAUI6WidgetEb_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZN15AlbumViewScreen16selectionChangedEPN4MAUI6WidgetEb_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 194
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i0,i1
LBB45_17:
.line 195
	and i2,#0xff
	ld r14,#0x0
	jc eq,i2,r14,&L62_17
LBB46_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB47_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE47_17:
	ld i0,[r14]
	ld i1,[zr,_gFontBlue_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE45_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 200
	pop rt,fr
	ret
L62_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB50_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE50_17:
	ld i0,[r14]
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE48_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 200
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen4showEv
//****************************************

.func __ZN15AlbumViewScreen4showEv_17, 1, void
.line 202
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB51_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[i0,48]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d1,48]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB53_17:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE53_17:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
Ltext28_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 204
	ld i0,d1
	call &__ZN4MAUI6Screen4showEv_94
LBE51_17:
	pop rt,d1
	ret

//****************************************
// Function: __ZN15AlbumViewScreen4hideEv
//****************************************

.func __ZN15AlbumViewScreen4hideEv_17, 1, void
.line 207
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB54_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[i0,48]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d1,48]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB56_17:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE56_17:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x0
	call d0
Ltext30_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 209
	ld i0,d1
	call &__ZN4MAUI6Screen4hideEv_94
LBE54_17:
	pop rt,d1
	ret

//****************************************
// Function: __ZThn24_N15AlbumViewScreen12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZThn24_N15AlbumViewScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN15AlbumViewScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZN15AlbumViewScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 244
	push rt,d3
	sub sp,#0x85c
	ld fr,sp
	add fr,#0x874
	ld d2,i0
	ld d3,i1
	ld d0,i2
LBB57_17:
.line 245
	ld d1,fr
	add d1,#0xffffffe4
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	add i0,#0x8d8
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 246
	ld r14,#0xc8
	jc eq,d0,r14,&L78_17
.line 250
	ld i0,d2
	add i0,#0x38
	call &__ZN6MAUtil10Connection5closeEv_62
.line 251
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE57_17:
.line 253
	add sp,#0x85c
	pop rt,d3
	ret
L78_17:
.line 247
	ld d0,d2
	add d0,#0x60
	add d1,#0xfffff7ac
	ld i0,d1
	call &__ZN13XmlConnectionC1Ev_3
LBB60_17:
	ld i0,d2
	add i0,#0x68
	ld i1,fr
	add i1,#0xfffff798
	ld i2,#0x3c
	syscall 5
	ld r14,[fr,-2092]
	ld [d0,68],r14
	ld r14,[fr,-2088]
	ld [d0,72],r14
	ld i0,d2
	add i0,#0xac
	ld i1,fr
	add i1,#0xfffff7dc
	ld i2,#0x800
	syscall 5
	ld r14,[fr,-36]
	ld [d0,2124],r14
	ld r14,[fr,-32]
	ld [d0,2128],r14
LBE60_17:
	ld i0,d1
	call &__ZN13XmlConnectionD1Ev_3
.line 248
	ld r14,#0x0
	ld [sp],r14
	ld i0,d0
	ld i1,d3
	ld i2,d2
	add i2,#0x10
	ld i3,d2
	add i3,#0x14
	call &__ZN13XmlConnection5parseEPN6MAUtil10ConnectionEP10XCListenerPN3Mtx11XmlListenerEPN4MAUI5LabelE_3
LBE58_17:
.line 253
	add sp,#0x85c
	pop rt,d3
	ret

//****************************************
// Function: __ZThn24_N15AlbumViewScreen16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZThn24_N15AlbumViewScreen16connReadFinishedEPN6MAUtil10ConnectionEi_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffe8
	call &__ZN15AlbumViewScreen16connReadFinishedEPN6MAUtil10ConnectionEi_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN15AlbumViewScreen16connReadFinishedEPN6MAUtil10ConnectionEi_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 255
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 255
	pop fr,fr
	ret

//****************************************
// Function: __ZThn16_N15AlbumViewScreen11xcConnErrorEi
//****************************************

.func __ZThn16_N15AlbumViewScreen11xcConnErrorEi_17, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffff0
	call &__ZN15AlbumViewScreen11xcConnErrorEi_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen11xcConnErrorEi
//****************************************

.func __ZN15AlbumViewScreen11xcConnErrorEi_17, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 257
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 257
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen11mtxEncodingEPKc
//****************************************

.func __ZThn20_N15AlbumViewScreen11mtxEncodingEPKc_17, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen11mtxEncodingEPKc_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen11mtxEncodingEPKc
//****************************************

.func __ZN15AlbumViewScreen11mtxEncodingEPKc_17, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 261
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 261
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen11mtxTagStartEPKci
//****************************************

.func __ZThn20_N15AlbumViewScreen11mtxTagStartEPKci_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen11mtxTagStartEPKci_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen11mtxTagStartEPKci
//****************************************

.func __ZN15AlbumViewScreen11mtxTagStartEPKci_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 264
	push rt,d1
	sub sp,#0x4
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB61_17:
.line 265
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8b4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE61_17:
	add sp,#0x4
	pop rt,d1
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen10mtxTagAttrEPKcS1_
//****************************************

.func __ZThn20_N15AlbumViewScreen10mtxTagAttrEPKcS1__17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen10mtxTagAttrEPKcS1__17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen10mtxTagAttrEPKcS1_
//****************************************

.func __ZN15AlbumViewScreen10mtxTagAttrEPKcS1__17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 268
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 268
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen10mtxTagDataEPKci
//****************************************

.func __ZThn20_N15AlbumViewScreen10mtxTagDataEPKci_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen10mtxTagDataEPKci_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen10mtxTagDataEPKci
//****************************************

.func __ZN15AlbumViewScreen10mtxTagDataEPKci_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 272
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
LBB62_17:
.line 273
	ld d0,i0
	add d0,#0x8b4
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_cardid_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L91_17
.line 274
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8bc
L108_17:
.line 290
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L90_17:
.line 292
	add sp,#0x4
	pop rt,d2
	ret
L91_17:
.line 275
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_carddescription_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L93_17
.line 276
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8c0
	jp &L108_17
L93_17:
.line 277
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_cardquantity_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L109_17
.line 279
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_thumburl_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L97_17
.line 280
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8c8
	jp &L108_17
L109_17:
.line 278
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8c4
	jp &L108_17
L97_17:
.line 281
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_fronturl_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L110_17
.line 283
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_backurl_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L101_17
.line 284
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8d0
	jp &L108_17
L110_17:
.line 282
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8cc
	jp &L108_17
L101_17:
.line 285
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_rate_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L103_17
.line 286
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8dc
	jp &L108_17
L103_17:
.line 287
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_value_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L105_17
.line 288
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8e0
	jp &L108_17
L105_17:
.line 289
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_error_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L90_17
.line 290
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8d8
	jp &L108_17

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratoraSERKS8_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratoraSERKS8__17, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 183
	push fr,fr
	ld fr,sp
	add fr,#0x4
	ld r14,i0
LBB64_17:
.line 184
	ld r0,[i1]
	ld [i0],r0
.line 185
	ld i1,[i1,4]
	ld [i0,4],i1
LBE64_17:
.line 186
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen13mtxParseErrorEv
//****************************************

.func __ZThn20_N15AlbumViewScreen13mtxParseErrorEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen13mtxParseErrorEv_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen13mtxParseErrorEv
//****************************************

.func __ZN15AlbumViewScreen13mtxParseErrorEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 337
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 337
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen14mtxEmptyTagEndEv
//****************************************

.func __ZThn20_N15AlbumViewScreen14mtxEmptyTagEndEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen14mtxEmptyTagEndEv_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen14mtxEmptyTagEndEv
//****************************************

.func __ZN15AlbumViewScreen14mtxEmptyTagEndEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 340
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 340
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen14mtxTagStartEndEv
//****************************************

.func __ZThn20_N15AlbumViewScreen14mtxTagStartEndEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen14mtxTagStartEndEv_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen14mtxTagStartEndEv
//****************************************

.func __ZN15AlbumViewScreen14mtxTagStartEndEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 343
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 343
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1EP6dict_t
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1EP6dict_t_17, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 174
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB65_17:
.line 175
	ld r14,#0x0
	ld [i0],r14
	ld [i0,4],i1
LBE65_17:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17, 2, int
.line 120
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB66_17:
.line 121
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1EP6dict_t_17
.line 122
	ld r14,#0x0
	ld [d0],r14
LBE67_17:
.line 123
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1ERKS8_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1ERKS8__17, 2, void
.line 178
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB68_17:
.line 179
	ld r14,[i1]
	ld [i0],r14
	ld i1,[i1,4]
	ld [i0,4],i1
LBE68_17:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6_
//****************************************

.func __ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__17, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\collection_common.h'
.line 43
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
LBB69_17:
.line 44
	call &__ZNK6MAUtil11BasicStringIcEltERKS1__81
	ld d0,r14
	and d0,#0xff
.line 45
	ld r0,#0xffffffff
.line 44
	ld r14,#0x0
	jc ne,d0,r14,&L122_17
.line 46
	ld i0,d1
	ld i1,d2
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__81
	and r14,#0xff
.line 47
	ld r0,#0x0
.line 46
	jc eq,r14,d0,&L127_17
L122_17:
.line 49
	ld r14,r0
	pop rt,d2
	ret
L127_17:
	ld r0,#0x1
LBE70_17:
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv_17, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 104
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB71_17:
.line 105
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1EP6dict_t_17
.line 106
	ld i0,d0
	call &_dict_first_60
	ld [d1],r14
LBE72_17:
.line 107
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17, 1, int
.line 196
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB73_17:
.line 197
	ld i0,[i0]
	ld r14,#0x0
	jc eq,i0,r14,&L132_17
LBE73_17:
.line 198
	ld r14,i0
	add r14,#0x18
	pop rt,fr
	ret
L132_17:
.line 197
	ld i0,&LC20_17
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xc5
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4findERS3_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4findERS3__17, 3, int
.line 155
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d1,i1
	ld d2,i2
LBB75_17:
.line 156
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1EP6dict_t_17
.line 157
	ld i0,d1
	ld i1,d2
	call &_dict_lookup_60
	ld [d0],r14
LBE76_17:
.line 158
	ld r14,d0
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5clearEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5clearEv_17, 1, void
.line 78
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB77_17:
.line 79
	call &_dict_free_nodes_60
LBE77_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEED2Ev
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEED2Ev_17, 1, void
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB78_17:
.line 74
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5clearEv_17
LBE78_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_17, 1, void
.line 78
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB79_17:
.line 79
	call &_dict_free_nodes_60
LBE79_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_17, 1, void
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB80_17:
.line 74
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE5clearEv_17
LBE80_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorneERKS8_
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorneERKS8__17, 2, int
.line 325
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB81_17:
.line 326
	ld r15,#0x0
	ld r14,[i0]
	ld i1,[i1]
	jc eq,r14,i1,&L143_17
	ld r15,#0x1
L143_17:
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratordeEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratordeEv_17, 1, int
.line 272
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB82_17:
.line 273
	ld i0,[i0]
	ld r14,#0x0
	jc eq,i0,r14,&L147_17
LBE82_17:
.line 274
	ld r14,i0
	add r14,#0x18
	pop rt,fr
	ret
L147_17:
.line 273
	ld i0,&LC20_17
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x111
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEv_17, 1, int
.line 203
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB84_17:
.line 204
	ld i1,[i0]
	ld r14,#0x0
	jc eq,i1,r14,&L151_17
.line 205
	ld i0,[i0,4]
	call &_dict_next_60
	ld [d0],r14
LBE84_17:
.line 206
	ld r14,d0
	pop rt,d0
	ret
L151_17:
.line 204
	ld i0,&LC20_17
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xcc
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEi
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEi_17, 3, int
.line 211
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB86_17:
.line 212
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1ERKS8__17
.line 213
	ld i0,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEv_17
LBE87_17:
.line 214
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZN15AlbumViewScreen6getAllEv
//****************************************

.func __ZN15AlbumViewScreen6getAllEv_17, 2, int
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 329
	push rt,d6
	sub sp,#0x24
	ld fr,sp
	add fr,#0x48
	ld d6,i0
	ld d4,i1
LBB88_17:
.line 330
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBB90_17:
.line 331
	ld d3,fr
	add d3,#0xffffffd4
	add d4,#0x96c
	ld i0,d3
	ld i1,d4
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv_17
	ld d5,fr
	add d5,#0xffffffcc
	jp &L154_17
L157_17:
.line 332
	ld d0,fr
	add d0,#0xffffffc8
	ld d2,fr
	add d2,#0xffffffc4
	ld i0,d3
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,d2
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card6getAllEv_15
	ld d1,fr
	add d1,#0xffffffc0
	ld i0,d1
	ld i1,&LC14_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d6
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 331
	ld i0,fr
	add i0,#0xffffffb8
	ld i1,d3
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEi_17
L154_17:
	ld i0,d5
	ld i1,d4
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,d3
	ld i1,d5
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L157_17
LBE90_17:
.line 335
	ld r14,d6
	add sp,#0x24
	pop rt,d6
	ret

//****************************************
// Function: __ZN15AlbumViewScreen13keyPressEventEi
//****************************************

.func __ZN15AlbumViewScreen13keyPressEventEi_17, 2, void
.line 212
	push rt,d3
	sub sp,#0x14
	ld fr,sp
	add fr,#0x2c
	ld d2,i0
	ld d0,i1
LBB91_17:
.line 213
	ld i0,[i0,48]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
	ld d1,r14
.line 214
	case d0,#0x111,#0xd,#L175_17,#L158_17
.data
	.align 4
L175_17:
	.word L160_17
	.word L161_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L158_17
	.word L163_17
	.word L162_17
	.word L170_17


.code
L170_17:
.line 235
	ld i0,[d2,28]
	ld r14,#0x0
	jc ne,i0,r14,&L177_17
L171_17:
.line 238
	ld d0,fr
	add d0,#0xffffffdc
LBB93_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	sll d1,#0x2
LBE94_17:
	ld i0,d0
	ld i1,d2
	add i1,#0x96c
	ld i2,[d2,2484]
	add i2,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4findERS3__17
	ld i0,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld d1,r14
	add d1,#0x4
	ld i0,#0x34
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d2
	ld i2,[d2,2292]
	ld i3,d1
	call &__ZN18TradeOptionsScreenC1EPN4MAUI6ScreenEP4FeedP4Card_5
	ld [d2,28],d0
Ltext57_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 239
	ld r14,[d0]
	ld d1,[r14,28]
	ld i0,d0
	call d1
L158_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L161_17:
.line 219
	ld i0,[d2,48]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox14selectNextItemEb_92
LBE96_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L163_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 265
	ld d3,d2
	add d3,#0x9ac
LBB100_17:
	ld r14,[d3]
LBE100_17:
	ld r0,#0xffffffff
	jc le,r14,r0,&L158_17
Ltext59_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 227
	ld i0,[d2,28]
	ld r14,#0x0
	jc ne,i0,r14,&L178_17
L166_17:
.line 230
	ld d0,fr
	add d0,#0xffffffdc
LBB101_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	sll d1,#0x2
LBE102_17:
	ld i0,d0
	ld i1,d2
	add i1,#0x96c
	ld i2,[d3,8]
	add i2,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4findERS3__17
	ld i0,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld d0,r14
	add d0,#0x4
	ld i0,#0x34
	call &__Znwm_21
	ld d1,r14
	ld i3,[d2,2292]
	ld r0,#0x0
	ld.b [sp],r0
	ld [sp,4],d0
	ld i0,r14
	ld i1,d2
	ld i2,#0xc
	call &__ZN11ImageScreenC1EPN4MAUI6ScreenEiP4FeedbP4Card_10
	ld [d2,28],d1
Ltext61_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 231
	ld r14,[d1]
	ld d0,[r14,28]
	ld i0,d1
	call d0
L179_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L162_17:
.line 222
	ld i0,d2
	add i0,#0x8d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d1,r14
	ld d0,fr
	add d0,#0xffffffe4
	ld i0,d0
	ld i1,d2
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d1
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 223
	ld i0,[d2,32]
	ld r14,[i0]
	ld d0,[r14,28]
.line 231
	call d0
	jp &L179_17
L160_17:
.line 216
	ld i0,[d2,48]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox18selectPreviousItemEb_92
LBE104_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L177_17:
.line 236
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L171_17
L178_17:
.line 228
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L166_17

//****************************************
// Function: __ZThn4_N15AlbumViewScreenD0Ev
//****************************************

.func __ZThn4_N15AlbumViewScreenD0Ev_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN15AlbumViewScreenD0Ev_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreenD0Ev
//****************************************

.func __ZN15AlbumViewScreenD0Ev_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 158
	push rt,d7
	sub sp,#0x20
	ld fr,sp
	add fr,#0x48
	ld d2,i0
LBB107_17:
.line 158
	ld r0,&__ZTV15AlbumViewScreen_17+8
	ld [i0],r0
	ld r2,&__ZTV15AlbumViewScreen_17+112
	ld [i0,4],r2
	ld r14,&__ZTV15AlbumViewScreen_17+152
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumViewScreen_17+176
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumViewScreen_17+188
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumViewScreen_17+232
	ld [i0,24],r14
LBB108_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	ld i0,[i0,52]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB109_17:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L289_17
	ld r1,[d0]
L184_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L274_17
	ld i0,[d0,8]
L194_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L194_17
L274_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE112_17:
.line 313
	ld i0,[d2,48]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB118_17:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L290_17
	ld r1,[d0]
L198_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L278_17
	ld i0,[d0,8]
L208_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L208_17
L278_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE121_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 162
	ld i0,[d2,48]
	jc ne,i0,r14,&L291_17
L212_17:
.line 163
	ld i0,[d2,52]
	ld r0,#0x0
	jc ne,i0,r0,&L292_17
L214_17:
.line 164
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L293_17
L215_17:
.line 168
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L294_17
L218_17:
.line 173
	ld i0,[d2,44]
	ld r2,#0x0
	jc ne,i0,r2,&L295_17
L236_17:
.line 174
	ld i0,[d2,40]
	ld r14,#0x0
	jc ne,i0,r14,&L296_17
L238_17:
.line 175
	ld i0,[d2,28]
	ld r0,#0x0
	jc ne,i0,r0,&L297_17
L240_17:
.line 176
	ld d0,[d2,36]
	ld r2,#0x0
	jc ne,d0,r2,&L298_17
L242_17:
.line 178
	ld d5,d2
	add d5,#0x8d4
	ld i0,d5
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,r14
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,d2
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d0
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 180
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d2
	add r14,#0x8b4
	ld [fr,-48],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 181
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r0,d2
	add r0,#0x8b8
	ld [fr,-52],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 182
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r2,d2
	add r2,#0x8bc
	ld [fr,-56],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 183
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d2
	add r14,#0x8c0
	ld [fr,-60],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 184
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r0,d2
	add r0,#0x8c4
	ld [fr,-64],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 185
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r2,d2
	add r2,#0x8c8
	ld [fr,-68],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 186
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d2
	add r14,#0x8cc
	ld [fr,-72],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 187
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d7,d2
	add d7,#0x8d0
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 188
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d5
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 189
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d6,d2
	add d6,#0x8d8
	ld i0,d6
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 190
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d4,d2
	add d4,#0x8dc
	ld i0,d4
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 191
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d3,d2
	add d3,#0x8e0
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB126_17:
.line 11
	ld d0,d2
	add d0,#0x9b8
LBB127_17:
	ld i0,d2
	add i0,#0x9d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9cc
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9c8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9c4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9bc
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE127_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 142
	ld d1,d2
	add d1,#0x9ac
LBB129_17:
.line 143
	ld i0,[d1,8]
	ld r0,#0x0
	jc eq,i0,r0,&L252_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L250_17
L299_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d1,8]
	jc ne,i0,d0,&L299_17
L250_17:
	add i0,#0xfffffffc
	call &__ZdaPv_22
L252_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d2
	add i0,#0x96c
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEED2Ev_17
LBE131_17:
	ld i0,d2
	add i0,#0x934
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEED2Ev_17
LBE133_17:
	ld i0,d2
	add i0,#0x8f8
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_17
LBE137_17:
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-72]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-68]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-64]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-60]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-56]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-48]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x60
	call &__ZN13XmlConnectionD1Ev_3
LBB138_17:
	ld i0,d2
	add i0,#0x38
LBB139_17:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE139_17:
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_94
LBE107_17:
.line 192
	ld i0,d2
	call &__ZdlPv_23
	add sp,#0x20
	pop rt,d7
	ret
L298_17:
.line 176
	ld i0,d0
	call &__ZN10ImageCacheD1Ev_12
	ld i0,d0
	call &__ZdlPv_23
	jp &L242_17
L297_17:
.line 175
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L240_17
L296_17:
.line 174
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L238_17
L295_17:
.line 173
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L236_17
L294_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB142_17:
.line 295
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L300_17
	ld r1,[d0]
L220_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L282_17
	ld i0,[d0,8]
L230_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L230_17
L282_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE145_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L301_17
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L218_17
L293_17:
.line 165
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 166
	ld r14,#0x0
	ld [zr,_image_4],r14
	jp &L215_17
L292_17:
.line 163
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L214_17
L291_17:
.line 162
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L212_17
L290_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB158_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L286_17
	ld i0,[d0,8]
L202_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L202_17
L276_17:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L302_17
.line 307
	ld [d0,8],d1
	jp &L198_17
L289_17:
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB167_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L284_17
	ld i0,[d0,8]
L188_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L188_17
L272_17:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L303_17
.line 307
	ld [d0,8],d1
	jp &L184_17
L301_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L218_17
L303_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L184_17
L302_17:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L198_17
L300_17:
.line 298
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB192_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L288_17
	ld i0,[d0,8]
L224_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L224_17
L280_17:
.line 304
	ld r14,#0x0
	ld [d0,4],r14
.line 305
	jc ne,i0,r14,&L304_17
.line 307
	ld [d0,8],d1
	jp &L220_17
L304_17:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L220_17
L286_17:
	ld i0,[d0,8]
	jp &L276_17
L284_17:
	ld i0,[d0,8]
	jp &L272_17
L288_17:
	ld i0,[d0,8]
	jp &L280_17

//****************************************
// Function: __ZThn4_N15AlbumViewScreenD1Ev
//****************************************

.func __ZThn4_N15AlbumViewScreenD1Ev_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xfffffffc
	call &__ZN15AlbumViewScreenD1Ev_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreenD1Ev
//****************************************

.func __ZN15AlbumViewScreenD1Ev_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 158
	push rt,d7
	sub sp,#0x20
	ld fr,sp
	add fr,#0x48
	ld d2,i0
LBB193_17:
.line 158
	ld r0,&__ZTV15AlbumViewScreen_17+8
	ld [i0],r0
	ld r2,&__ZTV15AlbumViewScreen_17+112
	ld [i0,4],r2
	ld r14,&__ZTV15AlbumViewScreen_17+152
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumViewScreen_17+176
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumViewScreen_17+188
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumViewScreen_17+232
	ld [i0,24],r14
LBB194_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	ld i0,[i0,52]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB195_17:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L414_17
	ld r1,[d0]
L309_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L399_17
	ld i0,[d0,8]
L319_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L319_17
L399_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE198_17:
.line 313
	ld i0,[d2,48]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB204_17:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L415_17
	ld r1,[d0]
L323_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L403_17
	ld i0,[d0,8]
L333_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L333_17
L403_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE207_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 162
	ld i0,[d2,48]
	jc ne,i0,r14,&L416_17
L337_17:
.line 163
	ld i0,[d2,52]
	ld r0,#0x0
	jc ne,i0,r0,&L417_17
L339_17:
.line 164
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L418_17
L340_17:
.line 168
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L419_17
L343_17:
.line 173
	ld i0,[d2,44]
	ld r2,#0x0
	jc ne,i0,r2,&L420_17
L361_17:
.line 174
	ld i0,[d2,40]
	ld r14,#0x0
	jc ne,i0,r14,&L421_17
L363_17:
.line 175
	ld i0,[d2,28]
	ld r0,#0x0
	jc ne,i0,r0,&L422_17
L365_17:
.line 176
	ld d0,[d2,36]
	ld r2,#0x0
	jc ne,d0,r2,&L423_17
L367_17:
.line 178
	ld d5,d2
	add d5,#0x8d4
	ld i0,d5
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,r14
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,d2
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d0
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 180
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d2
	add r14,#0x8b4
	ld [fr,-48],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 181
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r0,d2
	add r0,#0x8b8
	ld [fr,-52],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 182
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r2,d2
	add r2,#0x8bc
	ld [fr,-56],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 183
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d2
	add r14,#0x8c0
	ld [fr,-60],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 184
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r0,d2
	add r0,#0x8c4
	ld [fr,-64],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 185
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r2,d2
	add r2,#0x8c8
	ld [fr,-68],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 186
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d2
	add r14,#0x8cc
	ld [fr,-72],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 187
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d7,d2
	add d7,#0x8d0
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 188
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d5
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 189
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d6,d2
	add d6,#0x8d8
	ld i0,d6
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 190
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d4,d2
	add d4,#0x8dc
	ld i0,d4
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 191
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d3,d2
	add d3,#0x8e0
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB212_17:
.line 11
	ld d0,d2
	add d0,#0x9b8
LBB213_17:
	ld i0,d2
	add i0,#0x9d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9cc
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9c8
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9c4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x9bc
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE213_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 142
	ld d1,d2
	add d1,#0x9ac
LBB215_17:
.line 143
	ld i0,[d1,8]
	ld r0,#0x0
	jc eq,i0,r0,&L377_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L375_17
L424_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d1,8]
	jc ne,i0,d0,&L424_17
L375_17:
	add i0,#0xfffffffc
	call &__ZdaPv_22
L377_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d2
	add i0,#0x96c
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEED2Ev_17
LBE217_17:
	ld i0,d2
	add i0,#0x934
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEED2Ev_17
LBE219_17:
	ld i0,d2
	add i0,#0x8f8
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEED2Ev_17
LBE223_17:
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-72]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-68]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-64]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-60]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-56]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[fr,-48]
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	add i0,#0x60
	call &__ZN13XmlConnectionD1Ev_3
LBB224_17:
	ld i0,d2
	add i0,#0x38
LBB225_17:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE225_17:
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_94
LBE193_17:
.line 192
	add sp,#0x20
	pop rt,d7
	ret
L423_17:
.line 176
	ld i0,d0
	call &__ZN10ImageCacheD1Ev_12
	ld i0,d0
	call &__ZdlPv_23
	jp &L367_17
L422_17:
.line 175
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L365_17
L421_17:
.line 174
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L363_17
L420_17:
.line 173
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L361_17
L419_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB228_17:
.line 295
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L425_17
	ld r1,[d0]
L345_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L407_17
	ld i0,[d0,8]
L355_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L355_17
L407_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE231_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L426_17
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L343_17
L418_17:
.line 165
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 166
	ld r14,#0x0
	ld [zr,_image_4],r14
	jp &L340_17
L417_17:
.line 163
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L339_17
L416_17:
.line 162
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L337_17
L415_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB244_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L411_17
	ld i0,[d0,8]
L327_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L327_17
L401_17:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L427_17
.line 307
	ld [d0,8],d1
	jp &L323_17
L414_17:
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB253_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L409_17
	ld i0,[d0,8]
L313_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L313_17
L397_17:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L428_17
.line 307
	ld [d0,8],d1
	jp &L309_17
L426_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L343_17
L428_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L309_17
L427_17:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L323_17
L425_17:
.line 298
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB278_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L413_17
	ld i0,[d0,8]
L349_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L349_17
L405_17:
.line 304
	ld r14,#0x0
	ld [d0,4],r14
.line 305
	jc ne,i0,r14,&L429_17
.line 307
	ld [d0,8],d1
	jp &L345_17
L429_17:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L345_17
L411_17:
	ld i0,[d0,8]
	jp &L401_17
L409_17:
	ld i0,[d0,8]
	jp &L397_17
L413_17:
	ld i0,[d0,8]
	jp &L405_17

//****************************************
// Function: __ZN15AlbumViewScreen8drawListEv
//****************************************

.func __ZN15AlbumViewScreen8drawListEv_17, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 121
	push rt,d7
	sub sp,#0x34
	ld fr,sp
	add fr,#0x5c
	ld d5,i0
LBB365_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	ld i0,[i0,48]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB368_17:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L650_17
	ld r1,[d0]
L556_17:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L630_17
	ld i0,[d0,8]
L566_17:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L566_17
L630_17:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE371_17:
.line 313
	ld d3,d5
	add d3,#0x9ac
LBB377_17:
.line 295
	ld r14,[d3,4]
	ld r0,#0x0
	jc lt,r14,r0,&L651_17
	ld r14,[d3]
L570_17:
.line 281
	ld d0,#0x0
	jc le,r14,d0,&L634_17
	ld d4,fr
	add d4,#0xffffffd4
L586_17:
.line 282
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld r14,d0
	sll r14,#0x2
	ld i0,[d3,8]
	add i0,r14
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 281
	add d0,#0x1
	ld r14,[d3]
	jc gt,r14,d0,&L586_17
L634_17:
.line 285
	ld r2,#0x0
	ld [d3],r2
LBE380_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 126
	ld d7,fr
	add d7,#0xffffffcc
	ld r14,d5
	add r14,#0x96c
	ld [fr,-72],r14
	ld i0,d7
	ld i1,r14
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv_17
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,d7
	ld i1,#0xffffffc4
	add i1,fr
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L652_17
L624_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 167
	ld d4,fr
	add d4,#0xffffffd4
	ld i0,d7
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,d4
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card5getIdEv_15
LBB389_17:
.line 168
	ld r1,[d3,4]
	ld r14,r1
	add r14,#0xffffffff
	ld r0,[d3]
	jc lt,r0,r14,&L643_17
.line 169
	ld r2,#0x0
	jc eq,r1,r2,&L593_17
LBB390_17:
.line 293
	ld d2,r1
	add d2,r1
LBB391_17:
.line 295
	jc lt,r1,d2,&L653_17
L643_17:
	ld i0,[d3,8]
L592_17:
.line 174
	add r0,#0x1
	ld [d3],r0
	add r0,#0xffffffff
	sll r0,#0x2
	add i0,r0
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
LBE389_17:
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext98_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 128
	ld i0,d7
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,d4
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card7getTextEv_15
	ld d2,d5
	add d2,#0x8b8
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 129
	ld i0,d4
	ld i1,&LC21_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 130
	ld i0,d7
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,d4
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card11getQuantityEv_15
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 132
	ld i0,[d5,48]
	call &__ZNK4MAUI6Widget8getWidthEv_95
	ld d0,r14
	add d0,#0xfffffff6
	ld i0,#0x9c
	call &__Znwm_21
	ld d1,r14
	ld r14,#0x4a
	ld [sp],r14
	ld r0,[d5,48]
	ld [sp,4],r0
	ld r2,#0x2
	ld [sp,8],r2
	ld r14,#0x1
	ld [sp,12],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	ld i3,d0
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_91
.line 133
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinAlbum_4]
	call d0
.line 134
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_95
.line 135
	ld i0,d1
	ld i1,d5
	add i1,#0xc
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 138
	ld i0,#0x84
	call &__Znwm_21
	ld d0,r14
	ld r0,#0x40
	ld [sp],r0
	ld [sp,4],d1
	ld r2,#0x0
	ld.b [sp,8],r2
	ld.b [sp,12],r2
	ld r14,#0xc
	ld [sp,16],r14
	ld i0,d0
	ld i1,#0x0
	ld i2,i1
	ld i3,#0x38
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_88
.line 141
	ld i0,d7
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
.line 143
	ld i0,d0
	ld i1,r14
	add i1,#0x4
	ld i2,[d5,36]
	call &__Z13retrieveThumbPN4MAUI5ImageEP4CardP10ImageCache_4
.line 145
	ld i0,#0x9c
	call &__Znwm_21
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	add i3,#0xffffffaa
	ld r0,#0x4a
	ld [sp],r0
	ld [sp,4],d1
	ld [sp,8],d2
	ld r2,#0x0
	ld [sp,12],r2
	ld r14,[zr,_gFontWhite_4]
	ld [sp,16],r14
	ld i0,d0
	ld i1,r2
	ld i2,r2
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld [d5,44],d0
.line 146
	ld i0,d0
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_90
.line 147
	ld i0,[d5,44]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setAutoSizeYEb_90
.line 148
	ld i0,[d5,44]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_90
LBE387_17:
.line 126
	ld i0,fr
	add i0,#0xffffffbc
	ld i1,d7
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEi_17
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,[fr,-72]
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,d7
	ld i1,#0xffffffc4
	add i1,fr
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L624_17
L652_17:
.line 150
	ld i0,[fr,-72]
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4sizeEv_17
	ld d2,r14
	ld r2,#0x0
	jc eq,r14,r2,&L625_17
.line 151
	ld i0,[d5,48]
	ld i1,r2
.line 154
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
LBE366_17:
.line 156
	add sp,#0x34
	pop rt,d7
	ret
L653_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x2
	add i0,#0x4
	call &__Znam_20
	ld d6,r14
	add d6,#0x4
	ld [r14],d2
	ld d1,d6
	ld d0,d2
	jp &L645_17
L654_17:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d1,#0x4
L645_17:
	add d0,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d0,r14,&L654_17
LBB403_17:
.line 300
	ld d0,#0x0
	ld r0,[d3]
	jc le,r0,d0,&L636_17
L655_17:
.line 301
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d6
	ld i1,[d3,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 300
	add d0,#0x1
	ld r0,[d3]
	jc gt,r0,d0,&L655_17
L636_17:
.line 304
	ld [d3,4],d2
.line 305
	ld i0,[d3,8]
	ld r2,#0x0
	jc eq,i0,r2,&L605_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L607_17
L656_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d3,8]
	jc ne,i0,d0,&L656_17
L607_17:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d3]
L605_17:
.line 307
	ld i0,d6
LBE402_17:
	ld [d3,8],i0
	jp &L592_17
L593_17:
.line 298
	ld i0,#0x14
	call &__Znam_20
	ld d2,r14
	add d2,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d2
	ld d1,#0x3
	ld r2,#0xffffffff
	jc eq,d1,r2,&L612_17
L657_17:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d1,#0xffffffff
	ld r2,#0xffffffff
	jc ne,d1,r2,&L657_17
L612_17:
.line 300
	ld d0,#0x0
	ld r0,[d3]
	jc le,r0,d0,&L638_17
L658_17:
.line 301
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d2
	ld i1,[d3,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 300
	add d0,#0x1
	ld r0,[d3]
	jc gt,r0,d0,&L658_17
L638_17:
.line 304
	ld r14,#0x4
	ld [d3,4],r14
.line 305
	ld i0,[d3,8]
	ld r2,#0x0
	jc eq,i0,r2,&L620_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L622_17
L659_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d3,8]
	jc ne,i0,d0,&L659_17
L622_17:
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r0,[d3]
L620_17:
.line 307
	ld i0,d2
	ld [d3,8],i0
	jp &L592_17
L625_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 153
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,[zr,_empty_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld i0,[d5,48]
	ld r0,[i0]
	ld d0,[r0]
	ld i1,r14
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 154
	ld i0,[d5,48]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
LBE394_17:
.line 156
	add sp,#0x34
	pop rt,d7
	ret
L651_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,#0x4
	call &__Znam_20
	ld d1,r14
	add d1,#0x4
	ld r2,#0x0
	ld [r14],r2
	ld d0,d1
	ld d2,#0xffffffff
L571_17:
	ld r14,#0xffffffff
	jc ne,d2,r14,&L660_17
LBB418_17:
.line 300
	ld d0,#0x0
	ld r14,[d3]
	jc le,r14,d0,&L632_17
L661_17:
.line 301
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d1
	ld i1,[d3,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
.line 300
	add d0,#0x1
	ld r14,[d3]
	jc gt,r14,d0,&L661_17
L632_17:
.line 304
	ld r0,#0x0
	ld [d3,4],r0
.line 305
	ld i0,[d3,8]
	jc eq,i0,r0,&L580_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
L581_17:
	jc eq,i0,d0,&L582_17
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d3,8]
	jp &L581_17
L650_17:
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB427_17:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L640_17
	ld i0,[d0,8]
L560_17:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L560_17
L628_17:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L662_17
.line 307
	ld [d0,8],d1
	jp &L556_17
L582_17:
.line 305
	add i0,#0xfffffffc
	call &__ZdaPv_22
	ld r14,[d3]
L580_17:
.line 307
	ld [d3,8],d1
	jp &L570_17
L662_17:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L556_17
L640_17:
	ld i0,[d0,8]
	jp &L628_17
L660_17:
.line 298
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d2,#0xffffffff
	jp &L571_17

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorppEv
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorppEv_17, 1, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 285
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB452_17:
.line 286
	ld i1,[i0]
	ld r14,#0x0
	jc eq,i1,r14,&L666_17
.line 287
	ld i0,[i0,4]
	call &_dict_next_60
	ld [d0],r14
LBE452_17:
.line 288
	ld r14,d0
	pop rt,d0
	ret
L666_17:
.line 286
	ld i0,&LC20_17
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x11e
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorC1EPK6dict_t
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorC1EPK6dict_t_17, 2, void
.line 252
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB454_17:
.line 253
	ld r14,#0x0
	ld [i0],r14
	ld [i0,4],i1
LBE454_17:
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv_17, 2, int
.line 112
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB455_17:
.line 113
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorC1EPK6dict_t_17
.line 114
	ld i0,d0
	call &_dict_first_60
	ld [d1],r14
LBE456_17:
.line 115
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv
//****************************************

.func __ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17, 2, int
.line 128
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB457_17:
.line 129
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorC1EPK6dict_t_17
.line 130
	ld r14,#0x0
	ld [d0],r14
LBE458_17:
.line 131
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8DictNodeC1ES6_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8DictNodeC1ES6__17, 2, void
.line 32
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d1,i1
LBB459_17:
.line 63
	add i0,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBB462_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld d3,d0
	add d3,#0x1c
	ld d2,d1
	add d2,#0x4
LBB463_17:
	ld i0,d3
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x20
	ld i1,d1
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x24
	ld i1,d1
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x28
	ld i1,d1
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x2c
	ld i1,d1
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x30
	ld i1,d1
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x34
	ld i1,d1
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d0
	add i0,#0x38
	ld i1,d1
	add i1,#0x20
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld.b d2,[d2,32]
	ld.b [d3,32],d2
LBE463_17:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 34
	ld r14,#0x0
	ld [d0],r14
	ld [d0,4],r14
	ld [d0,8],r14
	ld [d0,12],r14
	ld [d0,16],r14
	ld [d0,20],r14
LBE459_17:
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE6insertERKS6_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE6insertERKS6__17, 3, int
.line 84
	push rt,d7
	sub sp,#0x2c
	ld fr,sp
	add fr,#0x54
	ld d7,i0
	ld [fr,-84],i1
	ld d0,i2
LBB464_17:
.line 85
	ld r14,#0x0
	ld [i0],r14
	ld [i0,4],r14
	ld.b [i0,8],r14
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorC1EP6dict_t_17
LBB466_17:
.line 63
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBB468_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld d6,d0
	add d6,#0x4
LBB469_17:
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,d0
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,d0
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d3,fr
	add d3,#0xffffffc0
	ld i0,d3
	ld i1,d0
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,d0
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d4,fr
	add d4,#0xffffffc8
	ld i0,d4
	ld i1,d0
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d2,fr
	add d2,#0xffffffcc
	ld i0,d2
	ld i1,d0
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i1,d0
	add i1,#0x20
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld.b d6,[d6,32]
	ld.b [fr,-44],d6
LBE469_17:
	ld i0,#0x40
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,#0xffffffb0
	add i1,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8DictNodeC1ES6__17
Ltext106_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext107_17:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 87
	ld i0,d0
	ld i1,#0x0
	call &_dnode_init_60
.line 88
	ld d2,d0
	add d2,#0x18
.line 90
	ld i0,[fr,-84]
	ld i1,d0
	ld i2,[i0,52]
	add i2,d2
	call &_dict_insert_60
	ld d1,r14
.line 91
	ld r14,#0x0
	jc eq,d1,r14,&L683_17
.line 92
	jc ne,d0,r14,&L697_17
L685_17:
.line 93
	ld [d7],d1
.line 94
	ld r14,#0x0
.line 97
	ld.b [d7,8],r14
LBE465_17:
.line 99
	ld r14,d7
	add sp,#0x2c
	pop rt,d7
	ret
L697_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d0
	add i0,#0x38
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x34
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x30
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x2c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x28
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x24
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x20
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	add d0,#0x1c
	ld i0,d0
	add d0,#0xffffffe4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE477_17:
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE475_17:
	ld i0,d0
	call &__ZdlPv_23
	jp &L685_17
L683_17:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 96
	ld [d7],d0
.line 97
	ld r14,#0x1
	ld.b [d7,8],r14
LBE471_17:
.line 99
	ld r14,d7
	add sp,#0x2c
	pop rt,d7
	ret

//****************************************
// Function: __ZN15AlbumViewScreen10loadImagesEPKc
//****************************************

.func __ZN15AlbumViewScreen10loadImagesEPKc_17, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 49
	push rt,d7
	sub sp,#0x50
	ld fr,sp
	add fr,#0x78
	ld d7,i0
LBB478_17:
.line 50
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 53
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
.line 54
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	jp &L699_17
L709_17:
.line 56
	ld d1,fr
	add d1,#0xffffffc0
	add d6,#0x1
	ld i0,d1
	ld i1,#0xffffffd4
	add i1,fr
	ld i2,#0x0
	ld i3,d0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 57
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d3,d7
	add d3,#0x9b8
	ld i0,d3
	ld i1,r14
	call &__ZN4Card6setAllEPKc_15
LBB480_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld r14,d7
	add r14,#0x96c
	ld [fr,-120],r14
	ld i0,d1
	ld i1,d3
	call &__ZN4Card5getIdEv_15
LBB481_17:
.line 48
	ld r14,#0x0
	ld [fr,-116],r14
	ld [fr,-112],r14
	ld [fr,-108],r14
	ld [fr,-104],r14
	ld [fr,-100],r14
	ld [fr,-96],r14
	ld [fr,-92],r14
	ld [fr,-88],r14
	ld [fr,-84],r14
	ld [fr,-80],r14
	ld i0,#0xffffff8c
	add i0,fr
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBB483_17:
	ld i0,#0xffffff90
	add i0,fr
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff94
	add i0,fr
	ld i1,d7
	add i1,#0x9bc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff98
	add i0,fr
	ld i1,d7
	add i1,#0x9c0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff9c
	add i0,fr
	ld i1,d7
	add i1,#0x9c4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d5,fr
	add d5,#0xffffffa0
	ld i0,d5
	ld i1,d7
	add i1,#0x9c8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d4,fr
	add d4,#0xffffffa4
	ld i0,d4
	ld i1,d7
	add i1,#0x9cc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d2,fr
	add d2,#0xffffffa8
	ld i0,d2
	ld i1,d7
	add i1,#0x9d0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d0,fr
	add d0,#0xffffffac
	ld i0,d0
	ld i1,d7
	add i1,#0x9d4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld.b d3,[d3,32]
	ld.b [fr,-80],d3
LBE484_17:
	ld i0,fr
	add i0,#0xffffffb4
	ld i1,[fr,-120]
	ld i2,#0xffffff8c
	add i2,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE6insertERKS6__17
LBB485_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff98
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff94
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff90
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE489_17:
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE487_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext114_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 59
	ld i0,d1
	ld i1,#0xffffffd4
	add i1,fr
	ld i2,d6
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_81
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L699_17:
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,[zr,_newline_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_81
	ld d6,r14
	ld d0,r14
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld r14,#0xffffffff
	jc gt,d6,r14,&L709_17
.line 63
	ld i0,d7
	call &__ZN15AlbumViewScreen8drawListEv_17
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE479_17:
	add sp,#0x50
	pop rt,d7
	ret

//****************************************
// Function: __ZN15AlbumViewScreen8loadFileEv
//****************************************

.func __ZN15AlbumViewScreen8loadFileEv_17, 1, void
.line 46
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB490_17:
.line 47
	add i0,#0x8d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	call &__Z7getDataPKc_4
	ld i0,d0
	ld i1,r14
	call &__ZN15AlbumViewScreen10loadImagesEPKc_17
LBE490_17:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEaSERKS7_
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEaSERKS7__17, 2, int
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 57
	push rt,d7
	sub sp,#0x5c
	ld fr,sp
	add fr,#0x84
	ld [fr,-128],i0
	ld [fr,-132],i1
LBB491_17:
.line 58
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5clearEv_17
.line 60
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,[fr,-128]
	call &_dict_load_begin_60
.line 61
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,[fr,-132]
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv_17
	jp &L712_17
L722_17:
.line 63
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratordeEv_17
	ld d0,r14
LBB496_17:
	ld i0,#0xffffff84
	add i0,fr
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBB497_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld d6,d0
	add d6,#0x4
LBB498_17:
	ld i0,#0xffffff88
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff8c
	add i0,fr
	ld i1,d0
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d4,fr
	add d4,#0xffffff90
	ld i0,d4
	ld i1,d0
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d7,fr
	add d7,#0xffffff94
	ld i0,d7
	ld i1,d0
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d5,fr
	add d5,#0xffffff98
	ld i0,d5
	ld i1,d0
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d3,fr
	add d3,#0xffffff9c
	ld i0,d3
	ld i1,d0
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d2,fr
	add d2,#0xffffffa0
	ld i0,d2
	ld i1,d0
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d1,fr
	add d1,#0xffffffa4
	ld i0,d1
	ld i1,d0
	add i1,#0x20
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld.b d6,[d6,32]
	ld.b [fr,-88],d6
LBE498_17:
	ld i0,#0x40
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,#0xffffff84
	add i1,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8DictNodeC1ES6__17
Ltext117_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff88
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff84
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext118_17:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 65
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,d0
	add d0,#0x18
	ld r0,[fr,-128]
	ld i2,[r0,52]
	add i2,d0
	call &_dict_load_next_60
.line 66
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorppEv_17
L712_17:
	ld i0,#0xffffffac
	add i0,fr
	ld i1,[fr,-132]
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,#0xffffffac
	add i1,fr
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorneERKS8__17
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L722_17
.line 68
	ld i0,#0xffffffbc
	add i0,fr
	call &_dict_load_end_60
LBE492_17:
.line 69
	ld r14,[fr,-128]
	add sp,#0x5c
	pop rt,d7
	ret

//****************************************
// Function: __ZThn20_N15AlbumViewScreen9mtxTagEndEPKci
//****************************************

.func __ZThn20_N15AlbumViewScreen9mtxTagEndEPKci_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumViewScreen.h'
.line 17
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 17
	add i0,#0xffffffec
	call &__ZN15AlbumViewScreen9mtxTagEndEPKci_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreen9mtxTagEndEPKci
//****************************************

.func __ZN15AlbumViewScreen9mtxTagEndEPKci_17, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 294
	push rt,d7
	sub sp,#0xc0
	ld fr,sp
	add fr,#0xe8
	ld d7,i0
	ld d5,i1
LBB499_17:
.line 295
	ld i0,i1
	ld i1,[zr,_xml_backurl_17]
	syscall 6
	ld d3,r14
	ld r0,#0x0
	jc eq,r14,r0,&L743_17
.line 316
	ld i0,d5
	ld i1,[zr,_xml_error_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L744_17
.line 319
	ld i0,d5
	ld i1,[zr,_xml_carddone_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L737_17
L745_17:
.line 320
	ld d0,d7
	add d0,#0x96c
	ld i0,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5clearEv_17
LBB500_17:
.line 321
	ld i0,d0
	ld i1,d7
	add i1,#0x934
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEaSERKS7__17
LBE501_17:
.line 322
	ld i0,d7
	call &__ZN15AlbumViewScreen8drawListEv_17
.line 323
	ld i0,d7
	add i0,#0x8d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,r14
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d7
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d0
	ld i1,r14
	call &__Z8saveDataPKcS0__4
.line 325
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE499_17:
.line 327
	add sp,#0xc0
	pop rt,d7
	ret
L744_17:
.line 317
	ld i0,d7
	add i0,#0x8d8
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d7,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffff7c
	add i1,fr
	call d0
L741_17:
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 319
	ld i0,d5
	ld i1,[zr,_xml_carddone_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L745_17
L737_17:
.line 325
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d7,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffff7c
	add i1,fr
	call d0
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE502_17:
.line 327
	add sp,#0xc0
	pop rt,d7
	ret
L743_17:
.line 296
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d7,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffffd4
	add i1,fr
	call d0
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 297
	ld i0,#0xffffff98
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld r14,d7
	add r14,#0x8c4
	ld [fr,-196],r14
	ld i0,#0xffffff9c
	add i0,fr
	ld i1,r14
	ld i2,#0xffffff98
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r0,d7
	add r0,#0x8c0
	ld [fr,-200],r0
	ld i0,#0xffffffa0
	add i0,fr
	ld i1,#0xffffff9c
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff94
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffa4
	add i0,fr
	ld i1,#0xffffffa0
	add i1,fr
	ld i2,#0xffffff94
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r14,d7
	add r14,#0x8c8
	ld [fr,-204],r14
	ld i0,#0xffffffa8
	add i0,fr
	ld i1,#0xffffffa4
	add i1,fr
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff90
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffac
	add i0,fr
	ld i1,#0xffffffa8
	add i1,fr
	ld i2,#0xffffff90
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r0,d7
	add r0,#0x8cc
	ld [fr,-208],r0
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,#0xffffffac
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff8c
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,#0xffffffb0
	add i1,fr
	ld i2,#0xffffff8c
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r14,d7
	add r14,#0x8d0
	ld [fr,-212],r14
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,#0xffffffb4
	add i1,fr
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d2,fr
	add d2,#0xffffff88
	ld i0,d2
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,#0xffffffb8
	add i1,fr
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r0,d7
	add r0,#0x8bc
	ld [fr,-216],r0
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,#0xffffffbc
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d1,fr
	add d1,#0xffffff84
	ld i0,d1
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,#0xffffffc0
	add i1,fr
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r14,d7
	add r14,#0x8dc
	ld [fr,-220],r14
	ld i0,#0xffffffc8
	add i0,fr
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld d0,fr
	add d0,#0xffffff80
	ld i0,d0
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,#0xffffffc8
	add i1,fr
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld r0,d7
	add r0,#0x8e0
	ld [fr,-224],r0
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,#0xffffffcc
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,#0xffffff7c
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d6,d7
	add d6,#0x9b8
	ld i0,d6
	ld i1,r14
	call &__ZN4Card6setAllEPKc_15
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffac
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff90
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffa8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffa4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff94
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffffa0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff98
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 298
	add d0,#0xfffffff4
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card5getIdEv_15
	ld d1,d7
	add d1,#0x96c
	ld i0,d0
	ld i1,d1
	ld i2,#0xffffff7c
	add i2,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4findERS3__17
	ld d2,d7
	add d2,#0x9a4
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratoraSERKS8__17
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 299
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,d2
	ld i1,d0
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17
	and r14,#0xff
	jc eq,r14,d3,&L726_17
.line 300
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card8getThumbEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d6
	ld i1,r14
	call &__ZN4Card8setThumbEPKc_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 301
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card7getBackEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d6
	ld i1,r14
	call &__ZN4Card7setBackEPKc_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 302
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card8getFrontEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d6
	ld i1,r14
	call &__ZN4Card8setFrontEPKc_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 303
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card8getThumbEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld [sp],r14
	ld i0,&LC22_17
	call &_lprintfln_37
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 304
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card7getBackEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld [sp],r14
	ld i0,&LC23_17
	call &_lprintfln_37
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 305
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card8getFrontEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld [sp],r14
	ld i0,&LC24_17
	call &_lprintfln_37
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L726_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld r14,d7
	add r14,#0x934
	ld [fr,-228],r14
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card5getIdEv_15
LBB505_17:
.line 48
	ld r0,#0x0
	ld [fr,-192],r0
	ld [fr,-188],r0
	ld [fr,-184],r0
	ld [fr,-180],r0
	ld [fr,-176],r0
	ld [fr,-172],r0
	ld [fr,-168],r0
	ld [fr,-164],r0
	ld [fr,-160],r0
	ld [fr,-156],r0
	ld i0,#0xffffff40
	add i0,fr
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
LBB507_17:
	ld i0,#0xffffff44
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff48
	add i0,fr
	ld i1,d7
	add i1,#0x9bc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff4c
	add i0,fr
	ld i1,d7
	add i1,#0x9c0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d4,fr
	add d4,#0xffffff50
	ld i0,d4
	ld i1,d7
	add i1,#0x9c4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0xffffff54
	add i0,fr
	ld i1,d7
	add i1,#0x9c8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d2,fr
	add d2,#0xffffff58
	ld i0,d2
	ld i1,d7
	add i1,#0x9cc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d1,fr
	add d1,#0xffffff5c
	ld i0,d1
	ld i1,d7
	add i1,#0x9d0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld d0,fr
	add d0,#0xffffff60
	ld i0,d0
	ld i1,d7
	add i1,#0x9d4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld.b d6,[d6,32]
	ld.b [fr,-156],d6
LBE508_17:
	ld i0,fr
	add i0,#0xffffff68
	ld i1,[fr,-228]
	ld i2,#0xffffff40
	add i2,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE6insertERKS6__17
LBB509_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff54
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff4c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff48
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,#0xffffff44
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE513_17:
	ld i0,#0xffffff40
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE511_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext124_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 308
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-216]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 309
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-200]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 310
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-196]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 311
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-204]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 312
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-208]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 313
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-212]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 314
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-220]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 315
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[fr,-224]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	jp &L741_17

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E_17, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 38
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i2,i1
LBB514_17:
.line 39
	ld i1,#0xffffffff
	call &_dict_init_60
LBE514_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei_17, 3, void
.line 43
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB515_17:
.line 44
	ld [i0,52],i2
.line 45
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE4initEPFiRS3_S7_E_17
LBE515_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4initEPFiRS3_S8_E
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4initEPFiRS3_S8_E_17, 2, void
.line 38
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i2,i1
LBB516_17:
.line 39
	ld i1,#0xffffffff
	call &_dict_init_60
LBE516_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEC2EPFiRS3_S8_Ei
//****************************************

.func __ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEC2EPFiRS3_S8_Ei_17, 3, void
.line 43
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB517_17:
.line 44
	ld [i0,52],i2
.line 45
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4initEPFiRS3_S8_E_17
LBE517_17:
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumViewScreenC1EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN15AlbumViewScreenC1EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE_17, 4, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	push rt,d7
	sub sp,#0x18
	ld fr,sp
	add fr,#0x40
	ld d2,i0
	ld d0,i1
	ld d7,i2
	ld [fr,-48],i3
LBB518_17:
.line 11
	call &__ZN4MAUI6ScreenC2Ev_94
LBB519_17:
	ld i1,d2
	add i1,#0x18
LBE519_17:
	ld r0,&__ZTV15AlbumViewScreen_17+8
	ld [d2],r0
	ld r14,&__ZTV15AlbumViewScreen_17+112
	ld [d2,4],r14
	ld r0,&__ZTV15AlbumViewScreen_17+152
	ld [d2,12],r0
	ld r14,&__ZTV15AlbumViewScreen_17+176
	ld [d2,16],r14
	ld r0,&__ZTV15AlbumViewScreen_17+188
	ld [d2,20],r0
	ld r14,&__ZTV15AlbumViewScreen_17+232
	ld [i1],r14
	ld [d2,32],d0
	ld i0,d2
	add i0,#0x38
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_62
	ld i0,d2
	add i0,#0x60
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d2
	add i0,#0x8b4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8b8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8bc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8c0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8c4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8c8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8cc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld d0,d2
	add d0,#0x8d4
	ld d5,fr
	add d5,#0xffffffd4
	ld i0,d5
	ld i1,[zr,_ALBUMEND_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,[fr,-48]
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld d6,d2
	add d6,#0x8d8
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8dc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8e0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld [d2,2292],d7
LBB520_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 46
	ld i0,d2
	add i0,#0x8f8
	ld i1,&__ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__17
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEEC2EPFiRS3_S7_Ei_17
LBE523_17:
	ld i0,d2
	add i0,#0x934
	ld i1,&__ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__17
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEC2EPFiRS3_S8_Ei_17
LBE525_17:
	add d0,#0x98
LBB527_17:
	ld i0,d0
	ld i1,&__ZN6MAUtil7CompareIKNS_11BasicStringIcEEEEiRKT_S6__17
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEEC2EPFiRS3_S8_Ei_17
LBE527_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d2
	add i0,#0x9a4
	ld i1,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
LBB528_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 104
	ld d3,d2
	add d3,#0x9ac
LBB529_17:
.line 109
	ld i0,#0x14
	call &__Znam_20
	ld d4,r14
	add d4,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d4
	ld d1,#0x3
L764_17:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	add d0,#0x4
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L764_17
	ld [d3,8],d4
.line 111
	ld r0,#0x4
	ld [d3,4],r0
.line 113
	ld r14,#0x0
	ld [d3],r14
LBE529_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d2
	add i0,#0x9b8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9bc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9c0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9c4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9c8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9cc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x9d4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBE531_17:
.line 12
	ld i0,#0xc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_94
	ld [d2,28],d0
.line 13
	ld i0,d5
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d6
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 14
	ld i0,d7
	call &__ZN4Feed15getTouchEnabledEv_14
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L767_17
.line 15
	ld i0,[zr,_back_17]
	ld i1,[zr,_tradelbl_17]
	ld i2,&LC19_17
L775_17:
.line 17
	ld i3,#0x1
	call &__Z16createMainLayoutPKcS0_S0_b_4
	ld i0,r14
	ld [d2,52],r14
LBB533_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB535_17:
	ld r14,[r14,8]
LBE535_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB536_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE536_17:
	ld r14,[r14]
	ld [d2,48],r14
LBB537_17:
	ld i0,[d2,52]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB539_17:
	ld r14,[r14,8]
LBE539_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB540_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE540_17:
	ld r14,[r14]
	ld [d2,40],r14
Ltext132_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 21
	ld i0,d5
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d5
	call d0
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 22
	ld i0,#0x44c
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN10ImageCacheC1Ev_12
	ld [d2,36],d0
.line 23
	ld i0,d2
	call &__ZN15AlbumViewScreen8loadFileEv_17
.line 24
	ld i0,#0x64
	call &__Znam_20
	ld d1,r14
.line 25
	ld i0,r14
	ld i1,#0x0
	ld i2,#0x64
	syscall 4
.line 26
	ld i0,&_CARDS_17
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,r14
	ld i0,[fr,-48]
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld [sp],d0
	ld [sp,4],r14
	ld r14,[zr,_scrHeight_4]
	ld [sp,8],r14
	ld r0,[zr,_scrWidth_4]
	ld [sp,12],r0
	ld i0,d1
	ld i1,&LC25_17
	call &_sprintf_37
.line 36
	ld i0,d2
	ld i1,[d2,52]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
.line 38
	ld r14,#0x0
	ld [d2,2284],r14
LBE532_17:
	add sp,#0x18
	pop rt,d7
	ret
L767_17:
.line 17
	ld i0,[zr,_back_17]
	ld i1,[zr,_tradelbl_17]
	ld i2,[zr,_select_17]
	jp &L775_17

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_17, 2, void
.line 347
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext139_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L838_17
L802_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 347
	add sp,#0x4
	pop rt,d0
	ret
L838_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L839_17
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L802_17
	ld i0,&_TRADE_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L840_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 347
	add sp,#0x4
	pop rt,d0
	ret
L839_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_17
	ld i1,&LC26_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_17
	ld i1,&LC27_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC28_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC29_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC30_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC31_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L840_17

//****************************************
// Function: __GLOBAL__I__ZN15AlbumViewScreenC2EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE
//****************************************

.func __GLOBAL__I__ZN15AlbumViewScreenC2EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE_17, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 348
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 348
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_17
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN15AlbumViewScreenC2EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE
//****************************************

.func __GLOBAL__D__ZN15AlbumViewScreenC2EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE_17, 0, void
.line 349
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 349
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_17
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE
//****************************************

.func __ZN4MAUI14WidgetListener9triggeredEPNS_6WidgetE_18, 2, void
.sourcefile 'c:\MoSync\include\MAUI\Widget.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb
//****************************************

.func __ZN4MAUI14WidgetListener18enableStateChangedEPNS_6WidgetEb_18, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI14WidgetListener13boundsChangedEPNS_6WidgetERKN6MAUtil4RectE_18, 3, void
.line 67
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 67
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_18, 2, void
.sourcefile 'c:\MoSync\include\MAUtil\Environment.h'
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di_18, 4, void
.line 71
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 71
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di_18, 4, void
.line 72
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 72
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di_18, 4, void
.line 73
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 73
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen13keyPressEventEii
//****************************************

.func __ZN4MAUI6Screen13keyPressEventEii_18, 3, void
.sourcefile 'c:\MoSync\include\MAUI\Screen.h'
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 60
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Screen15keyReleaseEventEii
//****************************************

.func __ZN4MAUI6Screen15keyReleaseEventEii_18, 3, void
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 64
	pop fr,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen7refreshEv
//****************************************

.func __ZN15AlbumLoadScreen7refreshEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 7
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB2_18:
.line 8
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
LBE2_18:
	pop rt,d0
	ret

//****************************************
// Function: __ZThn4_N15AlbumLoadScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn4_N15AlbumLoadScreen19pointerReleaseEventE9MAPoint2d_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xfffffffc
	call &__ZN15AlbumLoadScreen19pointerReleaseEventE9MAPoint2d_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN15AlbumLoadScreen19pointerReleaseEventE9MAPoint2d_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 84
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB3_18:
.line 85
	ld r14,[i0,2228]
	ld r0,#0x8
	jc gt,r14,r0,&L14_18
.line 86
	ld.b r14,[i0,2234]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L22_18
.line 88
	ld.b r0,[i0,2233]
	and r0,#0xff
	jc eq,r0,r14,&L17_18
.line 89
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 91
	call d0
L14_18:
.line 94
	ld r14,#0x0
	ld [d1,2228],r14
LBE3_18:
	pop rt,d1
	ret
L17_18:
.line 90
	ld.b r14,[i0,2232]
	and r14,#0xff
	jc eq,r14,r0,&L14_18
.line 91
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L14_18
L22_18:
.line 87
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 91
	call d0
	jp &L14_18

//****************************************
// Function: __ZN15AlbumLoadScreen10locateItemE9MAPoint2d
//****************************************

.func __ZN15AlbumLoadScreen10locateItemE9MAPoint2d_18, 3, void
.line 98
	push rt,d4
	sub sp,#0xc
	ld fr,sp
	add fr,#0x28
	ld d2,i0
	ld d3,i1
	ld d4,i2
LBB5_18:
.line 99
	ld i0,[i0,2252]
	ld i1,[zr,_truesz_18]
	call &__ZN4Feed8setTouchEPKc_14
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L51_18
L24_18:
.line 103
	ld r14,#0x0
	ld.b [d2,2232],r14
.line 104
	ld.b [d2,2233],r14
.line 105
	ld.b [d2,2234],r14
LBB7_18:
.sourcefile 'c:\MoSync\include\MAUtil\Geometry.h'
.line 41
	ld [fr,-40],d3
	ld [fr,-36],d4
LBE8_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 109
	ld d1,#0x0
LBB10_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB13_18:
	ld r14,[r14,8]
LBE13_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB14_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE14_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB15_18:
.line 265
	ld r14,[r14]
LBE15_18:
.line 366
	jc le,r14,d1,&L52_18
L38_18:
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB19_18:
	ld r14,[r14,8]
LBE19_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB20_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE20_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB21_18:
	ld r0,d1
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE21_18:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffd8
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L30_18
Ltext10_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 114
	ld r14,#0x1
	ld.b [d2,2232],r14
L30_18:
.line 109
	add d1,#0x1
LBB22_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB25_18:
	ld r14,[r14,8]
LBE25_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB26_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE26_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB27_18:
.line 265
	ld r14,[r14]
LBE27_18:
.line 366
	jc gt,r14,d1,&L38_18
L52_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 117
	ld d1,#0x0
	jp &L39_18
L50_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB31_18:
	ld r14,[r14,8]
	add r14,#0x4
LBE31_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB32_18:
	ld r0,d1
	sll r0,#0x2
	ld r14,[r14,8]
	add r0,r14
LBE32_18:
	ld i0,[r0]
	ld r14,[i0]
	ld d0,[r14,40]
	ld i1,fr
	add i1,#0xffffffd8
	call d0
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L53_18
Ltext14_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 117
	add d1,#0x1
L39_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_94
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB35_18:
	ld r14,[r14,8]
	add r14,#0x4
LBE35_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB36_18:
.line 265
	ld r14,[r14]
LBE36_18:
.line 366
	jc gt,r14,d1,&L50_18
L23_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 131
	add sp,#0xc
	pop rt,d4
	ret
L51_18:
.line 100
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,[d2,2252]
	call &__ZN4Feed6getAllEv_14
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[zr,_FEED_18]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L24_18
L53_18:
.line 121
	jc ne,d1,r0,&L47_18
.line 122
	ld [d2,2228],d1
.line 123
	ld r14,#0x1
	ld.b [d2,2233],r14
LBE39_18:
.line 131
	add sp,#0xc
	pop rt,d4
	ret
L47_18:
.line 124
	ld r0,#0x2
	jc ne,d1,r0,&L23_18
.line 125
	ld r14,#0x0
	ld [d2,2228],r14
.line 126
	ld r0,#0x1
	ld.b [d2,2234],r0
	jp &L23_18

//****************************************
// Function: __ZThn4_N15AlbumLoadScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn4_N15AlbumLoadScreen16pointerMoveEventE9MAPoint2d_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 14
	add i0,#0xfffffffc
	call &__ZN15AlbumLoadScreen16pointerMoveEventE9MAPoint2d_18
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN15AlbumLoadScreen16pointerMoveEventE9MAPoint2d_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 78
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB43_18:
.line 79
	ld r14,[i0,2228]
	add r14,#0x1
	ld [i0,2228],r14
.line 80
	call &__ZN15AlbumLoadScreen10locateItemE9MAPoint2d_18
LBE43_18:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N15AlbumLoadScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn4_N15AlbumLoadScreen17pointerPressEventE9MAPoint2d_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
.line 14
	add i0,#0xfffffffc
	call &__ZN15AlbumLoadScreen17pointerPressEventE9MAPoint2d_18
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN15AlbumLoadScreen17pointerPressEventE9MAPoint2d_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 73
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
	ld [fr,-16],i1
	ld [fr,-12],i2
LBB44_18:
.line 74
	call &__ZN15AlbumLoadScreen10locateItemE9MAPoint2d_18
LBE44_18:
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZThn12_N15AlbumLoadScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZThn12_N15AlbumLoadScreen16selectionChangedEPN4MAUI6WidgetEb_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xfffffff4
	call &__ZN15AlbumLoadScreen16selectionChangedEPN4MAUI6WidgetEb_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen16selectionChangedEPN4MAUI6WidgetEb
//****************************************

.func __ZN15AlbumLoadScreen16selectionChangedEPN4MAUI6WidgetEb_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 153
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i0,i1
LBB45_18:
.line 154
	and i2,#0xff
	ld r14,#0x0
	jc eq,i2,r14,&L60_18
.line 155
	ld i1,[zr,_gFontBlue_4]
.line 157
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE45_18:
.line 159
	pop rt,fr
	ret
L60_18:
.line 157
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_90
LBE46_18:
.line 159
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen4showEv
//****************************************

.func __ZN15AlbumLoadScreen4showEv_18, 1, void
.line 161
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB47_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[i0,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d1,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB49_18:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE49_18:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
Ltext24_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 163
	ld i0,d1
	call &__ZN4MAUI6Screen4showEv_94
LBE47_18:
	pop rt,d1
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen4hideEv
//****************************************

.func __ZN15AlbumLoadScreen4hideEv_18, 1, void
.line 166
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB50_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[i0,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d1,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB52_18:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE52_18:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x0
	call d0
Ltext26_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 168
	ld i0,d1
	call &__ZN4MAUI6Screen4hideEv_94
LBE50_18:
	pop rt,d1
	ret

//****************************************
// Function: __ZThn24_N15AlbumLoadScreen12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZThn24_N15AlbumLoadScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffe8
	call &__ZN15AlbumLoadScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen12httpFinishedEPN6MAUtil14HttpConnectionEi
//****************************************

.func __ZN15AlbumLoadScreen12httpFinishedEPN6MAUtil14HttpConnectionEi_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 210
	push rt,d3
	sub sp,#0x85c
	ld fr,sp
	add fr,#0x874
	ld d2,i0
	ld d3,i1
LBB53_18:
.line 211
	ld r14,#0xc8
	jc eq,i2,r14,&L74_18
.line 215
	add i0,#0x20
	call &__ZN6MAUtil10Connection5closeEv_62
.line 216
	ld d0,fr
	add d0,#0xfffff790
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE53_18:
.line 218
	add sp,#0x85c
	pop rt,d3
	ret
L74_18:
.line 212
	ld d0,i0
	add d0,#0x48
	ld d1,fr
	add d1,#0xfffff794
	ld i0,d1
	call &__ZN13XmlConnectionC1Ev_3
LBB56_18:
	ld i0,d2
	add i0,#0x50
	ld i1,fr
	add i1,#0xfffff79c
	ld i2,#0x3c
	syscall 5
	ld r14,[fr,-2088]
	ld [d0,68],r14
	ld r14,[fr,-2084]
	ld [d0,72],r14
	ld i0,d2
	add i0,#0x94
	ld i1,fr
	add i1,#0xfffff7e0
	ld i2,#0x800
	syscall 5
	ld r14,[fr,-32]
	ld [d0,2124],r14
	ld r14,[fr,-28]
	ld [d0,2128],r14
LBE56_18:
	ld i0,d1
	call &__ZN13XmlConnectionD1Ev_3
.line 213
	ld r14,#0x0
	ld [sp],r14
	ld i0,d0
	ld i1,d3
	ld i2,d2
	add i2,#0x10
	ld i3,d2
	add i3,#0x14
	call &__ZN13XmlConnection5parseEPN6MAUtil10ConnectionEP10XCListenerPN3Mtx11XmlListenerEPN4MAUI5LabelE_3
LBE54_18:
.line 218
	add sp,#0x85c
	pop rt,d3
	ret

//****************************************
// Function: __ZThn24_N15AlbumLoadScreen16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZThn24_N15AlbumLoadScreen16connReadFinishedEPN6MAUtil10ConnectionEi_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffe8
	call &__ZN15AlbumLoadScreen16connReadFinishedEPN6MAUtil10ConnectionEi_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen16connReadFinishedEPN6MAUtil10ConnectionEi
//****************************************

.func __ZN15AlbumLoadScreen16connReadFinishedEPN6MAUtil10ConnectionEi_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 220
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 220
	pop fr,fr
	ret

//****************************************
// Function: __ZThn16_N15AlbumLoadScreen11xcConnErrorEi
//****************************************

.func __ZThn16_N15AlbumLoadScreen11xcConnErrorEi_18, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xfffffff0
	call &__ZN15AlbumLoadScreen11xcConnErrorEi_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen11xcConnErrorEi
//****************************************

.func __ZN15AlbumLoadScreen11xcConnErrorEi_18, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 222
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 222
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen11mtxEncodingEPKc
//****************************************

.func __ZThn20_N15AlbumLoadScreen11mtxEncodingEPKc_18, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen11mtxEncodingEPKc_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen11mtxEncodingEPKc
//****************************************

.func __ZN15AlbumLoadScreen11mtxEncodingEPKc_18, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 226
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 226
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen11mtxTagStartEPKci
//****************************************

.func __ZThn20_N15AlbumLoadScreen11mtxTagStartEPKci_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen11mtxTagStartEPKci_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen11mtxTagStartEPKci
//****************************************

.func __ZN15AlbumLoadScreen11mtxTagStartEPKci_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 229
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d1,i1
LBB57_18:
.line 230
	ld i0,i1
	ld i1,[zr,_xml_albumdone_18]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L84_18
.line 233
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	add i0,#0x89c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE57_18:
	add sp,#0x4
	pop rt,d2
	ret
L84_18:
.line 231
	ld i0,[d2,2256]
	call &__ZN6Albums8clearAllEv_16
.line 233
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	add i0,#0x89c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE58_18:
	add sp,#0x4
	pop rt,d2
	ret

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen10mtxTagAttrEPKcS1_
//****************************************

.func __ZThn20_N15AlbumLoadScreen10mtxTagAttrEPKcS1__18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen10mtxTagAttrEPKcS1__18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen10mtxTagAttrEPKcS1_
//****************************************

.func __ZN15AlbumLoadScreen10mtxTagAttrEPKcS1__18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 236
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 236
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen10mtxTagDataEPKci
//****************************************

.func __ZThn20_N15AlbumLoadScreen10mtxTagDataEPKci_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen10mtxTagDataEPKci_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen10mtxTagDataEPKci
//****************************************

.func __ZN15AlbumLoadScreen10mtxTagDataEPKci_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 239
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
LBB59_18:
.line 240
	ld d0,i0
	add d0,#0x89c
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_albumname_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L89_18
.line 241
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8a4
L94_18:
.line 245
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L88_18:
.line 247
	add sp,#0x4
	pop rt,d2
	ret
L89_18:
.line 242
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_albumid_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L91_18
.line 243
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8a0
	jp &L94_18
L91_18:
.line 244
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,[zr,_xml_error_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L88_18
.line 245
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	add i0,#0x8a8
	jp &L94_18

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen13mtxParseErrorEv
//****************************************

.func __ZThn20_N15AlbumLoadScreen13mtxParseErrorEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen13mtxParseErrorEv_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen13mtxParseErrorEv
//****************************************

.func __ZN15AlbumLoadScreen13mtxParseErrorEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 266
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 266
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen14mtxEmptyTagEndEv
//****************************************

.func __ZThn20_N15AlbumLoadScreen14mtxEmptyTagEndEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen14mtxEmptyTagEndEv_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen14mtxEmptyTagEndEv
//****************************************

.func __ZN15AlbumLoadScreen14mtxEmptyTagEndEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 269
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 269
	pop fr,fr
	ret

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen14mtxTagStartEndEv
//****************************************

.func __ZThn20_N15AlbumLoadScreen14mtxTagStartEndEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen14mtxTagStartEndEv_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen14mtxTagStartEndEv
//****************************************

.func __ZN15AlbumLoadScreen14mtxTagStartEndEv_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 272
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 272
	pop fr,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen13keyPressEventEi
//****************************************

.func __ZN15AlbumLoadScreen13keyPressEventEi_18, 2, void
.line 171
	push rt,d4
	sub sp,#0x14
	ld fr,sp
	add fr,#0x30
	ld d3,i0
	ld d0,i1
LBB61_18:
.line 172
	ld i0,[i0,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB63_18:
.line 174
	case d0,#0x111,#0xd,#L127_18,#L102_18
.data
	.align 4
L127_18:
	.word L104_18
	.word L105_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L102_18
	.word L107_18
	.word L130_18
	.word L113_18


.code
L107_18:
.line 185
	ld.b d1,[d3,2235]
	and d1,#0xff
	ld r0,#0x0
	jc ne,d1,r0,&L102_18
LBB66_18:
.line 186
	ld d4,fr
	add d4,#0xffffffe0
LBB67_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	ld i0,[d3,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
	ld i0,[d3,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_92
LBB68_18:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE68_18:
	ld i0,[r14]
	call &__ZNK4MAUI5Label10getCaptionEv_90
	ld d2,fr
	add d2,#0xffffffdc
	ld i0,d2
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,d4
	ld i1,[d3,2256]
	ld i2,d2
	call &__ZN6Albums5getIdEN6MAUtil11BasicStringIcEE_16
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
Ltext48_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 187
	ld i0,[d3,28]
	jc eq,i0,d1,&L110_18
.line 188
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L110_18:
.line 190
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
	ld i0,#0x9dc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d3
	ld i2,[d3,2252]
	ld i3,d2
	call &__ZN15AlbumViewScreenC1EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE_17
	ld [d3,28],d0
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 191
	ld i0,[d3,28]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L102_18:
.line 208
	add sp,#0x14
	pop rt,d4
	ret
L113_18:
.line 195
	ld i0,[d3,2252]
	call &__ZN4Feed8getAlbumEv_14
LBB73_18:
.line 196
	ld d4,fr
	add d4,#0xffffffd0
	ld i0,d4
	ld i1,r14
	call &__ZN6Albums6getIDsEv_16
LBB74_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 334
	ld d0,[fr,-40]
LBE76_18:
.line 341
	ld r14,[d4]
	sll r14,#0x2
	add r14,d0
LBE78_18:
	jc eq,r14,d0,&L129_18
	ld d2,fr
	add d2,#0xffffffe0
	ld d1,fr
	add d1,#0xffffffdc
L119_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 198
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d1
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 199
	ld i0,d2
	ld i1,&LC10_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 200
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,&LC9_18
	call &__Z8saveDataPKcS0__4
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE80_18:
.line 197
	add d0,#0x4
LBB81_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 341
	ld r14,[d4]
	sll r14,#0x2
	ld r0,[fr,-40]
	add r14,r0
LBE82_18:
	jc ne,r14,d0,&L119_18
L129_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 202
	ld i0,[d3,2252]
	ld i1,&LC9_18
	call &__ZN4Feed6setAllEPKc_14
.line 203
	ld i0,[zr,_FEED_18]
	ld i1,&LC9_18
	call &__Z8saveDataPKcS0__4
.line 204
	ld i0,[zr,_ALBUM_18]
	ld i1,&LC9_18
	call &__Z8saveDataPKcS0__4
L130_18:
.line 205
	ld i0,#0x0
	syscall 2
L105_18:
.line 179
	ld i0,[d3,2240]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox14selectNextItemEb_92
LBE72_18:
.line 208
	add sp,#0x14
	pop rt,d4
	ret
L104_18:
.line 176
	ld i0,[d3,2240]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox18selectPreviousItemEb_92
LBE86_18:
.line 208
	add sp,#0x14
	pop rt,d4
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen8drawListEv
//****************************************

.func __ZN15AlbumLoadScreen8drawListEv_18, 1, void
.line 133
	push rt,d5
	sub sp,#0x10
	ld fr,sp
	add fr,#0x30
	ld d2,i0
LBB87_18:
.line 134
	ld r0,#0x0
	ld.b [i0,2235],r0
LBB89_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	ld i0,[i0,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB90_18:
.line 295
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L169_18
	ld r1,[d0]
L133_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L164_18
	ld i0,[d0,8]
L143_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L143_18
L164_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE93_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 136
	ld d5,fr
	add d5,#0xffffffd4
	ld i0,d5
	ld i1,[d2,2256]
	call &__ZN6Albums8getNamesEv_16
LBB98_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 334
	ld d1,[fr,-36]
LBE100_18:
.line 341
	ld r14,[d5]
	sll r14,#0x2
	add r14,d1
LBE102_18:
	jc eq,r14,d1,&L166_18
	ld d3,fr
	add d3,#0xffffffd0
	ld d4,d2
	add d4,#0xc
L151_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 138
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d3
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d2,2248],r14
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 139
	ld i0,[d2,2248]
	ld i1,d4
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 140
	ld i0,[d2,2240]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d2,2248]
	call d0
.line 137
	add d1,#0x4
LBB103_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 341
	ld r14,[d5]
	sll r14,#0x2
	ld r0,[fr,-36]
	add r14,r0
LBE104_18:
	jc ne,r14,d1,&L151_18
L166_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 143
	ld i0,[d2,2256]
	call &__ZN6Albums4sizeEv_16
	ld r2,#0x0
	jc le,r14,r2,&L152_18
.line 144
	ld i0,[d2,2240]
	ld i1,r2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_92
L153_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 143
	ld r14,[fr,-36]
	ld r0,#0x0
	jc eq,r14,r0,&L131_18
	ld d0,[r14,-4]
	sll d0,#0x2
	add d0,r14
	ld i0,[d5,8]
	jc eq,i0,d0,&L158_18
L170_18:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,[d5,8]
	jc ne,i0,d0,&L170_18
L158_18:
	add i0,#0xfffffffc
	call &__ZdaPv_22
L131_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 151
	add sp,#0x10
	pop rt,d5
	ret
L152_18:
.line 146
	ld r14,#0x1
	ld.b [d2,2235],r14
.line 147
	ld d0,fr
	add d0,#0xffffffd0
	ld i0,d0
	ld i1,[zr,_empty_18]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d2,2248],r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 148
	ld i0,[d2,2248]
	ld i1,d2
	add i1,#0xc
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_95
.line 149
	ld i0,[d2,2240]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d2,2248]
	call d0
	jp &L153_18
L169_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB117_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L168_18
	ld i0,[d0,8]
L137_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L137_18
L162_18:
.line 304
	ld r14,#0x0
	ld [d0,4],r14
.line 305
	jc ne,i0,r14,&L171_18
.line 307
	ld [d0,8],d1
	jp &L133_18
L171_18:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L133_18
L168_18:
	ld i0,[d0,8]
	jp &L162_18

//****************************************
// Function: __ZThn20_N15AlbumLoadScreen9mtxTagEndEPKci
//****************************************

.func __ZThn20_N15AlbumLoadScreen9mtxTagEndEPKci_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xffffffec
	call &__ZN15AlbumLoadScreen9mtxTagEndEPKci_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreen9mtxTagEndEPKci
//****************************************

.func __ZN15AlbumLoadScreen9mtxTagEndEPKci_18, 3, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 249
	push rt,d4
	sub sp,#0x4
	ld fr,sp
	add fr,#0x20
	ld d4,i0
	ld d0,i1
LBB118_18:
.line 250
	ld i0,i1
	ld i1,[zr,_xml_albumname_18]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L183_18
.line 255
	ld i0,d0
	ld i1,[zr,_xml_albumdone_18]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L184_18
.line 259
	ld i0,d0
	ld i1,[zr,_xml_error_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L178_18
.line 260
	ld i0,d4
	add i0,#0x8a8
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,r14
L180_18:
.line 262
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d4,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
L182_18:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE118_18:
.line 264
	add sp,#0x4
	pop rt,d4
	ret
L184_18:
.line 256
	ld d1,fr
	add d1,#0xffffffe0
	ld i0,d1
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d4,2244]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 257
	ld i0,d4
	call &__ZN15AlbumLoadScreen8drawListEv_18
.line 258
	ld i0,d1
	ld i1,[d4,2256]
	call &__ZN6Albums6getAllEv_16
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[zr,_ALBUM_18]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d1
.line 262
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE119_18:
.line 264
	add sp,#0x4
	pop rt,d4
	ret
L183_18:
.line 251
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d4,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 252
	ld d2,d4
	add d2,#0x8a4
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d1,r14
	ld d3,d4
	add d3,#0x8a0
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d4,2256]
	ld i1,d1
	ld i2,r14
	call &__ZN6Albums8addAlbumEPKcS1__16
.line 253
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 254
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	jp &L182_18
L178_18:
.line 262
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC9_18
	jp &L180_18

//****************************************
// Function: __ZN15AlbumLoadScreenC1EP4Feed
//****************************************

.func __ZN15AlbumLoadScreenC1EP4Feed_18, 2, void
.line 20
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d1,i1
LBB121_18:
.line 20
	call &__ZN4MAUI6ScreenC2Ev_94
LBB122_18:
	ld i1,d2
	add i1,#0x18
LBE122_18:
	ld r0,&__ZTV15AlbumLoadScreen_18+8
	ld [d2],r0
	ld r14,&__ZTV15AlbumLoadScreen_18+112
	ld [d2,4],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+152
	ld [d2,12],r0
	ld r14,&__ZTV15AlbumLoadScreen_18+176
	ld [d2,16],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+188
	ld [d2,20],r0
	ld r14,&__ZTV15AlbumLoadScreen_18+232
	ld [i1],r14
	ld i0,d2
	add i0,#0x20
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_62
	ld i0,d2
	add i0,#0x48
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d2
	add i0,#0x89c
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8a0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8a4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld i0,d2
	add i0,#0x8a8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	ld [d2,2252],d1
.line 21
	ld i0,#0xc
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_94
	ld [d2,28],d0
.line 22
	ld i0,d1
	call &__ZN4Feed15getTouchEnabledEv_14
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L192_18
.line 23
	ld i0,&LC11_18
	ld i1,&LC12_18
	ld i2,&LC9_18
L198_18:
.line 25
	ld i3,#0x1
	call &__Z16createMainLayoutPKcS0_S0_b_4
	ld i0,r14
	ld [d2,2236],r14
LBB123_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 362
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB125_18:
	ld r14,[r14,8]
LBE125_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB126_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE126_18:
	ld r14,[r14]
	ld [d2,2240],r14
LBB127_18:
	ld i0,[d2,2236]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB129_18:
	ld r14,[r14,8]
LBE129_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_95
LBB130_18:
	ld r14,[r14,8]
	add r14,#0x4
LBE130_18:
	ld r14,[r14]
	ld [d2,2244],r14
Ltext65_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 31
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,[d2,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 32
	ld i0,[d2,2252]
	call &__ZN4Feed8getAlbumEv_14
	ld [d2,2256],r14
.line 33
	ld i0,d2
	call &__ZN15AlbumLoadScreen8drawListEv_18
.line 42
	ld i0,d2
	ld i1,[d2,2236]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_94
.line 44
	ld [zr,_orig_4],d2
.line 45
	ld r14,#0x0
	ld [d2,2228],r14
LBE121_18:
	add sp,#0x4
	pop rt,d2
	ret
L192_18:
.line 25
	ld i0,&LC11_18
	ld i1,&LC12_18
	ld i2,[zr,_select_18]
	jp &L198_18

//****************************************
// Function: __ZThn4_N15AlbumLoadScreenD0Ev
//****************************************

.func __ZThn4_N15AlbumLoadScreenD0Ev_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xfffffffc
	call &__ZN15AlbumLoadScreenD0Ev_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreenD0Ev
//****************************************

.func __ZN15AlbumLoadScreenD0Ev_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 48
	push rt,d5
	sub sp,#0x4
	ld fr,sp
	add fr,#0x24
	ld d5,i0
LBB143_18:
.line 48
	ld r0,&__ZTV15AlbumLoadScreen_18+8
	ld [i0],r0
	ld r2,&__ZTV15AlbumLoadScreen_18+112
	ld [i0,4],r2
	ld r14,&__ZTV15AlbumLoadScreen_18+152
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+176
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumLoadScreen_18+188
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumLoadScreen_18+232
	ld [i0,24],r14
LBB144_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	ld i0,[i0,2236]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB145_18:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L298_18
	ld r1,[d0]
L217_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L283_18
	ld i0,[d0,8]
L227_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L227_18
L283_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE148_18:
.line 313
	ld i0,[d5,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB154_18:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L299_18
	ld r1,[d0]
L231_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L287_18
	ld i0,[d0,8]
L241_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L241_18
L287_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE157_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 52
	ld i0,[d5,2240]
	jc ne,i0,r14,&L300_18
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc ne,i0,r0,&L301_18
L247_18:
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L302_18
L248_18:
.line 58
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L303_18
L251_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc ne,i0,r2,&L304_18
L269_18:
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc ne,i0,r14,&L305_18
L271_18:
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc ne,i0,r0,&L306_18
L273_18:
.line 66
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d4,d5
	add d4,#0x89c
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 67
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d3,d5
	add d3,#0x8a0
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 68
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d2,d5
	add d2,#0x8a4
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d5
	add d1,#0x8a8
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	add i0,#0x48
	call &__ZN13XmlConnectionD1Ev_3
LBB162_18:
.line 20
	ld i0,d5
	add i0,#0x20
LBB163_18:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE163_18:
	ld i0,d5
	call &__ZN4MAUI6ScreenD2Ev_94
LBE143_18:
.line 70
	ld i0,d5
	call &__ZdlPv_23
	add sp,#0x4
	pop rt,d5
	ret
L300_18:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc eq,i0,r0,&L247_18
L301_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L248_18
L302_18:
.line 55
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 56
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 58
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L251_18
L303_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB166_18:
.line 295
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L307_18
	ld r1,[d0]
L253_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L291_18
	ld i0,[d0,8]
L263_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L263_18
L291_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE169_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L308_18
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L311_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc eq,i0,r2,&L269_18
L304_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc eq,i0,r14,&L271_18
L305_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc eq,i0,r0,&L273_18
L306_18:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L273_18
L299_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB182_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L295_18
	ld i0,[d0,8]
L235_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L235_18
L285_18:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L309_18
.line 307
	ld [d0,8],d1
	jp &L231_18
L298_18:
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB191_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L293_18
	ld i0,[d0,8]
L221_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L221_18
L281_18:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L310_18
.line 307
	ld [d0,8],d1
	jp &L217_18
L308_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L311_18
L310_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L217_18
L309_18:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L231_18
L307_18:
.line 298
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB216_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L297_18
	ld i0,[d0,8]
L257_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L257_18
L289_18:
.line 304
	ld r14,#0x0
	ld [d0,4],r14
.line 305
	jc ne,i0,r14,&L312_18
.line 307
	ld [d0,8],d1
	jp &L253_18
L312_18:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L253_18
L295_18:
	ld i0,[d0,8]
	jp &L285_18
L293_18:
	ld i0,[d0,8]
	jp &L281_18
L297_18:
	ld i0,[d0,8]
	jp &L289_18

//****************************************
// Function: __ZThn4_N15AlbumLoadScreenD1Ev
//****************************************

.func __ZThn4_N15AlbumLoadScreenD1Ev_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\AlbumLoadScreen.h'
.line 14
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 14
	add i0,#0xfffffffc
	call &__ZN15AlbumLoadScreenD1Ev_18
	pop rt,fr
	ret

//****************************************
// Function: __ZN15AlbumLoadScreenD1Ev
//****************************************

.func __ZN15AlbumLoadScreenD1Ev_18, 1, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 48
	push rt,d5
	sub sp,#0x4
	ld fr,sp
	add fr,#0x24
	ld d5,i0
LBB217_18:
.line 48
	ld r0,&__ZTV15AlbumLoadScreen_18+8
	ld [i0],r0
	ld r2,&__ZTV15AlbumLoadScreen_18+112
	ld [i0,4],r2
	ld r14,&__ZTV15AlbumLoadScreen_18+152
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+176
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumLoadScreen_18+188
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumLoadScreen_18+232
	ld [i0,24],r14
LBB218_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	ld i0,[i0,2236]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB219_18:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L398_18
	ld r1,[d0]
L317_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L383_18
	ld i0,[d0,8]
L327_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L327_18
L383_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE222_18:
.line 313
	ld i0,[d5,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB228_18:
.line 295
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L399_18
	ld r1,[d0]
L331_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L387_18
	ld i0,[d0,8]
L341_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L341_18
L387_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE231_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 52
	ld i0,[d5,2240]
	jc ne,i0,r14,&L400_18
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc ne,i0,r0,&L401_18
L347_18:
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L402_18
L348_18:
.line 58
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L403_18
L351_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc ne,i0,r2,&L404_18
L369_18:
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc ne,i0,r14,&L405_18
L371_18:
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc ne,i0,r0,&L406_18
L373_18:
.line 66
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d4,d5
	add d4,#0x89c
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 67
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d3,d5
	add d3,#0x8a0
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 68
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d2,d5
	add d2,#0x8a4
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld d1,d5
	add d1,#0x8a8
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d5
	add i0,#0x48
	call &__ZN13XmlConnectionD1Ev_3
LBB236_18:
.line 20
	ld i0,d5
	add i0,#0x20
LBB237_18:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE237_18:
	ld i0,d5
	call &__ZN4MAUI6ScreenD2Ev_94
LBE217_18:
.line 70
	add sp,#0x4
	pop rt,d5
	ret
L400_18:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc eq,i0,r0,&L347_18
L401_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L348_18
L402_18:
.line 55
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 56
	ld r14,#0x0
	ld [zr,_image_4],r14
.line 58
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc eq,i0,r0,&L351_18
L403_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 313
	call &__ZN4MAUI6Widget11getChildrenEv_95
	ld d0,r14
LBB240_18:
.line 295
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L407_18
	ld r1,[d0]
L353_18:
.line 281
	ld r0,#0x0
	jc le,r1,r0,&L391_18
	ld i0,[d0,8]
L363_18:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 281
	add r0,#0x1
	jc gt,r1,r0,&L363_18
L391_18:
.line 285
	ld r14,#0x0
	ld [d0],r14
LBE243_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L408_18
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L411_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc eq,i0,r2,&L369_18
L404_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc eq,i0,r14,&L371_18
L405_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc eq,i0,r0,&L373_18
L406_18:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L373_18
L399_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB256_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L395_18
	ld i0,[d0,8]
L335_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L335_18
L385_18:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L409_18
.line 307
	ld [d0,8],d1
	jp &L331_18
L398_18:
.line 298
	ld i0,r0
	call &__Znam_20
	ld d1,r14
LBB265_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L393_18
	ld i0,[d0,8]
L321_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L321_18
L381_18:
.line 304
	ld r2,#0x0
	ld [d0,4],r2
.line 305
	jc ne,i0,r2,&L410_18
.line 307
	ld [d0,8],d1
	jp &L317_18
L408_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L411_18
L410_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L317_18
L409_18:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L331_18
L407_18:
.line 298
	ld i0,r2
	call &__Znam_20
	ld d1,r14
LBB290_18:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L397_18
	ld i0,[d0,8]
L357_18:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L357_18
L389_18:
.line 304
	ld r14,#0x0
	ld [d0,4],r14
.line 305
	jc ne,i0,r14,&L412_18
.line 307
	ld [d0,8],d1
	jp &L353_18
L412_18:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld [d0,8],d1
	jp &L353_18
L395_18:
	ld i0,[d0,8]
	jp &L385_18
L393_18:
	ld i0,[d0,8]
	jp &L381_18
L397_18:
	ld i0,[d0,8]
	jp &L389_18

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_18, 2, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 276
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
Ltext95_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0xffff
	jc eq,i1,r14,&L548_18
L512_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 276
	add sp,#0x4
	pop rt,d0
	ret
L548_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L549_18
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L512_18
	ld i0,&_TRADE_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,&_CARDS_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,&_ALBUMS_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 71
	ld i0,&_USER_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 69
	ld i0,&_URL_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 61
	ld i0,&_base64_chars_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
L550_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 276
	add sp,#0x4
	pop rt,d0
	ret
L549_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_18
	ld i1,&LC13_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 69
	ld i0,&_URL_18
	ld i1,&LC14_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC15_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_USER_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 73
	ld i0,d0
	ld i1,&LC16_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_ALBUMS_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 75
	ld i0,d0
	ld i1,&LC17_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_CARDS_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 77
	ld i0,d0
	ld i1,&LC18_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,&_TRADE_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__81
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L550_18

//****************************************
// Function: __GLOBAL__I__ZN15AlbumLoadScreen7refreshEv
//****************************************

.func __GLOBAL__I__ZN15AlbumLoadScreen7refreshEv_18, 0, void
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 277
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 277
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_18
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN15AlbumLoadScreen7refreshEv
//****************************************

.func __GLOBAL__D__ZN15AlbumLoadScreen7refreshEv_18, 0, void
.line 278
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 278
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_18
	pop rt,fr
	ret

//****************************************
// Function: __Znam
//****************************************

.func __Znam_20, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\new_opvnt.cc'
.line 35
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_20:
.line 36
	call &__Znwm_21
LBE2_20:
.line 37
	pop rt,fr
	ret

//****************************************
// Function: __Znwm
//****************************************

.func __Znwm_21, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\new_opnt.cc'
.line 41
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_21:
.line 45
	ld r14,#0x0
	jc ne,i0,r14,&L2_21
.line 46
	ld i0,#0x1
L2_21:
.line 47
	call &_malloc_31
LBE3_21:
.line 68
	pop rt,fr
	ret

//****************************************
// Function: __ZdaPv
//****************************************

.func __ZdaPv_22, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\del_opvnt.cc'
.line 35
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_22:
.line 36
	call &__ZdlPv_23
LBE2_22:
	pop rt,fr
	ret

//****************************************
// Function: __ZdlPv
//****************************************

.func __ZdlPv_23, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\del_opnt.cc'
.line 37
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_23:
.line 38
	ld r14,#0x0
	jc eq,i0,r14,&L1_23
.line 39
	call &_free_31
L1_23:
.line 40
	pop rt,fr
	ret

//****************************************
// Function: _crt_tor_chain
//****************************************

.func _crt_tor_chain_27, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\ma.c'
.line 30
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
.line 31
	ld r14,#0x0
	jc eq,i0,r14,&L2_27
.line 36
	ld d0,[i0]
	jc eq,d0,r14,&L2_27
L10_27:
.line 35
	call d0
.line 36
	add d1,#0x4
LBE2_27:
	ld d0,[d1]
	ld r14,#0x0
	jc ne,d0,r14,&L10_27
L2_27:
.line 38
	pop rt,d1
	ret

//****************************************
// Function: _FileNameFromPath
//****************************************

.func _FileNameFromPath_28, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\maassert.c'
.line 26
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
.line 27
	ld i1,#0x5c
	call &_strrchr_34
	ld d0,r14
.line 28
	ld i0,d1
	ld i1,#0x2f
	call &_strrchr_34
.line 29
	ld r0,#0x0
	jc eq,r14,r0,&L5_28
.line 31
	ld i0,d0
	jc ltu,d0,r14,&L6_28
L3_28:
	add i0,#0x1
L1_28:
.line 32
	ld r14,i0
	pop rt,d1
	ret
L6_28:
.line 31
	ld i0,r14
	jp &L3_28
L5_28:
.line 30
	ld i0,d1
.line 29
	jc eq,d0,r14,&L1_28
.line 31
	ld i0,d0
	jc geu,d0,r14,&L3_28
	jp &L6_28

//****************************************
// Function: _bfeHandler
//****************************************

.func _bfeHandler_28, 3, void
.line 49
	push rt,d2
	sub sp,#0x408
	ld fr,sp
	add fr,#0x41c
	ld d2,i0
	ld d1,i2
.line 51
	ld i0,i1
	call &_FileNameFromPath_28
	ld d0,fr
	add d0,#0xfffffbec
	ld [sp],r14
	ld [sp,4],d1
	ld i0,d0
	ld i1,&LC0_28
	call &_sprintf_37
.line 52
	ld i0,d2
	ld i1,d0
	syscall 3

//****************************************
// Function: _panicFunction
//****************************************

.func _panicFunction_28, 2, void
.line 55
	push rt,d0
	sub sp,#0x408
	ld fr,sp
	add fr,#0x414
	ld r14,i0
.line 56
	ld r0,#0x0
	jc eq,i1,r0,&L22_28
LBB3_28:
.line 58
	ld d0,fr
	add d0,#0xfffffbf4
	ld [sp],i0
	ld [sp,4],i1
	ld i0,d0
	ld i1,&LC1_28
	call &_sprintf_37
.line 59
	ld i0,#0x1
	ld i1,d0
LBE3_28:
.line 61
	syscall 3
L22_28:
	ld i0,#0x1
	ld i1,r14
	syscall 3

//****************************************
// Function: _isalpha
//****************************************

.func _isalpha_29, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\mactype.c'
.line 180
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 180
	ld r14,#0x0
	ld r0,#0x7f
	jc gt,i0,r0,&L3_29
	ld.b r14,[i0,__ctypetab_29]
	and r14,#0x3
L3_29:
	pop fr,fr
	ret

//****************************************
// Function: _isupper
//****************************************

.func _isupper_29, 1, int
.line 181
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 181
	ld r14,#0x0
	ld r0,#0x7f
	jc gt,i0,r0,&L7_29
	ld.b r14,[i0,__ctypetab_29]
	and r14,#0x1
L7_29:
	pop fr,fr
	ret

//****************************************
// Function: _isdigit
//****************************************

.func _isdigit_29, 1, int
.line 183
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 183
	ld r14,#0x0
	ld r0,#0x7f
	jc gt,i0,r0,&L13_29
	ld.b r14,[i0,__ctypetab_29]
	and r14,#0x4
L13_29:
	pop fr,fr
	ret

//****************************************
// Function: _isspace
//****************************************

.func _isspace_29, 1, int
.line 185
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 185
	ld r14,#0x0
	ld r0,#0x7f
	jc gt,i0,r0,&L19_29
	ld.b r14,[i0,__ctypetab_29]
	and r14,#0x8
L19_29:
	pop fr,fr
	ret

//****************************************
// Function: _tolower
//****************************************

.func _tolower_29, 1, int
.line 192
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
.line 192
	call &_isupper_29
	ld r0,d0
	add r0,#0x20
	ld r1,#0x0
	jc ne,r14,r1,&L40_29
	ld r0,d0
L40_29:
	ld r14,r0
	pop rt,d0
	ret

//****************************************
// Function: ___gtdf2
//****************************************

.func ___gtdf2_30, 4, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\madmath.c'
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 74
	syscall 17
.line 75
	pop rt,fr
	ret

//****************************************
// Function: ___ltdf2
//****************************************

.func ___ltdf2_30, 4, int
.line 87
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 88
	syscall 17
.line 89
	pop rt,fr
	ret

//****************************************
// Function: ___eqdf2
//****************************************

.func ___eqdf2_30, 4, int
.line 101
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 102
	syscall 17
.line 103
	pop rt,fr
	ret

//****************************************
// Function: ___nedf2
//****************************************

.func ___nedf2_30, 4, int
.line 108
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 109
	syscall 17
.line 110
	pop rt,fr
	ret

//****************************************
// Function: _default_malloc_handler
//****************************************

.func _default_malloc_handler_31, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\maheap.c'
.line 36
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 41
	ld i1,&LC0_31
	syscall 3

//****************************************
// Function: _set_malloc_handler
//****************************************

.func _set_malloc_handler_31, 1, int
.line 44
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 45
	ld r14,[zr,_gMallocHandler_31]
.line 46
	ld [zr,_gMallocHandler_31],i0
.line 48
	pop fr,fr
	ret

//****************************************
// Function: _set_malloc_hook
//****************************************

.func _set_malloc_hook_31, 1, int
.line 50
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 51
	ld r14,[zr,_gMallocHook_31]
.line 52
	ld [zr,_gMallocHook_31],i0
.line 54
	pop fr,fr
	ret

//****************************************
// Function: _set_realloc_hook
//****************************************

.func _set_realloc_hook_31, 1, int
.line 56
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 57
	ld r14,[zr,_gReallocHook_31]
.line 58
	ld [zr,_gReallocHook_31],i0
.line 60
	pop fr,fr
	ret

//****************************************
// Function: _set_free_hook
//****************************************

.func _set_free_hook_31, 1, int
.line 62
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 63
	ld r14,[zr,_gFreeHook_31]
.line 64
	ld [zr,_gFreeHook_31],i0
.line 66
	pop fr,fr
	ret

//****************************************
// Function: _set_block_size_hook
//****************************************

.func _set_block_size_hook_31, 1, int
.line 68
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 69
	ld r14,[zr,_gBlockSizeHook_31]
.line 70
	ld [zr,_gBlockSizeHook_31],i0
.line 72
	pop fr,fr
	ret

//****************************************
// Function: _ansi_heap_init_crt0
//****************************************

.func _ansi_heap_init_crt0_31, 2, void
.line 94
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
.line 96
	ld i0,#0xe25769d0
	syscall 1
	ld r0,#0xe25769d0
	jc ne,r14,r0,&L13_31
.line 102
	ld [zr,_sHeapBase_31],d1
.line 104
	ld r14,#0x0
	jc le,d0,r14,&L7_31
.line 106
	ld i0,d0
	ld i1,d1
	call &_init_memory_pool_50
.line 107
	ld r0,#0x0
	jc lt,r14,r0,&L14_31
.line 110
	ld i0,&_tlsf_malloc_50
	call &_set_malloc_hook_31
.line 111
	ld i0,&_tlsf_free_50
	call &_set_free_hook_31
.line 112
	ld i0,&_tlsf_realloc_50
	call &_set_realloc_hook_31
.line 113
	ld i0,&_tlsf_block_size_50
	call &_set_block_size_hook_31
L7_31:
.line 116
	pop rt,d1
	ret
L13_31:
.line 97
	ld i0,#0x1
	ld i1,&LC1_31
.line 108
	syscall 3
L14_31:
	ld i0,#0x1
	ld i1,&LC2_31
	syscall 3

//****************************************
// Function: _malloc
//****************************************

.func _malloc_31, 1, int
.line 130
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
.line 139
	ld d0,[zr,_gMallocHook_31]
	call d0
.line 141
	ld r0,#0x0
	jc eq,r14,r0,&L20_31
L18_31:
.line 159
	ld r0,r14
L17_31:
.line 160
	ld r14,r0
	pop rt,d1
	ret
L20_31:
.line 143
	ld d0,[zr,_gMallocHandler_31]
	jc eq,d0,r14,&L17_31
.line 145
	ld i0,d1
	call d0
.line 146
	ld i0,d1
	ld d0,[zr,_gMallocHook_31]
	call d0
	jp &L18_31

//****************************************
// Function: _free
//****************************************

.func _free_31, 1, void
.line 186
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 189
	ld r14,#0x0
	jc eq,i0,r14,&L23_31
.line 199
	ld d0,[zr,_gFreeHook_31]
	call d0
L23_31:
.line 205
	pop rt,d0
	ret

//****************************************
// Function: _realloc
//****************************************

.func _realloc_31, 2, int
.line 210
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d2,i0
	ld d1,i1
.line 214
	ld d0,[zr,_gReallocHook_31]
	call d0
.line 215
	ld r0,#0x0
	jc eq,r14,r0,&L28_31
L26_31:
.line 222
	ld r0,r14
L25_31:
.line 223
	ld r14,r0
	pop rt,d2
	ret
L28_31:
.line 217
	ld d0,[zr,_gMallocHandler_31]
	jc eq,d0,r14,&L25_31
.line 219
	ld i0,d1
	call d0
.line 220
	ld i0,d2
	ld i1,d1
	ld d0,[zr,_gReallocHook_31]
	call d0
	jp &L26_31

//****************************************
// Function: _atoi
//****************************************

.func _atoi_33, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\mastdlib.c'
.line 32
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
.line 33
	ld d1,#0x0
.line 34
	ld d4,d1
.line 35
	ld d2,d1
.line 37
	ld.b r0,[i0]
	xb r14,r0
	ld r0,#0x2d
	jc eq,r14,r0,&L9_33
L3_33:
.line 48
	ld d0,d2
	add d0,d3
	ld.b r0,[d0]
	xb i0,r0
	call &_isdigit_29
	ld r0,#0x0
	jc eq,r14,r0,&L10_33
.line 45
	mul d1,#0xa
	ld.b d0,[d0]
	xb r14,d0
	add d1,r14
	add d1,#0xffffffd0
	add d2,#0x1
.line 47
	ld r14,#0xa
	jc le,d2,r14,&L3_33
.line 48
	ld i0,#0xfffffffa
	ld i1,&LC0_33
	syscall 3
L10_33:
.line 52
	neg r14,d1
.line 51
	jc ne,d4,r0,&L1_33
.line 54
	ld r14,d1
L1_33:
.line 55
	pop rt,d4
	ret
L9_33:
.line 39
	add d3,#0x1
.line 40
	ld d4,#0x1
	jp &L3_33

//****************************************
// Function: _srand
//****************************************

.func _srand_33, 1, void
.line 152
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 153
	ld [zr,_randStateX_33],i0
.line 154
	ld r14,#0x32378fc7
	ld [zr,_randStateY_33],r14
.line 155
	ld r14,#0xd55f8767
	ld [zr,_randStateZ_33],r14
.line 156
	ld r14,#0x104aa1ad
	ld [zr,_randStateW_33],r14
	pop fr,fr
	ret

//****************************************
// Function: _stricmp
//****************************************

.func _stricmp_34, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\mastring.c'
.line 143
	push fr,fr
	ld fr,sp
	add fr,#0x4
L81_34:
.line 148
	ld.b r15,[i0]
	ld r14,r15
	add r14,#0xffffffbf
	and r14,#0xff
	ld r1,r15
	add r1,#0x20
	ld r0,#0x19
	jc leu,r14,r0,&L85_34
	ld r1,r15
L85_34:
.line 149
	ld.b r15,[i1]
	ld r14,r15
	add r14,#0xffffffbf
	and r14,#0xff
	ld r0,r15
	add r0,#0x20
	ld r2,#0x19
	jc leu,r14,r2,&L87_34
	ld r0,r15
L87_34:
.line 150
	add i0,#0x1
.line 151
	add i1,#0x1
.line 152
	xb r14,r1
	ld r1,#0x0
	jc eq,r14,r1,&L88_34
	xb r15,r0
	jc eq,r14,r15,&L81_34
.line 155
	sub r14,r15
	pop fr,fr
	ret
L88_34:
	xb r15,r0
	sub r14,r15
	pop fr,fr
	ret

//****************************************
// Function: _strrchr
//****************************************

.func _strrchr_34, 2, int
.line 178
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 179
	ld r0,i0
L106_34:
.line 181
	ld.b r1,[i0]
	xb r14,r1
	add i0,#0x1
	ld r1,#0x0
	jc ne,r14,r1,&L106_34
	xb i1,i1
L109_34:
.line 182
	add i0,#0xffffffff
	jc eq,i0,r0,&L113_34
	ld.b r15,[i0]
	xb r14,r15
	jc ne,r14,i1,&L109_34
.line 183
	xb r14,r15
	jc ne,r14,i1,&L114_34
L105_34:
.line 186
	ld r14,i0
	pop fr,fr
	ret
L113_34:
	ld.b r15,[i0]
.line 183
	xb r14,r15
	jc eq,r14,i1,&L105_34
L114_34:
.line 185
	ld i0,#0x0
.line 186
	ld r14,i0
	pop fr,fr
	ret

//****************************************
// Function: _strlen
//****************************************

.func _strlen_34, 1, int
.line 542
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 543
	ld r15,i0
L230_34:
.line 544
	ld.b r0,[r15]
	xb r14,r0
	add r15,#0x1
	ld r0,#0x0
	jc ne,r14,r0,&L230_34
.line 545
	sub r15,i0
.line 546
	ld r14,r15
	add r14,#0xffffffff
	pop fr,fr
	ret

//****************************************
// Function: _strnlen
//****************************************

.func _strnlen_34, 2, int
.line 577
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 579
	ld r15,i0
	ld.b r0,[i0]
	xb r14,r0
	ld r0,#0x0
	jc eq,r14,r0,&L344_34
L348_34:
	add i1,#0xffffffff
	ld r14,#0xffffffff
	jc eq,i1,r14,&L344_34
	add r15,#0x1
	ld.b r0,[r15]
	xb r14,r0
	ld r0,#0x0
	jc ne,r14,r0,&L348_34
L344_34:
.line 581
	ld r14,r15
	sub r14,i0
	pop fr,fr
	ret

//****************************************
// Function: _cvt
//****************************************

.func _cvt_37, 7, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\mavsprintf.c'
.line 55
	push rt,d7
	sub sp,#0x18
	ld fr,sp
	add fr,#0x40
	ld d3,i0
	ld d4,i1
	ld [fr,-60],i2
	ld [fr,-64],i3
	ld d0,[fr]
.line 60
	ld r0,#0x0
	jc lt,i2,r0,&L46_37
.line 61
	ld r1,[fr,-60]
	ld r14,#0x4e
	jc gt,r1,r14,&L47_37
L3_37:
.line 62
	ld d6,#0x0
.line 64
	ld d5,[fr,4]
.line 65
	ld i2,#0
	ld i3,#0
	call &___ltdf2_30
	jc lt,r14,d6,&L48_37
L41_37:
	ld r1,#0x0
	ld [d0],r1
.line 70
	ld i0,d3
	ld i1,d4
	ld i2,fr
	add i2,#0xffffffd0
	call &_modf_41
	ld d3,r14
	ld d4,r15
.line 71
	ld d2,[fr,4]
	add d2,#0x50
	ld d7,d2
.line 73
	ld d0,[fr,-48]
	ld d1,[fr,-44]
	ld i0,d0
	ld i1,d1
	ld i2,#0
	ld i3,#0
	call &___nedf2_30
	ld r0,#0x0
	jc eq,r14,r0,&L6_37
	jp &L8_37
L12_37:
.line 78
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	ld i3,#0x40240000
	syscall 11
	ld i0,r14
	ld i1,r15
	ld i2,fr
	add i2,#0xffffffd0
	call &_modf_41
	ld d0,r14
	ld d1,r15
	ld [fr,-56],r14
	ld [fr,-52],r15
.line 79
	add d2,#0xffffffff
	ld i0,r14
	ld i1,r15
	ld i2,#0xeb851eb8
	ld i3,#0x3f9eb851
	syscall 8
	ld i0,r14
	ld i1,r15
	ld i2,#0x0
	ld i3,#0x40240000
	syscall 10
	ld i0,r14
	ld i1,r15
	syscall 13
	add r14,#0x30
	ld.b [d2],r14
.line 80
	add d6,#0x1
.line 85
	ld r1,#0x4f
	jc gt,d6,r1,&L9_37
	ld d0,[fr,-48]
	ld d1,[fr,-44]
L8_37:
	ld i0,d0
	ld i1,d1
	ld i2,#0
	ld i3,#0
	call &___nedf2_30
	ld r0,#0x0
	jc ne,r14,r0,&L12_37
L9_37:
.line 87
	jc leu,d7,d2,&L16_37
	ld.b r14,[d2]
	add d2,#0x1
	ld.b [d5],r14
	add d5,#0x1
	jp &L9_37
L47_37:
.line 61
	ld [fr,-60],r14
.line 62
	ld d6,#0x0
.line 64
	ld d5,[fr,4]
.line 65
	ld i2,#0
	ld i3,#0
	call &___ltdf2_30
	jc ge,r14,d6,&L41_37
L48_37:
.line 67
	ld r0,#0x1
	ld [d0],r0
.line 68
	ld r14,d3
	ld r15,d4
	xor r15,#0x80000000
	ld d3,r14
	ld d4,r15
.line 70
	ld i0,d3
	ld i1,d4
	ld i2,fr
	add i2,#0xffffffd0
	call &_modf_41
	ld d3,r14
	ld d4,r15
.line 71
	ld d2,[fr,4]
	add d2,#0x50
	ld d7,d2
.line 73
	ld d0,[fr,-48]
	ld d1,[fr,-44]
	ld i0,d0
	ld i1,d1
	ld i2,#0
	ld i3,#0
	call &___nedf2_30
	ld r0,#0x0
	jc ne,r14,r0,&L8_37
L6_37:
.line 89
	ld i0,d3
	ld i1,d4
	ld i2,#0
	ld i3,#0
	call &___gtdf2_30
	ld r1,#0x0
	jc gt,r14,r1,&L19_37
	jp &L16_37
L22_37:
.line 93
	ld d3,d0
	ld d4,d1
.line 94
	add d6,#0xffffffff
L19_37:
	ld i0,d3
	ld i1,d4
	ld i2,#0x0
	ld i3,#0x40240000
	syscall 10
	ld d0,r14
	ld d1,r15
	ld i0,r14
	ld i1,r15
	ld i2,#0x0
	ld i3,#0x3ff00000
	call &___ltdf2_30
	ld r0,#0x0
	jc lt,r14,r0,&L22_37
	ld [fr,-56],d0
	ld [fr,-52],d1
L16_37:
.line 97
	ld d2,[fr,4]
	ld r1,[fr,-60]
	add d2,r1
.line 98
	ld r14,[fr,8]
	ld r0,#0x0
	jc ne,r14,r0,&L23_37
	add d2,d6
L23_37:
.line 99
	ld r1,[fr,-64]
	ld [r1],d6
.line 100
	ld r14,[fr,4]
	jc geu,d2,r14,&L44_37
.line 102
	ld r0,#0x0
	ld.b [r14],r0
.line 136
	ld r14,[fr,4]
	add sp,#0x18
	pop rt,d7
	ret
L46_37:
.line 60
	ld [fr,-60],r0
	jp &L3_37
L44_37:
.line 109
	jc gtu,d5,d2,&L26_37
L43_37:
	jc leu,d7,d5,&L26_37
.line 107
	ld i0,d3
	ld i1,d4
	ld i2,#0x0
	ld i3,#0x40240000
	syscall 10
.line 108
	ld i0,r14
	ld i1,r15
	ld i2,fr
	add i2,#0xffffffc8
	call &_modf_41
	ld d3,r14
	ld d4,r15
.line 109
	ld i0,[fr,-56]
	ld i1,[fr,-52]
	syscall 13
	add r14,#0x30
	ld.b [d5],r14
	add d5,#0x1
	jc leu,d5,d2,&L43_37
L26_37:
.line 111
	jc gtu,d7,d2,&L28_37
.line 113
	ld r14,#0x0
	ld r1,[fr,4]
	ld.b [r1,79],r14
.line 136
	ld r14,[fr,4]
	add sp,#0x18
	pop rt,d7
	ret
L28_37:
.line 116
	ld d5,d2
.line 117
	ld.b r0,[d2]
	add r0,#0x5
.line 130
	xb r14,r0
	ld r1,#0x39
	jc le,r14,r1,&L42_37
L35_37:
.line 121
	ld r14,[fr,4]
	jc leu,d2,r14,&L31_37
	ld r0,#0x30
	ld.b [d2],r0
.line 122
	add d2,#0xffffffff
	ld.b r14,[d2]
	add r14,#0x1
	ld.b [d2],r14
L29_37:
.line 130
	ld.b r0,[d2]
	xb r14,r0
	ld r1,#0x39
	jc gt,r14,r1,&L35_37
.line 134
	ld r14,#0x0
	ld.b [d5],r14
L49_37:
.line 136
	ld r14,[fr,4]
	add sp,#0x18
	pop rt,d7
	ret
L42_37:
	ld.b [d2],r0
.line 134
	ld r14,#0x0
	ld.b [d5],r14
	jp &L49_37
L31_37:
.line 125
	ld r1,#0x31
	ld.b [d2],r1
.line 126
	ld r0,[fr,-64]
	ld r14,[r0]
	add r14,#0x1
	ld [r0],r14
.line 127
	ld r1,[fr,8]
	ld r14,#0x0
	jc ne,r1,r14,&L29_37
.line 129
	ld r0,[fr,4]
	jc leu,d5,r0,&L34_37
	ld r1,#0x30
	ld.b [d5],r1
L34_37:
.line 130
	add d5,#0x1
	jp &L29_37

//****************************************
// Function: _ecvtbuf
//****************************************

.func _ecvtbuf_37, 6, int
.line 145
	push rt,fr
	sub sp,#0xc
	ld fr,sp
	add fr,#0x14
.line 146
	ld r14,[fr]
	ld [sp],r14
	ld r14,[fr,4]
	ld [sp,4],r14
	ld r14,#0x1
	ld [sp,8],r14
	call &_cvt_37
.line 147
	add sp,#0xc
	pop rt,fr
	ret

//****************************************
// Function: _skip_atoi
//****************************************

.func _skip_atoi_37, 1, int
.line 184
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 185
	ld r0,#0x0
.line 186
	ld r15,[i0]
	jp &L57_37
L58_37:
	mul r0,#0xa
	ld.b r1,[r15]
	xb r14,r1
	add r0,r14
	add r0,#0xffffffd0
	ld r14,r15
	add r14,#0x1
	ld [i0],r14
	ld r15,r14
L57_37:
	ld.b r14,[r15]
	add r14,#0xffffffd0
	and r14,#0xff
	ld r1,#0x9
	jc leu,r14,r1,&L58_37
.line 188
	ld r14,r0
	pop fr,fr
	ret

//****************************************
// Function: _number
//****************************************

.func _number_37, 6, int
.line 191
	push fr,fr
	sub sp,#0x44
	ld fr,sp
	add fr,#0x48
	ld r2,[fr]
	ld r3,[fr,4]
.line 193
	ld r4,[zr,_digits_37]
.line 196
	ld r14,r3
	and r14,#0x40
	ld r0,#0x0
	jc eq,r14,r0,&L60_37
	ld r4,[zr,_upper_digits_37]
L60_37:
.line 197
	ld r14,r3
	and r14,#0x10
	ld r1,#0x0
	jc eq,r14,r1,&L61_37
	and r3,#0xfffffffe
L61_37:
.line 198
	ld r14,i2
	add r14,#0xfffffffe
	ld r0,#0x0
	ld r1,#0x22
	jc gtu,r14,r1,&L59_37
.line 200
	ld r14,r3
	and r14,#0x1
	ld r7,#0x30
	jc eq,r14,r0,&L116_37
L64_37:
.line 201
	ld r6,#0x0
.line 202
	ld r14,r3
	and r14,#0x2
	ld r0,#0x0
	jc eq,r14,r0,&L65_37
.line 204
	jc lt,i1,r0,&L117_37
.line 210
	ld r0,r3
	and r0,#0x4
	ld r1,#0x0
	jc ne,r0,r1,&L118_37
.line 215
	ld r14,r3
	and r14,#0x8
	jc eq,r14,r0,&L65_37
.line 217
	ld r6,#0x20
.line 218
	add i3,#0xffffffff
L65_37:
.line 222
	ld r5,r3
	and r5,#0x20
	ld r14,#0x0
	jc eq,r5,r14,&L71_37
.line 224
	ld r0,#0x10
	jc eq,i2,r0,&L119_37
.line 226
	ld r1,#0x8
	jc eq,i2,r1,&L120_37
L71_37:
.line 230
	ld r15,#0x0
.line 232
	jc ne,i1,r15,&L79_37
.line 233
	ld r14,#0x30
	ld.b [fr,-72],r14
	ld r15,#0x1
L76_37:
.line 243
	jc le,r15,r2,&L80_37
	ld r2,r15
L80_37:
.line 244
	sub i3,r2
.line 245
	ld r0,r3
	and r0,#0x11
	ld r14,#0x0
	jc ne,r0,r14,&L81_37
	ld r14,i3
	add i3,#0xffffffff
	jc le,r14,r0,&L81_37
L84_37:
	ld r0,#0x20
	ld.b [i0],r0
	add i0,#0x1
	ld r14,i3
	add i3,#0xffffffff
	ld r1,#0x0
	jc gt,r14,r1,&L84_37
L81_37:
.line 246
	xb r14,r6
	ld r0,#0x0
	jc eq,r14,r0,&L85_37
	ld.b [i0],r6
	add i0,#0x1
L85_37:
.line 248
	ld r1,#0x0
	jc eq,r5,r1,&L86_37
.line 250
	ld r14,#0x8
	jc eq,i2,r14,&L121_37
.line 252
	ld r1,#0x10
	jc eq,i2,r1,&L122_37
L86_37:
.line 259
	ld r0,r3
	and r0,#0x10
	ld r1,#0x0
	jc ne,r0,r1,&L90_37
	ld r14,i3
	add i3,#0xffffffff
L114_37:
	jc le,r14,r0,&L90_37
	ld.b [i0],r7
	add i0,#0x1
	ld r14,i3
	add i3,#0xffffffff
	ld r0,#0x0
	jp &L114_37
L116_37:
.line 200
	ld r7,#0x20
	jp &L64_37
L123_37:
.line 262
	ld r1,#0x20
	ld.b [i0],r1
	add i0,#0x1
L109_37:
	ld r14,i3
	add i3,#0xffffffff
	ld r0,#0x0
	jc gt,r14,r0,&L123_37
.line 264
	ld r0,i0
L59_37:
.line 265
	ld r14,r0
	add sp,#0x44
	pop fr,fr
	ret
L79_37:
.line 238
	ld r1,#0xfffffffc
	add r1,fr
	add r1,r15
	ld r0,i1
	divu r0,i2
	ld r14,r0
	mul r14,i2
	sub i1,r14
	add i1,r4
	ld.b i1,[i1]
	ld.b [r1,-68],i1
	add r15,#0x1
.line 239
	ld i1,r0
	ld r1,#0x0
	jc eq,r0,r1,&L76_37
.line 238
	ld r1,#0xfffffffc
	add r1,fr
	add r1,r15
	ld r0,i1
	divu r0,i2
	ld r14,r0
	mul r14,i2
	sub i1,r14
	add i1,r4
	ld.b i1,[i1]
	ld.b [r1,-68],i1
	add r15,#0x1
.line 239
	ld i1,r0
	ld r1,#0x0
	jc ne,r0,r1,&L79_37
	jp &L76_37
L124_37:
.line 260
	ld r1,#0x30
	ld.b [i0],r1
	add i0,#0x1
L90_37:
	ld r14,r2
	add r2,#0xffffffff
	jc gt,r14,r15,&L124_37
.line 261
	ld r14,r15
	add r15,#0xffffffff
	ld r0,#0x0
	jc le,r14,r0,&L109_37
L99_37:
	ld r14,#0xfffffffc
	add r14,fr
	add r14,r15
	ld.b r14,[r14,-68]
	ld.b [i0],r14
	add i0,#0x1
	ld r14,r15
	add r15,#0xffffffff
	ld r1,#0x0
	jc gt,r14,r1,&L99_37
	jp &L109_37
L118_37:
.line 212
	ld r6,#0x2b
.line 218
	add i3,#0xffffffff
	jp &L65_37
L120_37:
.line 227
	add i3,#0xffffffff
	jp &L71_37
L121_37:
.line 251
	ld r0,#0x30
	ld.b [i0],r0
.line 255
	add i0,#0x1
	jp &L86_37
L119_37:
.line 225
	add i3,#0xfffffffe
	jp &L71_37
L117_37:
.line 206
	ld r6,#0x2d
.line 207
	neg i1,i1
.line 218
	add i3,#0xffffffff
	jp &L65_37
L122_37:
.line 254
	ld r14,#0x30
	ld.b [i0],r14
	add i0,#0x1
.line 255
	ld r14,[zr,_digits_37]
	ld.b r14,[r14,33]
	ld.b [i0],r14
	add i0,#0x1
	jp &L86_37

//****************************************
// Function: _vsprintf
//****************************************

.func _vsprintf_37, 3, int
.line 544
	push rt,d7
	sub sp,#0xf0
	ld fr,sp
	add fr,#0x118
	ld d7,i0
	ld [fr,-228],i1
	ld d4,i2
.line 558
	ld d0,i0
	ld.b r0,[i1]
	xb r14,r0
	ld r1,#0x0
	jc eq,r14,r1,&L363_37
L442_37:
.line 560
	xb r14,r0
	ld r2,#0x25
	jc eq,r14,r2,&L441_37
.line 718
	ld.b [d0],r0
	add d0,#0x1
L436_37:
	ld i1,[fr,-228]
L128_37:
.line 558
	ld r14,i1
	add r14,#0x1
	ld [fr,-228],r14
	ld i1,r14
	ld.b r0,[i1]
	xb r14,r0
	ld r1,#0x0
	jc ne,r14,r1,&L442_37
L363_37:
.line 741
	ld r2,#0x0
	ld.b [d0],r2
.line 743
	ld r14,d0
	sub r14,d7
	add sp,#0xf0
	pop rt,d7
	ret
L441_37:
.line 567
	ld d2,#0x0
L130_37:
.line 569
	add i1,#0x1
	ld [fr,-228],i1
.line 570
	ld.b r3,[i1]
	xb r14,r3
	case r14,#0x20,#0x10,#L137_37,#L131_37
.data
	.align 4
L137_37:
	.word L134_37
	.word L131_37
	.word L131_37
	.word L135_37
	.word L131_37
	.word L131_37
	.word L131_37
	.word L131_37
	.word L131_37
	.word L131_37
	.word L131_37
	.word L133_37
	.word L131_37
	.word L132_37
	.word L131_37
	.word L131_37
	.word L136_37


.code
L136_37:
.line 576
	or d2,#0x1
	jp &L130_37
L131_37:
.line 580
	ld d3,#0xffffffff
.line 581
	ld.b r0,[i1]
	ld r14,r0
	add r14,#0xffffffd0
	and r14,#0xff
	ld r1,#0x9
	jc leu,r14,r1,&L443_37
.line 583
	xb r14,r0
	ld r2,#0x2a
	jc eq,r14,r2,&L444_37
L139_37:
.line 595
	ld d5,#0xffffffff
.line 596
	ld.b r0,[i1]
	xb r14,r0
	ld r1,#0x2e
	jc eq,r14,r1,&L445_37
L142_37:
.line 610
	ld r0,#0xffffffff
.line 611
	ld.b r1,[i1]
	xb r14,r1
	ld r2,#0x68
	jc eq,r14,r2,&L148_37
	ld r3,#0x6c
	jc eq,r14,r3,&L148_37
	ld r1,#0x4c
	jc eq,r14,r1,&L148_37
.line 618
	ld i2,#0xa
.line 620
	ld.b r3,[i1]
	xb r14,r3
	ld r1,#0x7a
	jc eq,r14,r1,&L150_37
L446_37:
	ld r2,#0x5a
	jc eq,r14,r2,&L150_37
L149_37:
.line 623
	ld.b r3,[i1]
	xb r14,r3
	case r14,#0x41,#0x37,#L352_37,#L348_37
.data
	.align 4
L352_37:
	.word L191_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L245_37
	.word L348_37
	.word L245_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L173_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L236_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L192_37
	.word L348_37
	.word L152_37
	.word L239_37
	.word L245_37
	.word L245_37
	.word L245_37
	.word L348_37
	.word L239_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L348_37
	.word L188_37
	.word L235_37
	.word L186_37
	.word L348_37
	.word L348_37
	.word L160_37
	.word L348_37
	.word L151_37
	.word L348_37
	.word L348_37
	.word L237_37


.code
L132_37:
.line 572
	or d2,#0x10
	jp &L130_37
L135_37:
.line 575
	or d2,#0x20
	jp &L130_37
L134_37:
.line 574
	or d2,#0x8
	jp &L130_37
L133_37:
.line 573
	or d2,#0x4
	jp &L130_37
L148_37:
.line 613
	ld.b r2,[i1]
	xb r0,r2
.line 614
	add i1,#0x1
	ld [fr,-228],i1
.line 618
	ld i2,#0xa
.line 620
	ld.b r3,[i1]
	xb r14,r3
	ld r1,#0x7a
	jc ne,r14,r1,&L446_37
L150_37:
.line 621
	add i1,#0x1
	ld [fr,-228],i1
	jp &L149_37
L443_37:
.line 582
	ld i0,fr
	add i0,#0xffffff1c
	call &_skip_atoi_37
	ld d3,r14
	ld i1,[fr,-228]
.line 595
	ld d5,#0xffffffff
.line 596
	ld.b r0,[i1]
	xb r14,r0
	ld r1,#0x2e
	jc ne,r14,r1,&L142_37
L445_37:
.line 598
	add i1,#0x1
	ld [fr,-228],i1
.line 599
	ld.b r0,[i1]
	ld r14,r0
	add r14,#0xffffffd0
	and r14,#0xff
	ld r2,#0x9
	jc leu,r14,r2,&L447_37
.line 601
	xb r14,r0
	ld r3,#0x2a
	jc eq,r14,r3,&L448_37
.line 606
	ld d5,#0x0
	jp &L142_37
L448_37:
.line 603
	add i1,#0x1
	ld [fr,-228],i1
.line 604
	ld r14,d4
	add d4,#0x4
	ld d5,[r14]
.line 606
	ld r14,#0x0
	jc ge,d5,r14,&L142_37
L449_37:
	ld d5,#0x0
	jp &L142_37
L444_37:
.line 585
	add i1,#0x1
	ld [fr,-228],i1
.line 586
	ld r14,d4
	add d4,#0x4
	ld d3,[r14]
.line 587
	ld r3,#0x0
	jc ge,d3,r3,&L139_37
.line 589
	neg d3,d3
.line 590
	or d2,#0x10
	jp &L139_37
L447_37:
.line 600
	ld i0,fr
	add i0,#0xffffff1c
	call &_skip_atoi_37
	ld d5,r14
	ld i1,[fr,-228]
.line 606
	ld r14,#0x0
	jc ge,d5,r14,&L142_37
	jp &L449_37
L239_37:
.line 695
	or d2,#0x2
L151_37:
.line 736
	ld r14,d4
	add d4,#0x4
	ld i1,[r14]
.line 738
	ld [sp],d5
	ld [sp,4],d2
	ld i0,d0
L438_37:
	ld i3,d3
	call &_number_37
	ld d0,r14
	jp &L436_37
L191_37:
.line 672
	or d2,#0x40
L192_37:
.line 675
	ld r2,#0x6c
	jc eq,r0,r2,&L450_37
LBB2_37:
.line 290
	ld i0,d0
	ld r14,d4
	add d4,#0x4
	ld r7,[r14]
	ld r4,d3
LBB3_37:
.line 294
	ld r5,#0x0
.line 295
	ld r3,r5
	ld r6,[zr,_digits_37]
L222_37:
.line 297
	ld r1,#0x0
	jc eq,r3,r1,&L216_37
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r5
	ld r2,#0x2e
	ld.b [r14,-24],r2
	add r5,#0x1
L216_37:
.line 298
	ld r14,r3
	add r14,r7
	ld.b r2,[r14]
	and r2,#0xff
.line 300
	ld r14,#0x0
	jc ne,r2,r14,&L217_37
.line 301
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r5
	ld.b r0,[r6]
	ld.b [r14,-24],r0
L427_37:
.line 317
	add r5,#0x1
.line 295
	add r3,#0x1
	ld r0,#0x3
	jc le,r3,r0,&L222_37
.line 321
	ld r14,d2
	and r14,#0x10
	ld r1,#0x0
	jc ne,r14,r1,&L223_37
	ld r4,d3
	add r4,#0xffffffff
	jc le,d3,r5,&L223_37
L226_37:
	ld r2,#0x20
	ld.b [i0],r2
	add i0,#0x1
	ld r14,r4
	add r4,#0xffffffff
	jc gt,r14,r5,&L226_37
L223_37:
.line 322
	ld r3,#0x0
L428_37:
	jc le,r5,r3,&L388_37
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r3
	ld.b r14,[r14,-24]
	ld.b [i0],r14
	add i0,#0x1
	add r3,#0x1
	jp &L428_37
L236_37:
.line 687
	or d2,#0x40
L237_37:
.line 690
	ld i2,#0x10
	jp &L151_37
L186_37:
.line 650
	ld r0,#0xffffffff
	jc eq,d3,r0,&L451_37
L187_37:
.line 655
	ld r14,d4
	add d4,#0x4
	ld [sp],d5
	ld [sp,4],d2
	ld i0,d0
	ld i1,[r14]
	ld i2,#0x10
	jp &L438_37
L235_37:
.line 683
	ld i2,#0x8
	jp &L151_37
L188_37:
.line 666
	ld r14,d4
	add d4,#0x4
	ld r0,[r14]
.line 667
	ld r14,d0
	sub r14,d7
	ld [r0],r14
	jp &L128_37
L160_37:
.line 632
	ld r14,d4
	add d4,#0x4
	ld d1,[r14]
.line 633
	ld r1,#0x0
	jc eq,d1,r1,&L452_37
L161_37:
.line 634
	ld i0,d1
	ld i1,d5
	call &_strnlen_34
	ld r1,r14
.line 635
	ld r14,d2
	and r14,#0x10
	ld r2,#0x0
	jc ne,r14,r2,&L162_37
	jp &L422_37
L453_37:
	ld r3,#0x20
	ld.b [d0],r3
	add d0,#0x1
L422_37:
	ld r14,d3
	add d3,#0xffffffff
	jc gt,r14,r1,&L453_37
L162_37:
.line 636
	ld r0,#0x0
L423_37:
	jc le,r1,r0,&L369_37
	ld.b r14,[d1]
	add d1,#0x1
	ld.b [d0],r14
	add d0,#0x1
	add r0,#0x1
	jp &L423_37
L173_37:
.line 641
	ld r14,d4
	add d4,#0x4
	ld d1,[r14]
.line 642
	ld r0,#0x0
	jc eq,d1,r0,&L454_37
L174_37:
.line 643
	ld i0,d1
	ld i1,d5
	call &_wcsnlen_38
	ld r1,r14
.line 644
	ld r14,d2
	and r14,#0x10
	ld r2,#0x0
	jc ne,r14,r2,&L175_37
	jp &L424_37
L455_37:
	ld r3,#0x20
	ld.b [d0],r3
	add d0,#0x1
L424_37:
	ld r14,d3
	add d3,#0xffffffff
	jc gt,r14,r1,&L455_37
L175_37:
.line 645
	ld r0,#0x0
L425_37:
	jc le,r1,r0,&L374_37
	ld.h r14,[d1]
	add d1,#0x2
	ld.b [d0],r14
	add d0,#0x1
	add r0,#0x1
	jp &L425_37
L245_37:
.line 483
	ld r14,d4
	add d4,#0x8
	ld r0,[r14]
	ld r1,[r14,4]
	ld [fr,-244],r0
	ld [fr,-240],r1
	ld d1,d3
	ld [fr,-248],d5
	ld.b d6,[i1]
	or d2,#0x2
	ld [fr,-252],d2
LBB6_37:
.line 489
	ld r1,d2
	and r1,#0x10
	ld [fr,-268],r1
	ld r2,#0x0
	jc eq,r1,r2,&L246_37
	ld r3,d2
	and r3,#0xfffffffe
	ld [fr,-252],r3
	and r3,#0x10
	ld [fr,-268],r3
L246_37:
.line 492
	ld r14,[fr,-252]
	and r14,#0x1
	ld r0,#0x30
	ld.b [fr,-253],r0
	ld r1,#0x0
	jc ne,r14,r1,&L248_37
	ld r2,#0x20
	ld.b [fr,-253],r2
L248_37:
.line 493
	ld r3,#0x0
	ld.b [fr,-254],r3
.line 494
	ld r14,[fr,-252]
	and r14,#0x2
	ld r0,#0x0
	jc eq,r14,r0,&L249_37
.line 496
	ld i0,[fr,-244]
	ld i1,[fr,-240]
	ld i2,#0
	ld i3,#0
	call &___ltdf2_30
	ld r1,#0x0
	jc lt,r14,r1,&L456_37
.line 502
	ld r0,[fr,-252]
	and r0,#0x4
	ld r3,#0x0
	jc eq,r0,r3,&L253_37
.line 504
	ld r14,#0x2b
	ld.b [fr,-254],r14
.line 510
	ld d1,d3
	add d1,#0xffffffff
L249_37:
.line 515
	ld r1,#0x0
	jc lt,d5,r1,&L457_37
	xb r14,d6
	ld [fr,-264],r14
.line 517
	ld r0,#0x0
	jc ne,d5,r0,&L257_37
	ld r2,#0x67
	jc eq,r14,r2,&L458_37
L257_37:
.line 334
	ld d5,fr
	add d5,#0xffffff70
	ld d3,d5
	ld r14,d6
	ld d2,[fr,-248]
LBB8_37:
.line 338
	ld r0,#0x0
	ld [fr,-260],r0
.line 341
	ld r1,[fr,-264]
	ld r2,#0x47
	jc eq,r1,r2,&L260_37
	ld r3,#0x45
	jc eq,r1,r3,&L260_37
L259_37:
.line 347
	xb r14,r14
	ld r0,#0x67
	jc eq,r14,r0,&L459_37
.line 363
	ld r2,#0x65
	jc eq,r14,r2,&L415_37
.line 401
	ld r1,#0x66
	jc eq,r14,r1,&L417_37
L277_37:
.line 437
	ld r14,#0x0
	ld.b [d3],r14
LBE8_37:
.line 524
	ld d3,[fr,-252]
	and d3,#0x20
	ld r0,#0x0
	jc eq,d3,r0,&L302_37
	ld r1,[fr,-248]
	jc ne,r1,r0,&L302_37
LBB9_37:
.line 441
	ld d2,d5
LBB10_37:
.line 446
	ld.b r0,[d5]
	xb r14,r0
	jc eq,r14,r1,&L304_37
L309_37:
.line 444
	ld r2,#0x2e
	jc eq,r14,r2,&L302_37
.line 445
	ld r3,#0x65
	jc eq,r14,r3,&L304_37
	ld r1,#0x45
	jc eq,r14,r1,&L304_37
.line 446
	add d2,#0x1
	ld.b r0,[d2]
	xb r14,r0
	ld r2,#0x0
	jc ne,r14,r2,&L309_37
L304_37:
.line 449
	xb r14,r0
	ld r3,#0x0
	jc eq,r14,r3,&L310_37
LBB11_37:
.line 451
	ld i0,d2
	call &_strlen_34
	ld r0,r14
.line 455
	ld r14,#0x0
	jc le,r0,r14,&L400_37
L313_37:
.line 454
	ld r14,d2
	add r14,r0
	ld.b r1,[r14]
	ld.b [r14,1],r1
.line 455
	add r0,#0xffffffff
	ld r2,#0x0
	jc gt,r0,r2,&L313_37
L400_37:
.line 458
	ld r3,#0x2e
	ld.b [d2],r3
L302_37:
.line 527
	ld r1,[fr,-264]
	ld r2,#0x67
	jc eq,r1,r2,&L460_37
L315_37:
.line 529
	ld i0,d5
	call &_strlen_34
	ld r1,r14
.line 532
	sub d1,r14
.line 533
	ld r0,[fr,-252]
	and r0,#0x11
	ld r2,#0x0
	jc ne,r0,r2,&L331_37
	ld r14,d1
	add d1,#0xffffffff
L434_37:
	jc le,r14,r0,&L331_37
	ld r3,#0x20
	ld.b [d0],r3
	add d0,#0x1
	ld r14,d1
	add d1,#0xffffffff
	ld r0,#0x0
	jp &L434_37
L152_37:
.line 626
	ld r14,d2
	and r14,#0x10
	ld r0,#0x0
	jc ne,r14,r0,&L153_37
	add d3,#0xffffffff
	jc le,d3,r14,&L153_37
L156_37:
	ld r1,#0x20
	ld.b [d0],r1
	add d0,#0x1
	add d3,#0xffffffff
	ld r2,#0x0
	jc gt,d3,r2,&L156_37
L153_37:
.line 627
	ld r14,d4
	add d4,#0x4
	ld.b r14,[r14]
	ld.b [d0],r14
	add d0,#0x1
.line 628
	add d3,#0xffffffff
	ld r3,#0x0
	jc le,d3,r3,&L436_37
L159_37:
	ld r14,#0x20
	ld.b [d0],r14
	add d0,#0x1
	add d3,#0xffffffff
	ld r0,#0x0
	jc gt,d3,r0,&L159_37
	jp &L436_37
L348_37:
.line 716
	ld.b r0,[i1]
	xb r14,r0
	ld r1,#0x25
	jc eq,r14,r1,&L349_37
	ld r2,#0x25
	ld.b [d0],r2
	add d0,#0x1
	ld i1,[fr,-228]
L349_37:
.line 717
	ld.b r0,[i1]
	xb r14,r0
.line 720
	add i1,#0xffffffff
.line 717
	ld r3,#0x0
	jc eq,r14,r3,&L128_37
.line 718
	ld.b [d0],r0
	add d0,#0x1
	jp &L436_37
L461_37:
.line 637
	ld r14,#0x20
	ld.b [d0],r14
	add d0,#0x1
L369_37:
	ld r14,d3
	add d3,#0xffffffff
	jc gt,r14,r1,&L461_37
	jp &L436_37
L462_37:
.line 646
	ld r14,#0x20
	ld.b [d0],r14
	add d0,#0x1
L374_37:
	ld r14,d3
	add d3,#0xffffffff
	jc gt,r14,r1,&L462_37
	jp &L436_37
L463_37:
.line 323
	ld r3,#0x20
	ld.b [i0],r3
	add i0,#0x1
L388_37:
	ld r14,r4
	add r4,#0xffffffff
	jc gt,r14,r5,&L463_37
LBE13_37:
.line 290
	ld d0,i0
	jp &L436_37
L217_37:
.line 304
	ld r1,#0x63
	jc le,r2,r1,&L219_37
.line 306
	ld r1,#0xffffffd8
	add r1,fr
	add r1,r5
	ld r14,r2
	div r14,#0x64
	ld r0,r6
	add r0,r14
	ld.b r0,[r0]
	ld.b [r1,-24],r0
	add r5,#0x1
.line 307
	mul r14,#0x64
	sub r2,r14
.line 308
	ld r1,#0xffffffd8
	add r1,fr
	add r1,r5
	ld r14,r2
	div r14,#0xa
	ld r0,r6
	add r0,r14
	ld.b r0,[r0]
	ld.b [r1,-24],r0
	add r5,#0x1
.line 309
	mul r14,#0xa
	sub r2,r14
L220_37:
.line 317
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r5
	add r2,r6
	ld.b r2,[r2]
	ld.b [r14,-24],r2
	jp &L427_37
L219_37:
.line 311
	ld r14,#0x9
	jc le,r2,r14,&L220_37
.line 313
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r5
	ld r0,r2
	div r0,#0xa
	ld r1,r6
	add r1,r0
	ld.b r1,[r1]
	ld.b [r14,-24],r1
	add r5,#0x1
.line 314
	mul r0,#0xa
	sub r2,r0
	jp &L220_37
L331_37:
.line 534
	ld.b r2,[fr,-254]
	xb r14,r2
	ld r3,#0x0
	jc eq,r14,r3,&L335_37
	ld.b [d0],r2
	add d0,#0x1
L335_37:
.line 535
	ld r14,[fr,-268]
	ld r0,#0x0
	jc ne,r14,r0,&L336_37
	ld r14,d1
	add d1,#0xffffffff
	ld r2,[fr,-268]
	jc le,r14,r2,&L336_37
L339_37:
	ld.b r3,[fr,-253]
	ld.b [d0],r3
	add d0,#0x1
	ld r14,d1
	add d1,#0xffffffff
	ld r0,#0x0
	jc gt,r14,r0,&L339_37
L336_37:
.line 536
	ld r0,#0x0
	jc le,r1,r0,&L408_37
L464_37:
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r0
	ld.b r14,[r14,-104]
	ld.b [d0],r14
	add d0,#0x1
	add r0,#0x1
	jc gt,r1,r0,&L464_37
L408_37:
.line 537
	ld r14,d1
	add d1,#0xffffffff
	ld r1,#0x0
	jc le,r14,r1,&L436_37
L346_37:
	ld r2,#0x20
	ld.b [d0],r2
	add d0,#0x1
	ld r14,d1
	add d1,#0xffffffff
	ld r3,#0x0
	jc gt,r14,r3,&L346_37
	jp &L436_37
L450_37:
.line 268
	ld i0,d0
	ld r14,d4
	add d4,#0x4
	ld r6,[r14]
	ld r4,d3
LBB19_37:
.line 270
	ld r5,[zr,_digits_37]
.line 273
	ld r14,d2
	and r14,#0x40
	ld r3,#0x0
	jc eq,r14,r3,&L194_37
	ld r5,[zr,_upper_digits_37]
L194_37:
.line 274
	ld r3,#0x0
.line 275
	ld r2,r3
L199_37:
.line 277
	ld r14,#0x0
	jc eq,r2,r14,&L198_37
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r3
	ld r0,#0x3a
	ld.b [r14,-24],r0
	add r3,#0x1
L198_37:
.line 278
	ld r0,#0xffffffd8
	add r0,fr
	add r0,r3
	ld r1,r2
	add r1,r6
	ld.b r14,[r1]
	and r14,#0xff
	srl r14,#0x4
	add r14,r5
	ld.b r14,[r14]
	ld.b [r0,-24],r14
	add r3,#0x1
.line 279
	ld r0,#0xffffffd8
	add r0,fr
	add r0,r3
	ld.b r14,[r1]
	and r14,#0xf
	add r14,r5
	ld.b r14,[r14]
	ld.b [r0,-24],r14
	add r3,#0x1
.line 275
	add r2,#0x1
	ld r1,#0x5
	jc le,r2,r1,&L199_37
.line 282
	ld r14,d2
	and r14,#0x10
	ld r2,#0x0
	jc ne,r14,r2,&L200_37
	ld r4,d3
	add r4,#0xffffffff
	jc le,d3,r3,&L200_37
L203_37:
	ld r14,#0x20
	ld.b [i0],r14
	add i0,#0x1
	ld r14,r4
	add r4,#0xffffffff
	jc gt,r14,r3,&L203_37
L200_37:
.line 283
	ld r2,#0x0
L426_37:
	jc le,r3,r2,&L381_37
	ld r14,#0xffffffd8
	add r14,fr
	add r14,r2
	ld.b r14,[r14,-24]
	ld.b [i0],r14
	add i0,#0x1
	add r2,#0x1
	jp &L426_37
L465_37:
.line 284
	ld r0,#0x20
	ld.b [i0],r0
	add i0,#0x1
L381_37:
	ld r14,r4
	add r4,#0xffffffff
	jc gt,r14,r3,&L465_37
LBE19_37:
.line 290
	ld d0,i0
	jp &L436_37
L260_37:
.line 343
	ld r14,#0x1
	ld [fr,-260],r14
.line 344
	ld r14,d6
	add r14,#0x20
	jp &L259_37
L459_37:
.line 349
	ld r14,fr
	add r14,#0xffffff18
	ld [sp],r14
	add r14,#0x8
	ld [sp,4],r14
	ld i0,[fr,-244]
	ld i1,[fr,-240]
	ld i2,[fr,-248]
	ld i3,fr
	add i3,#0xffffff14
	call &_ecvtbuf_37
.line 350
	ld i2,[fr,-236]
	ld r0,i2
	add r0,#0xffffffff
	ld r14,[fr,-248]
	add r14,#0xffffffff
.line 351
	ld r1,#0xfffffffc
	jc lt,r0,r1,&L263_37
	ld r14,[fr,-248]
	add r14,#0xffffffff
.line 359
	ld d2,[fr,-248]
	sub d2,i2
.line 351
	jc ge,r14,r0,&L417_37
L263_37:
.line 354
	ld d2,r14
L415_37:
.line 366
	ld r14,fr
	add r14,#0xffffff18
	ld [sp],r14
	add r14,#0x8
	ld [sp,4],r14
	ld i0,[fr,-244]
	ld i1,[fr,-240]
	ld i2,d2
	add i2,#0x1
	ld i3,fr
	add i3,#0xffffff14
	call &_ecvtbuf_37
	ld i1,r14
.line 369
	ld r14,[fr,-232]
	ld r3,#0x0
	jc eq,r14,r3,&L266_37
	ld r14,#0x2d
	ld.b [d5],r14
	ld d3,d5
	add d3,#0x1
L266_37:
.line 370
	ld.b r0,[i1]
	ld.b [d3],r0
	add d3,#0x1
.line 371
	ld r1,#0x0
	jc le,d2,r1,&L267_37
	ld r2,#0x2e
	ld.b [d3],r2
	add d3,#0x1
L267_37:
.line 372
	ld i0,d3
	add i1,#0x1
	ld i2,d2
	syscall 5
.line 373
	add d3,d2
.line 374
	ld r14,d3
	add d3,#0x1
	ld r0,#0x45
	ld r3,[fr,-260]
	ld r1,#0x0
	jc ne,r3,r1,&L269_37
	ld r0,#0x65
L269_37:
	ld.b [r14],r0
.line 376
	ld d2,[fr,-236]
	ld r2,#0x0
	jc ne,d2,r2,&L270_37
.line 378
	ld i0,[fr,-244]
	ld i1,[fr,-240]
	ld i2,#0
	ld i3,#0
	call &___eqdf2_30
.line 379
	ld r1,#0x0
.line 378
	jc eq,r14,d2,&L275_37
.line 381
	ld r1,#0xffffffff
L416_37:
.line 388
	ld r14,#0x2d
	ld.b [d3],r14
	add d3,#0x1
.line 389
	neg r1,r1
L276_37:
.line 394
	ld r14,r1
	div r14,#0xa
	ld r0,r14
	mul r0,#0xa
	sub r1,r0
	add r1,#0x30
	ld.b [d3,2],r1
.line 396
	ld r0,r14
	div r0,#0xa
	ld r1,r0
	mul r1,#0xa
	sub r14,r1
	add r14,#0x30
	ld.b [d3,1],r14
.line 398
	ld r14,r0
	div r14,#0xa
	mul r14,#0xa
	sub r0,r14
	add r0,#0x30
	ld.b [d3],r0
.line 399
	add d3,#0x3
	jp &L277_37
L460_37:
.line 527
	ld r3,#0x0
	jc ne,d3,r3,&L315_37
LBB24_37:
.line 468
	ld r1,d5
LBB25_37:
.line 471
	ld.b r0,[d5]
	xb r14,r0
	jc eq,r14,d3,&L317_37
L432_37:
	ld r2,#0x2e
	jc eq,r14,r2,&L317_37
	add r1,#0x1
	ld.b r0,[r1]
	xb r14,r0
	ld r3,#0x0
	jc ne,r14,r3,&L432_37
L317_37:
.line 472
	add r1,#0x1
	xb r14,r0
	ld r3,#0x0
	jc eq,r14,r3,&L315_37
.line 474
	ld.b r0,[r1]
	xb r14,r0
	jc eq,r14,r3,&L321_37
	ld r2,#0x65
	jc eq,r14,r2,&L321_37
	ld r3,#0x45
	jc eq,r14,r3,&L321_37
L322_37:
	add r1,#0x1
	ld.b r0,[r1]
	xb r14,r0
	ld r2,#0x0
	jc eq,r14,r2,&L321_37
	ld r3,#0x65
	jc eq,r14,r3,&L321_37
	ld r0,#0x45
	jc ne,r14,r0,&L322_37
L321_37:
.line 475
	ld r14,r1
	add r1,#0xffffffff
	ld r2,r14
.line 476
	ld.b r0,[r1]
	xb r14,r0
	ld r3,#0x30
	jc ne,r14,r3,&L404_37
L466_37:
	add r1,#0xffffffff
	ld.b r0,[r1]
	xb r14,r0
	ld r3,#0x30
	jc eq,r14,r3,&L466_37
L404_37:
.line 477
	xb r14,r0
	ld r0,#0x2e
	jc ne,r14,r0,&L327_37
	add r1,#0xffffffff
L327_37:
.line 478
	add r1,#0x1
	ld.b r3,[r2]
	xb r14,r3
	add r2,#0x1
	ld.b [r1],r14
	ld r0,#0x0
	jc ne,r14,r0,&L327_37
	jp &L315_37
L451_37:
.line 652
	ld d3,#0x8
.line 653
	or d2,#0x1
	jp &L187_37
L417_37:
.line 158
	ld r14,fr
	add r14,#0xffffff18
	ld [sp],r14
	add r14,#0x8
	ld [sp,4],r14
	ld r2,#0x0
	ld [sp,8],r2
	ld i0,[fr,-244]
	ld i1,[fr,-240]
	ld i2,d2
	ld i3,fr
	add i3,#0xffffff14
	call &_cvt_37
	ld i1,r14
LBE31_37:
.line 406
	ld r14,[fr,-232]
	ld r3,#0x0
	jc eq,r14,r3,&L280_37
	ld r14,#0x2d
	ld.b [d5],r14
	ld d3,d5
	add d3,#0x1
L280_37:
.line 407
	ld.b r1,[i1]
	xb r14,r1
	ld r0,#0x0
	jc eq,r14,r0,&L281_37
.line 409
	ld r0,[fr,-236]
.line 418
	ld r2,#0x0
.line 409
	jc gt,r0,r2,&L294_37
	jp &L467_37
L293_37:
.line 422
	add i1,#0x1
	ld.b [d3],r1
	add d3,#0x1
	ld.b r1,[i1]
	xb r14,r1
	ld r0,#0x0
	jc eq,r14,r0,&L277_37
	ld r0,[fr,-236]
L294_37:
.line 421
	ld r14,r2
	add r2,#0x1
	jc ne,r14,r0,&L293_37
	ld r3,#0x2e
	ld.b [d3],r3
	add d3,#0x1
	ld.b r1,[i1]
	jp &L293_37
L457_37:
.line 516
	ld r2,#0x6
	ld [fr,-248],r2
	xb r3,d6
	ld [fr,-264],r3
	jp &L257_37
L253_37:
.line 507
	ld r14,[fr,-252]
	and r14,#0x8
	jc eq,r14,r0,&L249_37
.line 509
	ld r0,#0x20
	ld.b [fr,-254],r0
.line 510
	ld d1,d3
	add d1,#0xffffffff
	jp &L249_37
L270_37:
.line 384
	ld r1,d2
	add r1,#0xffffffff
.line 386
	ld r3,#0x0
	jc lt,r1,r3,&L416_37
L275_37:
.line 392
	ld r0,#0x2b
	ld.b [d3],r0
	add d3,#0x1
	jp &L276_37
L454_37:
.line 642
	ld d1,&LC3_37
	jp &L174_37
L452_37:
.line 633
	ld d1,&LC2_37
	jp &L161_37
L458_37:
.line 518
	ld r3,#0x1
	ld [fr,-248],r3
	jp &L257_37
L310_37:
.line 462
	ld r0,#0x2e
	ld.b [d2],r0
.line 463
	ld.b [d2,1],r14
	jp &L302_37
L281_37:
.line 428
	ld r1,#0x30
	ld.b [d3],r1
	add d3,#0x1
.line 429
	jc le,d2,r14,&L277_37
.line 431
	ld r2,#0x2e
	ld.b [d3],r2
	add d3,#0x1
.line 432
	ld r2,#0x0
L431_37:
	jc le,d2,r2,&L277_37
	ld r3,#0x30
	ld.b [d3],r3
	add d3,#0x1
	add r2,#0x1
	jp &L431_37
L456_37:
.line 498
	ld r2,#0x2d
	ld.b [fr,-254],r2
.line 499
	ld r14,[fr,-244]
	ld r15,[fr,-240]
	xor r15,#0x80000000
	ld [fr,-244],r14
	ld [fr,-240],r15
.line 510
	ld d1,d3
	add d1,#0xffffffff
	jp &L249_37
L467_37:
.line 411
	ld r1,#0x30
	ld.b [d3],r1
	add d3,#0x1
.line 412
	ld r2,#0x2e
	ld.b [d3],r2
	add d3,#0x1
.line 413
	ld r2,#0x0
	jp &L430_37
L468_37:
	ld r3,#0x30
	ld.b [d3],r3
	add d3,#0x1
	add r2,#0x1
L430_37:
	ld r14,[fr,-236]
	neg r14,r14
	jc gt,r14,r2,&L468_37
.line 414
	ld.b r0,[i1]
	xb r14,r0
	ld r1,#0x0
	jc eq,r14,r1,&L277_37
L289_37:
	add i1,#0x1
	ld.b [d3],r0
	add d3,#0x1
	ld.b r0,[i1]
	xb r14,r0
	ld r2,#0x0
	jc ne,r14,r2,&L289_37
	jp &L277_37

//****************************************
// Function: _sprintf
//****************************************

.func _sprintf_37, 2, int
.line 746
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 751
	ld i2,fr
	call &_vsprintf_37
.line 755
	pop rt,fr
	ret

//****************************************
// Function: _lprintfln
//****************************************

.func _lprintfln_37, 1, int
.line 760
	push rt,d1
	sub sp,#0x800
	ld fr,sp
	add fr,#0x810
	ld i1,i0
.line 766
	ld r14,[zr,lastWLres_0_37]
.line 767
	ld i2,r14
.line 766
	ld r0,#0x0
	jc lt,r14,r0,&L470_37
.line 769
	ld r1,#0x0
	ld.b [fr,-2064],r1
.line 772
	ld d1,fr
	add d1,#0xfffff7f0
	ld i0,d1
	ld i2,fr
	call &_vsprintf_37
	ld d0,r14
.line 773
	ld r14,#0x7fe
	jc gt,d0,r14,&L475_37
.line 778
	ld r0,#0xfffffff0
	add r0,fr
	add r0,d0
	ld.b r1,[r0,-2049]
	xb r14,r1
	ld r1,#0xa
	jc eq,r14,r1,&L473_37
.line 779
	ld r14,#0xa
	ld.b [r0,-2048],r14
	add d0,#0x1
.line 780
	ld r14,#0xfffffff0
	add r14,fr
	add r14,d0
	ld r0,#0x0
	ld.b [r14,-2048],r0
L473_37:
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\maapi.h'
.line 1939
	ld i0,#0x14
	ld i1,d1
	ld i2,d0
	ld i3,#0x0
	syscall 96
	ld r0,r14
	ld r1,r15
LBE43_37:
.line 1938
	ld [zr,lastWLres_0_37],r14
Ltext2_37:
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\mavsprintf.c'
.line 783
	ld i2,d0
L470_37:
.line 784
	ld r14,i2
	add sp,#0x800
	pop rt,d1
	ret
L475_37:
.line 774
	ld i0,#0x0
	ld i1,&LC4_37
	syscall 3

//****************************************
// Function: _wcsnlen
//****************************************

.func _wcsnlen_38, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\mawstring.c'
.line 341
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 343
	ld r15,i0
	ld.h r14,[i0]
	and r14,#0xffff
	ld r0,#0x0
	jc eq,r14,r0,&L231_38
L235_38:
	add i1,#0xffffffff
	ld r14,#0xffffffff
	jc eq,i1,r14,&L231_38
	add r15,#0x2
	ld.h r14,[r15]
	and r14,#0xffff
	ld r0,#0x0
	jc ne,r14,r0,&L235_38
L231_38:
.line 344
	sub r15,i0
.line 345
	ld r14,r15
	sra r14,#0x1
	pop fr,fr
	ret

//****************************************
// Function: _modf
//****************************************

.func _modf_41, 3, double
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\modf.c'
.line 156
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld r10,#0x0
	ld r11,r10
	ld r12,r10
	ld r13,r10
	ld r7,r10
	ld r8,r10
	ld r0,r10
	ld r1,r10
	ld r5,r10
	ld r6,r10
	ld r2,r10
	ld r3,r10
	ld d0,i0
	ld d1,i1
LBB2_41:
.line 159
	ld r14,i0
	ld r15,i1
	ld i3,r15
LBE2_41:
.line 160
	ld r9,i3
	sra r9,#0x14
	and r9,#0x7ff
	ld r4,r9
	add r4,#0xfffffc01
.line 161
	ld r14,#0x13
	jc gt,r4,r14,&L3_41
.line 162
	jc lt,r4,r10,&L24_41
.line 166
	ld r14,#0xfffff
	sra r14,r4
.line 167
	ld r0,i3
	and r0,r14
	or r0,i0
	ld r1,#0x0
	jc ne,r0,r1,&L7_41
LBB3_41:
.line 169
	ld [i2],i0
	ld [i2,4],i1
LBB4_41:
.line 171
	ld r13,d1
	and r13,#0x80000000
	ld r12,r0
	ld i0,r12
	ld i1,r13
LBE4_41:
.line 197
	ld r14,i0
	ld r15,i1
	pop rt,d1
	ret
L3_41:
.line 178
	ld r14,#0x33
	jc le,r4,r14,&L13_41
LBB5_41:
.line 180
	ld [i2],i0
	ld [i2,4],i1
LBB6_41:
.line 182
	ld r1,d1
	and r1,#0x80000000
	ld r0,#0x0
	ld i0,r0
	ld i1,r1
LBE6_41:
.line 197
	ld r14,i0
	ld r15,i1
	pop rt,d1
	ret
L13_41:
.line 185
	add r9,#0xfffffbed
	ld r14,#0xffffffff
	srl r14,r9
.line 186
	ld r0,i0
	and r0,r14
	ld r1,#0x0
	jc ne,r0,r1,&L17_41
LBB7_41:
.line 188
	ld [i2],i0
	ld [i2,4],i1
LBB8_41:
.line 190
	ld r6,d1
	and r6,#0x80000000
	ld r5,r0
	ld i0,r5
	ld i1,r6
LBE8_41:
.line 197
	ld r14,i0
	ld r15,i1
	pop rt,d1
	ret
L7_41:
.line 174
	not r14,r14
	ld r8,r14
	and r8,i3
	ld r7,#0x0
	ld [i2],r7
	ld [i2,4],r8
LBE9_41:
.line 175
	ld i2,r7
	ld i3,r8
.line 194
	syscall 9
	ld i0,r14
	ld i1,r15
L25_41:
.line 197
	ld r14,i0
	ld r15,i1
	pop rt,d1
	ret
L17_41:
.line 193
	ld r3,i3
	not r14,r14
	ld r2,r14
	and r2,i0
	ld [i2],r2
	ld [i2,4],r3
LBE10_41:
.line 194
	ld i2,r2
	ld i3,r3
	syscall 9
	ld i0,r14
	ld i1,r15
	jp &L25_41
L24_41:
.line 163
	ld r11,i3
	and r11,#0x80000000
	ld [i2],r10
	ld [i2,4],r11
LBE11_41:
.line 197
	ld r14,i0
	ld r15,i1
	pop rt,d1
	ret

//****************************************
// Function: _strtoul
//****************************************

.func _strtoul_44, 3, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\strtoul.c'
.line 43
	push rt,d7
	sub sp,#0xc
	ld fr,sp
	add fr,#0x34
	ld [fr,-44],i0
	ld [fr,-48],i1
	ld d4,i2
.line 52
	ld d2,i0
L2_44:
.line 54
	ld.b d0,[d2]
	and d0,#0xff
	add d2,#0x1
.line 55
	ld i0,d0
	call &_isspace_29
	ld r0,#0x0
	jc ne,r14,r0,&L2_44
.line 56
	ld r1,#0x2d
	jc eq,d0,r1,&L33_44
.line 60
	ld r1,#0x0
	ld [fr,-52],r1
.line 61
	ld r14,#0x2b
	jc eq,d0,r14,&L34_44
L6_44:
.line 64
	ld r1,#0x0
	jc eq,d4,r1,&L9_44
L38_44:
	ld r14,#0x10
	jc eq,d4,r14,&L9_44
L8_44:
.line 70
	ld r0,#0x0
	jc ne,d4,r0,&L11_44
.line 71
	ld d4,#0x8
	ld r1,#0x30
	jc eq,d0,r1,&L11_44
	ld d4,#0xa
L11_44:
.line 73
	ld d6,#0xffffffff
	divu d6,d4
.line 74
	ld r14,d6
	mul r14,d4
	not d7,r14
.line 75
	ld d3,#0x0
	ld d5,d3
.line 76
	ld i0,d0
	call &_isdigit_29
	ld d1,r14
	ld r14,#0x0
	jc eq,d1,r14,&L17_44
L36_44:
.line 77
	add d0,#0xffffffd0
.line 82
	jc ge,d0,d4,&L15_44
L37_44:
.line 84
	ld r14,#0x0
	jc lt,d5,r14,&L16_44
.line 86
	jc gtu,d3,d6,&L26_44
	jc eq,d3,d6,&L35_44
L25_44:
.line 93
	ld d5,#0x1
.line 94
	mul d3,d4
.line 95
	add d3,d0
L16_44:
.line 75
	ld.b d0,[d2]
	and d0,#0xff
	add d2,#0x1
.line 76
	ld i0,d0
	call &_isdigit_29
	ld d1,r14
	ld r14,#0x0
	jc ne,d1,r14,&L36_44
L17_44:
.line 78
	ld i0,d0
	call &_isalpha_29
	jc eq,r14,d1,&L15_44
.line 79
	ld i0,d0
	call &_isupper_29
	ld r0,d0
	add r0,#0xffffffc9
	ld r1,#0x0
	jc ne,r14,r1,&L21_44
	add r0,#0xffffffe0
L21_44:
	ld d0,r0
.line 82
	jc lt,d0,d4,&L37_44
L15_44:
.line 98
	ld r0,[fr,-52]
	ld r1,#0x0
	jc eq,r0,r1,&L28_44
	jc le,d5,r1,&L28_44
.line 99
	neg d3,d3
L28_44:
.line 100
	ld r14,[fr,-48]
	ld r0,#0x0
	jc eq,r14,r0,&L29_44
.line 101
	ld r14,d2
	add r14,#0xffffffff
	jc ne,d5,r0,&L31_44
	ld r14,[fr,-44]
L31_44:
	ld r1,[fr,-48]
	ld [r1],r14
L29_44:
.line 103
	ld r14,d3
	add sp,#0xc
	pop rt,d7
	ret
L34_44:
.line 62
	ld.b r0,[d2]
	xb d0,r0
	add d2,#0x1
.line 64
	ld r1,#0x0
	jc ne,d4,r1,&L38_44
L9_44:
	ld r0,#0x30
	jc ne,d0,r0,&L8_44
	ld.b r1,[d2]
	xb r14,r1
	ld r0,#0x78
	jc eq,r14,r0,&L10_44
	ld r1,#0x58
	jc ne,r14,r1,&L8_44
L10_44:
.line 66
	ld.b r14,[d2,1]
	xb d0,r14
.line 67
	add d2,#0x2
.line 68
	ld d4,#0x10
	jp &L11_44
L35_44:
.line 86
	jc le,d0,d7,&L25_44
L26_44:
.line 89
	ld d3,#0xffffffff
.line 90
	ld d5,d3
	jp &L16_44
L33_44:
.line 57
	ld r14,#0x1
	ld [fr,-52],r14
.line 58
	ld.b r0,[d2]
	xb d0,r0
	add d2,r14
	jp &L6_44

//****************************************
// Function: _free_ex
//****************************************

.func _free_ex_50, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\tlsf.c'
.line 749
	push fr,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0xc
.line 753
	ld r0,#0x0
	ld [fr,-8],r0
	ld [fr,-12],r0
.line 755
	jc eq,i0,r0,&L1_50
.line 758
	ld r4,i0
	add r4,#0xfffffff8
.line 759
	ld r15,[r4,4]
	or r15,#0x1
	ld [r4,4],r15
.line 761
	and r15,#0xfffffffc
	ld r14,[i1,4]
	sub r14,r15
	add r14,#0xfffffff8
	ld [i1,4],r14
.line 763
	ld [i0],r0
.line 764
	ld [r4,12],r0
.line 765
	ld r15,[r4,4]
	ld r1,r15
	and r1,#0xfffffffc
	add r1,r4
	add r1,#0x8
.line 766
	ld r3,[r1,4]
	ld r14,r3
	and r14,#0x1
	jc ne,r14,r0,&L61_50
	ld r9,fr
	add r9,#0xfffffff8
	ld r8,fr
	add r8,#0xfffffff4
	ld r5,i1
	add r5,#0x10
L4_50:
.line 771
	ld r14,r15
	and r14,#0x2
	ld r0,#0x0
	jc eq,r14,r0,&L23_50
.line 772
	ld r1,[r4]
LBB2_50:
.line 319
	ld r3,[r1,4]
	ld r0,r3
	and r0,#0xfffffffc
LBB3_50:
.line 320
	ld r2,#0x7f
	jc gtu,r0,r2,&L24_50
.line 321
	ld r14,#0x0
	ld [fr,-8],r14
.line 322
	srl r0,#0x2
	ld [fr,-12],r0
L33_50:
.line 774
	ld r14,[r1,12]
	ld r0,#0x0
	jc eq,r14,r0,&L35_50
	ld r2,[r1,8]
	ld [r14,8],r2
L35_50:
	ld r14,[r1,8]
	ld r0,#0x0
	jc eq,r14,r0,&L36_50
	ld r2,[r1,12]
	ld [r14,12],r2
L36_50:
	ld r2,[fr,-8]
	ld r0,r2
	sll r0,#0x5
	ld r4,[fr,-12]
	add r0,r4
	sll r0,#0x2
	add r0,i1
	add r0,#0x74
	ld r14,[r0]
	jc eq,r14,r1,&L62_50
L37_50:
	ld r14,#0x0
	ld [r1,8],r14
	ld [r1,12],r14
.line 775
	and r15,#0xfffffffc
	add r3,r15
	add r3,#0x8
	ld [r1,4],r3
.line 776
	ld r4,r1
	ld r15,r3
L23_50:
.line 319
	ld r0,r15
	and r0,#0xfffffffc
LBB5_50:
.line 320
	ld r2,#0x7f
	jc gtu,r0,r2,&L42_50
.line 321
	ld r14,#0x0
	ld [fr,-8],r14
.line 322
	srl r0,#0x2
	ld [fr,-12],r0
L51_50:
.line 779
	ld r14,#0x0
	ld [r4,8],r14
	ld r14,[fr,-8]
	sll r14,#0x5
	ld r0,[fr,-12]
	add r14,r0
	sll r14,#0x2
	add r14,i1
	add r14,#0x74
	ld r2,[r14]
	ld [r4,12],r2
	ld r14,[r14]
	ld r0,#0x0
	jc eq,r14,r0,&L53_50
	ld [r14,8],r4
L53_50:
	ld r0,[fr,-8]
	ld r14,r0
	sll r14,#0x5
	ld r2,[fr,-12]
	add r14,r2
	sll r14,#0x2
	add r14,i1
	ld [r14,116],r4
LBB6_50:
.line 289
	sll r0,#0x2
	add r0,i1
	add r0,#0x14
LBB7_50:
.line 290
	ld r1,r2
	sra r1,#0x5
	sll r1,#0x2
	add r1,r0
	and r2,#0x1f
	ld r3,#0x1
	ld r0,r3
	sll r0,r2
	ld r14,[r1]
	or r14,r0
	ld [r1],r14
LBE7_50:
.line 289
	ld r14,[fr,-8]
LBB9_50:
.line 290
	ld r0,r14
	sra r0,#0x5
	sll r0,#0x2
	add r0,r5
	and r14,#0x1f
	sll r3,r14
	ld r14,[r0]
	or r14,r3
	ld [r0],r14
LBE9_50:
.line 781
	ld r1,r15
	and r1,#0xfffffffc
	add r1,r4
	add r1,#0x8
.line 782
	ld r14,[r1,4]
	or r14,#0x2
	ld [r1,4],r14
.line 783
	ld [r1],r4
L1_50:
.line 784
	add sp,#0x8
	pop fr,fr
	ret
L61_50:
.line 319
	ld r0,r3
	and r0,#0xfffffffc
	ld r9,fr
	add r9,#0xfffffff8
	ld r8,fr
	add r8,#0xfffffff4
LBB11_50:
.line 320
	ld r2,#0x7f
	jc gtu,r0,r2,&L5_50
.line 322
	srl r0,#0x2
	ld [fr,-12],r0
L14_50:
.line 768
	ld r14,[r1,12]
	ld r0,#0x0
	jc eq,r14,r0,&L16_50
	ld r2,[r1,8]
	ld [r14,8],r2
L16_50:
	ld r14,[r1,8]
	ld r0,#0x0
	jc eq,r14,r0,&L17_50
	ld r2,[r1,12]
	ld [r14,12],r2
L17_50:
	ld r2,[fr,-8]
	ld r0,r2
	sll r0,#0x5
	ld i0,[fr,-12]
	add r0,i0
	sll r0,#0x2
	add r0,i1
	add r0,#0x74
	ld r14,[r0]
	ld r5,i1
	add r5,#0x10
	jc eq,r14,r1,&L63_50
L18_50:
	ld r14,#0x0
	ld [r1,8],r14
	ld [r1,12],r14
.line 769
	and r3,#0xfffffffc
	add r15,r3
	add r15,#0x8
	ld [r4,4],r15
	jp &L4_50
L42_50:
.line 284
	ld r2,#0xffff
	jc gtu,r0,r2,&L44_50
	ld r1,#0x0
	ld r14,#0xff
	jc leu,r0,r14,&L45_50
	ld r1,#0x8
L45_50:
	ld r14,r0
	srl r14,r1
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r1
LBE15_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [r8],r0
.line 326
	add r14,#0xffffffff
	ld [r9],r14
	jp &L51_50
L5_50:
.line 284
	ld r14,#0xffff
	jc leu,r0,r14,&L64_50
	ld r2,#0x10
	ld r14,#0xffffff
	jc leu,r0,r14,&L8_50
	ld r2,#0x18
L8_50:
	ld r14,r0
	srl r14,r2
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r2
LBE19_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [r8],r0
.line 326
	add r14,#0xffffffff
	ld [r9],r14
	jp &L14_50
L24_50:
.line 284
	ld r2,#0xffff
	jc leu,r0,r2,&L65_50
	ld r2,#0x10
	ld r14,#0xffffff
	jc leu,r0,r14,&L27_50
	ld r2,#0x18
L27_50:
	ld r14,r0
	srl r14,r2
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r2
LBE23_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [r8],r0
.line 326
	add r14,#0xffffffff
	ld [r9],r14
	jp &L33_50
L44_50:
.line 284
	ld r1,#0x10
	ld r2,#0xffffff
	jc leu,r0,r2,&L45_50
	ld r1,#0x18
	ld r14,r0
	srl r14,r1
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r1
LBE27_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [r8],r0
.line 326
	add r14,#0xffffffff
	ld [r9],r14
	jp &L51_50
L65_50:
.line 284
	ld r2,#0x0
	ld r14,#0xff
	jc leu,r0,r14,&L27_50
	ld r2,#0x8
	jp &L27_50
L64_50:
	ld r2,#0x0
	ld r14,#0xff
	jc leu,r0,r14,&L8_50
	ld r2,#0x8
	jp &L8_50
L63_50:
.line 768
	ld r14,[r1,12]
	ld [r0],r14
	ld r6,r14
	ld r0,#0x0
	jc ne,r14,r0,&L18_50
LBB36_50:
.line 294
	sll r2,#0x2
	add r2,i1
	add r2,#0x14
LBB37_50:
.line 295
	ld r0,i0
	sra r0,#0x5
	sll r0,#0x2
	add r0,r2
	and i0,#0x1f
	ld r7,#0x1
	ld r14,r7
	sll r14,i0
	not r14,r14
	ld r2,[r0]
	and r14,r2
	ld [r0],r14
LBE37_50:
.line 768
	ld r2,[fr,-8]
	ld r14,r2
	sll r14,#0x2
	add r14,i1
	ld r14,[r14,20]
	jc ne,r14,r6,&L18_50
LBB38_50:
.line 295
	ld r0,r2
	sra r0,#0x5
	sll r0,#0x2
	add r0,r5
	and r2,#0x1f
	sll r7,r2
	not r14,r7
	ld r2,[r0]
	and r14,r2
	ld [r0],r14
	jp &L18_50
L62_50:
.line 774
	ld r14,[r1,12]
	ld [r0],r14
	ld i0,r14
	ld r0,#0x0
	jc ne,r14,r0,&L37_50
LBB40_50:
.line 294
	sll r2,#0x2
	add r2,i1
	add r2,#0x14
LBB41_50:
.line 295
	ld r0,r4
	sra r0,#0x5
	sll r0,#0x2
	add r0,r2
	and r4,#0x1f
	ld r6,#0x1
	ld r14,r6
	sll r14,r4
	not r14,r14
	ld r2,[r0]
	and r14,r2
	ld [r0],r14
LBE41_50:
.line 774
	ld r2,[fr,-8]
	ld r14,r2
	sll r14,#0x2
	add r14,i1
	ld r14,[r14,20]
	jc ne,r14,i0,&L37_50
LBB42_50:
.line 295
	ld r0,r2
	sra r0,#0x5
	sll r0,#0x2
	add r0,r5
	and r2,#0x1f
	sll r6,r2
	not r14,r6
	ld r2,[r0]
	and r14,r2
	ld [r0],r14
	jp &L37_50

//****************************************
// Function: _init_memory_pool
//****************************************

.func _init_memory_pool_50, 2, int
.line 440
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d2,i1
.line 445
	ld r0,#0x0
	jc eq,i1,r0,&L68_50
	jc eq,i0,r0,&L68_50
	ld r2,#0xcb3
	jc leu,i0,r2,&L68_50
.line 450
	ld r14,i1
	and r14,#0x3
	ld r0,#0x0
	jc ne,r14,r0,&L77_50
.line 456
	ld r14,[i1]
	ld r2,#0x2a59fa59
	jc eq,r14,r2,&L78_50
.line 462
	ld [zr,_mp_50],i1
.line 465
	ld i0,i1
	ld i1,#0x0
	ld i2,#0xc74
	syscall 4
.line 467
	ld r14,#0x2a59fa59
	ld [d2],r14
LBB44_50:
.line 412
	ld r1,d2
	add r1,#0xc78
	ld r14,d3
	add r14,#0xfffff38c
	and r14,#0xfffffff8
LBB45_50:
.line 417
	ld r0,#0x8
	ld [r1,4],r0
.line 420
	ld r0,d2
	add r0,#0xc88
.line 421
	add r14,#0xffffffe0
	ld [r0,4],r14
.line 422
	ld r2,#0x0
	ld [r0,12],r2
	ld [r0,8],r2
.line 423
	add r14,r0
	add r14,#0x8
.line 424
	ld [r14],r0
.line 425
	ld r0,#0x2
	ld [r14,4],r0
.line 426
	ld d0,d2
	add d0,#0xc80
.line 427
	ld [d0,4],r2
.line 428
	ld [d0],r14
LBE45_50:
.line 473
	ld i0,[r1,4]
	and i0,#0xfffffffc
	add i0,r1
	ld d1,i0
	add d1,#0x8
.line 474
	add i0,#0x10
	ld i1,d2
	call &_free_ex_50
.line 475
	ld [d2,12],d0
.line 478
	ld r14,[d1,4]
	and r14,#0xfffffffc
	sub d3,r14
	ld [d2,4],d3
.line 479
	ld [d2,8],d3
.line 482
	ld r14,[d1,4]
	and r14,#0xfffffffc
L66_50:
.line 483
	pop rt,d3
	ret
L68_50:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 1939
	ld i0,#0x14
	ld i1,&LC0_50
	ld i2,#0x29
	ld i3,#0x0
LBE47_50:
	syscall 96
LBE49_50:
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\tlsf.c'
.line 452
	ld r14,#0xffffffff
L79_50:
.line 483
	pop rt,d3
	ret
L78_50:
.line 457
	ld [zr,_mp_50],i1
.line 459
	ld r14,[i1,3196]
.line 482
	and r14,#0xfffffffc
	jp &L66_50
L77_50:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 1939
	ld i0,#0x14
	ld i1,&LC1_50
	ld i2,#0x38
	ld i3,r0
	syscall 96
LBE51_50:
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\tlsf.c'
.line 452
	ld r14,#0xffffffff
	jp &L79_50

//****************************************
// Function: _malloc_ex
//****************************************

.func _malloc_ex_50, 2, int
.line 679
	push fr,fr
	sub sp,#0xc
	ld fr,sp
	add fr,#0x10
	ld [fr,-8],i0
.line 686
	ld r14,#0x8
	ld r0,#0x7
	jc leu,i0,r0,&L105_50
	ld r14,i0
	add r14,r0
	and r14,#0xfffffff8
L105_50:
	ld [fr,-8],r14
LBB54_50:
.line 299
	ld r3,fr
	add r3,#0xfffffff8
	ld r4,fr
	add r4,#0xfffffff4
	ld r5,fr
	add r5,#0xfffffff0
LBB55_50:
.line 302
	ld r1,#0x7f
	jc gtu,r14,r1,&L106_50
.line 303
	ld r2,#0x0
	ld [fr,-12],r2
.line 304
	ld r0,r14
	srl r0,#0x2
	ld [fr,-16],r0
LBE55_50:
.line 333
	ld r1,[fr,-12]
	ld r14,r1
	sll r14,#0x2
	add r14,i1
	ld r2,#0xffffffff
	ld r3,r2
	sll r3,r0
	ld r0,r3
	ld r14,[r14,20]
	and r0,r14
.line 334
	ld r15,#0x0
.line 336
	jc eq,r0,r15,&L123_50
L176_50:
.line 273
	neg r14,r0
	and r14,r0
.line 275
	ld r0,#0xffff
	jc gtu,r14,r0,&L124_50
	ld r0,r15
	ld r1,#0xff
	jc leu,r14,r1,&L125_50
	ld r0,#0x8
L125_50:
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r0,r14
LBE59_50:
.line 271
	ld [r5],r0
.line 338
	ld r14,[r4]
	sll r14,#0x5
	add r14,r0
	sll r14,#0x2
	add r14,i1
	ld r15,[r14,116]
L131_50:
.line 711
	ld r14,#0x0
	jc eq,r15,r14,&L173_50
.line 714
	ld r1,[fr,-12]
	ld r14,r1
	sll r14,#0x5
	ld r2,[fr,-16]
	add r14,r2
	sll r14,#0x2
	add r14,i1
	add r14,#0x74
	ld r0,[r15,12]
	ld [r14],r0
	ld r3,r0
	ld r14,#0x0
	jc eq,r0,r14,&L150_50
	ld [r0,8],r14
L151_50:
	ld r3,#0x0
	ld [r15,8],r3
	ld [r15,12],r3
.line 717
	ld r14,[r15,4]
	and r14,#0xfffffffc
	ld r1,r14
	add r1,r15
	add r1,#0x8
.line 719
	ld r2,[fr,-8]
	ld r0,r14
	sub r0,r2
.line 720
	ld r14,#0xf
	jc leu,r0,r14,&L155_50
.line 721
	add r0,#0xfffffff8
.line 722
	ld r3,r15
	add r3,r2
	add r3,#0x8
.line 723
	ld r14,r0
	or r14,#0x1
	ld [r3,4],r14
.line 724
	ld [r1],r3
LBB60_50:
.line 320
	ld r1,#0x7f
	jc gtu,r0,r1,&L156_50
.line 321
	ld r2,#0x0
	ld [fr,-12],r2
.line 322
	srl r0,#0x2
	ld [fr,-16],r0
L165_50:
.line 726
	ld r0,#0x0
	ld [r3,8],r0
	ld r14,[fr,-12]
	sll r14,#0x5
	ld r1,[fr,-16]
	add r14,r1
	sll r14,#0x2
	add r14,i1
	add r14,#0x74
	ld r2,[r14]
	ld [r3,12],r2
	ld r14,[r14]
	jc eq,r14,r0,&L167_50
	ld [r14,8],r3
L167_50:
	ld r0,[fr,-12]
	ld r14,r0
	sll r14,#0x5
	ld r2,[fr,-16]
	add r14,r2
	sll r14,#0x2
	add r14,i1
	ld [r14,116],r3
LBB62_50:
.line 289
	sll r0,#0x2
	add r0,i1
	add r0,#0x14
LBB63_50:
.line 290
	ld r1,r2
	sra r1,#0x5
	sll r1,#0x2
	add r1,r0
	and r2,#0x1f
	ld r3,#0x1
	ld r0,r3
	sll r0,r2
	ld r14,[r1]
	or r14,r0
	ld [r1],r14
LBE63_50:
.line 289
	ld r14,[fr,-12]
	add i1,#0x10
LBB65_50:
.line 290
	ld r0,r14
	sra r0,#0x5
	sll r0,#0x2
	add r0,i1
	add i1,#0xfffffff0
	and r14,#0x1f
	sll r3,r14
	ld r14,[r0]
	or r14,r3
	ld [r0],r14
LBE65_50:
.line 728
	ld r0,[r15,4]
	and r0,#0x2
	ld r14,[fr,-8]
	or r0,r14
L174_50:
.line 731
	ld [r15,4],r0
.line 734
	ld r14,r0
	and r14,#0xfffffffc
	ld r3,[i1,4]
	add r14,r3
	add r14,#0x8
	ld [i1,4],r14
	ld r0,[i1,8]
	jc leu,r14,r0,&L171_50
	ld [i1,8],r14
L171_50:
.line 736
	ld r14,r15
	add r14,#0x8
.line 737
	add sp,#0xc
	pop fr,fr
	ret
L106_50:
.line 284
	ld r0,#0xffff
	jc gtu,r14,r0,&L108_50
	ld r0,#0x0
	ld r1,#0xff
	jc gtu,r14,r1,&L175_50
L109_50:
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r0,r14
LBE69_50:
.line 280
	add r0,#0xfffffffb
	ld r2,#0x1
	sll r2,r0
	add r2,#0xffffffff
.line 307
	ld r1,[r3]
	add r1,r2
LBB70_50:
.line 284
	ld r14,#0xffff
	jc gtu,r1,r14,&L115_50
L179_50:
	ld r0,#0x0
	ld r14,#0xff
	jc leu,r1,r14,&L116_50
	ld r0,#0x8
L116_50:
	ld r14,r1
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r0,r14
LBE71_50:
.line 309
	add r0,#0xfffffffb
	ld r14,r1
	srl r14,r0
	add r14,#0xffffffe0
	ld [r5],r14
.line 310
	add r0,#0xffffffff
	ld [r4],r0
.line 314
	not r14,r2
	and r1,r14
	ld [r3],r1
	ld r0,[fr,-16]
LBE67_50:
.line 333
	ld r1,[fr,-12]
	ld r14,r1
	sll r14,#0x2
	add r14,i1
	ld r2,#0xffffffff
	ld r3,r2
	sll r3,r0
	ld r0,r3
	ld r14,[r14,20]
	and r0,r14
.line 334
	ld r15,#0x0
.line 336
	jc ne,r0,r15,&L176_50
L123_50:
.line 271
	add r1,#0x1
	ld r14,r2
	sll r14,r1
	ld r3,[i1,16]
	and r14,r3
LBB75_50:
.line 273
	neg r0,r14
	and r0,r14
.line 275
	ld r14,#0xffff
	jc gtu,r0,r14,&L132_50
	ld r14,#0x0
	ld r1,#0xff
	jc gtu,r0,r1,&L177_50
L133_50:
	srl r0,r14
	sll r0,#0x2
	ld r1,[r0,_table_50]
	add r1,r14
LBE75_50:
.line 271
	ld [r4],r1
.line 341
	ld r3,#0x0
	jc le,r1,r3,&L173_50
L178_50:
.line 271
	ld r14,r1
	sll r14,#0x2
	add r14,i1
	ld r14,[r14,20]
LBB77_50:
.line 273
	neg r0,r14
	and r0,r14
.line 275
	ld r14,#0xffff
	jc gtu,r0,r14,&L140_50
	ld r14,r3
	ld r2,#0xff
	jc leu,r0,r2,&L141_50
	ld r14,#0x8
L141_50:
	srl r0,r14
	sll r0,#0x2
	ld r0,[r0,_table_50]
	add r14,r0
LBE77_50:
.line 271
	ld [r5],r14
.line 343
	sll r1,#0x5
	add r1,r14
	sll r1,#0x2
	add r1,i1
	ld r15,[r1,116]
	jp &L131_50
L132_50:
.line 275
	ld r14,#0x10
	ld r2,#0xffffff
	jc leu,r0,r2,&L133_50
	ld r14,#0x18
	srl r0,r14
	sll r0,#0x2
	ld r1,[r0,_table_50]
	add r1,r14
LBE79_50:
.line 271
	ld [r4],r1
.line 341
	ld r3,#0x0
	jc gt,r1,r3,&L178_50
L173_50:
.line 712
	ld r14,r15
.line 737
	add sp,#0xc
	pop fr,fr
	ret
L108_50:
.line 284
	ld r0,#0x10
	ld r2,#0xffffff
	jc leu,r14,r2,&L109_50
	ld r0,#0x18
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r0,r14
LBE83_50:
.line 280
	add r0,#0xfffffffb
	ld r2,#0x1
	sll r2,r0
	add r2,#0xffffffff
.line 307
	ld r1,[r3]
	add r1,r2
LBB84_50:
.line 284
	ld r14,#0xffff
	jc leu,r1,r14,&L179_50
L115_50:
	ld r0,#0x10
	ld r14,#0xffffff
	jc leu,r1,r14,&L116_50
	ld r0,#0x18
	jp &L116_50
L124_50:
.line 275
	ld r0,#0x10
	ld r2,#0xffffff
	jc leu,r14,r2,&L125_50
	ld r0,#0x18
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r0,r14
LBE89_50:
.line 271
	ld [r5],r0
.line 338
	ld r14,[r4]
	sll r14,#0x5
	add r14,r0
	sll r14,#0x2
	add r14,i1
	ld r15,[r14,116]
	jp &L131_50
L177_50:
.line 275
	ld r14,#0x8
	jp &L133_50
L175_50:
.line 284
	ld r0,#0x8
	jp &L109_50
L155_50:
.line 730
	ld r14,[r1,4]
	and r14,#0xfffffffd
	ld [r1,4],r14
.line 731
	ld r0,[r15,4]
	and r0,#0xfffffffe
	jp &L174_50
L150_50:
.line 294
	sll r1,#0x2
	add r1,i1
	add r1,#0x14
LBB97_50:
.line 295
	ld r0,r2
	sra r0,#0x5
	sll r0,#0x2
	add r0,r1
	and r2,#0x1f
	ld i0,#0x1
	ld r14,i0
	sll r14,r2
	not r14,r14
	ld r1,[r0]
	and r14,r1
	ld [r0],r14
LBE97_50:
.line 714
	ld r1,[fr,-12]
	ld r14,r1
	sll r14,#0x2
	add r14,i1
	ld r14,[r14,20]
	jc ne,r14,r3,&L151_50
LBB98_50:
.line 294
	add i1,#0x10
LBB99_50:
.line 295
	ld r0,r1
	sra r0,#0x5
	sll r0,#0x2
	add r0,i1
	add i1,#0xfffffff0
	and r1,#0x1f
	sll i0,r1
	not r14,i0
	ld r2,[r0]
	and r14,r2
	ld [r0],r14
	jp &L151_50
L156_50:
.line 284
	ld r14,#0xffff
	jc gtu,r0,r14,&L158_50
	ld r1,#0x0
	ld r2,#0xff
	jc leu,r0,r2,&L159_50
	ld r1,#0x8
L159_50:
	ld r14,r0
	srl r14,r1
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r1
LBE103_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [r5],r0
.line 326
	add r14,#0xffffffff
	ld [r4],r14
	jp &L165_50
L140_50:
.line 275
	ld r14,#0x10
	ld r3,#0xffffff
	jc leu,r0,r3,&L141_50
	ld r14,#0x18
	jp &L141_50
L158_50:
.line 284
	ld r1,#0x10
	ld r14,#0xffffff
	jc leu,r0,r14,&L159_50
	ld r1,#0x18
	jp &L159_50

//****************************************
// Function: _tlsf_malloc
//****************************************

.func _tlsf_malloc_50, 1, int
.line 601
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 621
	ld i1,[zr,_mp_50]
	call &_malloc_ex_50
.line 626
	pop rt,fr
	ret

//****************************************
// Function: _tlsf_free
//****************************************

.func _tlsf_free_50, 1, void
.line 630
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 635
	ld i1,[zr,_mp_50]
	call &_free_ex_50
	pop rt,fr
	ret

//****************************************
// Function: _tlsf_block_size
//****************************************

.func _tlsf_block_size_50, 1, int
.line 741
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 744
	ld r14,[i0,-4]
.line 745
	and r14,#0xfffffffc
	pop fr,fr
	ret

//****************************************
// Function: _realloc_ex
//****************************************

.func _realloc_ex_50, 3, int
.line 788
	push rt,d4
	sub sp,#0x8
	ld fr,sp
	add fr,#0x24
	ld d1,i0
	ld d0,i1
	ld d2,i2
.line 797
	ld r0,#0x0
	jc eq,i0,r0,&L286_50
.line 802
	ld r2,#0x0
	jc eq,i1,r2,&L282_50
.line 807
	ld d3,i0
	add d3,#0xfffffff8
.line 808
	ld r14,[d3,4]
	ld r1,r14
	and r1,#0xfffffffc
	add r1,d3
	add r1,#0x8
.line 809
	ld d4,#0x8
	ld r3,#0x7
	jc gtu,i1,r3,&L287_50
.line 810
	ld r2,r14
	and r2,#0xfffffffc
.line 811
	jc gtu,d4,r2,&L202_50
L290_50:
.line 812
	ld r14,[d2,4]
	sub r14,r2
	add r14,#0xfffffff8
	ld [d2,4],r14
.line 813
	ld r5,[r1,4]
	ld r14,r5
	and r14,#0x1
	ld r0,#0x0
	jc eq,r14,r0,&L204_50
LBB112_50:
.line 319
	ld r0,r5
	and r0,#0xfffffffc
LBB113_50:
.line 320
	ld r3,#0x7f
	jc gtu,r0,r3,&L205_50
.line 321
	ld r14,#0x0
	ld [fr,-32],r14
.line 322
	srl r0,#0x2
	ld [fr,-36],r0
L214_50:
.line 815
	ld r14,[r1,12]
	ld r0,#0x0
	jc eq,r14,r0,&L216_50
	ld r3,[r1,8]
	ld [r14,8],r3
L216_50:
	ld r14,[r1,8]
	ld r0,#0x0
	jc eq,r14,r0,&L217_50
	ld r3,[r1,12]
	ld [r14,12],r3
L217_50:
	ld r3,[fr,-32]
	ld r0,r3
	sll r0,#0x5
	ld r4,[fr,-36]
	add r0,r4
	sll r0,#0x2
	add r0,d2
	add r0,#0x74
	ld r14,[r0]
	jc eq,r14,r1,&L288_50
L218_50:
	ld r14,#0x0
	ld [r1,8],r14
	ld [r1,12],r14
.line 816
	ld r14,r5
	and r14,#0xfffffffc
	add r2,r14
	add r2,#0x8
.line 817
	add r1,r14
	add r1,#0x8
L204_50:
.line 821
	sub r2,d4
.line 822
	ld r0,#0xf
	jc leu,r2,r0,&L280_50
.line 823
	add r2,#0xfffffff8
.line 824
	ld r3,d3
	add r3,d4
	add r3,#0x8
.line 825
	ld r14,r2
	or r14,#0x1
	ld [r3,4],r14
.line 826
	ld [r1],r3
.line 827
	ld r14,[r1,4]
	or r14,#0x2
	ld [r1,4],r14
LBB114_50:
.line 320
	ld r14,#0x7f
	jc leu,r2,r14,&L285_50
LBB116_50:
.line 284
	ld r14,#0xffff
	jc leu,r2,r14,&L289_50
	ld r0,#0x10
	ld r14,#0xffffff
	jc leu,r2,r14,&L227_50
	ld r0,#0x18
L227_50:
	ld r14,r2
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r0
LBE117_50:
.line 325
	add r14,#0xfffffffb
	srl r2,r14
	add r2,#0xffffffe0
	ld [fr,-36],r2
.line 326
	add r14,#0xffffffff
	ld [fr,-32],r14
	jp &L271_50
L287_50:
.line 809
	ld d4,i1
	add d4,r3
	and d4,#0xfffffff8
.line 810
	ld r2,r14
	and r2,#0xfffffffc
.line 811
	jc leu,d4,r2,&L290_50
L202_50:
.line 835
	ld r0,[r1,4]
	ld r14,r0
	and r14,#0x1
	ld r3,#0x0
	jc eq,r14,r3,&L240_50
.line 836
	ld r14,r0
	and r14,#0xfffffffc
	add r14,r2
	jc ltu,r14,d4,&L240_50
.line 837
	ld r14,[d2,4]
	sub r14,r2
	add r14,#0xfffffff8
	ld [d2,4],r14
LBB118_50:
.line 319
	ld r5,[r1,4]
	ld r0,r5
	and r0,#0xfffffffc
	ld r8,fr
	add r8,#0xffffffe0
	ld r7,fr
	add r7,#0xffffffdc
LBB119_50:
.line 320
	ld r14,#0x7f
	jc gtu,r0,r14,&L243_50
.line 321
	ld [fr,-32],r3
.line 322
	srl r0,#0x2
	ld [fr,-36],r0
L252_50:
.line 839
	ld r14,[r1,12]
	ld r0,#0x0
	jc eq,r14,r0,&L254_50
	ld r2,[r1,8]
	ld [r14,8],r2
L254_50:
	ld r14,[r1,8]
	ld r3,#0x0
	jc eq,r14,r3,&L255_50
	ld r0,[r1,12]
	ld [r14,12],r0
L255_50:
	ld r2,[fr,-32]
	ld r0,r2
	sll r0,#0x5
	ld r3,[fr,-36]
	add r0,r3
	sll r0,#0x2
	add r0,d2
	add r0,#0x74
	ld r14,[r0]
	jc eq,r14,r1,&L291_50
L256_50:
	ld r14,#0x0
	ld [r1,8],r14
	ld [r1,12],r14
.line 840
	ld r14,r5
	and r14,#0xfffffffc
	ld r0,[d3,4]
	add r14,r0
	add r14,#0x8
	ld [d3,4],r14
.line 841
	ld r1,r14
	and r1,#0xfffffffc
	add r1,d3
	add r1,#0x8
.line 843
	ld r14,[r1,4]
	and r14,#0xfffffffd
	ld [r1,4],r14
.line 844
	ld r14,[d3,4]
	ld r2,r14
	and r2,#0xfffffffc
	sub r2,d4
.line 845
	ld r3,#0xf
	jc leu,r2,r3,&L281_50
.line 846
	add r2,#0xfffffff8
.line 847
	ld r3,d3
	add r3,d4
	add r3,#0x8
.line 848
	ld r14,r2
	or r14,#0x1
	ld [r3,4],r14
.line 849
	ld [r1],r3
.line 850
	ld r14,[r1,4]
	or r14,#0x2
	ld [r1,4],r14
LBB120_50:
.line 320
	ld r14,#0x7f
	jc gtu,r2,r14,&L262_50
L285_50:
.line 321
	ld r0,#0x0
	ld [fr,-32],r0
.line 322
	srl r2,#0x2
	ld [fr,-36],r2
L271_50:
.line 852
	ld r0,#0x0
	ld [r3,8],r0
	ld r14,[fr,-32]
	sll r14,#0x5
	ld r2,[fr,-36]
	add r14,r2
	sll r14,#0x2
	add r14,d2
	add r14,#0x74
	ld r0,[r14]
	ld [r3,12],r0
	ld r14,[r14]
	ld r2,#0x0
	jc eq,r14,r2,&L273_50
	ld [r14,8],r3
L273_50:
	ld r0,[fr,-32]
	ld r14,r0
	sll r14,#0x5
	ld r2,[fr,-36]
	add r14,r2
	sll r14,#0x2
	add r14,d2
	ld [r14,116],r3
LBB122_50:
.line 289
	sll r0,#0x2
	add r0,d2
	add r0,#0x14
LBB123_50:
.line 290
	ld r1,r2
	sra r1,#0x5
	sll r1,#0x2
	add r1,r0
	and r2,#0x1f
	ld r3,#0x1
	ld r0,r3
	sll r0,r2
	ld r14,[r1]
	or r14,r0
	ld [r1],r14
LBE123_50:
.line 289
	ld r14,[fr,-32]
	add d2,#0x10
LBB125_50:
.line 290
	ld r0,r14
	sra r0,#0x5
	sll r0,#0x2
	add r0,d2
	add d2,#0xfffffff0
	and r14,#0x1f
	sll r3,r14
	ld r14,[r0]
	or r14,r3
	ld [r0],r14
LBE125_50:
.line 853
	ld r14,[d3,4]
	and r14,#0x2
	or r14,d4
	ld [d3,4],r14
L261_50:
.line 855
	and r14,#0xfffffffc
	ld r3,[d2,4]
	add r14,r3
	add r14,#0x8
	ld [d2,4],r14
	ld r0,[d2,8]
	jc leu,r14,r0,&L276_50
	ld [d2,8],r14
L276_50:
.line 856
	ld i0,d3
	add i0,#0x8
.line 868
	ld r14,i0
	add sp,#0x8
	pop rt,d4
	ret
L240_50:
.line 860
	ld i0,d4
	ld i1,d2
	call &_malloc_ex_50
	ld d0,r14
.line 862
	ld i2,[d3,4]
	and i2,#0xfffffffc
	jc leu,i2,d4,&L278_50
	ld i2,d4
L278_50:
.line 864
	ld i0,d0
	ld i1,d1
	syscall 5
.line 866
	ld i0,d1
L282_50:
	ld i1,d2
	call &_free_ex_50
.line 867
	ld i0,d0
L194_50:
.line 868
	ld r14,i0
	add sp,#0x8
	pop rt,d4
	ret
L280_50:
	ld r14,[d3,4]
	jp &L261_50
L286_50:
.line 801
	ld i0,r0
.line 798
	jc eq,i1,d1,&L194_50
.line 799
	ld i0,i1
	ld i1,i2
	call &_malloc_ex_50
	ld i0,r14
.line 868
	ld r14,i0
	add sp,#0x8
	pop rt,d4
	ret
L205_50:
.line 284
	ld r3,#0xffff
	jc leu,r0,r3,&L292_50
	ld r3,#0x10
	ld r14,#0xffffff
	jc leu,r0,r14,&L208_50
	ld r3,#0x18
L208_50:
	ld r14,r0
	srl r14,r3
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r3
LBE129_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [fr,-36],r0
.line 326
	add r14,#0xffffffff
	ld [fr,-32],r14
	jp &L214_50
L281_50:
	ld [r1],d3
	jp &L261_50
L243_50:
.line 284
	ld r2,#0xffff
	jc leu,r0,r2,&L293_50
	ld r2,#0x10
	ld r14,#0xffffff
	jc leu,r0,r14,&L246_50
	ld r2,#0x18
L246_50:
	ld r14,r0
	srl r14,r2
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r2
LBE133_50:
.line 325
	add r14,#0xfffffffb
	srl r0,r14
	add r0,#0xffffffe0
	ld [r7],r0
.line 326
	add r14,#0xffffffff
	ld [r8],r14
	jp &L252_50
L292_50:
.line 284
	ld r3,#0x0
	ld r14,#0xff
	jc leu,r0,r14,&L208_50
	ld r3,#0x8
	jp &L208_50
L289_50:
	ld r0,#0x0
	ld r14,#0xff
	jc leu,r2,r14,&L227_50
	ld r0,#0x8
	jp &L227_50
L262_50:
	ld r14,#0xffff
	jc gtu,r2,r14,&L264_50
	ld r0,#0x0
	ld r14,#0xff
	jc leu,r2,r14,&L265_50
	ld r0,#0x8
L265_50:
	ld r14,r2
	srl r14,r0
	sll r14,#0x2
	ld r14,[r14,_table_50]
	add r14,r0
LBE145_50:
.line 325
	add r14,#0xfffffffb
	srl r2,r14
	add r2,#0xffffffe0
	ld [r7],r2
.line 326
	add r14,#0xffffffff
	ld [r8],r14
	jp &L271_50
L293_50:
.line 284
	ld r2,#0x0
	ld r3,#0xff
	jc leu,r0,r3,&L246_50
	ld r2,#0x8
	jp &L246_50
L288_50:
.line 815
	ld r14,[r1,12]
	ld [r0],r14
	ld r6,r14
	ld r0,#0x0
	jc ne,r14,r0,&L218_50
LBB150_50:
.line 294
	sll r3,#0x2
	add r3,d2
	add r3,#0x14
LBB151_50:
.line 295
	ld r0,r4
	sra r0,#0x5
	sll r0,#0x2
	add r0,r3
	and r4,#0x1f
	ld r7,#0x1
	ld r14,r7
	sll r14,r4
	not r14,r14
	ld r3,[r0]
	and r14,r3
	ld [r0],r14
LBE151_50:
.line 815
	ld r3,[fr,-32]
	ld r14,r3
	sll r14,#0x2
	add r14,d2
	ld r14,[r14,20]
	jc ne,r14,r6,&L218_50
LBB152_50:
.line 294
	add d2,#0x10
LBB153_50:
.line 295
	ld r0,r3
	sra r0,#0x5
	sll r0,#0x2
	add r0,d2
	add d2,#0xfffffff0
	and r3,#0x1f
	sll r7,r3
	not r14,r7
	ld r3,[r0]
	and r14,r3
	ld [r0],r14
	jp &L218_50
L291_50:
.line 839
	ld r14,[r1,12]
	ld [r0],r14
	ld r4,r14
	ld r0,#0x0
	jc ne,r14,r0,&L256_50
LBB154_50:
.line 294
	sll r2,#0x2
	add r2,d2
	add r2,#0x14
LBB155_50:
.line 295
	ld r0,r3
	sra r0,#0x5
	sll r0,#0x2
	add r0,r2
	and r3,#0x1f
	ld r6,#0x1
	ld r14,r6
	sll r14,r3
	not r14,r14
	ld r2,[r0]
	and r14,r2
	ld [r0],r14
LBE155_50:
.line 839
	ld r2,[fr,-32]
	ld r14,r2
	sll r14,#0x2
	add r14,d2
	ld r14,[r14,20]
	jc ne,r14,r4,&L256_50
LBB156_50:
.line 294
	add d2,#0x10
LBB157_50:
.line 295
	ld r0,r2
	sra r0,#0x5
	sll r0,#0x2
	add r0,d2
	add d2,#0xfffffff0
	and r2,#0x1f
	sll r6,r2
	not r14,r6
	ld r3,[r0]
	and r14,r3
	ld [r0],r14
	jp &L256_50
L264_50:
.line 284
	ld r0,#0x10
	ld r14,#0xffffff
	jc leu,r2,r14,&L265_50
	ld r0,#0x18
	jp &L265_50

//****************************************
// Function: _tlsf_realloc
//****************************************

.func _tlsf_realloc_50, 2, int
.line 643
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 655
	ld i2,[zr,_mp_50]
	call &_realloc_ex_50
.line 660
	pop rt,fr
	ret

//****************************************
// Function: ___cxa_pure_virtual
//****************************************

.func ___cxa_pure_virtual_53, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\macpp.cpp'
.line 20
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_53:
.line 21
	ld i0,#0xffffffd6
	syscall 2

//****************************************
// Function: crt0_startup
//****************************************

.global crt0_startup
.func crt0_startup, 3, void
.sourcefile 'crtlib.s'
.line 1
	ld [zr,__memtop_58],i0
	sub sp,#0x10
	ld [zr,__stacktop_58],sp
	ld i0,sp
	sub i0,i1
	sub i0,i2
	ld i1,i2
	call &_ansi_heap_init_crt0_31
	ld i0,&__global_ctor_chain_100
	call &_crt_tor_chain_27
	call &_MAMain_13
crt_exit_58:
	ld [sp],r14
	ld i0,&__global_dtor_chain_100
	call &_crt_tor_chain_27
	ld i0,[sp]
	syscall 2
	ret

//****************************************
// Function: _rotate_left
//****************************************

.func _rotate_left_60, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\kazlib\dict.c'
.line 87
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 90
	ld r1,[i0,4]
.line 91
	ld r14,[r1]
	ld [i0,4],r14
.line 92
	ld [r14,8],i0
.line 94
	ld r0,[i0,8]
	ld [r1,8],r0
.line 99
	ld r14,[r0]
	jc eq,r14,i0,&L7_60
.line 102
	ld r14,[r0,4]
	jc ne,r14,i0,&L8_60
.line 103
	ld [r0,4],r1
.line 106
	ld [r1],i0
.line 107
	ld [i0,8],r1
	pop rt,fr
	ret
L7_60:
.line 100
	ld [r0],r1
.line 106
	ld [r1],i0
.line 107
	ld [i0,8],r1
	pop rt,fr
	ret
L8_60:
.line 102
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x66
	call &_bfeHandler_28

//****************************************
// Function: _rotate_right
//****************************************

.func _rotate_right_60, 1, void
.line 116
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 119
	ld r1,[i0]
.line 120
	ld r14,[r1,4]
	ld [i0],r14
.line 121
	ld [r14,8],i0
.line 123
	ld r0,[i0,8]
	ld [r1,8],r0
.line 125
	ld r14,[r0,4]
	jc eq,r14,i0,&L14_60
.line 128
	ld r14,[r0]
	jc ne,r14,i0,&L15_60
.line 129
	ld [r0],r1
.line 132
	ld [r1,4],i0
.line 133
	ld [i0,8],r1
	pop rt,fr
	ret
L14_60:
.line 126
	ld [r0,4],r1
.line 132
	ld [r1,4],i0
.line 133
	ld [i0,8],r1
	pop rt,fr
	ret
L15_60:
.line 128
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x80
	call &_bfeHandler_28

//****************************************
// Function: _free_nodes
//****************************************

.func _free_nodes_60, 3, void
.line 142
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d2,i0
	ld d1,i1
	ld d0,i2
.line 143
	jc eq,i1,i2,&L16_60
.line 145
	ld i1,[i1]
	call &_free_nodes_60
.line 146
	ld i0,d2
	ld i1,[d1,4]
	ld i2,d0
	call &_free_nodes_60
.line 147
	ld d0,[d2,40]
	ld i0,d1
	ld i1,[d2,44]
	call d0
L16_60:
.line 148
	pop rt,d2
	ret

//****************************************
// Function: _dict_first
//****************************************

.func _dict_first_60, 1, int
.line 851
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 852
	ld r15,[i0]
.line 854
	jc eq,r15,i0,&L24_60
.line 856
	ld r14,[r15]
	jc eq,r14,i0,&L27_60
L29_60:
	ld r15,r14
	ld r14,[r14]
	jc ne,r14,i0,&L29_60
L27_60:
.line 858
	ld r14,r15
	jc eq,r15,i0,&L24_60
.line 859
	pop fr,fr
	ret
L24_60:
.line 858
	ld r14,#0x0
.line 859
	pop fr,fr
	ret

//****************************************
// Function: _dict_next
//****************************************

.func _dict_next_60, 2, int
.line 885
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 888
	ld r14,[i1,4]
	jc eq,r14,i0,&L31_60
.line 889
	ld i1,r14
.line 891
	ld r14,[r14]
	jc eq,r14,i0,&L30_60
L44_60:
	ld i1,r14
	ld r14,[r14]
	jc ne,r14,i0,&L44_60
L30_60:
.line 903
	ld r14,i1
	pop fr,fr
	ret
L31_60:
.line 895
	ld r15,[i1,8]
.line 899
	jc eq,r15,i0,&L38_60
	ld r14,[r15,4]
	jc eq,r14,i1,&L37_60
.line 902
	ld i1,r15
	jc ne,r15,i0,&L30_60
L38_60:
	ld i1,#0x0
	jp &L30_60
L37_60:
.line 898
	ld i1,r15
.line 899
	ld r15,[r15,8]
	jc eq,r15,i0,&L38_60
	ld r14,[r15,4]
	jc eq,r14,i1,&L37_60
.line 902
	ld i1,r15
	jc ne,r15,i0,&L30_60
	jp &L38_60

//****************************************
// Function: _verify_bintree
//****************************************

.func _verify_bintree_60, 1, int
.line 160
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
.line 163
	call &_dict_first_60
	ld d2,r14
.line 165
	ld r14,[d3,48]
	ld r0,#0x0
	jc eq,r14,r0,&L52_60
.line 169
	ld r14,#0x0
	jc eq,d2,r14,&L51_60
L57_60:
	ld i0,d3
	ld i1,d2
	call &_dict_next_60
	ld d1,r14
	ld r0,#0x0
	jc eq,r14,r0,&L51_60
.line 167
	ld d0,[d3,32]
	ld i0,[d2,16]
	ld i1,[d1,16]
	call d0
	ld r0,#0x0
	jc gt,r14,r0,&L56_60
.line 169
	ld d2,d1
	ld r14,#0x0
	jc ne,d2,r14,&L57_60
L51_60:
.line 178
	ld r14,#0x1
.line 179
	pop rt,d3
	ret
L52_60:
.line 175
	ld r14,#0x0
	jc eq,d2,r14,&L51_60
	ld i0,d3
	ld i1,d2
	call &_dict_next_60
	ld d1,r14
	ld r0,#0x0
	jc eq,r14,r0,&L51_60
.line 173
	ld d0,[d3,32]
	ld i0,[d2,16]
	ld i1,[d1,16]
	call d0
	ld r0,#0x0
	jc ge,r14,r0,&L56_60
.line 175
	ld d2,d1
	jp &L52_60
L56_60:
.line 174
	ld r14,r0
.line 179
	pop rt,d3
	ret

//****************************************
// Function: _verify_redblack
//****************************************

.func _verify_redblack_60, 2, int
.line 196
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d1,i1
.line 217
	ld r0,#0x1
.line 199
	jc eq,i1,i0,&L58_60
.line 200
	ld i1,[i1]
	call &_verify_redblack_60
	ld d2,r14
.line 201
	ld i0,d0
	ld i1,[d1,4]
	call &_verify_redblack_60
.line 202
	ld r0,#0x0
	jc ne,d2,r0,&L68_60
L62_60:
.line 203
	ld r0,#0x0
L58_60:
.line 218
	ld r14,r0
	pop rt,d2
	ret
L68_60:
.line 202
	jc eq,r14,r0,&L62_60
.line 205
	ld r0,#0x0
.line 204
	jc ne,d2,r14,&L58_60
.line 206
	ld r14,[d1,12]
	jc ne,r14,r0,&L64_60
.line 207
	ld r14,[d1]
	ld r1,[r14,12]
	ld r14,#0x1
	jc ne,r1,r14,&L58_60
.line 209
	ld r14,[d1,4]
	ld r14,[r14,12]
	jc ne,r14,r1,&L58_60
.line 211
	ld r0,d2
	jp &L58_60
L64_60:
.line 214
	ld r0,#0x0
.line 213
	ld r1,#0x1
	jc ne,r14,r1,&L58_60
.line 215
	ld r0,d2
	add r0,r1
	jp &L58_60

//****************************************
// Function: _verify_node_count
//****************************************

.func _verify_node_count_60, 2, int
.line 227
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d2,i0
	ld d1,i1
.line 229
	ld r14,#0x0
.line 228
	jc eq,i1,i0,&L69_60
.line 231
	ld i1,[i1]
	call &_verify_node_count_60
	ld d0,r14
	ld i0,d2
	ld i1,[d1,4]
	call &_verify_node_count_60
	add r14,d0
	add r14,#0x1
L69_60:
.line 233
	pop rt,d2
	ret

//****************************************
// Function: _verify_dict_has_node
//****************************************

.func _verify_dict_has_node_60, 3, int
.line 243
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d0,i1
	ld d2,i2
.line 249
	ld r14,#0x0
.line 244
	jc eq,i1,i0,&L73_60
.line 245
	ld d3,r14
	jc eq,i1,i2,&L76_60
	ld i1,[i1]
	call &_verify_dict_has_node_60
	jc eq,r14,d3,&L78_60
L76_60:
	ld d3,#0x1
L75_60:
	ld r14,d3
L73_60:
.line 250
	pop rt,d3
	ret
L78_60:
.line 245
	ld i0,d1
	ld i1,[d0,4]
	ld i2,d2
	call &_verify_dict_has_node_60
	jc eq,r14,d3,&L75_60
	ld d3,#0x1
	jp &L75_60

//****************************************
// Function: _dict_free_nodes
//****************************************

.func _dict_free_nodes_60, 1, void
.line 309
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
.line 311
	ld i1,[i0]
	ld i2,i0
	call &_free_nodes_60
.line 312
	ld r14,#0x0
	ld [d0,24],r14
.line 313
	ld [d0],d0
.line 314
	ld [d0,4],d0
	pop rt,d0
	ret

//****************************************
// Function: _dict_init
//****************************************

.func _dict_init_60, 3, int
.line 334
	push fr,fr
	ld fr,sp
	add fr,#0x4
	ld r14,i0
.line 335
	ld [i0,32],i2
.line 336
	ld r0,&_dnode_alloc_60
	ld [i0,36],r0
.line 337
	ld r0,&_dnode_free_60
	ld [i0,40],r0
.line 338
	ld r0,#0x0
	ld [i0,44],r0
.line 339
	ld [i0,24],r0
.line 340
	ld [i0,28],i1
.line 341
	ld [r14],i0
.line 342
	ld [r14,4],i0
.line 343
	ld [r14,8],i0
.line 344
	ld r0,#0x1
	ld [i0,12],r0
.line 345
	ld r0,#0x0
	ld [i0,48],r0
.line 347
	pop fr,fr
	ret

//****************************************
// Function: _dict_verify
//****************************************

.func _dict_verify_60, 1, int
.line 392
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
.line 393
	ld d1,[i0]
.line 396
	ld r14,[d1,12]
.line 397
	ld r0,#0x0
.line 396
	ld r1,#0x1
	jc eq,r14,r1,&L121_60
L113_60:
.line 414
	ld r14,r0
	pop rt,d2
	ret
L121_60:
.line 398
	ld d2,[i0,12]
	jc ne,d2,r14,&L113_60
.line 400
	ld r14,[i0,4]
	jc ne,r14,i0,&L113_60
.line 403
	ld r14,[d1,8]
	jc ne,r14,i0,&L113_60
.line 406
	call &_verify_bintree_60
.line 407
	ld r0,r14
.line 406
	ld r1,#0x0
	jc eq,r14,r1,&L113_60
.line 409
	ld i0,d0
	ld i1,d1
	call &_verify_redblack_60
.line 410
	ld r0,r14
.line 409
	ld r1,#0x0
	jc eq,r14,r1,&L113_60
.line 411
	ld i0,d0
	ld i1,d1
	call &_verify_node_count_60
.line 412
	ld r0,#0x0
.line 411
	ld d0,[d0,24]
	jc ne,r14,d0,&L113_60
.line 413
	ld r0,d2
	jp &L113_60

//****************************************
// Function: _dict_lookup
//****************************************

.func _dict_lookup_60, 2, int
.line 449
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d2,i0
	ld d3,i1
.line 450
	ld d1,[i0]
L142_60:
.line 473
	jc eq,d1,d2,&L139_60
L145_60:
.line 458
	ld d0,[d2,32]
	ld i0,d3
	ld i1,[d1,16]
	call d0
.line 459
	ld r0,#0x0
	jc lt,r14,r0,&L144_60
.line 461
	ld r1,#0x0
	jc le,r14,r1,&L127_60
.line 462
	ld d1,[d1,4]
.line 473
	jc ne,d1,d2,&L145_60
L139_60:
.line 478
	ld r0,#0x0
L122_60:
.line 479
	ld r14,r0
	pop rt,d4
	ret
L144_60:
.line 460
	ld d1,[d1]
	jp &L142_60
L127_60:
.line 464
	ld r14,[d2,48]
.line 465
	ld r0,d1
.line 464
	ld r1,#0x0
	jc eq,r14,r1,&L122_60
.line 468
	ld d4,d1
.line 469
	ld d1,[d1]
L134_60:
.line 471
	jc eq,d1,d2,&L140_60
L147_60:
	ld d0,[d2,32]
	ld i0,d3
	ld i1,[d1,16]
	call d0
	ld r0,#0x0
	jc eq,r14,r0,&L146_60
	ld d1,[d1,4]
	jc ne,d1,d2,&L147_60
L140_60:
.line 473
	ld r0,d4
.line 479
	ld r14,r0
	pop rt,d4
	ret
L146_60:
.line 472
	jc eq,d1,d2,&L140_60
.line 468
	ld d4,d1
.line 469
	ld d1,[d1]
	jp &L134_60

//****************************************
// Function: _dict_contains
//****************************************

.func _dict_contains_60, 2, int
.line 959
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i2,i1
.line 960
	ld i1,[i0]
	call &_verify_dict_has_node_60
.line 961
	pop rt,fr
	ret

//****************************************
// Function: _dnode_is_in_a_dict
//****************************************

.func _dnode_is_in_a_dict_60, 1, int
.line 1016
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 1017
	ld r15,#0x0
	ld r14,[i0,8]
	jc eq,r14,r15,&L183_60
	ld r14,[i0]
	jc eq,r14,r15,&L183_60
	ld r14,[i0,4]
	jc eq,r14,r15,&L183_60
	ld r15,#0x1
L183_60:
.line 1018
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: _dict_insert
//****************************************

.func _dict_insert_60, 3, int
.line 554
	push rt,d6
	ld fr,sp
	add fr,#0x24
	ld d4,i0
	ld d3,i1
	ld d6,i2
.line 555
	ld d1,[i0]
.line 556
	ld d2,i0
.line 557
	ld d0,#0xffffffff
.line 559
	ld [d3,16],i2
.line 561
	ld r14,[i0,24]
	ld r0,[i0,28]
	jc eq,r14,r0,&L224_60
.line 562
	call &_dict_contains_60
	ld d5,r14
	ld r1,#0x0
	jc ne,r14,r1,&L225_60
.line 563
	ld i0,d3
	call &_dnode_is_in_a_dict_60
	jc ne,r14,d5,&L226_60
L223_60:
.line 576
	jc eq,d1,d4,&L197_60
L228_60:
.line 568
	ld d2,d1
.line 569
	ld d0,[d4,32]
	ld i0,d6
	ld i1,[d1,16]
	call d0
	ld d0,r14
.line 570
	ld r14,#0x0
	jc ne,d0,r14,&L193_60
	ld r14,[d4,48]
	jc eq,r14,d0,&L227_60
L194_60:
.line 576
	ld d1,[d1,4]
	jc ne,d1,d4,&L228_60
L197_60:
.line 581
	ld r1,#0x0
	jc lt,d0,r1,&L229_60
.line 584
	ld [d2,4],d3
L200_60:
.line 586
	ld [d3,8],d2
.line 587
	ld [d3],d4
.line 588
	ld [d3,4],d4
.line 590
	ld r14,[d4,24]
	add r14,#0x1
	ld [d4,24],r14
.line 594
	ld r14,#0x0
	ld [d3,12],r14
.line 635
	ld r14,[d2,12]
	ld r0,#0x0
	jc eq,r14,r0,&L215_60
	jp &L202_60
L203_60:
.line 620
	ld r0,[r14,12]
	ld r1,#0x0
	jc ne,r0,r1,&L230_60
L221_60:
.line 621
	ld r1,#0x1
	ld [d2,12],r1
.line 622
	ld [r14,12],r1
.line 623
	ld [d0,12],r0
.line 624
	ld d3,d0
.line 625
	ld d2,[d0,8]
.line 635
	ld r14,[d2,12]
	ld r1,#0x0
	jc ne,r14,r1,&L202_60
L215_60:
.line 597
	ld d0,[d2,8]
.line 598
	ld r14,[d0]
	jc ne,r14,d2,&L203_60
.line 599
	ld r14,[d0,4]
.line 600
	ld r0,[r14,12]
	ld r1,#0x0
	jc eq,r0,r1,&L221_60
.line 607
	ld r14,[d2,4]
	jc eq,r14,d3,&L231_60
L206_60:
.line 613
	ld r14,#0x1
	ld [d2,12],r14
.line 614
	ld r0,#0x0
	ld [d0,12],r0
.line 615
	ld i0,d0
	call &_rotate_right_60
L202_60:
.line 640
	ld r14,[d4]
	ld r0,#0x1
	ld [r14,12],r0
.line 642
	ld i0,d4
	call &_dict_verify_60
.line 644
	ld r0,#0x0
.line 642
	jc ne,r14,r0,&L184_60
L233_60:
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x282
	call &_bfeHandler_28
L193_60:
.line 573
	ld r0,#0x0
	jc ge,d0,r0,&L194_60
.line 574
	ld d1,[d1]
	jp &L223_60
L227_60:
.line 571
	ld r0,d1
L184_60:
.line 645
	ld r14,r0
	pop rt,d6
	ret
L229_60:
.line 582
	ld [d2],d3
	jp &L200_60
L230_60:
.line 627
	ld r14,[d2]
	jc eq,r14,d3,&L232_60
L212_60:
.line 632
	ld r14,#0x1
	ld [d2,12],r14
.line 633
	ld r0,#0x0
	ld [d0,12],r0
.line 634
	ld i0,d0
	call &_rotate_left_60
.line 640
	ld r14,[d4]
	ld r0,#0x1
	ld [r14,12],r0
.line 642
	ld i0,d4
	call &_dict_verify_60
.line 644
	ld r0,#0x0
.line 642
	jc ne,r14,r0,&L184_60
	jp &L233_60
L226_60:
.line 563
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x233
.line 642
	call &_bfeHandler_28
L232_60:
.line 628
	ld i0,d2
	call &_rotate_right_60
.line 629
	ld d2,d3
.line 630
	ld r14,[d3,8]
	jc eq,r14,d0,&L212_60
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x276
.line 642
	call &_bfeHandler_28
L224_60:
.line 561
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x231
.line 642
	call &_bfeHandler_28
L225_60:
.line 562
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x232
.line 642
	call &_bfeHandler_28
L231_60:
.line 608
	ld i0,d2
	call &_rotate_left_60
.line 609
	ld d2,d3
.line 610
	ld r14,[d3,8]
	jc eq,r14,d0,&L206_60
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x262
.line 642
	call &_bfeHandler_28

//****************************************
// Function: _dnode_init
//****************************************

.func _dnode_init_60, 2, int
.line 986
	push fr,fr
	ld fr,sp
	add fr,#0x4
	ld r14,i0
.line 987
	ld [i0,20],i1
.line 988
	ld r0,#0x0
	ld [i0,8],r0
.line 989
	ld [i0],r0
.line 990
	ld [i0,4],r0
.line 992
	pop fr,fr
	ret

//****************************************
// Function: _dict_isempty
//****************************************

.func _dict_isempty_60, 1, int
.line 949
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 950
	ld r15,#0x0
	ld r14,[i0,24]
	jc ne,r14,r15,&L368_60
	ld r15,#0x1
L368_60:
.line 951
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: _dnode_alloc
//****************************************

.func _dnode_alloc_60, 1, int
.line 964
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 965
	ld i0,#0x18
	call &_malloc_31
.line 966
	pop rt,fr
	ret

//****************************************
// Function: _dnode_free
//****************************************

.func _dnode_free_60, 2, void
.line 969
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 970
	call &_free_31
	pop rt,fr
	ret

//****************************************
// Function: _load_begin_internal
//****************************************

.func _load_begin_internal_60, 2, void
.line 1035
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 1036
	ld [i0],i1
.line 1037
	ld r14,i0
	add r14,#0x4
	ld [r14],r14
.line 1038
	ld [i0,8],r14
	pop fr,fr
	ret

//****************************************
// Function: _dict_load_begin
//****************************************

.func _dict_load_begin_60, 2, void
.line 1042
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
.line 1043
	ld i0,i1
	call &_dict_isempty_60
	ld r0,#0x0
	jc eq,r14,r0,&L396_60
.line 1044
	ld i0,d1
	ld i1,d0
	call &_load_begin_internal_60
	pop rt,d1
	ret
L396_60:
.line 1043
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x413
	call &_bfeHandler_28

//****************************************
// Function: _dict_load_next
//****************************************

.func _dict_load_next_60, 3, void
.line 1048
	push rt,d5
	ld fr,sp
	add fr,#0x20
	ld d2,i1
	ld d4,i2
.line 1049
	ld d1,[i0]
.line 1050
	ld d3,i0
	add d3,#0x4
.line 1052
	ld i0,i1
	call &_dnode_is_in_a_dict_60
	ld r0,#0x0
	jc ne,r14,r0,&L412_60
.line 1053
	ld r0,[d1,24]
	ld r14,[d1,28]
	jc geu,r0,r14,&L413_60
.line 1056
	ld r14,#0x0
	jc eq,r0,r14,&L402_60
.line 1057
	ld d5,[d1,48]
	jc eq,d5,r14,&L403_60
.line 1058
	ld r14,[d3]
	ld d0,[d1,32]
	ld i0,[r14,16]
	ld i1,d4
	call d0
	ld r0,#0x0
	jc gt,r14,r0,&L414_60
L410_60:
	ld r0,[d1,24]
L402_60:
.line 1064
	ld [d2,16],d4
.line 1065
	ld r14,[d3,4]
	ld [r14],d2
.line 1066
	ld [d3,4],d2
.line 1067
	ld [d2],d3
.line 1068
	add r0,#0x1
	ld [d1,24],r0
	pop rt,d5
	ret
L403_60:
.line 1060
	ld r14,[d3]
	ld d0,[d1,32]
	ld i0,[r14,16]
	ld i1,d4
	call d0
	jc lt,r14,d5,&L410_60
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x424
	call &_bfeHandler_28
L414_60:
.line 1058
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x422
.line 1060
	call &_bfeHandler_28
L412_60:
.line 1052
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x41c
.line 1060
	call &_bfeHandler_28
L413_60:
.line 1053
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x41d
.line 1060
	call &_bfeHandler_28

//****************************************
// Function: _dict_load_end
//****************************************

.func _dict_load_end_60, 1, void
.line 1072
	push rt,d1
	sub sp,#0x100
	ld fr,sp
	add fr,#0x110
	ld d0,i0
.line 1073
	ld d1,[i0]
.line 1074
	ld i0,fr
	add i0,#0xfffffef0
	ld i1,#0x0
	ld i2,#0x100
	syscall 4
.line 1075
	add d0,#0x4
.line 1076
	ld r2,#0x0
.line 1077
	ld r14,#0xffffffff
	ld r0,[d1,24]
.line 1079
	ld r6,r2
	ld r3,r2
L420_60:
.line 1084
	srl r14,#0x1
	jc ltu,r14,r0,&L419_60
	ld r1,#0x0
	jc ne,r14,r1,&L420_60
L419_60:
.line 1086
	ld r5,r0
	sub r5,r14
.line 1088
	ld r1,[d0]
	jc eq,r1,d0,&L458_60
L440_60:
.line 1089
	ld r4,[r1]
.line 1091
	ld r7,#0x0
	jc eq,r2,r7,&L460_60
L433_60:
.line 1123
	ld [r1],r2
.line 1124
	ld r14,r3
	add r14,#0x1
	and r14,#0x1
	ld [r1,12],r14
.line 1125
	ld [r2,8],r1
.line 1126
	sll r3,#0x2
	ld r14,#0xfffffff0
	add r14,fr
	add r3,r14
	ld [r3,-256],r1
.line 1127
	ld r2,#0x0
.line 1128
	ld r3,r6
L423_60:
.line 1088
	ld r1,r4
	jc ne,r4,d0,&L440_60
L464_60:
.line 1132
	ld r0,#0x0
	jc eq,r2,r0,&L458_60
L441_60:
.line 1135
	ld r1,#0x0
L446_60:
.line 1136
	ld r14,r1
	sll r14,#0x2
	ld r3,#0xfffffff0
	add r3,fr
	add r14,r3
	add r14,#0xffffff00
	ld r0,[r14]
	ld r7,#0x0
	jc eq,r0,r7,&L444_60
.line 1137
	ld [r0,4],r2
.line 1138
	ld r0,[r14]
	ld [r2,8],r0
.line 1139
	ld r2,[r14]
L444_60:
.line 1135
	add r1,#0x1
	ld r3,#0x3f
	jc leu,r1,r3,&L446_60
.line 1143
	ld r7,#0x1
	ld [d1,12],r7
.line 1144
	ld [d1,4],d1
.line 1145
	ld [r2,8],d1
.line 1146
	ld [r2,12],r7
.line 1147
	ld [d1],r2
.line 1149
	ld i0,d1
	call &_dict_verify_60
	ld r0,#0x0
	jc eq,r14,r0,&L461_60
.line 1150
	add sp,#0x100
	pop rt,d1
	ret
L458_60:
.line 1133
	ld r2,d1
	jp &L441_60
L460_60:
.line 1091
	add r5,#0xffffffff
	ld r14,#0xffffffff
	jc eq,r5,r14,&L462_60
L457_60:
.line 1110
	ld [r1],d1
.line 1111
	ld [r1,4],d1
.line 1112
	ld r14,r3
	and r14,#0x1
	ld [r1,12],r14
.line 1113
	ld r2,r1
.line 1115
	jc ne,r3,r6,&L463_60
.line 1120
	ld r0,r3
	sll r0,#0x2
	ld r1,#0xfffffff0
	add r1,fr
	add r0,r1
	ld r14,[r0,-256]
	ld r7,#0x0
	jc eq,r14,r7,&L423_60
L438_60:
.line 1117
	ld r14,r0
	add r14,#0xffffff00
	ld r0,[r14]
	ld [r0,4],r2
.line 1118
	ld r0,[r14]
	ld [r2,8],r0
.line 1119
	ld r2,[r14]
.line 1120
	ld r1,#0x0
	ld [r14],r1
	add r3,#0x1
	ld r0,r3
	sll r0,#0x2
	ld r7,#0xfffffff0
	add r7,fr
	add r0,r7
	ld r14,[r0,-256]
	jc ne,r14,r1,&L438_60
.line 1088
	ld r1,r4
	jc ne,r4,d0,&L440_60
	jp &L464_60
L462_60:
.line 1092
	jc ne,r6,r7,&L465_60
.line 1093
	ld r0,#0x0
	jc ne,r3,r0,&L466_60
.line 1094
	ld r3,#0x1
	ld r6,r3
.line 1095
	ld r2,[fr,-272]
.line 1097
	ld r7,#0x0
	jc eq,r2,r7,&L457_60
.line 1098
	ld [fr,-272],r7
.line 1099
	ld [r2,4],d1
.line 1104
	ld r14,[fr,-268]
	jc eq,r14,r7,&L424_60
	ld r0,#0x4
L432_60:
.line 1101
	ld r14,#0xfffffff0
	add r14,fr
	add r14,r0
	add r14,#0xffffff00
	ld r0,[r14]
	ld [r0,4],r2
.line 1102
	ld r0,[r14]
	ld [r2,8],r0
.line 1103
	ld r2,[r14]
.line 1104
	ld r7,#0x0
	ld [r14],r7
	add r3,#0x1
	ld r0,r3
	sll r0,#0x2
	ld r14,#0xfffffff0
	add r14,fr
	add r14,r0
	ld r14,[r14,-256]
	jc ne,r14,r7,&L432_60
L424_60:
.line 1109
	ld r14,#0x0
	jc ne,r2,r14,&L433_60
	jp &L457_60
L463_60:
.line 1115
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x45b
.line 1149
	call &_bfeHandler_28
L461_60:
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x47d
	call &_bfeHandler_28
L466_60:
.line 1093
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x445
.line 1149
	call &_bfeHandler_28
L465_60:
.line 1092
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x444
.line 1149
	call &_bfeHandler_28

//****************************************
// Function: _compute_bits
//****************************************

.func _compute_bits_61, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\kazlib\hash.c'
.line 89
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 90
	ld r14,#0xffffffff
.line 91
	ld r15,#0x0
L4_61:
.line 94
	add r15,#0x1
.line 95
	srl r14,#0x1
	ld r0,#0x0
	jc ne,r14,r0,&L4_61
.line 98
	ld [zr,_hash_val_t_bit_61],r15
	pop fr,fr
	ret

//****************************************
// Function: _is_power_of_two
//****************************************

.func _is_power_of_two_61, 1, int
.line 106
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 108
	ld r14,i0
.line 107
	ld r0,#0x0
	jc eq,i0,r0,&L8_61
.line 110
	xor r14,#0x1
	and r14,#0x1
	jc eq,r14,r0,&L15_61
L17_61:
	srl i0,#0x1
	ld r14,i0
	xor r14,#0x1
	and r14,#0x1
	ld r0,#0x0
	jc ne,r14,r0,&L17_61
L15_61:
.line 111
	ld r14,#0x0
	ld r0,#0x1
	jc eq,i0,r0,&L18_61
L8_61:
.line 112
	pop fr,fr
	ret
L18_61:
.line 111
	ld r14,i0
.line 112
	pop fr,fr
	ret

//****************************************
// Function: _clear_table
//****************************************

.func _clear_table_61, 1, void
.line 131
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 136
	ld i2,[i0,4]
	ld i0,[i0]
	ld i1,#0x0
	sll i2,#0x2
	syscall 4
	pop rt,fr
	ret

//****************************************
// Function: _hash_verify
//****************************************

.func _hash_verify_61, 1, int
.line 739
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
.line 740
	ld d1,#0x0
.line 744
	ld r14,[i0,48]
	jc eq,r14,d1,&L21_61
.line 745
	ld r14,[i0,20]
	ld i0,[i0,16]
.line 746
	ld r0,d1
.line 745
	jc ltu,r14,i0,&L39_61
L20_61:
.line 765
	ld r14,r0
	pop rt,d1
	ret
L39_61:
.line 747
	call &_is_power_of_two_61
.line 748
	ld r0,r14
.line 747
	ld r1,d1
	jc eq,r14,d1,&L20_61
.line 749
	ld i0,[d0,20]
	call &_is_power_of_two_61
.line 750
	ld r0,r14
.line 749
	ld r1,d1
	jc eq,r14,d1,&L20_61
L21_61:
.line 753
	ld r2,#0x0
	ld r3,[d0,4]
	jc leu,r3,r2,&L36_61
	ld r4,[d0]
L33_61:
.line 754
	ld r14,r2
	sll r14,#0x2
	add r14,r4
	ld r0,[r14]
	ld r14,#0x0
	jc eq,r0,r14,&L38_61
	ld r1,[d0,44]
L32_61:
.line 755
	ld r14,[r0,12]
	and r14,r1
	jc ne,r14,r2,&L40_61
.line 757
	add d1,#0x1
.line 754
	ld r0,[r0]
	ld r14,#0x0
	jc ne,r0,r14,&L32_61
L38_61:
.line 753
	add r2,#0x1
	jc gtu,r3,r2,&L33_61
L36_61:
.line 761
	ld r14,[d0,8]
.line 762
	ld r0,#0x0
.line 761
	jc ne,r14,d1,&L20_61
.line 764
	ld r0,#0x1
	jp &L20_61
L40_61:
.line 756
	ld r0,#0x0
.line 765
	ld r14,r0
	pop rt,d1
	ret

//****************************************
// Function: _hash_set_allocator
//****************************************

.func _hash_set_allocator_61, 4, void
.line 343
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 344
	ld r14,[i0,8]
	ld r0,#0x0
	jc ne,r14,r0,&L63_61
.line 345
	jc eq,i1,r14,&L64_61
L58_61:
	ld r14,#0x0
	jc eq,i1,r14,&L59_61
	jc eq,i2,r14,&L59_61
L56_61:
.line 347
	ld r14,i1
	ld r0,#0x0
	jc eq,i1,r0,&L65_61
L60_61:
	ld [i0,32],r14
.line 348
	ld r14,i2
	ld r0,#0x0
	jc eq,i2,r0,&L66_61
	ld [i0,36],r14
.line 349
	ld [i0,40],i3
	pop rt,fr
	ret
L59_61:
.line 345
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x159
	call &_bfeHandler_28
L64_61:
	jc ne,i2,i1,&L58_61
	jp &L56_61
L66_61:
.line 348
	ld r14,&_hnode_free_61
	ld [i0,36],r14
.line 349
	ld [i0,40],i3
	pop rt,fr
	ret
L65_61:
.line 347
	ld r14,&_hnode_alloc_61
	jp &L60_61
L63_61:
.line 344
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x158
.line 345
	call &_bfeHandler_28

//****************************************
// Function: _hash_scan_begin
//****************************************

.func _hash_scan_begin_61, 2, void
.line 449
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 450
	ld r0,[i1,4]
.line 453
	ld [i0],i1
.line 457
	ld r15,#0x0
	jc leu,r0,r15,&L69_61
	ld r1,[i1]
	ld r14,[r1]
	jc ne,r14,r15,&L69_61
L71_61:
	add r15,#0x1
	jc geu,r15,r0,&L72_61
	ld r14,r15
	sll r14,#0x2
	add r14,r1
	ld r14,[r14]
	ld r2,#0x0
	jc eq,r14,r2,&L71_61
L69_61:
.line 460
	jc geu,r15,r0,&L72_61
.line 461
	ld [i0,4],r15
.line 462
	sll r15,#0x2
	ld i1,[i1]
	add r15,i1
	ld r15,[r15]
	ld [i0,8],r15
.line 466
	pop fr,fr
	ret
L72_61:
.line 464
	ld r14,#0x0
	ld [i0,8],r14
.line 466
	pop fr,fr
	ret

//****************************************
// Function: _hash_scan_next
//****************************************

.func _hash_scan_next_61, 1, int
.line 507
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 508
	ld r2,[i0,8]
.line 509
	ld r3,[i0]
.line 510
	ld r0,[i0,4]
	add r0,#0x1
.line 511
	ld r1,[r3,4]
.line 513
	ld r14,[zr,_hash_val_t_bit_61]
	ld r4,#0x0
	jc eq,r14,r4,&L89_61
.line 515
	ld r5,#0x0
	jc eq,r2,r5,&L78_61
.line 516
	ld r14,[r2]
	jc ne,r14,r5,&L88_61
.line 520
	jc geu,r0,r1,&L84_61
	ld r4,[r3]
L87_61:
	ld r14,r0
	sll r14,#0x2
	add r14,r4
	ld r14,[r14]
	ld r5,#0x0
	jc ne,r14,r5,&L82_61
	add r0,#0x1
	jc ltu,r0,r1,&L87_61
L84_61:
.line 525
	ld r14,#0x0
L88_61:
	ld [i0,8],r14
L78_61:
.line 530
	ld r14,r2
	pop rt,fr
	ret
L82_61:
.line 521
	jc geu,r0,r1,&L84_61
.line 522
	ld [i0,4],r0
.line 523
	sll r0,#0x2
	ld r3,[r3]
	add r0,r3
	ld r0,[r0]
	ld [i0,8],r0
.line 530
	ld r14,r2
	pop rt,fr
	ret
L89_61:
.line 513
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x201
	call &_bfeHandler_28

//****************************************
// Function: _hash_init
//****************************************

.func _hash_init_61, 6, int
.line 416
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d0,i0
	ld d4,i1
	ld d2,i2
	ld d3,i3
	ld d1,[fr,4]
.line 417
	ld r14,[zr,_hash_val_t_bit_61]
	ld r0,#0x0
	jc eq,r14,r0,&L112_61
L99_61:
.line 420
	ld i0,d1
	call &_is_power_of_two_61
	ld r0,#0x0
	jc eq,r14,r0,&L113_61
.line 422
	ld r14,[fr]
	ld [d0],r14
.line 423
	ld [d0,4],d1
.line 424
	ld r0,#0x0
	ld [d0,8],r0
.line 425
	ld [d0,12],d4
.line 426
	ld r14,d2
	jc eq,d2,r0,&L114_61
L102_61:
	ld [d0,24],r14
.line 427
	ld r14,d3
	ld r0,#0x0
	jc eq,d3,r0,&L115_61
L103_61:
	ld [d0,28],r14
.line 428
	ld r14,#0x0
	ld [d0,48],r14
LBB2_61:
.line 120
	ld i0,d1
	call &_is_power_of_two_61
	ld r0,#0x0
	jc eq,r14,r0,&L116_61
.line 121
	ld r14,#0x1
	jc leu,d1,r14,&L117_61
	add d1,#0xffffffff
LBE3_61:
.line 119
	ld [d0,44],d1
.line 430
	ld i0,d0
	call &_clear_table_61
.line 432
	ld i0,d0
	call &_hash_verify_61
	ld r0,#0x0
	jc eq,r14,r0,&L118_61
.line 435
	ld r14,d0
	pop rt,d4
	ret
L112_61:
.line 418
	call &_compute_bits_61
	jp &L99_61
L115_61:
.line 427
	ld r14,&_hash_fun_default_61
	jp &L103_61
L114_61:
.line 426
	ld r14,&_hash_comp_default_61
	jp &L102_61
L113_61:
.line 420
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x1a4
.line 432
	call &_bfeHandler_28
L116_61:
.line 120
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x78
LBE5_61:
.line 432
	call &_bfeHandler_28
L117_61:
.line 121
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x79
LBE7_61:
.line 432
	call &_bfeHandler_28
L118_61:
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x1b0
	call &_bfeHandler_28

//****************************************
// Function: _hash_scan_init
//****************************************

.func _hash_scan_init_61, 3, void
.line 472
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 473
	ld [i0],i1
.line 474
	ld r14,#0x0
	jc eq,i2,r14,&L120_61
.line 475
	ld r14,[i2,12]
	ld i1,[i1,44]
	and r14,i1
	ld [i0,4],r14
L120_61:
.line 477
	ld [i0,8],i2
	pop fr,fr
	ret

//****************************************
// Function: _hash_lookup_hkey
//****************************************

.func _hash_lookup_hkey_61, 3, int
.line 605
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
	ld d2,i2
.line 609
	ld r14,[i0,44]
	and r14,i2
.line 611
	sll r14,#0x2
	ld r0,[i0]
	add r14,r0
	ld d1,[r14]
	ld r14,#0x0
	jc eq,d1,r14,&L128_61
L131_61:
.line 612
	ld r14,[d1,12]
	jc eq,r14,d2,&L130_61
L124_61:
.line 611
	ld d1,[d1]
	ld r14,#0x0
	jc ne,d1,r14,&L131_61
L128_61:
.line 616
	ld r14,#0x0
.line 617
	pop rt,d4
	ret
L130_61:
.line 612
	ld d0,[d3,24]
	ld i0,[d1,4]
	ld i1,d4
	call d0
	ld r0,#0x0
	jc ne,r14,r0,&L124_61
.line 613
	ld r14,d1
.line 617
	pop rt,d4
	ret

//****************************************
// Function: _hash_clone_insert
//****************************************

.func _hash_clone_insert_61, 2, int
.line 557
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
.line 561
	ld r14,[zr,_hash_val_t_bit_61]
	ld r0,#0x0
	jc eq,r14,r0,&L167_61
.line 562
	ld r14,[i0,8]
	ld r1,[i0,12]
	jc geu,r14,r1,&L168_61
.line 564
	ld i1,[i1,4]
	ld i2,[d1,12]
	call &_hash_lookup_hkey_61
	ld r0,r14
.line 566
	ld r1,r14
.line 565
	ld r10,#0x0
	jc eq,r14,r10,&L169_61
L132_61:
.line 581
	ld r14,r1
	pop rt,d1
	ret
L169_61:
.line 569
	ld r14,[d0,48]
	jc eq,r14,r0,&L164_61
	ld r0,[d0,8]
	ld r14,[d0,16]
	jc ltu,r0,r14,&L138_61
LBB8_61:
.line 171
	ld i1,[d0,4]
	ld r14,i1
	add r14,i1
	jc leu,r14,i1,&L170_61
.line 173
	ld i0,[d0]
	sll i1,#0x3
	call &_realloc_31
	ld r7,r14
.line 176
	ld r0,#0x0
	jc eq,r14,r0,&L141_61
LBB10_61:
.line 177
	ld r14,[d0,44]
	ld r9,r14
	sll r9,#0x1
	or r9,#0x1
.line 178
	ld r6,r14
	xor r6,r9
.line 181
	jc eq,r14,r9,&L171_61
.line 183
	ld r8,#0x0
	ld r5,[d0,4]
	jc leu,r5,r8,&L160_61
L173_61:
.line 184
	ld r4,#0x0
	ld r2,r4
.line 186
	ld r3,r8
	sll r3,#0x2
	ld r14,r3
	add r14,r7
	ld r0,[r14]
	jc ne,r0,r4,&L152_61
	jp &L162_61
L172_61:
.line 190
	ld [r0],r4
.line 191
	ld r4,r0
.line 186
	ld r0,r1
	ld r14,#0x0
	jc eq,r1,r14,&L162_61
L152_61:
.line 187
	ld r1,[r0]
.line 189
	ld r14,[r0,12]
	and r14,r6
	ld r10,#0x0
	jc ne,r14,r10,&L172_61
.line 193
	ld [r0],r2
.line 194
	ld r2,r0
.line 186
	ld r0,r1
	ld r14,#0x0
	jc ne,r1,r14,&L152_61
L162_61:
.line 198
	add r3,r7
	ld [r3],r2
.line 199
	ld r14,r8
	add r14,r5
	sll r14,#0x2
	add r14,r7
	ld [r14],r4
LBE11_61:
.line 183
	add r8,#0x1
	jc gtu,r5,r8,&L173_61
L160_61:
.line 202
	ld [d0],r7
.line 203
	ld [d0,44],r9
.line 204
	add r5,r5
	ld [d0,4],r5
.line 205
	ld r14,[d0,20]
	add r14,r14
	ld [d0,20],r14
.line 206
	ld r14,[d0,16]
	add r14,r14
	ld [d0,16],r14
L141_61:
.line 208
	ld i0,d0
	call &_hash_verify_61
	ld r0,#0x0
	jc eq,r14,r0,&L174_61
L164_61:
	ld r0,[d0,8]
L138_61:
.line 572
	ld r14,[d1,12]
	ld r1,[d0,44]
	and r14,r1
.line 574
	sll r14,#0x2
	ld r10,[d0]
	add r14,r10
	ld r1,[r14]
	ld [d1],r1
.line 575
	ld [r14],d1
.line 576
	add r0,#0x1
	ld [d0,8],r0
.line 578
	ld i0,d0
	call &_hash_verify_61
.line 580
	ld r1,#0x0
.line 578
	jc ne,r14,r1,&L132_61
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x242
	call &_bfeHandler_28
L174_61:
.line 208
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xd0
LBE13_61:
.line 578
	call &_bfeHandler_28
L168_61:
.line 562
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x232
.line 578
	call &_bfeHandler_28
L167_61:
.line 561
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x231
.line 578
	call &_bfeHandler_28
L170_61:
.line 171
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xab
LBE15_61:
.line 578
	call &_bfeHandler_28
L171_61:
.line 181
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xb5
LBE18_61:
.line 578
	call &_bfeHandler_28

//****************************************
// Function: _hash_insert
//****************************************

.func _hash_insert_61, 3, int
.line 546
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d1,i1
	ld d2,i2
.line 547
	ld r14,[i1]
	ld r0,#0x0
	jc ne,r14,r0,&L178_61
.line 549
	ld d0,[i0,28]
	ld i0,i2
	call d0
	ld [d1,12],r14
.line 550
	ld [d1,4],d2
.line 552
	ld i0,d3
	ld i1,d1
	call &_hash_clone_insert_61
.line 553
	pop rt,d3
	ret
L178_61:
.line 547
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x223
	call &_bfeHandler_28

//****************************************
// Function: _hash_lookup
//****************************************

.func _hash_lookup_61, 2, int
.line 598
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i1
.line 600
	ld d1,[i0,28]
	ld i0,i1
	call d1
.line 601
	ld i0,d0
	ld i1,d2
	ld i2,r14
	call &_hash_lookup_hkey_61
.line 602
	pop rt,d2
	ret

//****************************************
// Function: _hash_scan_delete
//****************************************

.func _hash_scan_delete_61, 2, int
.line 694
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
.line 698
	ld i1,[i1,4]
	call &_hash_lookup_61
	jc ne,r14,d0,&L196_61
.line 699
	ld r14,[zr,_hash_val_t_bit_61]
	ld r0,#0x0
	jc eq,r14,r0,&L197_61
.line 701
	ld r14,[d0,12]
	ld r0,[d1,44]
	and r14,r0
.line 702
	sll r14,#0x2
	ld r0,[d1]
	add r14,r0
	ld r0,[r14]
.line 704
	jc eq,r0,d0,&L198_61
.line 708
	ld r14,[r0]
	jc eq,r14,d0,&L193_61
L199_61:
	ld r0,r14
	ld r14,[r14]
	jc ne,r14,d0,&L199_61
L193_61:
.line 709
	ld r14,[d0]
	ld [r0],r14
L186_61:
.line 712
	ld r14,[d1,8]
	add r14,#0xffffffff
	ld [d1,8],r14
.line 713
	ld i0,d1
	call &_hash_verify_61
	ld r0,#0x0
	jc eq,r14,r0,&L200_61
.line 714
	ld r14,#0x0
	ld [d0],r14
.line 717
	ld r14,d0
	pop rt,d1
	ret
L198_61:
.line 705
	ld r0,[d0]
	ld [r14],r0
	jp &L186_61
L196_61:
.line 698
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2ba
.line 713
	call &_bfeHandler_28
L197_61:
.line 699
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2bb
.line 713
	call &_bfeHandler_28
L200_61:
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2c9
	call &_bfeHandler_28

//****************************************
// Function: _hash_free_nodes_noclear
//****************************************

.func _hash_free_nodes_noclear_61, 1, void
.line 364
	push rt,d3
	sub sp,#0xc
	ld fr,sp
	add fr,#0x24
	ld d2,i0
.line 367
	ld d3,fr
	add d3,#0xffffffdc
	ld i0,d3
	ld i1,d2
	call &_hash_scan_begin_61
	jp &L202_61
L204_61:
.line 369
	ld i0,d2
	ld i1,d1
	call &_hash_scan_delete_61
.line 370
	ld d0,[d2,36]
	ld i0,d1
	ld i1,[d2,40]
	call d0
L202_61:
	ld i0,d3
	call &_hash_scan_next_61
	ld d1,r14
	ld r14,#0x0
	jc ne,d1,r14,&L204_61
.line 372
	ld [d2,8],r14
	add sp,#0xc
	pop rt,d3
	ret

//****************************************
// Function: _hash_free_nodes
//****************************************

.func _hash_free_nodes_61, 1, void
.line 358
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
.line 359
	call &_hash_free_nodes_noclear_61
.line 360
	ld i0,d0
	call &_clear_table_61
	pop rt,d0
	ret

//****************************************
// Function: _hnode_alloc
//****************************************

.func _hnode_alloc_61, 1, int
.line 790
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 791
	ld i0,#0x10
	call &_malloc_31
.line 792
	pop rt,fr
	ret

//****************************************
// Function: _hnode_free
//****************************************

.func _hnode_free_61, 2, void
.line 795
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 796
	call &_free_31
	pop rt,fr
	ret

//****************************************
// Function: _hash_fun_default
//****************************************

.func _hash_fun_default_61, 1, int
.line 865
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 874
	ld r1,#0x0
.line 882
	ld.b r14,[i0]
	and r14,#0xff
	jc eq,r14,r1,&L286_61
	ld r15,r14
L284_61:
.line 877
	ld r14,r15
	add r14,r1
	and r14,#0xf
	sll r14,#0x2
	ld r14,[r14,randbox_0_61]
	xor r1,r14
.line 878
	ld r0,r1
	sll r0,#0x1
	ld r14,r1
	srl r14,#0x1f
	ld r1,r0
	or r1,r14
.line 880
	srl r15,#0x4
	add r15,r1
	and r15,#0xf
	sll r15,#0x2
	ld r15,[r15,randbox_0_61]
	xor r1,r15
	add i0,#0x1
.line 881
	ld r0,r1
	sll r0,#0x2
	ld r14,r1
	srl r14,#0x1e
	ld r1,r0
	or r1,r14
.line 882
	ld.b r15,[i0]
	and r15,#0xff
	ld r0,#0x0
	jc ne,r15,r0,&L284_61
L286_61:
.line 885
	ld r14,r1
	pop fr,fr
	ret

//****************************************
// Function: _hash_comp_default
//****************************************

.func _hash_comp_default_61, 2, int
.line 888
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 889
	syscall 6
.line 890
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil18ConnectionListener15connectFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener15connectFinishedEPNS_10ConnectionEi_62, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Connection.cpp'
.line 24
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_62:
.line 25
	ld i0,&LC0_62
	ld i1,&_ZZN6MAUtil18ConnectionListener15connectFinishedEPNS_10ConnectionEiE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil18ConnectionListener16connRecvFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener16connRecvFinishedEPNS_10ConnectionEi_62, 3, void
.line 27
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB3_62:
.line 28
	ld i0,&LC1_62
	ld i1,&_ZZN6MAUtil18ConnectionListener16connRecvFinishedEPNS_10ConnectionEiE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil18ConnectionListener17connWriteFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener17connWriteFinishedEPNS_10ConnectionEi_62, 3, void
.line 30
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_62:
.line 31
	ld i0,&LC2_62
	ld i1,&_ZZN6MAUtil18ConnectionListener17connWriteFinishedEPNS_10ConnectionEiE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil18ConnectionListener16connReadFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener16connReadFinishedEPNS_10ConnectionEi_62, 3, void
.line 33
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_62:
.line 34
	ld i0,&LC3_62
	ld i1,&_ZZN6MAUtil18ConnectionListener16connReadFinishedEPNS_10ConnectionEiE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi
//****************************************

.func __ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi_62, 3, void
.line 40
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB6_62:
.line 41
	ld r14,&__ZTVN6MAUtil10ConnectionE_62+8
	ld [i0],r14
	ld [i0,8],i2
	ld [i0,12],i1
	ld r14,#0x0
	ld [i0,16],r14
.line 42
	jc eq,i1,r14,&L11_62
.line 43
	ld r14,#0x0
	jc ne,i2,r14,&L12_62
LBE6_62:
.line 45
	pop rt,d0
	ret
L12_62:
.line 44
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,[d0,8]
	ld i2,d0
	call &__ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_73
LBE7_62:
.line 45
	pop rt,d0
	ret
L11_62:
.line 42
	ld i0,&LC4_62
	ld i1,&_ZZN6MAUtil10ConnectionC1EPNS_18ConnectionListenerEiE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil10Connection7connectEPKc
//****************************************

.func __ZN6MAUtil10Connection7connectEPKc_62, 2, int
.line 55
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
	ld i0,i1
LBB13_62:
.line 56
	ld r14,[d0,8]
	ld r0,#0x0
	jc gt,r14,r0,&L26_62
.line 57
	syscall 68
	ld [d0,8],r14
.line 59
	ld r0,r14
.line 58
	ld r1,#0x0
	jc lt,r14,r1,&L22_62
.line 60
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,[d0,8]
	ld i2,d0
	call &__ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_73
.line 61
	ld r0,#0x1
L22_62:
.line 62
	ld r14,r0
	pop rt,d0
	ret
L26_62:
.line 56
	ld i0,&LC5_62
	ld i1,&_ZZN6MAUtil10Connection7connectEPKcE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil10Connection5closeEv
//****************************************

.func __ZN6MAUtil10Connection5closeEv_62, 1, void
.line 64
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB15_62:
.line 65
	ld i0,[i0,8]
	ld r14,#0x0
	jc le,i0,r14,&L27_62
.line 66
	syscall 69
.line 67
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,[d0,8]
	call &__ZN6MAUtil11Environment18removeConnListenerEi_73
.line 68
	ld r14,#0x0
	ld [d0,8],r14
L27_62:
.line 70
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10ConnectionD0Ev
//****************************************

.func __ZN6MAUtil10ConnectionD0Ev_62, 1, void
.line 47
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB16_62:
.line 47
	ld r14,&__ZTVN6MAUtil10ConnectionE_62+8
	ld [i0],r14
.line 48
	call &__ZN6MAUtil10Connection5closeEv_62
LBE16_62:
.line 49
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10ConnectionD1Ev
//****************************************

.func __ZN6MAUtil10ConnectionD1Ev_62, 1, void
.line 47
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB17_62:
.line 47
	ld r14,&__ZTVN6MAUtil10ConnectionE_62+8
	ld [i0],r14
.line 48
	call &__ZN6MAUtil10Connection5closeEv_62
LBE17_62:
.line 49
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10ConnectionD2Ev
//****************************************

.func __ZN6MAUtil10ConnectionD2Ev_62, 1, void
.line 47
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB18_62:
.line 47
	ld r14,&__ZTVN6MAUtil10ConnectionE_62+8
	ld [i0],r14
.line 48
	call &__ZN6MAUtil10Connection5closeEv_62
LBE18_62:
.line 49
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10Connection5writeEPKvi
//****************************************

.func __ZN6MAUtil10Connection5writeEPKvi_62, 3, void
.line 72
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB19_62:
.line 73
	ld i0,[i0,8]
	syscall 71
LBE19_62:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10Connection4recvEPvi
//****************************************

.func __ZN6MAUtil10Connection4recvEPvi_62, 3, void
.line 79
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB21_62:
.line 80
	ld i0,[i0,8]
	syscall 70
LBE21_62:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10Connection9connEventERK15MAConnEventData
//****************************************

.func __ZN6MAUtil10Connection9connEventERK15MAConnEventData_62, 2, void
.line 113
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
	ld r1,i1
LBB31_62:
.line 115
	ld r14,[i1]
	ld r2,[i0,8]
	jc ne,r14,r2,&L80_62
.line 116
	ld r14,[i1,4]
	ld r3,#0x2
	jc eq,r14,r3,&L76_62
	jc gt,r14,r3,&L77_62
	ld r2,#0x1
	jc eq,r14,r2,&L66_62
L61_62:
.line 142
	pop rt,d0
	ret
L77_62:
.line 116
	ld r3,#0x7
	jc ne,r14,r3,&L61_62
.line 118
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14]
.line 139
	ld i1,r0
	ld i2,[r1,8]
L79_62:
	call d0
L85_62:
.line 142
	pop rt,d0
	ret
L66_62:
.line 121
	ld r2,[i0,16]
	ld r14,#0x0
	jc le,r2,r14,&L67_62
.line 122
	ld r14,[i1,8]
	ld r3,#0x0
	jc lt,r14,r3,&L81_62
.line 127
	sub r2,r14
	ld r14,r2
	ld [r0,16],r2
.line 128
	ld r2,#0x0
	jc lt,r14,r2,&L82_62
.line 129
	ld r3,#0x0
	jc eq,r14,r3,&L83_62
.line 132
	ld r2,[i0,36]
	ld r14,r2
	and r14,#0x1
	ld r3,#0x0
	jc ne,r14,r3,&L84_62
	ld d0,[i0,32]
L74_62:
	sra r2,#0x1
	ld i0,r0
	add i0,r2
	ld i1,[r1,8]
	call d0
LBE33_62:
.line 142
	pop rt,d0
	ret
L76_62:
.line 139
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,r0
	ld i2,[r1,8]
	jp &L79_62
L84_62:
.line 132
	ld r14,r2
	sra r14,#0x1
	add r14,i0
	ld r14,[r14]
	ld r3,[i0,32]
	add r14,r3
	ld d0,[r14]
	jp &L74_62
L83_62:
.line 130
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,12]
	ld i1,r0
	ld i2,#0x1
.line 139
	call d0
	jp &L85_62
L67_62:
.line 135
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,4]
.line 139
	ld i1,r0
	ld i2,[r1,8]
	jp &L79_62
L81_62:
.line 123
	ld [i0,16],r3
.line 124
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,12]
.line 139
	ld i1,r0
	ld i2,[r1,8]
	jp &L79_62
L80_62:
.line 115
	ld i0,&LC9_62
	ld i1,&_ZZN6MAUtil10Connection9connEventERK15MAConnEventDataE12__FUNCTION___62
	call &_panicFunction_28
L82_62:
.line 128
	ld i0,&LC10_62
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x80
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10Connection11setListenerEPNS_18ConnectionListenerE
//****************************************

.func __ZN6MAUtil10Connection11setListenerEPNS_18ConnectionListenerE_62, 2, void
.line 144
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB35_62:
.line 145
	ld [i0,12],i1
LBE35_62:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE
//****************************************

.func __ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_62, 2, void
.line 154
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB38_62:
.line 154
	ld i2,#0x0
	call &__ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi_62
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [d0],r14
LBE38_62:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection6createEPKci
//****************************************

.func __ZN6MAUtil14HttpConnection6createEPKci_62, 3, int
.line 157
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
	ld i0,i1
	ld i1,i2
LBB39_62:
.line 158
	ld r14,[d0,8]
	ld r0,#0x0
	jc gt,r14,r0,&L94_62
.line 159
	syscall 75
	ld [d0,8],r14
.line 161
	ld r0,r14
.line 160
	ld r1,#0x0
	jc lt,r14,r1,&L90_62
.line 162
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,[d0,8]
	ld i2,d0
	call &__ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_73
.line 163
	ld r0,#0x1
L90_62:
.line 164
	ld r14,r0
	pop rt,d0
	ret
L94_62:
.line 158
	ld i0,&LC5_62
	ld i1,&_ZZN6MAUtil14HttpConnection6createEPKciE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2_
//****************************************

.func __ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2__62, 3, void
.line 166
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB41_62:
.line 167
	ld i0,[i0,8]
	syscall 76
LBE41_62:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection17getResponseHeaderEPKcPNS_11BasicStringIcEE
//****************************************

.func __ZN6MAUtil14HttpConnection17getResponseHeaderEPKcPNS_11BasicStringIcEE_62, 3, int
.line 170
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d3,i1
	ld d1,i2
LBB42_62:
.line 171
	ld i0,i2
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_81
	ld i0,[d2,8]
	ld i1,d3
	ld i2,r14
	ld i3,#0x0
	syscall 77
	ld i1,r14
.line 172
	ld r0,#0x0
	jc lt,i1,r0,&L96_62
.line 174
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE6resizeEi_81
.line 175
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_81
	ld d0,r14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE8capacityEv_81
	ld i0,[d2,8]
	ld i1,d3
	ld i2,d0
	ld i3,r14
	add i3,#0x1
	syscall 77
L96_62:
.line 176
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection6finishEv
//****************************************

.func __ZN6MAUtil14HttpConnection6finishEv_62, 1, void
.line 178
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB44_62:
.line 179
	ld i0,[i0,8]
	syscall 78
LBE44_62:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection9connEventERK15MAConnEventData
//****************************************

.func __ZN6MAUtil14HttpConnection9connEventERK15MAConnEventData_62, 2, void
.line 182
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r1,i0
	ld r0,i1
LBB45_62:
.line 183
	ld r14,[i1]
	ld r2,[i0,8]
	jc ne,r14,r2,&L104_62
.line 184
	ld r14,[i1,4]
	ld r2,#0xb
	jc eq,r14,r2,&L105_62
.line 187
	call &__ZN6MAUtil10Connection9connEventERK15MAConnEventData_62
LBE45_62:
.line 188
	pop rt,d0
	ret
L105_62:
.line 185
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,16]
	ld i1,r1
	ld i2,[r0,8]
	call d0
LBE46_62:
.line 188
	pop rt,d0
	ret
L104_62:
.line 183
	ld i0,&LC9_62
	ld i1,&_ZZN6MAUtil14HttpConnection9connEventERK15MAConnEventDataE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil14HttpConnectionD1Ev
//****************************************

.func __ZN6MAUtil14HttpConnectionD1Ev_62, 1, void
.line 189
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB48_62:
.line 189
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r14
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE48_62:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnectionD0Ev
//****************************************

.func __ZN6MAUtil14HttpConnectionD0Ev_62, 1, void
.line 189
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB49_62:
.line 189
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_62+8
	ld [i0],r14
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE49_62:
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: _ogl_setup
//****************************************

.func _ogl_setup_63, 4, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\GraphicsOpenGL.c'
.line 83
	push rt,d5
	sub sp,#0xc
	ld fr,sp
	add fr,#0x2c
	ld d4,i0
	ld d5,i1
	ld d2,i2
	ld d3,i3
LBB2_63:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\IX_OPENGL_ES.h'
.line 162
	ld [sp],i3
	ld i0,#0x97
	ld i1,d4
	ld i2,d5
	ld i3,d2
	syscall 96
LBE3_63:
.line 314
	ld i0,#0xb6
	ld i1,#0x1701
	ld i2,#0x0
	ld i3,i2
	syscall 96
LBE5_63:
.line 56
	ld i0,#0x82
	ld i1,#0x0
	ld i2,i1
	ld i3,i1
	syscall 96
LBE7_63:
.line 421
	ld i0,d2
	syscall 25
	ld d1,r14
	ld i0,d3
	syscall 25
LBB9_63:
.line 428
	ld d0,#0x0
.line 434
	ld [sp],d0
	ld [sp,4],d0
	ld r0,#0x3f800000
	ld [sp,8],r0
	ld i0,#0xcb
	ld i1,d0
	ld i2,d1
	ld i3,r14
	syscall 96
LBE9_63:
.line 314
	ld i0,#0xb6
	ld i1,#0x1700
	ld i2,d0
	ld i3,d0
	syscall 96
LBE11_63:
.line 56
	ld i0,#0x82
	ld i1,d0
	ld i2,d0
	ld i3,d0
	syscall 96
LBE13_63:
.line 362
	ld i0,#0xc0
	ld i1,#0xde1
	ld i2,d0
	ld i3,d0
	syscall 96
LBE15_63:
.line 458
	ld i0,#0xd1
	ld i1,#0xb71
	ld i2,d0
	ld i3,d0
	syscall 96
LBE17_63:
.line 418
	ld [sp],d0
	ld i0,#0xca
	ld i1,d0
	ld i2,d0
	ld i3,d0
	syscall 96
LBE19_63:
.line 524
	ld i0,#0xe1
	ld i1,#0x302
	ld i2,#0x303
	ld i3,d0
	syscall 96
LBE21_63:
.line 362
	ld i0,#0xc0
	ld i1,#0xbe2
	ld i2,d0
	ld i3,d0
	syscall 96
LBE23_63:
	ld i0,#0xc0
	ld i1,#0xc11
	ld i2,d0
	ld i3,d0
	syscall 96
LBE25_63:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\GraphicsOpenGL.c'
.line 102
	ld r14,&_sViewPort_63
	ld [r14],d4
.line 103
	ld [r14,4],d5
.line 104
	ld [r14,8],d2
.line 105
	ld [r14,12],d3
	add sp,#0xc
	pop rt,d5
	ret

//****************************************
// Function: _Gfx_useDriverSoftware
//****************************************

.func _Gfx_useDriverSoftware_64, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\GraphicsSoftware.c'
.line 85
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 86
	ld i0,&_sSoftwareGraphicsDriver_64
	call &_Gfx_useDriver_71
	pop rt,fr
	ret

//****************************************
// Function: _soft_setup
//****************************************

.func _soft_setup_64, 4, void
.line 90
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 90
	pop fr,fr
	ret

//****************************************
// Function: _soft_setClipRect
//****************************************

.func _soft_setClipRect_64, 4, void
.line 93
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 94
	syscall 33
	pop rt,fr
	ret

//****************************************
// Function: _soft_clearMatrix
//****************************************

.func _soft_clearMatrix_64, 0, void
.line 97
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 98
	ld r0,#0x0
	ld [zr,_sTransformStackPtr_64],r0
.line 99
	ld r14,&_sCurrentOffset_64
	ld [r14],r0
.line 100
	ld [r14,4],r0
.line 101
	ld r14,&_sTransformStack_64
	ld [r14],r0
.line 102
	ld [r14,4],r0
	pop fr,fr
	ret

//****************************************
// Function: _soft_init
//****************************************

.func _soft_init_64, 0, void
.line 105
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 106
	ld r14,[zr,_sTransformStackPtr_64]
	ld r0,#0x0
	jc lt,r14,r0,&L8_64
.line 108
	pop rt,fr
	ret
L8_64:
.line 107
	call &_soft_clearMatrix_64
.line 108
	pop rt,fr
	ret

//****************************************
// Function: _soft_pushMatrix
//****************************************

.func _soft_pushMatrix_64, 0, void
.line 111
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 112
	call &_soft_init_64
.line 113
	ld r0,[zr,_sTransformStackPtr_64]
	ld r14,#0x7e
	jc gt,r0,r14,&L11_64
.line 118
	add r0,#0x1
	ld [zr,_sTransformStackPtr_64],r0
.line 119
	sll r0,#0x3
	add r0,&_sTransformStack_64
	ld r14,[zr,_sCurrentOffset_64]
	ld r15,[zr,_sCurrentOffset_64+4]
	ld [r0],r14
	ld [r0,4],r15
	pop rt,fr
	ret
L11_64:
.line 114
	ld i0,&LC0_64
	ld i1,&__FUNCTION___1_64
	call &_panicFunction_28

//****************************************
// Function: _soft_popMatrix
//****************************************

.func _soft_popMatrix_64, 0, void
.line 122
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 123
	call &_soft_init_64
.line 124
	ld r1,[zr,_sTransformStackPtr_64]
	ld r14,#0x0
	jc lt,r1,r14,&L14_64
.line 128
	ld r0,r1
	sll r0,#0x3
	add r0,&_sTransformStack_64
	ld r14,[r0]
	ld r15,[r0,4]
	ld [zr,_sCurrentOffset_64],r14
	ld [zr,_sCurrentOffset_64+4],r15
.line 129
	add r1,#0xffffffff
	ld [zr,_sTransformStackPtr_64],r1
	pop rt,fr
	ret
L14_64:
.line 125
	ld i0,&LC1_64
	ld i1,&__FUNCTION___0_64
	call &_panicFunction_28

//****************************************
// Function: _soft_translate
//****************************************

.func _soft_translate_64, 2, void
.line 132
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 133
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	add r0,i0
	ld [r14],r0
.line 134
	add r14,#0x4
	ld r0,[r14]
	add r0,i1
	ld [r14],r0
	pop fr,fr
	ret

//****************************************
// Function: _soft_getTranslation
//****************************************

.func _soft_getTranslation_64, 0, double
.line 137
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 138
	ld r0,[zr,_sCurrentOffset_64]
	ld r1,[zr,_sCurrentOffset_64+4]
	ld r2,r0
	ld r3,r1
.line 139
	ld r14,r0
	ld r15,r1
	pop fr,fr
	ret

//****************************************
// Function: _soft_scale
//****************************************

.func _soft_scale_64, 2, void
.line 141
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 141
	pop fr,fr
	ret

//****************************************
// Function: _soft_plot
//****************************************

.func _soft_plot_64, 2, void
.line 145
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 146
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	add i0,r0
	ld r14,[r14,4]
	add i1,r14
	syscall 35
	pop rt,fr
	ret

//****************************************
// Function: _soft_line
//****************************************

.func _soft_line_64, 4, void
.line 149
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 150
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	ld r14,[r14,4]
	add i0,r0
	add i1,r14
	add i2,r0
	add i3,r14
	syscall 36
	pop rt,fr
	ret

//****************************************
// Function: _soft_fillRect
//****************************************

.func _soft_fillRect_64, 4, void
.line 153
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 154
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	add i0,r0
	ld r14,[r14,4]
	add i1,r14
	syscall 37
	pop rt,fr
	ret

//****************************************
// Function: _soft_drawText
//****************************************

.func _soft_drawText_64, 3, void
.line 162
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 163
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	add i0,r0
	ld r14,[r14,4]
	add i1,r14
	syscall 42
	pop rt,fr
	ret

//****************************************
// Function: _soft_drawTextW
//****************************************

.func _soft_drawTextW_64, 3, void
.line 166
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 167
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	add i0,r0
	ld r14,[r14,4]
	add i1,r14
	syscall 43
	pop rt,fr
	ret

//****************************************
// Function: _soft_drawImage
//****************************************

.func _soft_drawImage_64, 3, void
.line 170
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 171
	ld r14,&_sCurrentOffset_64
	ld r0,[r14]
	add i1,r0
	ld r14,[r14,4]
	add i2,r14
	syscall 47
	pop rt,fr
	ret

//****************************************
// Function: _soft_drawRGB
//****************************************

.func _soft_drawRGB_64, 4, void
.line 174
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
.line 175
	ld r1,[i0,4]
	ld [fr,-12],r1
.line 176
	ld r0,&_sCurrentOffset_64
	ld r14,[i0]
	ld r1,[r0]
	add r14,r1
	ld [fr,-16],r14
.line 177
	ld r14,[fr,-12]
	ld r0,[r0,4]
	add r14,r0
	ld [fr,-12],r14
.line 179
	ld i0,fr
	add i0,#0xfffffff0
	syscall 48
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: _soft_drawImageRegion
//****************************************

.func _soft_drawImageRegion_64, 4, void
.line 182
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
.line 183
	ld r1,[i2,4]
	ld [fr,-12],r1
.line 184
	ld r0,&_sCurrentOffset_64
	ld r14,[i2]
	ld r1,[r0]
	add r14,r1
	ld [fr,-16],r14
.line 185
	ld r14,[fr,-12]
	ld r0,[r0,4]
	add r14,r0
	ld [fr,-12],r14
.line 186
	ld i2,fr
	add i2,#0xfffffff0
	syscall 49
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: _soft_notifyImageUpdated
//****************************************

.func _soft_notifyImageUpdated_64, 1, void
.line 189
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 189
	pop fr,fr
	ret

//****************************************
// Function: _soft_beginRendering
//****************************************

.func _soft_beginRendering_64, 0, void
.line 192
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 192
	pop fr,fr
	ret

//****************************************
// Function: _soft_updateScreen
//****************************************

.func _soft_updateScreen_64, 0, void
.line 195
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 196
	syscall 44
	pop rt,fr
	ret

//****************************************
// Function: _soft_setClearColor
//****************************************

.func _soft_setClearColor_64, 3, void
.line 199
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 199
	pop fr,fr
	ret

//****************************************
// Function: _soft_setColor
//****************************************

.func _soft_setColor_64, 3, void
.line 202
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 203
	sll i0,#0x10
	sll i1,#0x8
	or i0,i1
	or i0,i2
	syscall 32
	pop rt,fr
	ret

//****************************************
// Function: _soft_setAlpha
//****************************************

.func _soft_setAlpha_64, 1, void
.line 206
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 206
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_Reset
//****************************************

.func _CharInput_Reset_65, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInputC.c'
.line 49
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 50
	ld r14,#0x0
	ld [zr,_sCurrentCharMapIndex_65],r14
.line 51
	ld [zr,_sCurrentCharMapListIndex_65],r14
.line 52
	ld [zr,_sCurrentMode_65],r14
.line 53
	ld [zr,_sCurrentCharMode_65],r14
	pop fr,fr
	ret

//****************************************
// Function: _getChar
//****************************************

.func _getChar_65, 1, int
.line 93
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 95
	ld r0,#0x1
	jc eq,i0,r0,&L5_65
	jc le,i0,r0,&L12_65
	ld r0,#0x2
	jc eq,i0,r0,&L6_65
L7_65:
.line 106
	ld r14,#0x0
.line 109
	xb r14,r14
	pop fr,fr
	ret
L5_65:
.line 100
	ld r14,[zr,_sCurrentCharMapIndex_65]
	sll r14,#0x2
	ld r14,[r14,_charMapUpperCase_65]
	ld r0,[zr,_sCurrentCharMapListIndex_65]
	add r14,r0
L9_65:
.line 103
	ld.b r14,[r14]
L13_65:
.line 109
	xb r14,r14
	pop fr,fr
	ret
L6_65:
.line 103
	ld r14,[zr,_sCurrentCharMapIndex_65]
	add r14,&_numMap_65
	ld.b r14,[r14]
	jp &L13_65
L12_65:
.line 95
	ld r14,#0x0
	jc ne,i0,r14,&L7_65
.line 97
	ld r14,[zr,_sCurrentCharMapIndex_65]
	sll r14,#0x2
	ld r14,[r14,_charMapLowerCase_65]
.line 100
	ld r0,[zr,_sCurrentCharMapListIndex_65]
	add r14,r0
	jp &L9_65

//****************************************
// Function: _CharInput_ShortPress
//****************************************

.func _CharInput_ShortPress_65, 0, void
.line 126
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 127
	ld d0,[zr,_sStopTimerCallback_65]
	ld r0,#0x0
	jc ne,d0,r0,&L27_65
L24_65:
.line 130
	ld r14,[zr,_sCurrentMode_65]
	ld r0,#0x0
	jc eq,r14,r0,&L23_65
.line 132
	ld d0,[zr,_sCharacterDeployedCallback_65]
	jc ne,d0,r0,&L28_65
.line 134
	ld r14,#0x0
	ld [zr,_sCurrentMode_65],r14
L23_65:
.line 135
	pop rt,d0
	ret
L27_65:
.line 128
	call d0
	jp &L24_65
L28_65:
.line 133
	ld i0,[zr,_sCurrentCharMode_65]
	call &_getChar_65
	ld i0,r14
	ld i1,[zr,_sCharacterDeployedUserData_65]
	call d0
.line 134
	ld r14,#0x0
	ld [zr,_sCurrentMode_65],r14
	jp &L23_65

//****************************************
// Function: _CharInput_LongPress
//****************************************

.func _CharInput_LongPress_65, 0, void
.line 137
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 138
	ld d0,[zr,_sStopTimerCallback_65]
	ld r0,#0x0
	jc ne,d0,r0,&L33_65
L30_65:
.line 141
	ld r14,[zr,_sCurrentMode_65]
	ld r0,#0x0
	jc eq,r14,r0,&L29_65
.line 143
	ld d0,[zr,_sCharacterDeployedCallback_65]
	jc ne,d0,r0,&L34_65
.line 145
	ld r14,#0x0
	ld [zr,_sCurrentMode_65],r14
L29_65:
.line 146
	pop rt,d0
	ret
L33_65:
.line 139
	call d0
	jp &L30_65
L34_65:
.line 144
	ld i0,#0x2
	call &_getChar_65
	ld i0,r14
	ld i1,[zr,_sCharacterDeployedUserData_65]
	call d0
.line 145
	ld r14,#0x0
	ld [zr,_sCurrentMode_65],r14
	jp &L29_65

//****************************************
// Function: _CharInput_setMode
//****************************************

.func _CharInput_setMode_65, 1, void
.line 148
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 149
	ld [zr,_sCurrentCharMode_65],i0
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_getMode
//****************************************

.func _CharInput_getMode_65, 0, int
.line 152
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 154
	ld r14,[zr,_sCurrentCharMode_65]
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_Pressed
//****************************************

.func _CharInput_Pressed_65, 1, void
.line 156
	push rt,d1
	ld fr,sp
	add fr,#0x10
.line 158
	ld r14,[zr,_sQwerty_65]
	ld r0,#0x0
	jc ne,r14,r0,&L37_65
.line 161
	ld r0,[zr,_sCurrentCharMapIndex_65]
.line 162
	case i0,#0x2a,#0xf,#L52_65,#L37_65
.data
	.align 4
L52_65:
	.word L50_65
	.word L37_65
	.word L37_65
	.word L37_65
	.word L37_65
	.word L37_65
	.word L40_65
	.word L49_65
	.word L49_65
	.word L49_65
	.word L49_65
	.word L49_65
	.word L49_65
	.word L49_65
	.word L49_65
	.word L49_65


.code
L49_65:
.line 175
	ld d0,i0
	add d0,#0xffffffcf
L39_65:
.line 185
	ld i0,[zr,_sCurrentCharMode_65]
	ld r1,#0x2
	jc eq,i0,r1,&L61_65
L66_65:
	ld r14,[zr,_sCurrentMode_65]
	ld r1,#0x1
	jc eq,r14,r1,&L63_65
L56_65:
.line 196
	ld r0,#0x0
	ld [zr,_sCurrentCharMapListIndex_65],r0
.line 197
	ld [zr,_sCurrentCharMapIndex_65],d0
L55_65:
.line 200
	ld d0,[zr,_sCharacterChangedCallback_65]
	ld r1,#0x0
	jc ne,d0,r1,&L64_65
L58_65:
.line 203
	ld r14,#0x1
	ld [zr,_sCurrentMode_65],r14
.line 205
	ld d0,[zr,_sStopTimerCallback_65]
	ld r0,#0x0
	jc ne,d0,r0,&L65_65
L59_65:
.line 207
	ld d0,[zr,_sStartTimerCallback_65]
	ld r1,#0x0
	jc eq,d0,r1,&L37_65
.line 208
	ld i0,&_CharInput_LongPress_65
	ld i1,#0x1f4
	call d0
L37_65:
.line 209
	pop rt,d1
	ret
L50_65:
.line 178
	ld d0,#0x9
.line 185
	ld i0,[zr,_sCurrentCharMode_65]
	ld r1,#0x2
	jc ne,i0,r1,&L66_65
L61_65:
	ld r14,[zr,_sCurrentMode_65]
.line 191
	ld r1,#0x1
	jc ne,r14,r1,&L56_65
	jp &L62_65
L40_65:
.line 164
	ld d0,#0xa
	jp &L39_65
L65_65:
.line 206
	call d0
	jp &L59_65
L64_65:
.line 201
	ld i0,[zr,_sCurrentCharMode_65]
	call &_getChar_65
	ld i0,r14
	ld i1,[zr,_sCharacterChangedUserData_65]
	call d0
	jp &L58_65
L63_65:
.line 185
	jc eq,d0,r0,&L67_65
L62_65:
.line 192
	ld d1,[zr,_sCharacterDeployedCallback_65]
	ld r14,#0x0
	jc eq,d1,r14,&L56_65
.line 193
	call &_getChar_65
	ld i0,r14
	ld i1,[zr,_sCharacterDeployedUserData_65]
	call d1
	jp &L56_65
L67_65:
.line 186
	ld r14,[zr,_sCurrentCharMapListIndex_65]
	add r14,r1
	ld [zr,_sCurrentCharMapListIndex_65],r14
.line 187
	call &_getChar_65
	xb r14,r14
	ld r0,#0x0
	jc ne,r14,r0,&L55_65
.line 188
	ld [zr,_sCurrentCharMapListIndex_65],r14
	jp &L55_65

//****************************************
// Function: _CharInput_Char
//****************************************

.func _CharInput_Char_65, 1, void
.line 211
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
.line 212
	ld r14,[zr,_sQwerty_65]
	ld r0,#0x0
	jc eq,r14,r0,&L68_65
.line 215
	ld r14,[zr,_sCurrentCharMode_65]
	ld r0,#0x2
	jc eq,r14,r0,&L79_65
L70_65:
.line 220
	ld r14,#0x1f
	jc gtu,d1,r14,&L72_65
.line 222
	ld r14,d1
	add r14,#0xfffffff7
	ld r0,#0x1
	jc gtu,r14,r0,&L68_65
L72_65:
.line 231
	ld r14,#0xff
	jc leu,d1,r14,&L80_65
L68_65:
.line 236
	pop rt,d1
	ret
L79_65:
.line 217
	ld r14,i0
	add r14,#0xffffffd0
	ld r0,#0x9
	jc leu,r14,r0,&L70_65
.line 236
	pop rt,d1
	ret
L80_65:
.line 234
	ld i0,d1
	ld i1,[zr,_sCharacterChangedUserData_65]
	ld d0,[zr,_sCharacterChangedCallback_65]
	call d0
.line 235
	ld i0,d1
	ld i1,[zr,_sCharacterDeployedUserData_65]
	ld d0,[zr,_sCharacterDeployedCallback_65]
	call d0
.line 236
	pop rt,d1
	ret

//****************************************
// Function: _CharInput_Released
//****************************************

.func _CharInput_Released_65, 1, void
.line 238
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 239
	ld r14,[zr,_sQwerty_65]
	ld r0,#0x0
	jc ne,r14,r0,&L81_65
.line 242
	ld d0,[zr,_sStopTimerCallback_65]
	jc eq,d0,r14,&L83_65
.line 243
	call d0
L83_65:
.line 244
	ld d0,[zr,_sStartTimerCallback_65]
	ld r14,#0x0
	jc ne,d0,r14,&L85_65
L81_65:
.line 246
	pop rt,d0
	ret
L85_65:
.line 245
	ld i0,&_CharInput_ShortPress_65
	ld i1,#0x1f4
	call d0
.line 246
	pop rt,d0
	ret

//****************************************
// Function: _CharInput_RegisterTimerCallback
//****************************************

.func _CharInput_RegisterTimerCallback_65, 2, void
.line 248
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 249
	ld [zr,_sStartTimerCallback_65],i0
.line 250
	ld [zr,_sStopTimerCallback_65],i1
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_RegisterCharacterChangedCallback
//****************************************

.func _CharInput_RegisterCharacterChangedCallback_65, 2, void
.line 253
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 254
	ld [zr,_sCharacterChangedUserData_65],i1
.line 255
	ld [zr,_sCharacterChangedCallback_65],i0
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_RegisterCharacterDeployedCallback
//****************************************

.func _CharInput_RegisterCharacterDeployedCallback_65, 2, void
.line 258
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 259
	ld [zr,_sCharacterDeployedUserData_65],i1
.line 260
	ld [zr,_sCharacterDeployedCallback_65],i0
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_ForceDeployment
//****************************************

.func _CharInput_ForceDeployment_65, 0, void
.line 271
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 272
	call &_CharInput_ShortPress_65
	pop rt,fr
	ret

//****************************************
// Function: _CharInput_setQwerty
//****************************************

.func _CharInput_setQwerty_65, 1, void
.line 275
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
.line 276
	ld r14,[zr,_sQwerty_65]
	ld r0,#0x0
	jc ne,r14,r0,&L93_65
	jc eq,i0,r14,&L93_65
	ld d1,[zr,_sStopTimerCallback_65]
	jc ne,d1,r0,&L94_65
L93_65:
.line 278
	ld [zr,_sQwerty_65],d0
	pop rt,d1
	ret
L94_65:
.line 277
	call d1
.line 278
	ld [zr,_sQwerty_65],d0
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnectionC1EPNS_18ConnectionListenerE
//****************************************

.func __ZN6MAUtil19BluetoothConnectionC1EPNS_18ConnectionListenerE_67, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.cpp'
.line 33
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_67:
.line 33
	ld i2,#0x0
	call &__ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi_62
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_67+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_67+36
	ld [d0,40],r14
	ld i0,d0
	add i0,#0x2c
	call &__ZN6MAUtil19BluetoothDiscovererC1Ev_68
	ld r14,#0xffffffff
	ld [d0,64],r14
LBE3_67:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUID
//****************************************

.func __ZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUID_67, 3, int
.line 40
	push rt,d4
	sub sp,#0x58
	ld fr,sp
	add fr,#0x74
	ld d1,i0
	ld d0,i1
	ld d3,i2
LBB4_67:
.line 41
	ld r14,[i0,64]
	ld r0,#0x0
	jc ge,r14,r0,&L16_67
.line 42
	ld.b r1,[i1]
	ld.b [i0,56],r1
	ld.b r14,[i1,1]
	ld.b [i0,57],r14
	ld.b r0,[i1,2]
	ld.b [i0,58],r0
	ld.b r1,[i1,3]
	ld.b [i0,59],r1
	ld.b r14,[i1,4]
	ld.b [i0,60],r14
	ld.b r0,[i1,5]
	ld.b [i0,61],r0
.line 43
	ld r1,#0x0
	ld [i0,64],r1
.line 44
	add i0,#0x2c
	ld i3,d1
	add i3,#0x28
	call &__ZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerE_68
.line 59
	ld r0,r14
LBB6_67:
.line 45
	ld r1,#0x0
	jc lt,r14,r1,&L17_67
LBE6_67:
.line 60
	ld r14,r0
	add sp,#0x58
	pop rt,d4
	ret
L17_67:
.line 50
	ld d4,fr
	add d4,#0xffffffa4
.line 52
	ld.b r14,[d0]
	and r14,#0xff
	ld [sp],r14
	ld.b r14,[d0,1]
	and r14,#0xff
	ld [sp,4],r14
	ld.b r14,[d0,2]
	and r14,#0xff
	ld [sp,8],r14
	ld.b r14,[d0,3]
	and r14,#0xff
	ld [sp,12],r14
	ld.b r14,[d0,4]
	and r14,#0xff
	ld [sp,16],r14
	ld.b r14,[d0,5]
	and r14,#0xff
	ld [sp,20],r14
	ld i0,d4
	ld i1,&LC1_67
	call &_sprintf_37
	ld d0,d4
	add d0,r14
LBB11_67:
.line 54
	ld d2,#0x0
L12_67:
.line 55
	ld r14,d2
	sll r14,#0x2
	add r14,d3
	ld r14,[r14]
	ld [sp],r14
	ld i0,d0
	ld i1,&LC2_67
	call &_sprintf_37
	add d0,r14
.line 54
	add d2,#0x1
	ld r14,#0x3
	jc le,d2,r14,&L12_67
LBE11_67:
.line 57
	ld i0,d1
	ld i1,d4
	call &__ZN6MAUtil10Connection7connectEPKc_62
	ld r0,r14
LBE10_67:
.line 60
	ld r14,r0
	add sp,#0x58
	pop rt,d4
	ret
L16_67:
.line 41
	ld i0,&LC0_67
	ld i1,&_ZZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUIDE12__FUNCTION___67
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection5closeEv
//****************************************

.func __ZN6MAUtil19BluetoothConnection5closeEv_67, 1, void
.line 95
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB14_67:
.line 96
	ld r14,#0xffffffff
	ld [i0,64],r14
.line 97
	add i0,#0x2c
	call &__ZN6MAUtil19BluetoothDiscoverer6cancelEv_68
.line 98
	ld i0,d0
	call &__ZN6MAUtil10Connection5closeEv_62
LBE14_67:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnectionD0Ev
//****************************************

.func __ZN6MAUtil19BluetoothConnectionD0Ev_67, 1, void
.line 35
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB15_67:
.line 35
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_67+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_67+36
	ld [i0,40],r14
.line 36
	call &__ZN6MAUtil19BluetoothConnection5closeEv_67
	ld i0,d0
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE15_67:
.line 37
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnectionD1Ev
//****************************************

.func __ZN6MAUtil19BluetoothConnectionD1Ev_67, 1, void
.line 35
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB16_67:
.line 35
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_67+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_67+36
	ld [i0,40],r14
.line 36
	call &__ZN6MAUtil19BluetoothConnection5closeEv_67
	ld i0,d0
	call &__ZN6MAUtil10ConnectionD2Ev_62
LBE16_67:
.line 37
	pop rt,d0
	ret

//****************************************
// Function: __ZThn40_N6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE
//****************************************

.func __ZThn40_N6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE_67, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.h'
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 39
	add i0,#0xffffffd8
	call &__ZN6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE_67
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE
//****************************************

.func __ZN6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE_67, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.cpp'
.line 101
	push rt,d1
	sub sp,#0x5c
	ld fr,sp
	add fr,#0x6c
	ld d1,i0
LBB18_67:
.line 102
	ld r14,[i0,64]
	ld r0,#0x0
	jc le,r14,r0,&L37_67
L32_67:
.line 114
	add sp,#0x5c
	pop rt,d1
	ret
L37_67:
.line 104
	ld r14,[i1]
	jc le,r14,r0,&L38_67
.line 105
	ld [i0,64],r14
.line 108
	ld r0,i0
	add r0,#0x38
.line 109
	ld d0,fr
	add d0,#0xffffffb0
	ld.b r14,[r0]
	and r14,#0xff
	ld [sp],r14
	ld.b r14,[r0,1]
	and r14,#0xff
	ld [sp,4],r14
	ld.b r14,[r0,2]
	and r14,#0xff
	ld [sp,8],r14
	ld.b r14,[r0,3]
	and r14,#0xff
	ld [sp,12],r14
	ld.b r14,[r0,4]
	and r14,#0xff
	ld [sp,16],r14
	ld.b r14,[r0,5]
	and r14,#0xff
	ld [sp,20],r14
	ld i1,[i1]
	ld [sp,24],i1
	ld i0,d0
	ld i1,&LC4_67
	call &_sprintf_37
.line 111
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil10Connection7connectEPKc_62
	ld i2,r14
.line 112
	ld r14,#0x0
	jc ge,i2,r14,&L32_67
.line 113
	ld i0,[d1,12]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d1
	call d0
	jp &L32_67
L38_67:
.line 104
	ld i0,&LC3_67
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x68
	call &_bfeHandler_28

//****************************************
// Function: __ZThn40_N6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi
//****************************************

.func __ZThn40_N6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi_67, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.h'
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 39
	add i0,#0xffffffd8
	call &__ZN6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi_67
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi
//****************************************

.func __ZN6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi_67, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.cpp'
.line 116
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
	ld i2,i1
LBB22_67:
.line 117
	ld r14,[i0,64]
	ld r1,#0x0
	jc le,r14,r1,&L43_67
LBE22_67:
.line 122
	pop rt,d0
	ret
L43_67:
.line 118
	jc lt,i1,r1,&L42_67
.line 119
	ld i2,#0xffffffef
L42_67:
.line 120
	ld i0,[r0,12]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,r0
	call d0
LBE23_67:
.line 122
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscovererC1Ev
//****************************************

.func __ZN6MAUtil19BluetoothDiscovererC1Ev_68, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 23
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_68:
.line 23
	ld r14,&__ZTVN6MAUtil19BluetoothDiscovererE_68+8
	ld [i0],r14
	ld r14,#0x0
	ld [i0,4],r14
	ld [i0,8],r14
LBE3_68:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEb
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEb_68, 3, int
.line 27
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i2
LBB4_68:
.line 28
	ld r0,#0x0
	ld i0,&LC0_68
	jc eq,i1,r0,&L13_68
.line 29
	ld r14,[d0,4]
	ld r0,#0x0
	jc ne,r14,r0,&L10_68
	ld d1,[d0,8]
	jc eq,d1,r14,&L8_68
L10_68:
	ld i0,&LC1_68
L13_68:
	ld i1,&_ZZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEbE12__FUNCTION___68
	call &_panicFunction_28
L8_68:
.line 31
	ld [d0,4],i1
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE_73
LBB6_68:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 1959
	ld i0,#0x15
	ld i1,d2
	and i1,#0xff
	ld i2,d1
	ld i3,d1
	syscall 96
	ld r0,r14
	ld r1,r15
LBE7_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 34
	jc le,d1,r14,&L12_68
.line 35
	ld [d0,4],d1
L12_68:
.line 37
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerE
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerE_68, 4, int
.line 41
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d2,i1
	ld d3,i2
LBB8_68:
.line 42
	ld r0,#0x0
	ld i0,&LC0_68
	jc eq,i3,r0,&L23_68
.line 43
	ld r14,[d0,4]
	ld r0,#0x0
	jc ne,r14,r0,&L20_68
	ld d1,[d0,8]
	jc eq,d1,r14,&L18_68
L20_68:
	ld i0,&LC1_68
L23_68:
	ld i1,&_ZZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerEE12__FUNCTION___68
	call &_panicFunction_28
L18_68:
.line 45
	ld [d0,8],i3
.line 46
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE_73
LBB10_68:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 2001
	ld i0,#0x17
	ld i1,d2
	ld i2,d3
	ld i3,d1
	syscall 96
	ld r0,r14
	ld r1,r15
LBE11_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 48
	jc le,d1,r14,&L22_68
.line 49
	ld [d0,8],d1
L22_68:
.line 51
	ld r14,r0
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer6cancelEv
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer6cancelEv_68, 1, int
.line 53
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_68:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 2037
	ld i0,#0x1a
	ld i1,#0x0
	ld i2,i1
	ld i3,i1
	syscall 96
	ld r0,r14
	ld r1,r15
LBE14_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 55
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer8handleDDEi
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer8handleDDEi_68, 2, void
.line 123
	push rt,d5
	sub sp,#0x124
	ld fr,sp
	add fr,#0x144
	ld d3,i0
	ld d4,i1
LBB15_68:
.line 128
	ld r14,fr
	add r14,#0xfffffecc
	ld [fr,-52],r14
.line 129
	ld r14,#0x100
	ld [fr,-48],r14
	ld d5,fr
	add d5,#0xffffffcc
L27_68:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 1981
	ld i0,#0x16
	ld i1,d5
	ld i2,#0x0
	ld i3,i2
	syscall 96
	ld r0,r14
	ld r1,r15
LBE19_68:
	ld d2,r14
LBB20_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 133
	ld r14,#0x0
	jc eq,r0,r14,&L28_68
LBB21_68:
.line 134
	jc lt,r0,r14,&L40_68
LBB22_68:
.line 143
	ld d1,fr
	add d1,#0xfffffec0
LBB23_68:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBE23_68:
.line 144
	ld.b r14,[fr,-40]
	ld.b [fr,-316],r14
	ld.b r14,[fr,-39]
	ld.b [fr,-315],r14
	ld.b r14,[fr,-38]
	ld.b [fr,-314],r14
	ld.b r14,[fr,-37]
	ld.b [fr,-313],r14
	ld.b r14,[fr,-36]
	ld.b [fr,-312],r14
	ld.b r14,[fr,-35]
	ld.b [fr,-311],r14
.line 145
	ld d0,fr
	add d0,#0xfffffebc
	ld i0,d0
	ld i1,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 146
	ld i0,[d3,4]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d1
	call d0
LBB24_68:
.line 143
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE25_68:
.line 148
	ld r14,#0x0
	jc gt,d2,r14,&L27_68
L28_68:
.line 150
	ld r14,#0x0
	jc eq,d4,r14,&L26_68
L39_68:
.line 151
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	call &__ZN6MAUtil11Environment23removeBluetoothListenerEv_73
.line 152
	ld i0,[d3,4]
.line 153
	ld r14,#0x0
	ld [d3,4],r14
.line 154
	ld r14,[i0]
	ld d0,[r14,4]
	ld i1,d4
	call d0
L26_68:
.line 156
	add sp,#0x124
	pop rt,d5
	ret
L40_68:
.line 136
	jc lt,d4,r14,&L39_68
.line 137
	ld d4,r0
	jp &L28_68

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer8handleSDEi
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer8handleSDEi_68, 2, void
.line 67
	push rt,d7
	sub sp,#0x140
	ld fr,sp
	add fr,#0x168
	ld d5,i0
	ld d6,i1
LBB33_68:
.line 72
	ld d7,fr
	add d7,#0xfffffeb8
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBB37_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d1,fr
	add d1,#0xfffffebc
LBB38_68:
.line 109
	ld i0,#0x40
	call &__Znam_20
	ld [fr,-316],r14
.line 111
	ld r0,#0x4
	ld [fr,-320],r0
.line 113
	ld r0,#0x0
	ld [d1],r0
LBE38_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 75
	ld r0,fr
	add r0,#0xfffffec8
	ld [fr,-52],r0
.line 76
	ld r0,#0x100
	ld [fr,-48],r0
Ltext11_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 389
	ld [fr,-44],r14
	ld d4,fr
	add d4,#0xfffffe98
L45_68:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 2012
	ld i0,#0x18
	ld i1,d4
	ld i2,#0x0
	ld i3,i2
	syscall 96
	ld r0,r14
LBE41_68:
	ld d2,r14
Ltext13_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 82
	ld r14,#0x0
	jc eq,r0,r14,&L46_68
.line 83
	jc lt,r0,r14,&L129_68
LBB42_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld r0,[d1,4]
LBE43_68:
	ld r14,[d4,4]
	jc le,r14,r0,&L108_68
L132_68:
.line 295
	ld r14,#0x0
	jc lt,r0,r14,&L130_68
	ld r14,[d1]
L56_68:
.line 281
	ld d0,#0x0
	jc le,r14,d0,&L112_68
	ld d2,fr
	add d2,#0xfffffea4
L66_68:
.line 282
	ld i0,d0
	sll i0,#0x4
	ld r14,[d1,8]
	add i0,r14
	ld r0,#0x0
	ld [fr,-348],r0
	ld [fr,-344],r0
	ld [fr,-340],r0
	ld [fr,-336],r0
	ld i1,d2
	ld i2,#0x10
	syscall 5
.line 281
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L66_68
L112_68:
.line 285
	ld r14,#0x0
	ld [d1],r14
LBE46_68:
.line 327
	ld r0,[d1,4]
LBE53_68:
	ld d2,r0
	add d2,r0
LBB54_68:
.line 295
	jc lt,r0,d2,&L131_68
	ld r14,[d1,8]
LBE55_68:
.line 389
	ld [fr,-44],r14
L138_68:
.line 327
	ld r14,[d4,4]
	jc gt,r14,r0,&L132_68
L108_68:
.line 272
	ld d3,[d4,4]
LBB57_68:
.line 295
	jc lt,r0,d3,&L133_68
	ld r14,[d1]
L80_68:
.line 281
	ld d0,d3
	jc le,r14,d3,&L118_68
	ld d2,fr
	add d2,#0xfffffea4
L90_68:
.line 282
	ld i0,d0
	sll i0,#0x4
	ld r14,[d1,8]
	add i0,r14
	ld r0,#0x0
	ld [fr,-348],r0
	ld [fr,-344],r0
	ld [fr,-340],r0
	ld [fr,-336],r0
	ld i1,d2
	ld i2,#0x10
	syscall 5
.line 281
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L90_68
L118_68:
.line 285
	ld [d1],d3
LBE58_68:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\maapi.h'
.line 2022
	ld i0,#0x19
	ld i1,fr
	add i1,#0xffffffc8
	ld i2,#0x0
	ld i3,i2
	syscall 96
	ld r0,r14
LBE64_68:
	ld d2,r14
Ltext16_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 96
	ld r14,#0x0
	jc eq,r0,r14,&L46_68
.line 97
	jc lt,r0,r14,&L129_68
.line 103
	ld r0,[fr,-56]
	ld [fr,-332],r0
.line 104
	ld r14,[fr,-360]
	ld r0,#0x0
	jc le,r14,r0,&L134_68
.line 107
	ld d0,fr
	add d0,#0xfffffea0
	ld i0,d0
	ld i1,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
L127_68:
	ld i0,d7
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 110
	ld i0,[d5,8]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,fr
	add i1,#0xfffffeb4
	call d0
LBE39_68:
.line 113
	ld r14,#0x0
	jc gt,d2,r14,&L45_68
L46_68:
.line 115
	ld r0,#0x0
	jc eq,d6,r0,&L98_68
L122_68:
.line 116
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	call &__ZN6MAUtil11Environment23removeBluetoothListenerEv_73
.line 117
	ld i0,[d5,8]
.line 118
	ld r14,#0x0
	ld [d5,8],r14
.line 119
	ld r14,[i0]
	ld d0,[r14,4]
	ld i1,d6
	call d0
L98_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[fr,-316]
	ld r0,#0x0
	jc ne,i0,r0,&L135_68
LBE70_68:
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE68_68:
	add sp,#0x140
	pop rt,d7
	ret
L131_68:
.line 298
	ld i0,d2
	sll i0,#0x4
	call &__Znam_20
	ld d3,r14
LBB77_68:
.line 300
	ld d0,#0x0
	ld r14,[d1]
	jc le,r14,d0,&L114_68
L136_68:
.line 301
	ld i1,d0
	sll i1,#0x4
	ld i0,i1
	add i0,d3
	ld r0,[d1,8]
	add i1,r0
	ld i2,#0x10
	syscall 5
.line 300
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L136_68
L114_68:
.line 304
	ld [d1,4],d2
.line 305
	ld i0,[d1,8]
	ld r14,#0x0
	jc ne,i0,r14,&L137_68
L76_68:
.line 307
	ld r14,d3
	ld [d1,8],d3
	ld r0,[d1,4]
LBE76_68:
.line 389
	ld [fr,-44],r14
	jp &L138_68
L130_68:
.line 298
	ld i0,r14
	call &__Znam_20
	ld d2,r14
LBB84_68:
.line 300
	ld d0,#0x0
	ld r14,[d1]
	jc le,r14,d0,&L110_68
L139_68:
.line 301
	ld i1,d0
	sll i1,#0x4
	ld i0,i1
	add i0,d2
	ld r0,[d1,8]
	add i1,r0
	ld i2,#0x10
	syscall 5
.line 300
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L139_68
L110_68:
.line 304
	ld r0,#0x0
	ld [d1,4],r0
.line 305
	ld i0,[d1,8]
	jc ne,i0,r0,&L140_68
.line 307
	ld [d1,8],d2
	jp &L56_68
L133_68:
.line 298
	ld i0,d3
	sll i0,#0x4
	call &__Znam_20
	ld d2,r14
LBB91_68:
.line 300
	ld d0,#0x0
	ld r14,[d1]
	jc le,r14,d0,&L116_68
L141_68:
.line 301
	ld i1,d0
	sll i1,#0x4
	ld i0,i1
	add i0,d2
	ld r0,[d1,8]
	add i1,r0
	ld i2,#0x10
	syscall 5
.line 300
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L141_68
L116_68:
.line 304
	ld [d1,4],d3
.line 305
	ld i0,[d1,8]
	ld r0,#0x0
	jc ne,i0,r0,&L142_68
.line 307
	ld [d1,8],d2
	jp &L80_68
L134_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 105
	ld d0,fr
	add d0,#0xfffffea0
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
	jp &L127_68
L135_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE95_68:
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE93_68:
	add sp,#0x140
	pop rt,d7
	ret
L129_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 99
	jc lt,d6,r14,&L122_68
.line 100
	ld d6,r0
	jp &L46_68
L140_68:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d2
	jp &L56_68
L137_68:
.line 305
	call &__ZdaPv_22
	jp &L76_68
L142_68:
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d2
	jp &L80_68

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer14bluetoothEventEi
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer14bluetoothEventEi_68, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 57
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB114_68:
.line 58
	ld r0,[i0,4]
	ld r1,#0x0
	jc ne,r0,r1,&L147_68
.line 60
	ld r14,[i0,8]
	jc eq,r14,r0,&L143_68
.line 61
	call &__ZN6MAUtil19BluetoothDiscoverer8handleSDEi_68
L143_68:
.line 63
	pop rt,fr
	ret
L147_68:
.line 59
	call &__ZN6MAUtil19BluetoothDiscoverer8handleDDEi_68
LBE115_68:
.line 63
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_70, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.h'
.line 57
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 57
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_70, 2, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput6enableEv
//****************************************

.func __ZN6MAUtil9CharInput6enableEv_70, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 45
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB2_70:
.line 46
	call &_CharInput_Reset_65
.line 47
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_73
LBE2_70:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput7disableEv
//****************************************

.func __ZN6MAUtil9CharInput7disableEv_70, 1, void
.line 50
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_70:
.line 51
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_73
.line 52
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	add i1,#0x4
	call &__ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE_73
LBE3_70:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput13keyPressEventEii
//****************************************

.func __ZN6MAUtil9CharInput13keyPressEventEii_70, 3, void
.line 69
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_70:
.line 70
	ld i0,i1
	call &_CharInput_Pressed_65
LBE4_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput15keyReleaseEventEii
//****************************************

.func __ZN6MAUtil9CharInput15keyReleaseEventEii_70, 3, void
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_70:
.line 74
	ld i0,i1
	call &_CharInput_Released_65
LBE5_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput9charEventEj
//****************************************

.func __ZN6MAUtil9CharInput9charEventEj_70, 2, void
.line 77
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB6_70:
.line 78
	ld i0,i1
	call &_CharInput_Char_65
LBE6_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N6MAUtil9CharInput13runTimerEventEv
//****************************************

.func __ZThn4_N6MAUtil9CharInput13runTimerEventEv_70, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.h'
.line 178
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 178
	add i0,#0xfffffffc
	call &__ZN6MAUtil9CharInput13runTimerEventEv_70
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput13runTimerEventEv
//****************************************

.func __ZN6MAUtil9CharInput13runTimerEventEv_70, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 81
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB7_70:
.line 82
	ld d0,[i0,12]
	call d0
LBE7_70:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput10startTimerEPFvvEi
//****************************************

.func __ZN6MAUtil9CharInput10startTimerEPFvvEi_70, 2, void
.line 85
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB8_70:
.line 86
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
	ld i1,r0
	add i1,#0x4
	ld r14,#0x0
	jc ne,r0,r14,&L12_70
	ld i1,r0
L12_70:
	ld i2,d0
	ld i3,#0x1
	call &__ZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEii_73
.line 87
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
	ld [r14,12],d1
LBE8_70:
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput9stopTimerEv
//****************************************

.func __ZN6MAUtil9CharInput9stopTimerEv_70, 0, void
.line 90
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB9_70:
.line 91
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
	ld i1,r0
	add i1,#0x4
	ld r14,#0x0
	jc ne,r0,r14,&L16_70
	ld i1,r0
L16_70:
	call &__ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE_73
LBE9_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput15forceDeploymentEv
//****************************************

.func __ZN6MAUtil9CharInput15forceDeploymentEv_70, 1, void
.line 110
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB10_70:
.line 111
	call &_CharInput_ForceDeployment_65
LBE10_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput7setModeENS0_8CharModeE
//****************************************

.func __ZN6MAUtil9CharInput7setModeENS0_8CharModeE_70, 2, void
.line 114
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB11_70:
.line 115
	ld i0,i1
	call &_CharInput_setMode_65
LBE11_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil9CharInput7getModeEv
//****************************************

.func __ZNK6MAUtil9CharInput7getModeEv_70, 1, int
.line 118
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_70:
.line 119
	call &_CharInput_getMode_65
LBE12_70:
.line 120
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput9setQwertyEb
//****************************************

.func __ZN6MAUtil9CharInput9setQwertyEb_70, 2, void
.line 122
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB13_70:
.line 123
	ld i0,i1
	and i0,#0xff
	call &_CharInput_setQwerty_65
LBE13_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput19isCharInputListenerEPNS_17CharInputListenerE
//****************************************

.func __ZN6MAUtil9CharInput19isCharInputListenerEPNS_17CharInputListenerE_70, 2, int
.line 55
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB15_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 117
	ld r1,i0
	add r1,#0x10
LBB17_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x14
LBB21_70:
	ld r15,[i0,8]
LBE21_70:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r15
LBE23_70:
	jc eq,r14,r15,&L33_70
L36_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 119
	ld r14,[r15]
	jc eq,r14,i1,&L35_70
.line 118
	add r15,#0x8
LBB24_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,r1
	add r0,#0x4
LBB25_70:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE25_70:
	jc ne,r14,r15,&L36_70
L33_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	ld r14,#0x0
LBE18_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 57
	pop fr,fr
	ret
L35_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	ld r14,#0x1
LBE30_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 57
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInputC1Ev
//****************************************

.func __ZN6MAUtil9CharInputC1Ev_70, 1, void
.line 24
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB31_70:
.line 26
	ld r0,&__ZTVN6MAUtil9CharInputE_70+8
	ld [i0],r0
	ld r14,&__ZTVN6MAUtil9CharInputE_70+48
	ld [i0,4],r14
	ld r0,#0x0
	ld.b [i0,8],r0
LBB32_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,i0
	add r14,#0x10
LBB33_70:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB34_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x14
LBB35_70:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE35_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 27
	ld d0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
	jc ne,d0,r0,&L43_70
.line 30
	ld i0,&__ZN6MAUtil9CharInput24characterChangedCallbackEcPv_70
	ld i1,d0
	call &_CharInput_RegisterCharacterChangedCallback_65
.line 31
	ld i0,&__ZN6MAUtil9CharInput25characterDeployedCallbackEcPv_70
	ld i1,d0
	call &_CharInput_RegisterCharacterDeployedCallback_65
.line 32
	ld i0,&__ZN6MAUtil9CharInput10startTimerEPFvvEi_70
	ld i1,&__ZN6MAUtil9CharInput9stopTimerEv_70
	call &_CharInput_RegisterTimerCallback_65
.line 34
	ld [zr,__ZN6MAUtil9CharInput18charInputSingletonE_70],d1
LBE31_70:
	pop rt,d1
	ret
L43_70:
.line 28
	ld i0,&LC0_70
	ld i1,&_ZZN6MAUtil9CharInputC1EvE12__FUNCTION___70
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil9CharInput12getCharInputEv
//****************************************

.func __ZN6MAUtil9CharInput12getCharInputEv_70, 0, int
.line 37
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB37_70:
.line 38
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
.line 41
	ld d0,r14
.line 38
	ld r0,#0x0
	jc eq,r14,r0,&L47_70
LBE37_70:
.line 43
	ld r14,d0
	pop rt,d0
	ret
L47_70:
.line 39
	ld i0,#0x20
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	call &__ZN6MAUtil9CharInputC1Ev_70
LBE38_70:
.line 43
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput25characterDeployedCallbackEcPv
//****************************************

.func __ZN6MAUtil9CharInput25characterDeployedCallbackEcPv_70, 2, void
.line 102
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d2,i0
LBB45_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
LBB48_70:
.line 125
	ld r0,#0x1
	ld.b [r14,16],r0
LBE49_70:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld r1,r14
	add r1,#0x14
LBB54_70:
	ld [i1],r1
LBB55_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[r1]
LBE56_70:
	ld [fr,-48],r0
Ltext21_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r2,#0x0
	ld [fr,-44],r2
.line 72
	jc le,r0,r2,&L92_70
LBB57_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[r1,8]
LBE58_70:
	ld r14,[r14,4]
	jc ne,r14,r2,&L92_70
	ld r2,r14
L85_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r2
	add r14,#0x1
	ld r2,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L92_70
LBB61_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r3,[r1,8]
	add r14,r3
LBE62_70:
	ld r14,[r14,4]
	ld r3,#0x0
	jc eq,r14,r3,&L85_70
L92_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L150_70:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L97_70
	ld r14,#0x1
L97_70:
	ld r2,#0x0
	jc eq,r14,r2,&L151_70
LBB65_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB68_70:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE68_70:
	ld i0,[i0]
LBE66_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 59
	ld r14,[i0]
	ld d0,[r14,4]
	ld i1,d2
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L100_70:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L150_70
LBB71_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB72_70:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE72_70:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L100_70
	jp &L150_70
L151_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
	ld d4,r0
	add d4,#0x10
LBB74_70:
.line 125
	ld r3,#0x0
	ld.b [d4],r3
LBB76_70:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r1,r2
	jc eq,r14,r2,&L55_70
LBB77_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d1,r0
	add d1,#0x14
LBB79_70:
	ld d3,[d1]
LBE79_70:
.line 334
	ld d0,[d1,8]
LBE82_70:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE84_70:
	jc eq,r14,d0,&L139_70
	ld d2,d1
	jp &L117_70
L112_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 129
	add d0,#0x8
LBB85_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE86_70:
	jc eq,r14,d0,&L139_70
L117_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r2,#0x0
	jc gt,r14,r2,&L112_70
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r2,&L152_70
L115_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB88_70:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE88_70:
	ld r3,[r14]
	ld [d0],r3
	ld r14,[r14,4]
	ld [d0,4],r14
Ltext35_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 129
	add d0,#0x8
LBB89_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE90_70:
	jc ne,r14,d0,&L117_70
L139_70:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L153_70
	ld r14,[d2]
L119_70:
.line 281
	ld r0,d3
	jc le,r14,d3,&L143_70
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc4
L129_70:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L129_70
L143_70:
.line 285
	ld [d2],d3
LBE93_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L55_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 108
	add sp,#0x20
	pop rt,d4
	ret
L152_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L115_70
L153_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB112_70:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L146_70
	ld i0,[d2,8]
L123_70:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L123_70
L141_70:
.line 304
	ld [d2,4],d3
.line 305
	ld r3,#0x0
	jc ne,i0,r3,&L154_70
.line 307
	ld [d2,8],d0
	jp &L119_70
L154_70:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L119_70
L146_70:
	ld i0,[d2,8]
	jp &L141_70

//****************************************
// Function: __ZN6MAUtil9CharInput24characterChangedCallbackEcPv
//****************************************

.func __ZN6MAUtil9CharInput24characterChangedCallbackEcPv_70, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 94
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d2,i0
LBB113_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
LBB116_70:
.line 125
	ld r0,#0x1
	ld.b [r14,16],r0
LBE117_70:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld r1,r14
	add r1,#0x14
LBB122_70:
	ld [i1],r1
LBB123_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[r1]
LBE124_70:
	ld [fr,-48],r0
Ltext44_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r2,#0x0
	ld [fr,-44],r2
.line 72
	jc le,r0,r2,&L192_70
LBB125_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[r1,8]
LBE126_70:
	ld r14,[r14,4]
	jc ne,r14,r2,&L192_70
	ld r2,r14
L185_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r2
	add r14,#0x1
	ld r2,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L192_70
LBB129_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r3,[r1,8]
	add r14,r3
LBE130_70:
	ld r14,[r14,4]
	ld r3,#0x0
	jc eq,r14,r3,&L185_70
L192_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L250_70:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L197_70
	ld r14,#0x1
L197_70:
	ld r2,#0x0
	jc eq,r14,r2,&L251_70
LBB133_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB136_70:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE136_70:
	ld i0,[i0]
LBE134_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 59
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d2
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L200_70:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L250_70
LBB139_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB140_70:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE140_70:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L200_70
	jp &L250_70
L251_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_70]
	ld d4,r0
	add d4,#0x10
LBB142_70:
.line 125
	ld r3,#0x0
	ld.b [d4],r3
LBB144_70:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r1,r2
	jc eq,r14,r2,&L155_70
LBB145_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d1,r0
	add d1,#0x14
LBB147_70:
	ld d3,[d1]
LBE147_70:
.line 334
	ld d0,[d1,8]
LBE150_70:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE152_70:
	jc eq,r14,d0,&L239_70
	ld d2,d1
	jp &L217_70
L212_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 129
	add d0,#0x8
LBB153_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE154_70:
	jc eq,r14,d0,&L239_70
L217_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r2,#0x0
	jc gt,r14,r2,&L212_70
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r2,&L252_70
L215_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB156_70:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE156_70:
	ld r3,[r14]
	ld [d0],r3
	ld r14,[r14,4]
	ld [d0,4],r14
Ltext58_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 129
	add d0,#0x8
LBB157_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE158_70:
	jc ne,r14,d0,&L217_70
L239_70:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L253_70
	ld r14,[d2]
L219_70:
.line 281
	ld r0,d3
	jc le,r14,d3,&L243_70
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc4
L229_70:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L229_70
L243_70:
.line 285
	ld [d2],d3
LBE161_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L155_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 100
	add sp,#0x20
	pop rt,d4
	ret
L252_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L215_70
L253_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB180_70:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L246_70
	ld i0,[d2,8]
L223_70:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L223_70
L241_70:
.line 304
	ld [d2,4],d3
.line 305
	ld r3,#0x0
	jc ne,i0,r3,&L254_70
.line 307
	ld [d2,8],d0
	jp &L219_70
L254_70:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L219_70
L246_70:
	ld i0,[d2,8]
	jp &L241_70

//****************************************
// Function: __ZN6MAUtil9CharInput23removeCharInputListenerEPNS_17CharInputListenerE
//****************************************

.func __ZN6MAUtil9CharInput23removeCharInputListenerEPNS_17CharInputListenerE_70, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 64
	push rt,d4
	sub sp,#0x8
	ld fr,sp
	add fr,#0x24
	ld d3,i0
LBB181_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 101
	ld d1,i0
	add d1,#0x10
LBB183_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d2,i0
	add d2,#0x14
LBB187_70:
	ld d0,[d2,8]
LBE187_70:
.line 341
	ld r14,[d2]
	sll r14,#0x3
	add r14,d0
LBE189_70:
	jc eq,r14,d0,&L283_70
L298_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d0]
	jc eq,i0,i1,&L297_70
.line 102
	add d0,#0x8
LBB190_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d1
	add r0,#0x4
LBB191_70:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE191_70:
	jc ne,r14,d0,&L298_70
L283_70:
.line 265
	ld r0,[d2]
LBE195_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 141
	ld r14,#0x0
	jc ne,r0,r14,&L255_70
	ld.b r14,[d3,8]
	and r14,#0xff
	jc eq,r14,r0,&L255_70
Ltext70_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 66
	ld i0,d3
	call &__ZN6MAUtil9CharInput7disableEv_70
L255_70:
.line 67
	add sp,#0x8
	pop rt,d4
	ret
L297_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 104
	ld.b r0,[d1]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L299_70
.line 108
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L264_70
.line 109
	call &__ZdlPv_23
L264_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	add d1,#0x4
	ld r14,d0
LBB202_70:
.line 341
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE205_70:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d0,&L290_70
L268_70:
.line 205
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L268_70
	ld r1,[d1]
L290_70:
.line 272
	ld d0,r1
	add d0,#0xffffffff
LBB207_70:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d0,&L300_70
L270_70:
.line 281
	ld r0,d0
	jc le,r1,d0,&L294_70
	ld r1,fr
	add r1,#0xffffffdc
L280_70:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-36],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L280_70
L294_70:
.line 285
	ld [d1],d0
	jp &L283_70
L299_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 105
	ld [d0,4],r1
.line 106
	ld r2,#0x1
	ld.b [d1,1],r2
	jp &L283_70
L300_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d0
	sll i0,#0x3
	call &__Znam_20
	ld d4,r14
LBB222_70:
.line 300
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L295_70
	ld i0,[d1,8]
L274_70:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d4
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L274_70
L292_70:
.line 304
	ld [d1,4],d0
.line 305
	ld r2,#0x0
	jc ne,i0,r2,&L301_70
.line 307
	ld i0,d4
	ld [d1,8],d4
	jp &L270_70
L301_70:
.line 305
	call &__ZdaPv_22
	ld r1,[d1]
.line 307
	ld i0,d4
	ld [d1,8],d4
	jp &L270_70
L295_70:
	ld i0,[d1,8]
	jp &L292_70

//****************************************
// Function: __ZN6MAUtil9CharInput20addCharInputListenerEPNS_17CharInputListenerE
//****************************************

.func __ZN6MAUtil9CharInput20addCharInputListenerEPNS_17CharInputListenerE_70, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 59
	push rt,d5
	sub sp,#0x8
	ld fr,sp
	add fr,#0x28
	ld d3,i0
LBB223_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,i0
	add r1,#0x10
LBB225_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d2,i0
	add d2,#0x14
LBB229_70:
	ld r0,[d2,8]
LBE229_70:
.line 341
	ld r14,[d2]
	sll r14,#0x3
	add r14,r0
LBE231_70:
	jc eq,r14,r0,&L340_70
L310_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,i1,&L346_70
.line 91
	add r0,#0x8
LBB232_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB233_70:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE233_70:
	jc ne,r14,r0,&L310_70
L335_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d5,fr
	add d5,#0xffffffd8
	ld r14,#0x1
	ld [fr,-36],r14
	ld [fr,-40],i1
LBB234_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L342_70
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L312_70
LBB236_70:
.line 293
	ld d4,d1
	add d4,d1
LBB237_70:
.line 295
	jc lt,d1,d4,&L347_70
L342_70:
	ld i0,[d0,8]
L311_70:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d5]
	ld [r14],r2
	ld d5,[d5,4]
	ld [r14,4],d5
	add r0,#0x1
	ld [d0],r0
L309_70:
.line 265
	ld r14,[d2]
LBE242_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 141
	ld r0,#0x0
	jc le,r14,r0,&L302_70
	ld.b r14,[d3,8]
	and r14,#0xff
	jc eq,r14,r0,&L348_70
L302_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 62
	add sp,#0x8
	pop rt,d5
	ret
L346_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r1,#0x1
	ld [r0,4],r1
	jp &L309_70
L348_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 61
	ld i0,d3
	call &__ZN6MAUtil9CharInput6enableEv_70
LBE243_70:
.line 62
	add sp,#0x8
	pop rt,d5
	ret
L340_70:
	ld d0,r1
	add d0,#0x4
	jp &L335_70
L347_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d4
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB257_70:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L343_70
	ld i0,[d0,8]
L318_70:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L318_70
L337_70:
.line 304
	ld [d0,4],d4
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L349_70
.line 307
	ld i0,d1
L345_70:
	ld [d0,8],i0
	jp &L311_70
L312_70:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d4,r14
LBB261_70:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L344_70
	ld i0,[d0,8]
L327_70:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d4
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L327_70
L339_70:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L350_70
.line 307
	ld i0,d4
L351_70:
	ld [d0,8],i0
	jp &L311_70
L350_70:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d4
	jp &L351_70
L349_70:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L345_70
L344_70:
	ld i0,[d0,8]
	jp &L339_70
L343_70:
	ld i0,[d0,8]
	jp &L337_70

//****************************************
// Function: __ZN6MAUtil9CharInputD1Ev
//****************************************

.func __ZN6MAUtil9CharInputD1Ev_70, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB265_70:
.line 129
	ld r14,&__ZTVN6MAUtil9CharInputE_70+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil9CharInputE_70+48
	ld [i0,4],r14
LBB266_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,28]
	ld r14,#0x0
	jc ne,i0,r14,&L364_70
LBE269_70:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBE265_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	pop rt,d0
	ret
L364_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE274_70:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBE270_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInputD0Ev
//****************************************

.func __ZN6MAUtil9CharInputD0Ev_70, 1, void
.line 129
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB275_70:
.line 129
	ld r14,&__ZTVN6MAUtil9CharInputE_70+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil9CharInputE_70+48
	ld [i0,4],r14
LBB276_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,28]
	ld r14,#0x0
	jc ne,i0,r14,&L377_70
LBE279_70:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBE275_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret
L377_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE284_70:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBE280_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: _dummy_setup
//****************************************

.func _dummy_setup_71, 4, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Graphics.c'
.line 86
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
	ld d2,i1
	ld d3,i2
	ld d4,i3
.line 87
	call &_Gfx_useDriverSoftware_64
.line 88
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d4
	call d0
	pop rt,d4
	ret

//****************************************
// Function: _dummy_setClipRect
//****************************************

.func _dummy_setClipRect_71, 4, void
.line 91
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
	ld d2,i1
	ld d3,i2
	ld d4,i3
.line 92
	call &_Gfx_useDriverSoftware_64
.line 93
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,4]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d4
	call d0
	pop rt,d4
	ret

//****************************************
// Function: _dummy_clearMatrix
//****************************************

.func _dummy_clearMatrix_71, 0, void
.line 96
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 97
	call &_Gfx_useDriverSoftware_64
.line 98
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,8]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _dummy_pushMatrix
//****************************************

.func _dummy_pushMatrix_71, 0, void
.line 101
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 102
	call &_Gfx_useDriverSoftware_64
.line 103
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,12]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _dummy_popMatrix
//****************************************

.func _dummy_popMatrix_71, 0, void
.line 106
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 107
	call &_Gfx_useDriverSoftware_64
.line 108
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,16]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _dummy_translate
//****************************************

.func _dummy_translate_71, 2, void
.line 111
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
.line 112
	call &_Gfx_useDriverSoftware_64
.line 113
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,d2
	call d0
	pop rt,d2
	ret

//****************************************
// Function: _dummy_getTranslation
//****************************************

.func _dummy_getTranslation_71, 0, double
.line 116
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 117
	call &_Gfx_useDriverSoftware_64
.line 118
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,24]
	call d0
	ld r0,r14
	ld r1,r15
	ld r2,r14
	ld r3,r15
.line 119
	pop rt,d0
	ret

//****************************************
// Function: _dummy_scale
//****************************************

.func _dummy_scale_71, 2, void
.line 121
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 121
	pop fr,fr
	ret

//****************************************
// Function: _dummy_plot
//****************************************

.func _dummy_plot_71, 2, void
.line 125
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
.line 126
	call &_Gfx_useDriverSoftware_64
.line 127
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,32]
	ld i0,d1
	ld i1,d2
	call d0
	pop rt,d2
	ret

//****************************************
// Function: _dummy_line
//****************************************

.func _dummy_line_71, 4, void
.line 130
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
	ld d3,i2
.line 131
	call &_Gfx_useDriverSoftware_64
.line 132
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,36]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d2
	call d0
	pop rt,d3
	ret

//****************************************
// Function: _dummy_fillRect
//****************************************

.func _dummy_fillRect_71, 4, void
.line 135
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
	ld d2,i1
	ld d3,i2
	ld d4,i3
.line 136
	call &_Gfx_useDriverSoftware_64
.line 137
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,40]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d4
	call d0
	pop rt,d4
	ret

//****************************************
// Function: _dummy_drawText
//****************************************

.func _dummy_drawText_71, 3, void
.line 140
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
	ld d3,i2
.line 141
	call &_Gfx_useDriverSoftware_64
.line 142
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,44]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	call d0
	pop rt,d3
	ret

//****************************************
// Function: _dummy_drawTextW
//****************************************

.func _dummy_drawTextW_71, 3, void
.line 145
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
	ld d3,i2
.line 146
	call &_Gfx_useDriverSoftware_64
.line 147
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,48]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	call d0
	pop rt,d3
	ret

//****************************************
// Function: _dummy_drawImage
//****************************************

.func _dummy_drawImage_71, 3, void
.line 150
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
	ld d3,i2
.line 151
	call &_Gfx_useDriverSoftware_64
.line 152
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,52]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	call d0
	pop rt,d3
	ret

//****************************************
// Function: _dummy_drawRGB
//****************************************

.func _dummy_drawRGB_71, 4, void
.line 155
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
	ld d2,i1
	ld d3,i2
	ld d4,i3
.line 156
	call &_Gfx_useDriverSoftware_64
.line 157
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,56]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d4
	call d0
	pop rt,d4
	ret

//****************************************
// Function: _dummy_drawImageRegion
//****************************************

.func _dummy_drawImageRegion_71, 4, void
.line 160
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
	ld d2,i1
	ld d3,i2
	ld d4,i3
.line 161
	call &_Gfx_useDriverSoftware_64
.line 162
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,60]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d4
	call d0
	pop rt,d4
	ret

//****************************************
// Function: _dummy_notifyImageUpdated
//****************************************

.func _dummy_notifyImageUpdated_71, 1, void
.line 165
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
.line 166
	call &_Gfx_useDriverSoftware_64
.line 167
	ld r14,[zr,_graphicsDriver_71]
	ld d1,[r14,64]
	ld i0,d0
	call d1
	pop rt,d1
	ret

//****************************************
// Function: _dummy_beginRendering
//****************************************

.func _dummy_beginRendering_71, 0, void
.line 170
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 171
	call &_Gfx_useDriverSoftware_64
.line 172
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,68]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _dummy_updateScreen
//****************************************

.func _dummy_updateScreen_71, 0, void
.line 175
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 176
	call &_Gfx_useDriverSoftware_64
.line 177
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,72]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _dummy_setClearColor
//****************************************

.func _dummy_setClearColor_71, 3, void
.line 180
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
	ld d3,i2
.line 181
	call &_Gfx_useDriverSoftware_64
.line 182
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,76]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	call d0
	pop rt,d3
	ret

//****************************************
// Function: _dummy_setColor
//****************************************

.func _dummy_setColor_71, 3, void
.line 186
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d2,i1
	ld d3,i2
.line 187
	call &_Gfx_useDriverSoftware_64
.line 188
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,80]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	call d0
	pop rt,d3
	ret

//****************************************
// Function: _dummy_setAlpha
//****************************************

.func _dummy_setAlpha_71, 1, void
.line 191
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
.line 192
	call &_Gfx_useDriverSoftware_64
.line 193
	ld r14,[zr,_graphicsDriver_71]
	ld d1,[r14,84]
	ld i0,d0
	call d1
	pop rt,d1
	ret

//****************************************
// Function: _Gfx_clearMatrix
//****************************************

.func _Gfx_clearMatrix_71, 0, void
.line 403
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 412
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,8]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_clearClipRect
//****************************************

.func _Gfx_clearClipRect_71, 0, void
.line 229
	push rt,d2
	ld fr,sp
	add fr,#0x14
.line 230
	syscall 46
.line 231
	ld r0,#0x0
	ld [zr,_sClipStackPtr_71],r0
.line 233
	ld d2,r14
	sra d2,#0x10
	xh d0,r14
	ld r14,[zr,_graphicsDriver_71]
	ld d1,[r14,4]
	ld i0,r0
	ld i1,r0
	ld i2,d2
	ld i3,d0
	call d1
.line 235
	ld r14,&_sClipStack_71
	ld r0,#0x0
	ld [r14],r0
.line 236
	ld [r14,4],r0
.line 237
	ld [r14,8],d2
.line 238
	ld [r14,12],d0
	pop rt,d2
	ret

//****************************************
// Function: __Gfx_init
//****************************************

.func __Gfx_init_71, 0, void
.line 215
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 220
	ld r14,[zr,_sClipStackPtr_71]
	ld r0,#0x0
	jc lt,r14,r0,&L29_71
.line 224
	pop rt,fr
	ret
L29_71:
.line 221
	call &_Gfx_clearClipRect_71
.line 224
	pop rt,fr
	ret

//****************************************
// Function: _Gfx_useDriver
//****************************************

.func _Gfx_useDriver_71, 1, void
.line 196
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
.line 197
	call &__Gfx_init_71
.line 198
	ld [zr,_graphicsDriver_71],d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_getTranslation
//****************************************

.func _Gfx_getTranslation_71, 0, double
.line 454
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 455
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,24]
	call d0
	ld r0,r14
	ld r1,r15
	ld r2,r14
	ld r3,r15
.line 456
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_pushClipRect
//****************************************

.func _Gfx_pushClipRect_71, 4, int
.line 265
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d1,i0
	ld d2,i1
	ld d3,i2
	ld d4,i3
.line 268
	call &__Gfx_init_71
.line 269
	ld r14,[zr,_sClipStackPtr_71]
	ld r0,#0x7e
	jc gt,r14,r0,&L39_71
.line 274
	call &_Gfx_getTranslation_71
.line 275
	add d1,r14
.line 276
	add d2,r15
.line 279
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,4]
	ld i0,d1
	ld i1,d2
	ld i2,d3
	ld i3,d4
	call d0
.line 281
	ld r14,[zr,_sClipStackPtr_71]
	add r14,#0x1
	ld [zr,_sClipStackPtr_71],r14
.line 282
	sll r14,#0x4
	add r14,&_sClipStack_71
	ld [r14],d1
.line 283
	ld [r14,4],d2
.line 284
	ld [r14,8],d3
.line 285
	ld [r14,12],d4
.line 286
	ld r14,#0x0
	jc le,d3,r14,&L37_71
	ld r14,#0x1
	ld r0,#0x0
	jc le,d4,r0,&L37_71
.line 288
	pop rt,d4
	ret
L37_71:
.line 287
	ld r14,#0x0
.line 288
	pop rt,d4
	ret
L39_71:
.line 270
	ld i0,&LC0_71
	ld i1,&__FUNCTION___1_71
	call &_panicFunction_28

//****************************************
// Function: _Gfx_intersectClipRect
//****************************************

.func _Gfx_intersectClipRect_71, 4, int
.line 293
	push rt,d7
	ld fr,sp
	add fr,#0x28
	ld d1,i0
	ld d2,i1
	ld d6,i2
	ld d7,i3
.line 300
	call &__Gfx_init_71
.line 301
	ld r14,[zr,_sClipStackPtr_71]
	sll r14,#0x4
	add r14,&_sClipStack_71
	ld d0,[r14]
.line 302
	ld d4,[r14,4]
.line 303
	ld d3,[r14,8]
.line 304
	ld d5,[r14,12]
.line 307
	call &_Gfx_getTranslation_71
.line 308
	add d1,r14
	add d2,r15
.line 310
	ld r14,[zr,_sClipStackPtr_71]
	ld r0,#0x7e
	jc gt,r14,r0,&L58_71
.line 314
	ld r14,#0x0
	jc eq,d3,r14,&L57_71
	jc eq,d5,r14,&L57_71
.line 319
	ld r0,d1
	add r0,d6
	jc lt,r0,d0,&L57_71
.line 325
	ld r1,d2
	add r1,d7
	jc lt,r1,d4,&L57_71
.line 331
	ld r2,d0
	add r2,d3
	jc lt,r2,d1,&L57_71
.line 337
	ld r3,d4
	add r3,d5
	jc lt,r3,d2,&L57_71
.line 343
	jc lt,d1,d0,&L59_71
L48_71:
.line 349
	jc ge,d2,d4,&L49_71
.line 351
	ld r14,d4
	sub r14,d2
	sub d7,r14
.line 352
	ld d2,d4
	ld r1,d4
	add r1,d7
L49_71:
.line 355
	jc le,r0,r2,&L50_71
.line 357
	sub r0,r2
	sub d6,r0
L50_71:
.line 360
	jc le,r1,r3,&L51_71
.line 362
	sub r1,r3
	sub d7,r1
L51_71:
.line 366
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,4]
	ld i0,d1
	ld i1,d2
	ld i2,d6
	ld i3,d7
	call d0
.line 368
	ld r14,[zr,_sClipStackPtr_71]
	add r14,#0x1
	ld [zr,_sClipStackPtr_71],r14
.line 369
	sll r14,#0x4
	add r14,&_sClipStack_71
	ld [r14],d1
.line 370
	ld [r14,4],d2
.line 371
	ld [r14,8],d6
.line 372
	ld [r14,12],d7
.line 374
	ld r0,#0x0
	jc le,d6,r0,&L52_71
	ld r14,#0x1
	jc le,d7,r0,&L52_71
.line 377
	pop rt,d7
	ret
L57_71:
.line 339
	ld i0,#0x0
	ld i1,i0
	ld i2,i0
	ld i3,i0
	call &_Gfx_pushClipRect_71
L52_71:
.line 375
	ld r14,#0x0
.line 377
	pop rt,d7
	ret
L59_71:
.line 345
	ld r14,d0
	sub r14,d1
	sub d6,r14
.line 346
	ld d1,d0
	ld r0,d0
	add r0,d6
	jp &L48_71
L58_71:
.line 311
	ld i0,&LC0_71
	ld i1,&__FUNCTION___0_71
	call &_panicFunction_28

//****************************************
// Function: _Gfx_popClipRect
//****************************************

.func _Gfx_popClipRect_71, 0, int
.line 383
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 384
	call &__Gfx_init_71
.line 385
	ld r14,[zr,_sClipStackPtr_71]
	add r14,#0xffffffff
.line 386
	ld r0,#0xffffffff
	jc le,r14,r0,&L65_71
	ld [zr,_sClipStackPtr_71],r14
.line 390
	sll r14,#0x4
	add r14,&_sClipStack_71
	ld r0,[zr,_graphicsDriver_71]
	ld d0,[r0,4]
	ld i0,[r14]
	ld i1,[r14,4]
	ld i2,[r14,8]
	ld i3,[r14,12]
	call d0
.line 396
	ld r0,[zr,_sClipStackPtr_71]
	sll r0,#0x4
	add r0,&_sClipStack_71
	ld r14,[r0,8]
	ld r1,#0x0
	jc le,r14,r1,&L63_71
	ld r14,[r0,12]
	ld r0,#0x1
	jc le,r14,r1,&L63_71
.line 398
	ld r14,r0
	pop rt,d0
	ret
L65_71:
.line 387
	ld [zr,_sClipStackPtr_71],r0
L63_71:
.line 397
	ld r0,#0x0
.line 398
	ld r14,r0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_pushMatrix
//****************************************

.func _Gfx_pushMatrix_71, 0, void
.line 417
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 429
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,12]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_popMatrix
//****************************************

.func _Gfx_popMatrix_71, 0, void
.line 433
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 443
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,16]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_translate
//****************************************

.func _Gfx_translate_71, 2, void
.line 446
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 451
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,20]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_line
//****************************************

.func _Gfx_line_71, 4, void
.line 483
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 485
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,36]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_fillRect
//****************************************

.func _Gfx_fillRect_71, 4, void
.line 488
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 498
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,40]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_drawImage
//****************************************

.func _Gfx_drawImage_71, 3, void
.line 513
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 517
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,52]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_drawImageRegion
//****************************************

.func _Gfx_drawImageRegion_71, 4, void
.line 529
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 540
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,60]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_beginRendering
//****************************************

.func _Gfx_beginRendering_71, 0, void
.line 547
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 548
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,68]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_updateScreen
//****************************************

.func _Gfx_updateScreen_71, 0, void
.line 551
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 552
	ld r14,[zr,_graphicsDriver_71]
	ld d0,[r14,72]
	call d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.h'
.line 57
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 57
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_73, 2, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener20multitouchPressEventE9MAPoint2di_73, 4, void
.line 71
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 71
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener19multitouchMoveEventE9MAPoint2di_73, 4, void
.line 72
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 72
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil15PointerListener22multitouchReleaseEventE9MAPoint2di_73, 4, void
.line 73
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 73
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEii
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEii_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 34
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 34
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEii
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEii_73, 3, void
.line 35
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 35
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener9charEventEj
//****************************************

.func __ZN6MAUtil11KeyListener9charEventEj_73, 2, void
.line 36
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 36
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment18TimerEventInstanceC1EPNS_13TimerListenerEii
//****************************************

.func __ZN6MAUtil11Environment18TimerEventInstanceC1EPNS_13TimerListenerEii_73, 4, void
.line 39
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_73:
.line 40
	ld [i0],i1
	ld [i0,8],i2
	ld [i0,12],i3
.line 41
	syscall 86
	ld [d0,4],r14
.line 42
	ld r0,[d0,8]
	add r14,r0
	ld [d0,16],r14
LBE3_73:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment14getEnvironmentEv
//****************************************

.func __ZN6MAUtil11Environment14getEnvironmentEv_73, 0, int
.line 64
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_73:
.line 65
	ld r14,[zr,__ZN6MAUtil11Environment12sEnvironmentE_73]
	ld r0,#0x0
	jc eq,r14,r0,&L14_73
LBE4_73:
.line 69
	pop rt,fr
	ret
L14_73:
.line 66
	ld i0,&LC0_73
	ld i1,&_ZZN6MAUtil11Environment14getEnvironmentEvE12__FUNCTION___73
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE
//****************************************

.func __ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE_73, 2, void
.line 117
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_73:
.line 119
	ld [i0,36],i1
LBE6_73:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment23removeBluetoothListenerEv
//****************************************

.func __ZN6MAUtil11Environment23removeBluetoothListenerEv_73, 1, void
.line 122
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB7_73:
.line 124
	ld r14,#0x0
	ld [i0,36],r14
LBE7_73:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment18fireBluetoothEventEi
//****************************************

.func __ZN6MAUtil11Environment18fireBluetoothEventEi_73, 2, void
.line 325
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB8_73:
.line 327
	ld i0,[i0,36]
	ld r14,#0x0
	jc ne,i0,r14,&L19_73
LBE8_73:
.line 328
	pop rt,d0
	ret
L19_73:
.line 327
	ld r14,[i0]
	ld d0,[r14]
	call d0
LBE9_73:
.line 328
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment14fireCloseEventEv
//****************************************

.func __ZN6MAUtil11Environment14fireCloseEventEv_73, 1, void
.line 342
	push rt,d2
	ld fr,sp
	add fr,#0x14
LBB10_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d2,i0
	add d2,#0x28
LBB14_73:
	ld d1,[d2,8]
LBE14_73:
.line 341
	ld r14,[d2]
	sll r14,#0x2
	add r14,d1
LBE16_73:
	jc eq,r14,d1,&L28_73
L30_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 345
	ld i0,[d1]
	ld r14,[i0]
	ld d0,[r14]
	call d0
.line 344
	add d1,#0x4
LBB17_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x2
	ld r0,[d2,8]
	add r14,r0
LBE18_73:
	jc ne,r14,d1,&L30_73
L28_73:
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil11EnvironmentD0Ev
//****************************************

.func __ZN6MAUtil11EnvironmentD0Ev_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 71
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB19_73:
.line 71
	ld r14,&__ZTVN6MAUtil11EnvironmentE_73+8
	ld [i0],r14
LBB20_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,144]
	ld r14,#0x0
	jc ne,i0,r14,&L105_73
LBE23_73:
	ld i0,[d0,128]
	ld r14,#0x0
	jc ne,i0,r14,&L106_73
L48_73:
	ld i0,[d0,112]
	ld r14,#0x0
	jc ne,i0,r14,&L107_73
L56_73:
	ld i0,[d0,96]
	ld r14,#0x0
	jc ne,i0,r14,&L108_73
L64_73:
	ld i0,[d0,80]
	ld r14,#0x0
	jc ne,i0,r14,&L109_73
L72_73:
	ld i0,[d0,64]
	ld r14,#0x0
	jc ne,i0,r14,&L110_73
L80_73:
	ld i0,[d0,48]
	ld r14,#0x0
	jc ne,i0,r14,&L111_73
L85_73:
	ld i0,[d0,32]
	ld r14,#0x0
	jc ne,i0,r14,&L112_73
L93_73:
	ld i0,[d0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L113_73
L104_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret
L105_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE58_73:
	ld i0,[d0,128]
	ld r14,#0x0
	jc eq,i0,r14,&L48_73
L106_73:
	call &__ZdaPv_22
LBE62_73:
	ld i0,[d0,112]
	ld r14,#0x0
	jc eq,i0,r14,&L56_73
L107_73:
	call &__ZdaPv_22
LBE66_73:
	ld i0,[d0,96]
	ld r14,#0x0
	jc eq,i0,r14,&L64_73
L108_73:
	call &__ZdaPv_22
LBE70_73:
	ld i0,[d0,80]
	ld r14,#0x0
	jc eq,i0,r14,&L72_73
L109_73:
	call &__ZdaPv_22
LBE74_73:
	ld i0,[d0,64]
	ld r14,#0x0
	jc eq,i0,r14,&L80_73
L110_73:
	call &__ZdaPv_22
LBE78_73:
	ld i0,[d0,48]
	ld r14,#0x0
	jc eq,i0,r14,&L85_73
L111_73:
	call &__ZdaPv_22
LBE80_73:
	ld i0,[d0,32]
	ld r14,#0x0
	jc eq,i0,r14,&L93_73
L112_73:
	call &__ZdaPv_22
LBE84_73:
	ld i0,[d0,16]
	ld r14,#0x0
	jc eq,i0,r14,&L104_73
L113_73:
	call &__ZdaPv_22
LBE88_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11EnvironmentD1Ev
//****************************************

.func __ZN6MAUtil11EnvironmentD1Ev_73, 1, void
.line 71
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB89_73:
.line 71
	ld r14,&__ZTVN6MAUtil11EnvironmentE_73+8
	ld [i0],r14
LBB90_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,144]
	ld r14,#0x0
	jc ne,i0,r14,&L187_73
L123_73:
	ld i0,[d0,128]
	ld r14,#0x0
	jc ne,i0,r14,&L188_73
L131_73:
	ld i0,[d0,112]
	ld r14,#0x0
	jc ne,i0,r14,&L189_73
L139_73:
	ld i0,[d0,96]
	ld r14,#0x0
	jc ne,i0,r14,&L190_73
L147_73:
	ld i0,[d0,80]
	ld r14,#0x0
	jc ne,i0,r14,&L191_73
L155_73:
	ld i0,[d0,64]
	ld r14,#0x0
	jc ne,i0,r14,&L192_73
L163_73:
	ld i0,[d0,48]
	ld r14,#0x0
	jc ne,i0,r14,&L193_73
L168_73:
	ld i0,[d0,32]
	ld r14,#0x0
	jc ne,i0,r14,&L194_73
L176_73:
	ld i0,[d0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L195_73
LBE123_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L195_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE128_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L194_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
	jp &L176_73
L193_73:
	call &__ZdaPv_22
	jp &L168_73
L192_73:
	call &__ZdaPv_22
	jp &L163_73
L191_73:
	call &__ZdaPv_22
	jp &L155_73
L190_73:
	call &__ZdaPv_22
	jp &L147_73
L189_73:
	call &__ZdaPv_22
	jp &L139_73
L188_73:
	call &__ZdaPv_22
	jp &L131_73
L187_73:
	call &__ZdaPv_22
	jp &L123_73

//****************************************
// Function: __ZN6MAUtil11EnvironmentD2Ev
//****************************************

.func __ZN6MAUtil11EnvironmentD2Ev_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 71
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB160_73:
.line 71
	ld r14,&__ZTVN6MAUtil11EnvironmentE_73+8
	ld [i0],r14
LBB161_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,144]
	ld r14,#0x0
	jc ne,i0,r14,&L269_73
L205_73:
	ld i0,[d0,128]
	ld r14,#0x0
	jc ne,i0,r14,&L270_73
L213_73:
	ld i0,[d0,112]
	ld r14,#0x0
	jc ne,i0,r14,&L271_73
L221_73:
	ld i0,[d0,96]
	ld r14,#0x0
	jc ne,i0,r14,&L272_73
L229_73:
	ld i0,[d0,80]
	ld r14,#0x0
	jc ne,i0,r14,&L273_73
L237_73:
	ld i0,[d0,64]
	ld r14,#0x0
	jc ne,i0,r14,&L274_73
L245_73:
	ld i0,[d0,48]
	ld r14,#0x0
	jc ne,i0,r14,&L275_73
L250_73:
	ld i0,[d0,32]
	ld r14,#0x0
	jc ne,i0,r14,&L276_73
L258_73:
	ld i0,[d0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L277_73
LBE194_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L277_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE199_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L276_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
	jp &L258_73
L275_73:
	call &__ZdaPv_22
	jp &L250_73
L274_73:
	call &__ZdaPv_22
	jp &L245_73
L273_73:
	call &__ZdaPv_22
	jp &L237_73
L272_73:
	call &__ZdaPv_22
	jp &L229_73
L271_73:
	call &__ZdaPv_22
	jp &L221_73
L270_73:
	call &__ZdaPv_22
	jp &L213_73
L269_73:
	call &__ZdaPv_22
	jp &L205_73

//****************************************
// Function: __ZN6MAUtil11EnvironmentC2Ev
//****************************************

.func __ZN6MAUtil11EnvironmentC2Ev_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 48
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB267_73:
.line 57
	ld r0,&__ZTVN6MAUtil11EnvironmentE_73+8
	ld [i0],r0
LBB268_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,i0
	add r14,#0x4
LBB269_73:
.line 83
	ld r0,#0x0
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB270_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x8
LBB271_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE271_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x14
LBB273_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB274_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB275_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE275_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 57
	ld [d1,36],r0
LBB276_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB277_73:
.line 109
	ld i0,#0x10
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE277_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x34
LBB279_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB280_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB281_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE281_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x44
LBB283_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB284_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB285_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE285_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x54
LBB287_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld r0,#0x1
	ld.b [r14,2],r0
LBB288_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB289_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE289_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x64
LBB291_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB292_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB293_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE293_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x74
LBB295_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB296_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB297_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE297_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r14,d1
	add r14,#0x84
LBB299_73:
.line 83
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB300_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB301_73:
.line 109
	ld i0,#0x20
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE301_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 58
	ld r14,[zr,__ZN6MAUtil11Environment12sEnvironmentE_73]
	jc ne,r14,r0,&L317_73
.line 61
	ld [zr,__ZN6MAUtil11Environment12sEnvironmentE_73],d1
LBE267_73:
	pop rt,d1
	ret
L317_73:
.line 59
	ld i0,&LC1_73
	ld i1,&_ZZN6MAUtil11EnvironmentC1EvE12__FUNCTION___73
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE
//****************************************

.func __ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_73, 2, int
.line 98
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB319_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 117
	ld r1,i0
	add r1,#0x4
LBB321_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x8
LBB325_73:
	ld r15,[i0,8]
LBE325_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r15
LBE327_73:
	jc eq,r14,r15,&L342_73
L345_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 119
	ld r14,[r15]
	jc eq,r14,i1,&L344_73
.line 118
	add r15,#0x8
LBB328_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,r1
	add r0,#0x4
LBB329_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE329_73:
	jc ne,r14,r15,&L345_73
L342_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	ld r14,#0x0
LBE322_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 100
	pop fr,fr
	ret
L344_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	ld r14,#0x1
LBE334_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 100
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE
//****************************************

.func __ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_73, 2, int
.line 112
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB335_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 117
	ld r1,i0
	add r1,#0x14
LBB337_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x18
LBB341_73:
	ld r15,[i0,8]
LBE341_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r15
LBE343_73:
	jc eq,r14,r15,&L356_73
L359_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 119
	ld r14,[r15]
	jc eq,r14,i1,&L358_73
.line 118
	add r15,#0x8
LBB344_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,r1
	add r0,#0x4
LBB345_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE345_73:
	jc ne,r14,r15,&L359_73
L356_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	ld r14,#0x0
LBE338_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 114
	pop fr,fr
	ret
L358_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	ld r14,#0x1
LBE350_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 114
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment16addCloseListenerEPNS_13CloseListenerE
//****************************************

.func __ZN6MAUtil11Environment16addCloseListenerEPNS_13CloseListenerE_73, 2, void
.line 152
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld [fr,-24],i1
LBB351_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d1,i0
	add d1,#0x28
LBB355_73:
	ld r0,[d1,8]
	ld r2,r0
LBE355_73:
.line 341
	ld r1,[d1]
	sll r1,#0x2
	ld r14,r0
	add r14,r1
LBE357_73:
	jc eq,r14,r0,&L389_73
L400_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 155
	ld r14,[r0]
	jc eq,r14,i1,&L360_73
.line 154
	add r0,#0x4
LBB358_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,r2
	add r14,r1
LBE359_73:
	jc ne,r14,r0,&L400_73
L389_73:
.line 168
	ld d0,[d1,4]
	ld r14,d0
	add r14,#0xffffffff
	ld r1,[d1]
	jc lt,r1,r14,&L395_73
.line 169
	ld r0,#0x0
	jc eq,d0,r0,&L369_73
LBB362_73:
.line 293
	ld d2,d0
	add d2,d0
LBB363_73:
.line 295
	jc lt,d0,d2,&L401_73
L395_73:
	ld i0,[d1,8]
L368_73:
.line 174
	ld r14,r1
	sll r14,#0x2
	add r14,i0
	ld r0,[fr,-24]
	ld [r14],r0
	add r1,#0x1
	ld [d1],r1
L360_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 158
	add sp,#0x4
	pop rt,d2
	ret
L401_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x2
	call &__Znam_20
	ld d0,r14
LBB372_73:
.line 300
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L396_73
	ld i0,[d1,8]
L375_73:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L375_73
L391_73:
.line 304
	ld [d1,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L402_73
.line 307
	ld i0,d0
L399_73:
	ld [d1,8],i0
	jp &L368_73
L369_73:
.line 298
	ld i0,#0x10
	call &__Znam_20
	ld d2,r14
LBB376_73:
.line 300
	ld r2,d0
	ld r1,[d1]
	jc le,r1,d0,&L397_73
	ld i0,[d1,8]
L384_73:
.line 301
	ld r14,r2
	sll r14,#0x2
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r2,#0x1
	jc gt,r1,r2,&L384_73
L393_73:
.line 304
	ld r0,#0x4
	ld [d1,4],r0
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L403_73
.line 307
	ld i0,d2
L404_73:
	ld [d1,8],i0
	jp &L368_73
L403_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d1]
.line 307
	ld i0,d2
	jp &L404_73
L402_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d1]
.line 307
	ld i0,d0
	jp &L399_73
L397_73:
	ld i0,[d1,8]
	jp &L393_73
L396_73:
	ld i0,[d1,8]
	jp &L391_73

//****************************************
// Function: __ZN6MAUtil11Environment18fireFocusLostEventEv
//****************************************

.func __ZN6MAUtil11Environment18fireFocusLostEventEv_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 233
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
LBB417_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x64
LBB420_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE421_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x68
LBB426_73:
	ld [i1],d2
LBB427_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE428_73:
	ld [fr,-48],r0
Ltext101_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L480_73
LBB429_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE430_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L480_73
	ld r1,r14
L473_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L480_73
LBB433_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE434_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L473_73
L480_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L539_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L485_73
	ld r14,#0x1
L485_73:
	ld r2,#0x0
	jc eq,r14,r2,&L540_73
LBB437_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB440_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE440_73:
	ld i0,[i0]
LBE438_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14]
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L488_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L539_73
LBB443_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB444_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE444_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L488_73
	jp &L539_73
L540_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB448_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L443_73
LBB449_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE451_73:
.line 334
	ld d0,[d2,8]
LBE454_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE456_73:
	jc eq,r14,d0,&L527_73
L542_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L541_73
L500_73:
.line 129
	add d0,#0x8
LBB457_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE458_73:
	jc ne,r14,d0,&L542_73
L527_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d3,&L543_73
	ld r14,[d1]
L507_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L531_73
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L517_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L517_73
L531_73:
.line 285
	ld [d1],d3
LBE461_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L443_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 240
	add sp,#0x20
	pop rt,d4
	ret
L541_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L544_73
L503_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB475_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE475_73:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L500_73
L544_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L503_73
L543_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB482_73:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L534_73
	ld i0,[d1,8]
L511_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L511_73
L529_73:
.line 304
	ld [d1,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L545_73
.line 307
	ld [d1,8],d0
	jp &L507_73
L545_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L507_73
L534_73:
	ld i0,[d1,8]
	jp &L529_73

//****************************************
// Function: __ZN6MAUtil11Environment20fireFocusGainedEventEv
//****************************************

.func __ZN6MAUtil11Environment20fireFocusGainedEventEv_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 224
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
LBB483_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x64
LBB486_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE487_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x68
LBB492_73:
	ld [i1],d2
LBB493_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE494_73:
	ld [fr,-48],r0
Ltext122_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L583_73
LBB495_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE496_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L583_73
	ld r1,r14
L576_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L583_73
LBB499_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE500_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L576_73
L583_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L642_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L588_73
	ld r14,#0x1
L588_73:
	ld r2,#0x0
	jc eq,r14,r2,&L643_73
LBB503_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB506_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE506_73:
	ld i0,[i0]
LBE504_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L591_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L642_73
LBB509_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB510_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE510_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L591_73
	jp &L642_73
L643_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB514_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L546_73
LBB515_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE517_73:
.line 334
	ld d0,[d2,8]
LBE520_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE522_73:
	jc eq,r14,d0,&L630_73
L645_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L644_73
L603_73:
.line 129
	add d0,#0x8
LBB523_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE524_73:
	jc ne,r14,d0,&L645_73
L630_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d3,&L646_73
	ld r14,[d1]
L610_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L634_73
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L620_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L620_73
L634_73:
.line 285
	ld [d1],d3
LBE527_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L546_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 231
	add sp,#0x20
	pop rt,d4
	ret
L644_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L647_73
L606_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB541_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE541_73:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L603_73
L647_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L606_73
L646_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB548_73:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L637_73
	ld i0,[d1,8]
L614_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L614_73
L632_73:
.line 304
	ld [d1,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L648_73
.line 307
	ld [d1,8],d0
	jp &L610_73
L648_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L610_73
L637_73:
	ld i0,[d1,8]
	jp &L632_73

//****************************************
// Function: __ZN6MAUtil11Environment16addFocusListenerEPNS_13FocusListenerE
//****************************************

.func __ZN6MAUtil11Environment16addFocusListenerEPNS_13FocusListenerE_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 74
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB597_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,i0
	add r1,#0x64
LBB599_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x68
LBB603_73:
	ld r0,[i0,8]
LBE603_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE605_73:
	jc eq,r14,r0,&L728_73
L701_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,i1,&L734_73
.line 91
	add r0,#0x8
LBB606_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB607_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE607_73:
	jc ne,r14,r0,&L701_73
L723_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB608_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L730_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L703_73
LBB610_73:
.line 293
	ld d2,d1
	add d2,d1
LBB611_73:
.line 295
	jc lt,d1,d2,&L735_73
L730_73:
	ld i0,[d0,8]
L702_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE609_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 77
	add sp,#0x8
	pop rt,d3
	ret
L734_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r1,#0x1
	ld [r0,4],r1
LBE617_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 77
	add sp,#0x8
	pop rt,d3
	ret
L728_73:
	ld d0,r1
	add d0,#0x4
	jp &L723_73
L735_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB627_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L731_73
	ld i0,[d0,8]
L709_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L709_73
L725_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L736_73
.line 307
	ld i0,d1
L733_73:
	ld [d0,8],i0
	jp &L702_73
L703_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB631_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L732_73
	ld i0,[d0,8]
L718_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L718_73
L727_73:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L737_73
.line 307
	ld i0,d2
L738_73:
	ld [d0,8],i0
	jp &L702_73
L737_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L738_73
L736_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L733_73
L732_73:
	ld i0,[d0,8]
	jp &L727_73
L731_73:
	ld i0,[d0,8]
	jp &L725_73

//****************************************
// Function: __ZN6MAUtil11Environment13fireCharEventEj
//****************************************

.func __ZN6MAUtil11Environment13fireCharEventEj_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 263
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d3,i1
LBB635_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x4
LBB638_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE639_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x8
LBB644_73:
	ld [i1],d2
LBB645_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE646_73:
	ld [fr,-48],r0
Ltext166_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L778_73
LBB647_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE648_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L778_73
	ld r1,r14
L771_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L778_73
LBB651_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE652_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L771_73
L778_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L839_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L783_73
	ld r14,#0x1
L783_73:
	ld r2,#0x0
	jc eq,r14,r2,&L840_73
LBB655_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB658_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE658_73:
	ld i0,[i0]
LBE656_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14,16]
	ld i1,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L786_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L839_73
LBB661_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB662_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE662_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L786_73
	jp &L839_73
L840_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB666_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L739_73
LBB667_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE669_73:
.line 334
	ld d1,[d2,8]
LBE672_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE674_73:
	jc eq,r14,d1,&L827_73
L842_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L841_73
L798_73:
.line 129
	add d1,#0x8
LBB675_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE676_73:
	jc ne,r14,d1,&L842_73
L827_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L843_73
	ld r14,[d2]
L807_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L831_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc4
L817_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L817_73
L831_73:
.line 285
	ld [d2],d3
LBE679_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L739_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 269
	add sp,#0x20
	pop rt,d4
	ret
L841_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L801_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L844_73
L801_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB693_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE693_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L798_73
L843_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB700_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L834_73
	ld i0,[d2,8]
L811_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L811_73
L829_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L845_73
.line 307
	ld [d2,8],d0
	jp &L807_73
L845_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L807_73
L844_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L801_73
L834_73:
	ld i0,[d2,8]
	jp &L829_73

//****************************************
// Function: __ZN6MAUtil11Environment19fireKeyReleaseEventEii
//****************************************

.func __ZN6MAUtil11Environment19fireKeyReleaseEventEii_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 253
	push rt,d5
	sub sp,#0x20
	ld fr,sp
	add fr,#0x40
	ld d2,i1
	ld d3,i2
LBB702_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d5,i0
	add d5,#0x4
LBB705_73:
.line 125
	ld r0,#0x1
	ld.b [d5],r0
LBE706_73:
.line 71
	ld i1,fr
	add i1,#0xffffffc8
	ld d4,i0
	add d4,#0x8
LBB711_73:
	ld [i1],d4
LBB712_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d4]
LBE713_73:
	ld [fr,-52],r0
Ltext186_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-48],r1
.line 72
	jc le,r0,r1,&L885_73
LBB714_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d4,8]
LBE715_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L885_73
	ld r1,r14
L878_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L885_73
LBB718_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d4,8]
	add r14,r2
LBE719_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L878_73
L885_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L948_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L890_73
	ld r14,#0x1
L890_73:
	ld r2,#0x0
	jc eq,r14,r2,&L949_73
LBB722_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB725_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE725_73:
	ld i0,[i0]
LBE723_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14,24]
	ld i1,d2
	call d0
LBB726_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r0,[d1]
	ld r14,[fr,-36]
LBB729_73:
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE729_73:
	ld i0,[r14]
LBE727_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14,12]
	ld i1,d2
	ld i2,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L895_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L948_73
LBB732_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB733_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE733_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L895_73
	jp &L948_73
L949_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d5],r14
LBB737_73:
.line 126
	ld.b r14,[d5,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L846_73
LBB738_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d4]
LBE740_73:
.line 334
	ld d1,[d4,8]
LBE743_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d5
	add d2,#0x4
LBE745_73:
	jc eq,r14,d1,&L936_73
L951_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L950_73
L907_73:
.line 129
	add d1,#0x8
LBB746_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE747_73:
	jc ne,r14,d1,&L951_73
L936_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L952_73
	ld r14,[d2]
L916_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L940_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc0
L926_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-64],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L926_73
L940_73:
.line 285
	ld [d2],d3
LBE750_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d5,1],r14
L846_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 261
	add sp,#0x20
	pop rt,d5
	ret
L950_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d5,2]
	and r14,#0xff
	jc eq,r14,r1,&L910_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L953_73
L910_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB764_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE764_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L907_73
L952_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB771_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L943_73
	ld i0,[d2,8]
L920_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L920_73
L938_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L954_73
.line 307
	ld [d2,8],d0
	jp &L916_73
L954_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L916_73
L953_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L910_73
L943_73:
	ld i0,[d2,8]
	jp &L938_73

//****************************************
// Function: __ZN6MAUtil11Environment17fireKeyPressEventEii
//****************************************

.func __ZN6MAUtil11Environment17fireKeyPressEventEii_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 242
	push rt,d5
	sub sp,#0x20
	ld fr,sp
	add fr,#0x40
	ld d2,i1
	ld d3,i2
LBB773_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d5,i0
	add d5,#0x4
LBB776_73:
.line 125
	ld r0,#0x1
	ld.b [d5],r0
LBE777_73:
.line 71
	ld i1,fr
	add i1,#0xffffffc8
	ld d4,i0
	add d4,#0x8
LBB782_73:
	ld [i1],d4
LBB783_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d4]
LBE784_73:
	ld [fr,-52],r0
Ltext208_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-48],r1
.line 72
	jc le,r0,r1,&L994_73
LBB785_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d4,8]
LBE786_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L994_73
	ld r1,r14
L987_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L994_73
LBB789_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d4,8]
	add r14,r2
LBE790_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L987_73
L994_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1057_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L999_73
	ld r14,#0x1
L999_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1058_73
LBB793_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB796_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE796_73:
	ld i0,[i0]
LBE794_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,d2
	call d0
LBB797_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r0,[d1]
	ld r14,[fr,-36]
LBB800_73:
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE800_73:
	ld i0,[r14]
LBE798_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,d2
	ld i2,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1004_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1057_73
LBB803_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB804_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE804_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1004_73
	jp &L1057_73
L1058_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d5],r14
LBB808_73:
.line 126
	ld.b r14,[d5,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L955_73
LBB809_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d4]
LBE811_73:
.line 334
	ld d1,[d4,8]
LBE814_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d5
	add d2,#0x4
LBE816_73:
	jc eq,r14,d1,&L1045_73
L1060_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1059_73
L1016_73:
.line 129
	add d1,#0x8
LBB817_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE818_73:
	jc ne,r14,d1,&L1060_73
L1045_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1061_73
	ld r14,[d2]
L1025_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1049_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc0
L1035_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-64],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1035_73
L1049_73:
.line 285
	ld [d2],d3
LBE821_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d5,1],r14
L955_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 251
	add sp,#0x20
	pop rt,d5
	ret
L1059_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d5,2]
	and r14,#0xff
	jc eq,r14,r1,&L1019_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1062_73
L1019_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB835_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE835_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1016_73
L1061_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB842_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1052_73
	ld i0,[d2,8]
L1029_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1029_73
L1047_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1063_73
.line 307
	ld [d2,8],d0
	jp &L1025_73
L1063_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1025_73
L1062_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1019_73
L1052_73:
	ld i0,[d2,8]
	jp &L1047_73

//****************************************
// Function: __ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE
//****************************************

.func __ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 93
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
LBB844_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 101
	ld d2,i0
	add d2,#0x4
LBB846_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x8
LBB850_73:
	ld d1,[i0,8]
LBE850_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,d1
LBE852_73:
	jc eq,r14,d1,&L1064_73
L1106_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d1]
	jc eq,i0,i1,&L1105_73
.line 102
	add d1,#0x8
LBB853_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d2
	add r0,#0x4
LBB854_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE854_73:
	jc ne,r14,d1,&L1106_73
L1064_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 96
	add sp,#0x8
	pop rt,d2
	ret
L1105_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 104
	ld.b r0,[d2]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L1107_73
.line 108
	ld.b r14,[d2,2]
	and r14,#0xff
	jc eq,r14,r0,&L1073_73
.line 109
	ld r14,#0x0
	jc ne,i0,r14,&L1108_73
L1073_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	ld d0,d2
	add d0,#0x4
	ld r14,d1
LBB861_73:
.line 341
	ld r1,[d0]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d0,8]
	add r0,i0
LBE864_73:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d1,&L1098_73
L1079_73:
.line 205
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L1079_73
	ld r1,[d0]
L1098_73:
.line 272
	ld d1,r1
	add d1,#0xffffffff
LBB866_73:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L1109_73
L1081_73:
.line 281
	ld r0,d1
	jc le,r1,d1,&L1102_73
	ld r1,fr
	add r1,#0xffffffe4
L1091_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-28],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L1091_73
L1102_73:
.line 285
	ld [d0],d1
LBE867_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 96
	add sp,#0x8
	pop rt,d2
	ret
L1107_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 105
	ld [d1,4],r1
.line 106
	ld r2,#0x1
	ld.b [d2,1],r2
LBE876_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 96
	add sp,#0x8
	pop rt,d2
	ret
L1109_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d1
	sll i0,#0x3
	call &__Znam_20
	ld d2,r14
LBB891_73:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L1103_73
	ld i0,[d0,8]
L1085_73:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d0]
	jc gt,r1,r2,&L1085_73
L1100_73:
.line 304
	ld [d0,4],d1
.line 305
	ld r2,#0x0
	jc ne,i0,r2,&L1110_73
.line 307
	ld i0,d2
	ld [d0,8],d2
	jp &L1081_73
L1110_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld i0,d2
	ld [d0,8],d2
	jp &L1081_73
L1108_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 109
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1073_73
L1103_73:
	ld i0,[d0,8]
	jp &L1100_73

//****************************************
// Function: __ZN6MAUtil11KeyListenerD0Ev
//****************************************

.func __ZN6MAUtil11KeyListenerD0Ev_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB892_73:
.line 29
	ld r0,&__ZTVN6MAUtil11KeyListenerE_73+8
	ld [i0],r0
LBB893_73:
.line 30
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_73
.line 31
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1117_73
LBE893_73:
.line 33
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret
L1117_73:
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_73
LBE895_73:
.line 33
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListenerD1Ev
//****************************************

.func __ZN6MAUtil11KeyListenerD1Ev_73, 1, void
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB896_73:
.line 29
	ld r0,&__ZTVN6MAUtil11KeyListenerE_73+8
	ld [i0],r0
LBB897_73:
.line 30
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_73
.line 31
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1123_73
LBE897_73:
.line 33
	pop rt,d0
	ret
L1123_73:
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_73
LBE899_73:
.line 33
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListenerD2Ev
//****************************************

.func __ZN6MAUtil11KeyListenerD2Ev_73, 1, void
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB900_73:
.line 29
	ld r0,&__ZTVN6MAUtil11KeyListenerE_73+8
	ld [i0],r0
LBB901_73:
.line 30
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_73
.line 31
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1129_73
LBE901_73:
.line 33
	pop rt,d0
	ret
L1129_73:
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_73
LBE903_73:
.line 33
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE
//****************************************

.func __ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_73, 2, void
.line 88
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB904_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,i0
	add r1,#0x4
LBB906_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x8
LBB910_73:
	ld r0,[i0,8]
LBE910_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE912_73:
	jc eq,r14,r0,&L1165_73
L1138_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,i1,&L1171_73
.line 91
	add r0,#0x8
LBB913_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB914_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE914_73:
	jc ne,r14,r0,&L1138_73
L1160_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB915_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L1167_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L1140_73
LBB917_73:
.line 293
	ld d2,d1
	add d2,d1
LBB918_73:
.line 295
	jc lt,d1,d2,&L1172_73
L1167_73:
	ld i0,[d0,8]
L1139_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE916_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 91
	add sp,#0x8
	pop rt,d3
	ret
L1171_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r1,#0x1
	ld [r0,4],r1
LBE924_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 91
	add sp,#0x8
	pop rt,d3
	ret
L1165_73:
	ld d0,r1
	add d0,#0x4
	jp &L1160_73
L1172_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB934_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L1168_73
	ld i0,[d0,8]
L1146_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1146_73
L1162_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L1173_73
.line 307
	ld i0,d1
L1170_73:
	ld [d0,8],i0
	jp &L1139_73
L1140_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB938_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L1169_73
	ld i0,[d0,8]
L1155_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1155_73
L1164_73:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L1174_73
.line 307
	ld i0,d2
L1175_73:
	ld [d0,8],i0
	jp &L1139_73
L1174_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L1175_73
L1173_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L1170_73
L1169_73:
	ld i0,[d0,8]
	jp &L1164_73
L1168_73:
	ld i0,[d0,8]
	jp &L1162_73

//****************************************
// Function: __ZN6MAUtil11Environment26fireMultitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil11Environment26fireMultitouchReleaseEventE9MAPoint2di_73, 4, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 316
	push rt,d5
	sub sp,#0x28
	ld fr,sp
	add fr,#0x48
	ld [fr,-64],i1
	ld d5,fr
	add d5,#0xffffffc0
	ld [fr,-60],i2
	ld d3,i3
LBB942_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x14
LBB945_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE946_73:
.line 71
	ld i1,fr
	add i1,#0xffffffc8
	ld d2,i0
	add d2,#0x18
LBB951_73:
	ld [i1],d2
LBB952_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE953_73:
	ld [fr,-52],r0
Ltext254_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-48],r1
.line 72
	jc le,r0,r1,&L1215_73
LBB954_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE955_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1215_73
	ld r1,r14
L1208_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1215_73
LBB958_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE959_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1208_73
L1215_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1276_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L1220_73
	ld r14,#0x1
L1220_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1277_73
LBB962_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB965_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE965_73:
	ld i0,[i0]
LBE963_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[i0]
	ld r14,[fr,-64]
	ld r15,[d5,4]
	ld d0,[r0,28]
	ld i1,r14
	ld i2,r15
	ld i3,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1223_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1276_73
LBB968_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB969_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE969_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1223_73
	jp &L1276_73
L1277_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB973_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1176_73
LBB974_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE976_73:
.line 334
	ld d1,[d2,8]
LBE979_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE981_73:
	jc eq,r14,d1,&L1264_73
L1279_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1278_73
L1235_73:
.line 129
	add d1,#0x8
LBB982_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE983_73:
	jc ne,r14,d1,&L1279_73
L1264_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1280_73
	ld r14,[d2]
L1244_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1268_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffb8
L1254_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-72],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1254_73
L1268_73:
.line 285
	ld [d2],d3
LBE986_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L1176_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 323
	add sp,#0x28
	pop rt,d5
	ret
L1278_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1238_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1281_73
L1238_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1000_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1000_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1235_73
L1280_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB1007_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1271_73
	ld i0,[d2,8]
L1248_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1248_73
L1266_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1282_73
.line 307
	ld [d2,8],d0
	jp &L1244_73
L1282_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1244_73
L1281_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1238_73
L1271_73:
	ld i0,[d2,8]
	jp &L1266_73

//****************************************
// Function: __ZN6MAUtil11Environment23fireMultitouchMoveEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil11Environment23fireMultitouchMoveEventE9MAPoint2di_73, 4, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 307
	push rt,d5
	sub sp,#0x28
	ld fr,sp
	add fr,#0x48
	ld [fr,-64],i1
	ld d5,fr
	add d5,#0xffffffc0
	ld [fr,-60],i2
	ld d3,i3
LBB1009_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x14
LBB1012_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1013_73:
.line 71
	ld i1,fr
	add i1,#0xffffffc8
	ld d2,i0
	add d2,#0x18
LBB1018_73:
	ld [i1],d2
LBB1019_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1020_73:
	ld [fr,-52],r0
Ltext274_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-48],r1
.line 72
	jc le,r0,r1,&L1322_73
LBB1021_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1022_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1322_73
	ld r1,r14
L1315_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1322_73
LBB1025_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1026_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1315_73
L1322_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1383_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L1327_73
	ld r14,#0x1
L1327_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1384_73
LBB1029_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1032_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1032_73:
	ld i0,[i0]
LBE1030_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[i0]
	ld r14,[fr,-64]
	ld r15,[d5,4]
	ld d0,[r0,24]
	ld i1,r14
	ld i2,r15
	ld i3,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1330_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1383_73
LBB1035_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1036_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1036_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1330_73
	jp &L1383_73
L1384_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1040_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1283_73
LBB1041_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1043_73:
.line 334
	ld d1,[d2,8]
LBE1046_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1048_73:
	jc eq,r14,d1,&L1371_73
L1386_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1385_73
L1342_73:
.line 129
	add d1,#0x8
LBB1049_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1050_73:
	jc ne,r14,d1,&L1386_73
L1371_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1387_73
	ld r14,[d2]
L1351_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1375_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffb8
L1361_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-72],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1361_73
L1375_73:
.line 285
	ld [d2],d3
LBE1053_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L1283_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 314
	add sp,#0x28
	pop rt,d5
	ret
L1385_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1345_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1388_73
L1345_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1067_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1067_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1342_73
L1387_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB1074_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1378_73
	ld i0,[d2,8]
L1355_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1355_73
L1373_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1389_73
.line 307
	ld [d2,8],d0
	jp &L1351_73
L1389_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1351_73
L1388_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1345_73
L1378_73:
	ld i0,[d2,8]
	jp &L1373_73

//****************************************
// Function: __ZN6MAUtil11Environment24fireMultitouchPressEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil11Environment24fireMultitouchPressEventE9MAPoint2di_73, 4, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 298
	push rt,d5
	sub sp,#0x28
	ld fr,sp
	add fr,#0x48
	ld [fr,-64],i1
	ld d5,fr
	add d5,#0xffffffc0
	ld [fr,-60],i2
	ld d3,i3
LBB1076_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x14
LBB1079_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1080_73:
.line 71
	ld i1,fr
	add i1,#0xffffffc8
	ld d2,i0
	add d2,#0x18
LBB1085_73:
	ld [i1],d2
LBB1086_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1087_73:
	ld [fr,-52],r0
Ltext294_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-48],r1
.line 72
	jc le,r0,r1,&L1429_73
LBB1088_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1089_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1429_73
	ld r1,r14
L1422_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1429_73
LBB1092_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1093_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1422_73
L1429_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1490_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L1434_73
	ld r14,#0x1
L1434_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1491_73
LBB1096_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1099_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1099_73:
	ld i0,[i0]
LBE1097_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[i0]
	ld r14,[fr,-64]
	ld r15,[d5,4]
	ld d0,[r0,20]
	ld i1,r14
	ld i2,r15
	ld i3,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1437_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1490_73
LBB1102_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1103_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1103_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1437_73
	jp &L1490_73
L1491_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1107_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1390_73
LBB1108_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1110_73:
.line 334
	ld d1,[d2,8]
LBE1113_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1115_73:
	jc eq,r14,d1,&L1478_73
L1493_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1492_73
L1449_73:
.line 129
	add d1,#0x8
LBB1116_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1117_73:
	jc ne,r14,d1,&L1493_73
L1478_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1494_73
	ld r14,[d2]
L1458_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1482_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffb8
L1468_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-72],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1468_73
L1482_73:
.line 285
	ld [d2],d3
LBE1120_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L1390_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 305
	add sp,#0x28
	pop rt,d5
	ret
L1492_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1452_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1495_73
L1452_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1134_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1134_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1449_73
L1494_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB1141_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1485_73
	ld i0,[d2,8]
L1462_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1462_73
L1480_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1496_73
.line 307
	ld [d2,8],d0
	jp &L1458_73
L1496_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1458_73
L1495_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1452_73
L1485_73:
	ld i0,[d2,8]
	jp &L1480_73

//****************************************
// Function: __ZN6MAUtil11Environment23firePointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil11Environment23firePointerReleaseEventE9MAPoint2d_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 289
	push rt,d4
	sub sp,#0x28
	ld fr,sp
	add fr,#0x44
	ld [fr,-60],i1
	ld d3,fr
	add d3,#0xffffffc4
	ld [fr,-56],i2
LBB1143_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x14
LBB1146_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1147_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x18
LBB1152_73:
	ld [i1],d2
LBB1153_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1154_73:
	ld [fr,-48],r0
Ltext314_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L1536_73
LBB1155_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1156_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1536_73
	ld r1,r14
L1529_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1536_73
LBB1159_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1160_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1529_73
L1536_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1597_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1541_73
	ld r14,#0x1
L1541_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1598_73
LBB1163_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1166_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1166_73:
	ld i0,[i0]
LBE1164_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[i0]
	ld r14,[fr,-60]
	ld r15,[d3,4]
	ld d0,[r0,16]
	ld i1,r14
	ld i2,r15
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1544_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1597_73
LBB1169_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1170_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1170_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1544_73
	jp &L1597_73
L1598_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1174_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1497_73
LBB1175_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1177_73:
.line 334
	ld d1,[d2,8]
LBE1180_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1182_73:
	jc eq,r14,d1,&L1585_73
L1600_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1599_73
L1556_73:
.line 129
	add d1,#0x8
LBB1183_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1184_73:
	jc ne,r14,d1,&L1600_73
L1585_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1601_73
	ld r14,[d2]
L1565_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1589_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffbc
L1575_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1575_73
L1589_73:
.line 285
	ld [d2],d3
LBE1187_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L1497_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 296
	add sp,#0x28
	pop rt,d4
	ret
L1599_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1559_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1602_73
L1559_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1201_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1201_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1556_73
L1601_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB1208_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1592_73
	ld i0,[d2,8]
L1569_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1569_73
L1587_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1603_73
.line 307
	ld [d2,8],d0
	jp &L1565_73
L1603_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1565_73
L1602_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1559_73
L1592_73:
	ld i0,[d2,8]
	jp &L1587_73

//****************************************
// Function: __ZN6MAUtil11Environment20firePointerMoveEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil11Environment20firePointerMoveEventE9MAPoint2d_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 280
	push rt,d4
	sub sp,#0x28
	ld fr,sp
	add fr,#0x44
	ld [fr,-60],i1
	ld d3,fr
	add d3,#0xffffffc4
	ld [fr,-56],i2
LBB1210_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x14
LBB1213_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1214_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x18
LBB1219_73:
	ld [i1],d2
LBB1220_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1221_73:
	ld [fr,-48],r0
Ltext334_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L1643_73
LBB1222_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1223_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1643_73
	ld r1,r14
L1636_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1643_73
LBB1226_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1227_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1636_73
L1643_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1704_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1648_73
	ld r14,#0x1
L1648_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1705_73
LBB1230_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1233_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1233_73:
	ld i0,[i0]
LBE1231_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[i0]
	ld r14,[fr,-60]
	ld r15,[d3,4]
	ld d0,[r0,12]
	ld i1,r14
	ld i2,r15
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1651_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1704_73
LBB1236_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1237_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1237_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1651_73
	jp &L1704_73
L1705_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1241_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1604_73
LBB1242_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1244_73:
.line 334
	ld d1,[d2,8]
LBE1247_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1249_73:
	jc eq,r14,d1,&L1692_73
L1707_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1706_73
L1663_73:
.line 129
	add d1,#0x8
LBB1250_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1251_73:
	jc ne,r14,d1,&L1707_73
L1692_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1708_73
	ld r14,[d2]
L1672_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1696_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffbc
L1682_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1682_73
L1696_73:
.line 285
	ld [d2],d3
LBE1254_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L1604_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 287
	add sp,#0x28
	pop rt,d4
	ret
L1706_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1666_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1709_73
L1666_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1268_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1268_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1663_73
L1708_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB1275_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1699_73
	ld i0,[d2,8]
L1676_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1676_73
L1694_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1710_73
.line 307
	ld [d2,8],d0
	jp &L1672_73
L1710_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1672_73
L1709_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1666_73
L1699_73:
	ld i0,[d2,8]
	jp &L1694_73

//****************************************
// Function: __ZN6MAUtil11Environment21firePointerPressEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil11Environment21firePointerPressEventE9MAPoint2d_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 271
	push rt,d4
	sub sp,#0x28
	ld fr,sp
	add fr,#0x44
	ld [fr,-60],i1
	ld d3,fr
	add d3,#0xffffffc4
	ld [fr,-56],i2
LBB1277_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x14
LBB1280_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1281_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x18
LBB1286_73:
	ld [i1],d2
LBB1287_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1288_73:
	ld [fr,-48],r0
Ltext354_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L1750_73
LBB1289_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1290_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1750_73
	ld r1,r14
L1743_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1750_73
LBB1293_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1294_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1743_73
L1750_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1811_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1755_73
	ld r14,#0x1
L1755_73:
	ld r2,#0x0
	jc eq,r14,r2,&L1812_73
LBB1297_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1300_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1300_73:
	ld i0,[i0]
LBE1298_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[i0]
	ld r14,[fr,-60]
	ld r15,[d3,4]
	ld d0,[r0,8]
	ld i1,r14
	ld i2,r15
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1758_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L1811_73
LBB1303_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1304_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1304_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1758_73
	jp &L1811_73
L1812_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1308_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1711_73
LBB1309_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1311_73:
.line 334
	ld d1,[d2,8]
LBE1314_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1316_73:
	jc eq,r14,d1,&L1799_73
L1814_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1813_73
L1770_73:
.line 129
	add d1,#0x8
LBB1317_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1318_73:
	jc ne,r14,d1,&L1814_73
L1799_73:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d3,&L1815_73
	ld r14,[d2]
L1779_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L1803_73
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffbc
L1789_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1789_73
L1803_73:
.line 285
	ld [d2],d3
LBE1321_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L1711_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 278
	add sp,#0x28
	pop rt,d4
	ret
L1813_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1773_73
.line 132
	ld i0,[d1]
	jc ne,i0,r1,&L1816_73
L1773_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1335_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1335_73:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1770_73
L1815_73:
.line 298
	call &__Znam_20
	ld d0,r14
LBB1342_73:
.line 300
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1806_73
	ld i0,[d2,8]
L1783_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1783_73
L1801_73:
.line 304
	ld [d2,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L1817_73
.line 307
	ld [d2,8],d0
	jp &L1779_73
L1817_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d2]
.line 307
	ld [d2,8],d0
	jp &L1779_73
L1816_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1773_73
L1806_73:
	ld i0,[d2,8]
	jp &L1801_73

//****************************************
// Function: __ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE
//****************************************

.func __ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 107
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
LBB1344_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 101
	ld d2,i0
	add d2,#0x14
LBB1346_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x18
LBB1350_73:
	ld d1,[i0,8]
LBE1350_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,d1
LBE1352_73:
	jc eq,r14,d1,&L1818_73
L1860_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d1]
	jc eq,i0,i1,&L1859_73
.line 102
	add d1,#0x8
LBB1353_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d2
	add r0,#0x4
LBB1354_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE1354_73:
	jc ne,r14,d1,&L1860_73
L1818_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 110
	add sp,#0x8
	pop rt,d2
	ret
L1859_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 104
	ld.b r0,[d2]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L1861_73
.line 108
	ld.b r14,[d2,2]
	and r14,#0xff
	jc eq,r14,r0,&L1827_73
.line 109
	ld r14,#0x0
	jc ne,i0,r14,&L1862_73
L1827_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	ld d0,d2
	add d0,#0x4
	ld r14,d1
LBB1361_73:
.line 341
	ld r1,[d0]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d0,8]
	add r0,i0
LBE1364_73:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d1,&L1852_73
L1833_73:
.line 205
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L1833_73
	ld r1,[d0]
L1852_73:
.line 272
	ld d1,r1
	add d1,#0xffffffff
LBB1366_73:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L1863_73
L1835_73:
.line 281
	ld r0,d1
	jc le,r1,d1,&L1856_73
	ld r1,fr
	add r1,#0xffffffe4
L1845_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-28],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L1845_73
L1856_73:
.line 285
	ld [d0],d1
LBE1367_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 110
	add sp,#0x8
	pop rt,d2
	ret
L1861_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 105
	ld [d1,4],r1
.line 106
	ld r2,#0x1
	ld.b [d2,1],r2
LBE1376_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 110
	add sp,#0x8
	pop rt,d2
	ret
L1863_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d1
	sll i0,#0x3
	call &__Znam_20
	ld d2,r14
LBB1391_73:
.line 300
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L1857_73
	ld i0,[d0,8]
L1839_73:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d0]
	jc gt,r1,r2,&L1839_73
L1854_73:
.line 304
	ld [d0,4],d1
.line 305
	ld r2,#0x0
	jc ne,i0,r2,&L1864_73
.line 307
	ld i0,d2
	ld [d0,8],d2
	jp &L1835_73
L1864_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d0]
.line 307
	ld i0,d2
	ld [d0,8],d2
	jp &L1835_73
L1862_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 109
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1827_73
L1857_73:
	ld i0,[d0,8]
	jp &L1854_73

//****************************************
// Function: __ZN6MAUtil15PointerListenerD0Ev
//****************************************

.func __ZN6MAUtil15PointerListenerD0Ev_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB1392_73:
.line 23
	ld r0,&__ZTVN6MAUtil15PointerListenerE_73+8
	ld [i0],r0
LBB1393_73:
.line 24
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_73
.line 25
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1871_73
LBE1393_73:
.line 27
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret
L1871_73:
.line 26
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_73
LBE1395_73:
.line 27
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListenerD1Ev
//****************************************

.func __ZN6MAUtil15PointerListenerD1Ev_73, 1, void
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB1396_73:
.line 23
	ld r0,&__ZTVN6MAUtil15PointerListenerE_73+8
	ld [i0],r0
LBB1397_73:
.line 24
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_73
.line 25
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1877_73
LBE1397_73:
.line 27
	pop rt,d0
	ret
L1877_73:
.line 26
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_73
LBE1399_73:
.line 27
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListenerD2Ev
//****************************************

.func __ZN6MAUtil15PointerListenerD2Ev_73, 1, void
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB1400_73:
.line 23
	ld r0,&__ZTVN6MAUtil15PointerListenerE_73+8
	ld [i0],r0
LBB1401_73:
.line 24
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_73
.line 25
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1883_73
LBE1401_73:
.line 27
	pop rt,d0
	ret
L1883_73:
.line 26
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_73
LBE1403_73:
.line 27
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment18addPointerListenerEPNS_15PointerListenerE
//****************************************

.func __ZN6MAUtil11Environment18addPointerListenerEPNS_15PointerListenerE_73, 2, void
.line 102
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB1404_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,i0
	add r1,#0x14
LBB1406_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x18
LBB1410_73:
	ld r0,[i0,8]
LBE1410_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE1412_73:
	jc eq,r14,r0,&L1919_73
L1892_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,i1,&L1925_73
.line 91
	add r0,#0x8
LBB1413_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB1414_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1414_73:
	jc ne,r14,r0,&L1892_73
L1914_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB1415_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L1921_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L1894_73
LBB1417_73:
.line 293
	ld d2,d1
	add d2,d1
LBB1418_73:
.line 295
	jc lt,d1,d2,&L1926_73
L1921_73:
	ld i0,[d0,8]
L1893_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1416_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 105
	add sp,#0x8
	pop rt,d3
	ret
L1925_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r1,#0x1
	ld [r0,4],r1
LBE1424_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 105
	add sp,#0x8
	pop rt,d3
	ret
L1919_73:
	ld d0,r1
	add d0,#0x4
	jp &L1914_73
L1926_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB1434_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L1922_73
	ld i0,[d0,8]
L1900_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1900_73
L1916_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L1927_73
.line 307
	ld i0,d1
L1924_73:
	ld [d0,8],i0
	jp &L1893_73
L1894_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB1438_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L1923_73
	ld i0,[d0,8]
L1909_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1909_73
L1918_73:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L1928_73
.line 307
	ld i0,d2
L1929_73:
	ld [d0,8],i0
	jp &L1893_73
L1928_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L1929_73
L1927_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L1924_73
L1923_73:
	ld i0,[d0,8]
	jp &L1918_73
L1922_73:
	ld i0,[d0,8]
	jp &L1916_73

//****************************************
// Function: __ZN6MAUtil11Environment13fireConnEventERK15MAConnEventData
//****************************************

.func __ZN6MAUtil11Environment13fireConnEventERK15MAConnEventData_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 330
	push rt,d3
	sub sp,#0x20
	ld fr,sp
	add fr,#0x38
	ld d2,i1
LBB1442_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d3,i0
	add d3,#0x34
LBB1445_73:
.line 125
	ld r0,#0x1
	ld.b [d3],r0
LBE1446_73:
.line 71
	ld i1,fr
	add i1,#0xffffffd0
	ld d1,i0
	add d1,#0x38
LBB1451_73:
	ld [i1],d1
LBB1452_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d1]
LBE1453_73:
	ld [fr,-44],r0
Ltext398_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-40],r1
.line 72
	jc le,r0,r1,&L1967_73
LBB1454_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1,8]
LBE1455_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1967_73
	ld r1,r14
L1960_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L1967_73
LBB1458_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d1,8]
	add r14,r2
LBE1459_73:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L1960_73
L1967_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-32]
L2029_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-28]
	jc ge,i0,r3,&L1972_73
	ld r14,#0x1
L1972_73:
	ld r0,#0x0
	jc eq,r14,r0,&L1969_73
LBB1462_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r2,[d0]
LBB1465_73:
	sll i0,#0x3
	ld r14,[r2,8]
	add i0,r14
LBE1465_73:
	ld i0,[i0]
LBE1463_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0,4]
	ld r0,[d2]
	jc eq,r14,r0,&L2030_73
	ld r0,[d0,8]
	ld r1,[d0,4]
L1978_73:
.line 63
	ld r14,r0
	add r14,#0x1
	ld r0,r14
	ld [d0,8],r14
.line 64
	jc eq,r14,r1,&L2029_73
LBB1468_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r4,[r2,8]
	add r14,r4
LBE1469_73:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L1978_73
	jp &L2029_73
L2030_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d2
	call d0
L1969_73:
.line 125
	ld r1,#0x0
	ld.b [d3],r1
LBB1473_73:
.line 126
	ld.b r14,[d3,1]
	and r14,#0xff
	ld r2,#0x0
	jc eq,r14,r2,&L1930_73
LBB1474_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d2,[d1]
LBE1476_73:
.line 334
	ld d0,[d1,8]
LBE1479_73:
.line 341
	ld i0,d2
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d3
	add d1,#0x4
LBE1481_73:
	jc eq,r14,d0,&L2017_73
L2032_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r4,#0x0
	jc le,r14,r4,&L2031_73
L1990_73:
.line 129
	add d0,#0x8
LBB1482_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r1,[d1,8]
	add r14,r1
LBE1483_73:
	jc ne,r14,d0,&L2032_73
L2017_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d2,&L2033_73
	ld r14,[d1]
L1997_73:
.line 281
	ld r0,d2
	jc le,r14,d2,&L2021_73
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc8
L2007_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-56],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r4,[r1,4]
	ld [r14,4],r4
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2007_73
L2021_73:
.line 285
	ld [d1],d2
LBE1486_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d3,1],r14
L1930_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 340
	add sp,#0x20
	pop rt,d3
	ret
L2031_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d3,2]
	and r14,#0xff
	jc ne,r14,r4,&L2034_73
L1993_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d2,#0xffffffff
LBB1500_73:
	ld i0,d2
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1500_73:
	ld r0,[r14]
	ld [d0],r0
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L1990_73
L2034_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L1993_73
L2033_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB1507_73:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L2024_73
	ld i0,[d1,8]
L2001_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L2001_73
L2019_73:
.line 304
	ld [d1,4],d2
.line 305
	ld r4,#0x0
	jc ne,i0,r4,&L2035_73
.line 307
	ld [d1,8],d0
	jp &L1997_73
L2035_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L1997_73
L2024_73:
	ld i0,[d1,8]
	jp &L2019_73

//****************************************
// Function: __ZN6MAUtil11Environment18removeConnListenerEi
//****************************************

.func __ZN6MAUtil11Environment18removeConnListenerEi_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 144
	push rt,d6
	sub sp,#0x20
	ld fr,sp
	add fr,#0x44
	ld d6,i0
	ld d4,i1
LBB1508_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld i1,fr
	add i1,#0xffffffc4
	ld d3,i0
	add d3,#0x38
LBB1514_73:
	ld [i1],d3
LBB1515_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d3]
LBE1516_73:
	ld [fr,-56],r0
Ltext419_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-52],r1
.line 72
	jc le,r0,r1,&L2048_73
LBB1517_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d3,8]
LBE1518_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2048_73
	ld r1,r14
L2041_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L2048_73
LBB1521_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d3,8]
	add r14,r2
LBE1522_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L2041_73
L2048_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d2,fr
	add d2,#0xffffffd0
	ld i0,d2
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-44]
L2108_73:
.line 69
	ld r14,#0x0
	ld r0,[fr,-40]
	jc ge,r0,r3,&L2053_73
	ld r14,#0x1
L2053_73:
	ld r1,#0x0
	jc eq,r14,r1,&L2109_73
LBB1525_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2]
LBB1528_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1528_73:
	ld r1,[r0]
LBE1526_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[r1,4]
	jc eq,r14,d4,&L2110_73
L2051_73:
	ld r1,[d2,8]
	ld r2,[d2,4]
L2088_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d2,8],r0
.line 64
	jc eq,r0,r2,&L2108_73
LBB1531_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2]
LBB1532_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1532_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L2088_73
	jp &L2108_73
L2110_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 101
	ld d1,d6
	add d1,#0x34
LBB1534_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,[d3,8]
LBE1538_73:
.line 341
	ld r14,[d3]
	sll r14,#0x3
	add r14,d0
L2106_73:
	jc eq,r14,d0,&L2051_73
Ltext429_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d0]
	jc eq,i0,r1,&L2111_73
.line 102
	add d0,#0x8
LBB1541_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d1
	add r0,#0x4
LBB1542_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
	jp &L2106_73
L2109_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 69
	add sp,#0x20
	pop rt,d6
	ret
L2111_73:
.line 104
	ld.b r0,[d1]
	and r0,#0xff
	ld r14,#0x0
	jc eq,r0,r14,&L2065_73
.line 105
	ld [d0,4],r14
.line 106
	ld r0,#0x1
	ld.b [d1,1],r0
	ld r3,[fr,-44]
	jp &L2051_73
L2065_73:
.line 108
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L2067_73
.line 109
	call &__ZdlPv_23
L2067_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	add d1,#0x4
	ld r14,d0
LBB1551_73:
.line 341
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE1554_73:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d0,&L2097_73
L2071_73:
.line 205
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L2071_73
	ld r1,[d1]
L2097_73:
.line 272
	ld d0,r1
	add d0,#0xffffffff
LBB1556_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d0,&L2112_73
L2073_73:
.line 281
	ld r0,d0
	jc le,r1,d0,&L2101_73
	ld r1,fr
	add r1,#0xffffffbc
L2083_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2083_73
L2101_73:
.line 285
	ld [d1],d0
	ld r3,[fr,-44]
	jp &L2051_73
L2112_73:
.line 298
	ld i0,d0
	sll i0,#0x3
	call &__Znam_20
	ld d5,r14
LBB1565_73:
.line 300
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L2102_73
	ld i0,[d1,8]
L2077_73:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d5
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L2077_73
L2099_73:
.line 304
	ld [d1,4],d0
.line 305
	ld r2,#0x0
	jc ne,i0,r2,&L2113_73
.line 307
	ld i0,d5
	ld [d1,8],d5
	jp &L2073_73
L2113_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d1]
.line 307
	ld i0,d5
	ld [d1,8],d5
	jp &L2073_73
L2102_73:
	ld i0,[d1,8]
	jp &L2099_73

//****************************************
// Function: __ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE
//****************************************

.func __ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 129
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
	ld d2,i0
	ld d0,i1
	ld d1,i2
LBB1566_73:
.line 130
	ld r1,#0x0
	jc eq,i2,r1,&L2156_73
.line 137
	call &__ZN6MAUtil11Environment18removeConnListenerEi_73
.line 140
	ld [d1,4],d0
LBB1567_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,d2
	add r1,#0x34
LBB1568_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,d2
	add r14,#0x38
LBB1572_73:
	ld r0,[r14,8]
LBE1572_73:
.line 341
	ld r14,[r14]
	sll r14,#0x3
	add r14,r0
LBE1574_73:
	jc eq,r14,r0,&L2150_73
L2123_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,d1,&L2157_73
.line 91
	add r0,#0x8
LBB1575_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB1576_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1576_73:
	jc ne,r14,r0,&L2123_73
L2145_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],d1
LBB1577_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2152_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L2125_73
LBB1579_73:
.line 293
	ld d2,d1
	add d2,d1
LBB1580_73:
.line 295
	jc lt,d1,d2,&L2158_73
L2152_73:
	ld i0,[d0,8]
L2124_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1578_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 142
	add sp,#0x8
	pop rt,d3
	ret
L2157_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r2,#0x1
	ld [r0,4],r2
LBE1586_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 142
	add sp,#0x8
	pop rt,d3
	ret
L2150_73:
	ld d0,r1
	add d0,#0x4
	jp &L2145_73
L2158_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB1596_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2153_73
	ld i0,[d0,8]
L2131_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2131_73
L2147_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L2159_73
.line 307
	ld i0,d1
L2155_73:
	ld [d0,8],i0
	jp &L2124_73
L2125_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB1600_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2154_73
	ld i0,[d0,8]
L2140_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2140_73
L2149_73:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L2160_73
.line 307
	ld i0,d2
L2161_73:
	ld [d0,8],i0
	jp &L2124_73
L2160_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L2161_73
L2159_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L2155_73
L2154_73:
	ld i0,[d0,8]
	jp &L2149_73
L2156_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 131
	ld i0,&LC2_73
	ld i1,&_ZZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerEE12__FUNCTION___73
	call &_panicFunction_28
L2153_73:
	ld i0,[d0,8]
	jp &L2147_73

//****************************************
// Function: __ZN6MAUtil11Environment16runIdleListenersEv
//****************************************

.func __ZN6MAUtil11Environment16runIdleListenersEv_73, 1, void
.line 367
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
LBB1604_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x44
LBB1607_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1608_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x48
LBB1613_73:
	ld [i1],d2
LBB1614_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1615_73:
	ld [fr,-48],r0
Ltext447_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L2199_73
LBB1616_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1617_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2199_73
	ld r1,r14
L2192_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L2199_73
LBB1620_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1621_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L2192_73
L2199_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L2258_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L2204_73
	ld r14,#0x1
L2204_73:
	ld r2,#0x0
	jc eq,r14,r2,&L2259_73
LBB1624_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1627_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1627_73:
	ld i0,[i0]
LBE1625_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14]
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L2207_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L2258_73
LBB1630_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1631_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1631_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L2207_73
	jp &L2258_73
L2259_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1635_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L2162_73
LBB1636_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1638_73:
.line 334
	ld d0,[d2,8]
LBE1641_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE1643_73:
	jc eq,r14,d0,&L2246_73
L2261_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L2260_73
L2219_73:
.line 129
	add d0,#0x8
LBB1644_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE1645_73:
	jc ne,r14,d0,&L2261_73
L2246_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d3,&L2262_73
	ld r14,[d1]
L2226_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L2250_73
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L2236_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2236_73
L2250_73:
.line 285
	ld [d1],d3
LBE1648_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L2162_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 375
	add sp,#0x20
	pop rt,d4
	ret
L2260_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L2263_73
L2222_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1662_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1662_73:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L2219_73
L2263_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L2222_73
L2262_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB1669_73:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L2253_73
	ld i0,[d1,8]
L2230_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L2230_73
L2248_73:
.line 304
	ld [d1,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L2264_73
.line 307
	ld [d1,8],d0
	jp &L2226_73
L2264_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L2226_73
L2253_73:
	ld i0,[d1,8]
	jp &L2248_73

//****************************************
// Function: __ZN6MAUtil11Environment18removeIdleListenerEPNS_12IdleListenerE
//****************************************

.func __ZN6MAUtil11Environment18removeIdleListenerEPNS_12IdleListenerE_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 175
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
LBB1670_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 101
	ld d1,i0
	add d1,#0x44
LBB1672_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x48
LBB1676_73:
	ld d0,[i0,8]
LBE1676_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,d0
LBE1678_73:
	jc eq,r14,d0,&L2265_73
L2305_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d0]
	jc eq,i0,i1,&L2304_73
.line 102
	add d0,#0x8
LBB1679_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d1
	add r0,#0x4
LBB1680_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE1680_73:
	jc ne,r14,d0,&L2305_73
L2265_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 178
	add sp,#0x8
	pop rt,d2
	ret
L2304_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 104
	ld.b r0,[d1]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L2306_73
.line 108
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L2274_73
.line 109
	call &__ZdlPv_23
L2274_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	add d1,#0x4
	ld r14,d0
LBB1687_73:
.line 341
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE1690_73:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d0,&L2297_73
L2278_73:
.line 205
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L2278_73
	ld r1,[d1]
L2297_73:
.line 272
	ld d0,r1
	add d0,#0xffffffff
LBB1692_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d0,&L2307_73
L2280_73:
.line 281
	ld r0,d0
	jc le,r1,d0,&L2301_73
	ld r1,fr
	add r1,#0xffffffe4
L2290_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-28],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2290_73
L2301_73:
.line 285
	ld [d1],d0
LBE1693_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 178
	add sp,#0x8
	pop rt,d2
	ret
L2306_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 105
	ld [d0,4],r1
.line 106
	ld r2,#0x1
	ld.b [d1,1],r2
LBE1702_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 178
	add sp,#0x8
	pop rt,d2
	ret
L2307_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d0
	sll i0,#0x3
	call &__Znam_20
	ld d2,r14
LBB1717_73:
.line 300
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L2302_73
	ld i0,[d1,8]
L2284_73:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L2284_73
L2299_73:
.line 304
	ld [d1,4],d0
.line 305
	ld r2,#0x0
	jc ne,i0,r2,&L2308_73
.line 307
	ld i0,d2
	ld [d1,8],d2
	jp &L2280_73
L2308_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d1]
.line 307
	ld i0,d2
	ld [d1,8],d2
	jp &L2280_73
L2302_73:
	ld i0,[d1,8]
	jp &L2299_73

//****************************************
// Function: __ZN6MAUtil11Environment15addIdleListenerEPNS_12IdleListenerE
//****************************************

.func __ZN6MAUtil11Environment15addIdleListenerEPNS_12IdleListenerE_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 170
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB1718_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,i0
	add r1,#0x44
LBB1720_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x48
LBB1724_73:
	ld r0,[i0,8]
LBE1724_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE1726_73:
	jc eq,r14,r0,&L2344_73
L2317_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,i1,&L2350_73
.line 91
	add r0,#0x8
LBB1727_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB1728_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1728_73:
	jc ne,r14,r0,&L2317_73
L2339_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB1729_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2346_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L2319_73
LBB1731_73:
.line 293
	ld d2,d1
	add d2,d1
LBB1732_73:
.line 295
	jc lt,d1,d2,&L2351_73
L2346_73:
	ld i0,[d0,8]
L2318_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1730_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 173
	add sp,#0x8
	pop rt,d3
	ret
L2350_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r1,#0x1
	ld [r0,4],r1
LBE1738_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 173
	add sp,#0x8
	pop rt,d3
	ret
L2344_73:
	ld d0,r1
	add d0,#0x4
	jp &L2339_73
L2351_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB1748_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2347_73
	ld i0,[d0,8]
L2325_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2325_73
L2341_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L2352_73
.line 307
	ld i0,d1
L2349_73:
	ld [d0,8],i0
	jp &L2318_73
L2319_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB1752_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2348_73
	ld i0,[d0,8]
L2334_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2334_73
L2343_73:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L2353_73
.line 307
	ld i0,d2
L2354_73:
	ld [d0,8],i0
	jp &L2318_73
L2353_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L2354_73
L2352_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L2349_73
L2348_73:
	ld i0,[d0,8]
	jp &L2343_73
L2347_73:
	ld i0,[d0,8]
	jp &L2341_73

//****************************************
// Function: __ZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEii
//****************************************

.func __ZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEii_73, 4, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 180
	push rt,d6
	sub sp,#0x28
	ld fr,sp
	add fr,#0x4c
	ld d4,i0
	ld d3,i1
	ld d5,i2
	ld d6,i3
LBB1756_73:
.line 181
	ld r0,#0x0
	jc lt,i2,r0,&L2483_73
LBB1758_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld i1,fr
	add i1,#0xffffffc4
	ld d2,i0
	add d2,#0x58
LBB1762_73:
	ld [i1],d2
LBB1763_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1764_73:
	ld [fr,-56],r0
Ltext491_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-52],r1
.line 72
	jc le,r0,r1,&L2369_73
LBB1765_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1766_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2369_73
	ld r1,r14
L2362_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L2369_73
LBB1769_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1770_73:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2362_73
L2369_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-44]
L2482_73:
.line 69
	ld r14,#0x0
	ld r0,[fr,-40]
	jc ge,r0,r3,&L2374_73
	ld r14,#0x1
L2374_73:
	ld r1,#0x0
	jc eq,r14,r1,&L2484_73
LBB1773_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r2,[d1]
LBB1776_73:
	sll r0,#0x3
	ld d0,[r2,8]
	add r0,d0
LBE1776_73:
	ld r0,[r0]
LBE1774_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[r0]
	jc eq,r14,d3,&L2485_73
	ld r0,[d1,8]
	ld r1,[d1,4]
L2418_73:
.line 63
	ld r14,r0
	add r14,#0x1
	ld r0,r14
	ld [d1,8],r14
.line 64
	jc eq,r14,r1,&L2482_73
LBB1779_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r4,[r2,8]
	add r14,r4
LBE1780_73:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2418_73
	jp &L2482_73
L2484_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	add d4,#0x54
	ld i0,#0x14
	call &__Znwm_21
	ld d1,r14
	ld i0,r14
	ld i1,d3
	ld i2,d5
	ld i3,d6
	call &__ZN6MAUtil11Environment18TimerEventInstanceC1EPNS_13TimerListenerEii_73
LBB1782_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,[d2,8]
LBE1786_73:
.line 341
	ld r14,[d2]
	sll r14,#0x3
	add r14,r0
LBE1788_73:
	jc eq,r14,r0,&L2470_73
L2432_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,d1,&L2486_73
.line 91
	add r0,#0x8
LBB1789_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,d4
	add d0,#0x4
LBB1790_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r4,[d0,8]
	add r14,r4
LBE1790_73:
	jc ne,r14,r0,&L2432_73
L2460_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffb4
	ld r14,#0x1
	ld [fr,-72],r14
	ld [fr,-76],d1
LBB1791_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2472_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L2434_73
LBB1793_73:
.line 293
	ld d2,d1
	add d2,d1
LBB1794_73:
.line 295
	jc lt,d1,d2,&L2487_73
L2472_73:
	ld i0,[d0,8]
L2433_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r1,[d3]
	ld [r14],r1
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1792_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 193
	add sp,#0x28
	pop rt,d6
	ret
L2470_73:
	ld d0,d4
	add d0,#0x4
	jp &L2460_73
L2485_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld [r0,8],d5
LBB1799_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[fr,-40]
LBB1802_73:
	sll r14,#0x3
	add r14,d0
LBE1802_73:
	ld r14,[r14]
LBE1800_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld [r14,12],d6
LBB1803_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[fr,-40]
LBB1806_73:
	sll r14,#0x3
	add d0,r14
LBE1806_73:
	ld d0,[d0]
LBE1804_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	syscall 86
	ld [d0,4],r14
LBB1807_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r0,[d1]
	ld r14,[fr,-40]
LBB1810_73:
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE1810_73:
	ld r14,[r14]
LBE1808_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r1,[r14,4]
	add d5,r1
	ld [r14,16],d5
LBB1811_73:
.line 90
	ld r2,d4
	add r2,#0x54
LBB1812_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[fr,-40]
LBB1815_73:
	sll r14,#0x3
	add r0,r14
LBE1815_73:
	ld i0,[r0]
LBE1813_73:
.line 334
	ld r1,[d2,8]
LBE1820_73:
.line 341
	ld r14,[d2]
	sll r14,#0x3
	add r14,r1
LBE1822_73:
	jc eq,r14,r1,&L2465_73
L2397_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r1]
	jc eq,r14,i0,&L2488_73
.line 91
	add r1,#0x8
LBB1823_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r2
	add d0,#0x4
LBB1824_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r4,[d0,8]
	add r14,r4
LBE1824_73:
	jc ne,r14,r1,&L2397_73
L2454_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffbc
	ld r14,#0x1
	ld [fr,-64],r14
	ld [fr,-68],i0
LBB1825_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2472_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L2399_73
LBB1827_73:
.line 293
	ld d2,d1
	add d2,d1
LBB1828_73:
.line 295
	jc ge,d1,d2,&L2472_73
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB1830_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2473_73
	ld i0,[d0,8]
L2405_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2405_73
L2462_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r4,#0x0
	jc ne,i0,r4,&L2489_73
.line 307
	ld i0,d1
L2479_73:
	ld [d0,8],i0
	jp &L2433_73
L2465_73:
	ld d0,r2
	add d0,#0x4
	jp &L2454_73
L2399_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB1851_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2474_73
	ld i0,[d0,8]
L2414_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2414_73
L2464_73:
.line 304
	ld r4,#0x4
	ld [d0,4],r4
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L2490_73
.line 307
	ld i0,d2
L2491_73:
	ld [d0,8],i0
	jp &L2433_73
L2434_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB1860_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2474_73
	ld i0,[d0,8]
L2449_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2449_73
	jp &L2464_73
L2487_73:
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB1864_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2473_73
	ld i0,[d0,8]
L2440_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2440_73
	jp &L2462_73
L2490_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L2491_73
L2489_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L2479_73
L2474_73:
	ld i0,[d0,8]
	jp &L2464_73
L2486_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r2,#0x1
	ld [r0,4],r2
LBE1871_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 193
	add sp,#0x28
	pop rt,d6
	ret
L2488_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r2,#0x1
	ld [r1,4],r2
LBE1878_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 193
	add sp,#0x28
	pop rt,d6
	ret
L2483_73:
.line 181
	ld i0,&LC3_73
	ld i1,&_ZZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEiiE12__FUNCTION___73
	call &_panicFunction_28
L2473_73:
	ld i0,[d0,8]
	jp &L2462_73

//****************************************
// Function: __ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE
//****************************************

.func __ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE_73, 2, void
.line 195
	push rt,d3
	sub sp,#0x20
	ld fr,sp
	add fr,#0x38
	ld d3,i0
	ld d1,i1
LBB1881_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld i1,fr
	add i1,#0xffffffd0
	ld d2,i0
	add d2,#0x58
LBB1887_73:
	ld [i1],d2
LBB1888_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1889_73:
	ld [fr,-44],r0
Ltext524_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-40],r1
.line 72
	jc le,r0,r1,&L2504_73
LBB1890_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1891_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2504_73
	ld r1,r14
L2497_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L2504_73
LBB1894_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1895_73:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2497_73
L2504_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-32]
L2564_73:
.line 69
	ld r14,#0x0
	ld r0,[fr,-28]
	jc ge,r0,r3,&L2509_73
	ld r14,#0x1
L2509_73:
	ld r1,#0x0
	jc eq,r14,r1,&L2492_73
LBB1898_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r2,[d0]
LBB1901_73:
	sll r0,#0x3
	ld r14,[r2,8]
	add r0,r14
LBE1901_73:
	ld r1,[r0]
LBE1899_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[r1]
	jc eq,r14,d1,&L2565_73
	ld r0,[d0,8]
	ld r1,[d0,4]
L2544_73:
.line 63
	ld r14,r0
	add r14,#0x1
	ld r0,r14
	ld [d0,8],r14
.line 64
	jc eq,r14,r1,&L2564_73
LBB1904_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r4,[r2,8]
	add r14,r4
LBE1905_73:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2544_73
	jp &L2564_73
L2566_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 104
	ld.b r0,[d1]
	and r0,#0xff
	ld r1,#0x0
	jc eq,r0,r1,&L2521_73
.line 105
	ld [d0,4],r1
.line 106
	ld r2,#0x1
	ld.b [d1,1],r2
L2492_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 202
	add sp,#0x20
	pop rt,d3
	ret
L2565_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 101
	ld d1,d3
	add d1,#0x54
LBB1914_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,[d2,8]
LBE1918_73:
.line 341
	ld r14,[d2]
	sll r14,#0x3
	add r14,d0
L2563_73:
	jc eq,r14,d0,&L2492_73
Ltext536_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d0]
	jc eq,i0,r1,&L2566_73
.line 102
	add d0,#0x8
LBB1921_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d1
	add r0,#0x4
LBB1922_73:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
	jp &L2563_73
L2521_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 108
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L2523_73
.line 109
	call &__ZdlPv_23
L2523_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	add d1,#0x4
	ld r14,d0
LBB1924_73:
.line 341
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE1927_73:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d0,&L2554_73
L2527_73:
.line 205
	ld r4,[r14,8]
	ld [r14],r4
	ld r1,[r14,12]
	ld [r14,4],r1
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L2527_73
	ld r1,[d1]
L2554_73:
.line 272
	ld d0,r1
	add d0,#0xffffffff
LBB1929_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d0,&L2567_73
L2529_73:
.line 281
	ld r0,d0
	jc le,r1,d0,&L2558_73
	ld r1,fr
	add r1,#0xffffffc8
L2539_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-56],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r4,[r1,4]
	ld [r14,4],r4
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2539_73
L2558_73:
.line 285
	ld [d1],d0
	jp &L2492_73
L2567_73:
.line 298
	ld i0,d0
	sll i0,#0x3
	call &__Znam_20
	ld d2,r14
LBB1938_73:
.line 300
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L2559_73
	ld i0,[d1,8]
L2533_73:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r4,[r14]
	ld [r0],r4
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L2533_73
L2556_73:
.line 304
	ld [d1,4],d0
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L2568_73
.line 307
	ld i0,d2
	ld [d1,8],d2
	jp &L2529_73
L2568_73:
.line 305
	call &__ZdaPv_22
	ld r1,[d1]
.line 307
	ld i0,d2
	ld [d1,8],d2
	jp &L2529_73
L2559_73:
	ld i0,[d1,8]
	jp &L2556_73

//****************************************
// Function: __ZN6MAUtil11Environment24fireCustomEventListenersERK7MAEvent
//****************************************

.func __ZN6MAUtil11Environment24fireCustomEventListenersERK7MAEvent_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 349
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d3,i1
LBB1939_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,i0
	add d4,#0x74
LBB1942_73:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE1943_73:
.line 71
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x78
LBB1948_73:
	ld [i1],d2
LBB1949_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE1950_73:
	ld [fr,-48],r0
Ltext543_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-44],r1
.line 72
	jc le,r0,r1,&L2606_73
LBB1951_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE1952_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2606_73
	ld r1,r14
L2599_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L2606_73
LBB1955_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1956_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L2599_73
L2606_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L2665_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L2611_73
	ld r14,#0x1
L2611_73:
	ld r2,#0x0
	jc eq,r14,r2,&L2666_73
LBB1959_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1962_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1962_73:
	ld i0,[i0]
LBE1960_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L2614_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L2665_73
LBB1965_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB1966_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1966_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L2614_73
	jp &L2665_73
L2666_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d4],r14
LBB1970_73:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L2569_73
LBB1971_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE1973_73:
.line 334
	ld d0,[d2,8]
LBE1976_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE1978_73:
	jc eq,r14,d0,&L2653_73
L2668_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L2667_73
L2626_73:
.line 129
	add d0,#0x8
LBB1979_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE1980_73:
	jc ne,r14,d0,&L2668_73
L2653_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d3,&L2669_73
	ld r14,[d1]
L2633_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L2657_73
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L2643_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2643_73
L2657_73:
.line 285
	ld [d1],d3
LBE1983_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L2569_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 356
	add sp,#0x20
	pop rt,d4
	ret
L2667_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L2670_73
L2629_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB1997_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1997_73:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L2626_73
L2670_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L2629_73
L2669_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB2004_73:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L2660_73
	ld i0,[d1,8]
L2637_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L2637_73
L2655_73:
.line 304
	ld [d1,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L2671_73
.line 307
	ld [d1,8],d0
	jp &L2633_73
L2671_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L2633_73
L2660_73:
	ld i0,[d1,8]
	jp &L2655_73

//****************************************
// Function: __ZN6MAUtil11Environment22addCustomEventListenerEPNS_19CustomEventListenerE
//****************************************

.func __ZN6MAUtil11Environment22addCustomEventListenerEPNS_19CustomEventListenerE_73, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 204
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB2053_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 90
	ld r1,i0
	add r1,#0x74
LBB2055_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	add i0,#0x78
LBB2059_73:
	ld r0,[i0,8]
LBE2059_73:
.line 341
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE2061_73:
	jc eq,r14,r0,&L2751_73
L2724_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld r14,[r0]
	jc eq,r14,i1,&L2757_73
.line 91
	add r0,#0x8
LBB2062_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld d0,r1
	add d0,#0x4
LBB2063_73:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE2063_73:
	jc ne,r14,r0,&L2724_73
L2746_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 97
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB2064_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2753_73
.line 169
	ld r1,#0x0
	jc eq,d1,r1,&L2726_73
LBB2066_73:
.line 293
	ld d2,d1
	add d2,d1
LBB2067_73:
.line 295
	jc lt,d1,d2,&L2758_73
L2753_73:
	ld i0,[d0,8]
L2725_73:
.line 174
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE2065_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 207
	add sp,#0x8
	pop rt,d3
	ret
L2757_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 93
	ld r1,#0x1
	ld [r0,4],r1
LBE2073_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 207
	add sp,#0x8
	pop rt,d3
	ret
L2751_73:
	ld d0,r1
	add d0,#0x4
	jp &L2746_73
L2758_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	sll i0,#0x3
	call &__Znam_20
	ld d1,r14
LBB2083_73:
.line 300
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2754_73
	ld i0,[d0,8]
L2732_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2732_73
L2748_73:
.line 304
	ld [d0,4],d2
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L2759_73
.line 307
	ld i0,d1
L2756_73:
	ld [d0,8],i0
	jp &L2725_73
L2726_73:
.line 298
	ld i0,#0x20
	call &__Znam_20
	ld d2,r14
LBB2087_73:
.line 300
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2755_73
	ld i0,[d0,8]
L2741_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2741_73
L2750_73:
.line 304
	ld r14,#0x4
	ld [d0,4],r14
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L2760_73
.line 307
	ld i0,d2
L2761_73:
	ld [d0,8],i0
	jp &L2725_73
L2760_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d2
	jp &L2761_73
L2759_73:
.line 305
	call &__ZdaPv_22
	ld r0,[d0]
.line 307
	ld i0,d1
	jp &L2756_73
L2755_73:
	ld i0,[d0,8]
	jp &L2750_73
L2754_73:
	ld i0,[d0,8]
	jp &L2748_73

//****************************************
// Function: __ZN6MAUtil11Environment20fireTextBoxListenersEii
//****************************************

.func __ZN6MAUtil11Environment20fireTextBoxListenersEii_73, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 358
	push rt,d5
	sub sp,#0x20
	ld fr,sp
	add fr,#0x40
	ld d4,i1
	ld d3,i2
LBB2091_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d5,i0
	add d5,#0x84
LBB2094_73:
.line 125
	ld r0,#0x1
	ld.b [d5],r0
LBE2095_73:
.line 71
	ld i1,fr
	add i1,#0xffffffc8
	ld d2,i0
	add d2,#0x88
LBB2100_73:
	ld [i1],d2
LBB2101_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d2]
LBE2102_73:
	ld [fr,-52],r0
Ltext587_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-48],r1
.line 72
	jc le,r0,r1,&L2799_73
LBB2103_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d2,8]
LBE2104_73:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2799_73
	ld r1,r14
L2792_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L2799_73
LBB2107_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE2108_73:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L2792_73
L2799_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L2858_73:
.line 69
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L2804_73
	ld r14,#0x1
L2804_73:
	ld r2,#0x0
	jc eq,r14,r2,&L2859_73
LBB2111_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB2114_73:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE2114_73:
	ld i0,[i0]
LBE2112_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d4
	ld i2,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L2807_73:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L2858_73
LBB2117_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB2118_73:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE2118_73:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L2807_73
	jp &L2858_73
L2859_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 125
	ld r14,#0x0
	ld.b [d5],r14
LBB2122_73:
.line 126
	ld.b r14,[d5,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L2762_73
LBB2123_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d3,[d2]
LBE2125_73:
.line 334
	ld d0,[d2,8]
LBE2128_73:
.line 341
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d5
	add d1,#0x4
LBE2130_73:
	jc eq,r14,d0,&L2846_73
L2861_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L2860_73
L2819_73:
.line 129
	add d0,#0x8
LBB2131_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE2132_73:
	jc ne,r14,d0,&L2861_73
L2846_73:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d3,&L2862_73
	ld r14,[d1]
L2826_73:
.line 281
	ld r0,d3
	jc le,r14,d3,&L2850_73
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc0
L2836_73:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-64],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2836_73
L2850_73:
.line 285
	ld [d1],d3
LBE2135_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d5,1],r14
L2762_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 365
	add sp,#0x20
	pop rt,d5
	ret
L2860_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d5,2]
	and r14,#0xff
	jc ne,r14,r1,&L2863_73
L2822_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d3,#0xffffffff
LBB2149_73:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE2149_73:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L2819_73
L2863_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L2822_73
L2862_73:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__Znam_20
	ld d0,r14
LBB2156_73:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L2853_73
	ld i0,[d1,8]
L2830_73:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L2830_73
L2848_73:
.line 304
	ld [d1,4],d3
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L2864_73
.line 307
	ld [d1,8],d0
	jp &L2826_73
L2864_73:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L2826_73
L2853_73:
	ld i0,[d1,8]
	jp &L2848_73

//****************************************
// Function: __ZN6MAUtil4RectC1Ev
//****************************************

.func __ZN6MAUtil4RectC1Ev_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Geometry.cpp'
.line 21
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_75:
.line 21
	ld r14,&__ZTVN6MAUtil4RectE_75+8
	ld [i0],r14
	ld r14,#0x0
	ld [i0,4],r14
	ld [i0,8],r14
	ld [i0,12],r14
	ld [i0,16],r14
LBE3_75:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil4RectC1Eiiii
//****************************************

.func __ZN6MAUtil4RectC1Eiiii_75, 5, void
.line 24
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB5_75:
.line 24
	ld r14,&__ZTVN6MAUtil4RectE_75+8
	ld [i0],r14
.line 25
	ld [i0,4],i1
.line 26
	ld [i0,8],i2
.line 27
	ld [i0,12],i3
.line 28
	ld r14,[fr]
	ld [i0,16],r14
LBE5_75:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil4Rect3setEiiii
//****************************************

.func __ZN6MAUtil4Rect3setEiiii_75, 5, void
.line 32
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_75:
.line 33
	ld [i0,4],i1
.line 34
	ld [i0,8],i2
.line 35
	ld [i0,12],i3
.line 36
	ld r14,[fr]
	ld [i0,16],r14
LBE6_75:
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil4Rect8containsEii
//****************************************

.func __ZNK6MAUtil4Rect8containsEii_75, 3, int
.line 70
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB8_75:
.line 71
	ld r14,[i0,4]
	ld r0,#0x0
	jc gt,r14,i1,&L7_75
.line 72
	ld r15,[i0,8]
	jc gt,r15,i2,&L7_75
.line 73
	ld r0,[i0,12]
	add r14,r0
	ld r0,#0x0
	jc lt,r14,i1,&L7_75
.line 74
	ld r14,[i0,16]
	add r14,r15
	jc lt,r14,i2,&L7_75
.line 75
	ld r0,#0x1
L7_75:
.line 76
	ld r14,r0
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil4Rect8containsERKNS_5PointE
//****************************************

.func __ZNK6MAUtil4Rect8containsERKNS_5PointE_75, 2, int
.line 45
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld r14,i1
LBB9_75:
.line 46
	ld i1,[i1]
	ld i2,[r14,4]
	call &__ZNK6MAUtil4Rect8containsEii_75
LBE9_75:
.line 47
	and r14,#0xff
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil13THashFunctionIiEEmRKT_
//****************************************

.func __ZN6MAUtil13THashFunctionIiEEmRKT__76, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\HashMap.cpp'
.line 28
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_76:
.line 29
	ld r14,[i0]
.line 30
	ld r0,r14
	sll r0,#0xf
	not r0,r0
	add r14,r0
.line 31
	ld r0,r14
	sra r0,#0xa
	xor r14,r0
.line 32
	ld r0,r14
	sll r0,#0x3
	add r14,r0
.line 33
	ld r0,r14
	sra r0,#0x6
	xor r14,r0
.line 34
	mul r14,#0x4005
.line 35
	ld r0,r14
	sra r0,#0x10
LBE4_76:
.line 37
	xor r14,r0
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_77, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.h'
.line 57
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 57
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_77, 2, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6Moblet13keyPressEventEii
//****************************************

.func __ZThn148_N6MAUtil6Moblet13keyPressEventEii_77, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6Moblet13keyPressEventEii_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet13keyPressEventEii
//****************************************

.func __ZN6MAUtil6Moblet13keyPressEventEii_77, 3, void
.line 54
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 54
	pop fr,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6Moblet15keyReleaseEventEii
//****************************************

.func __ZThn148_N6MAUtil6Moblet15keyReleaseEventEii_77, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6Moblet15keyReleaseEventEii_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet15keyReleaseEventEii
//****************************************

.func __ZN6MAUtil6Moblet15keyReleaseEventEii_77, 3, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet17pointerPressEventE9MAPoint2d
//****************************************

.func __ZThn152_N6MAUtil6Moblet17pointerPressEventE9MAPoint2d_77, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d_77, 3, void
.line 63
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 63
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZThn152_N6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_77, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_77, 3, void
.line 68
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 68
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZThn152_N6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_77, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_77, 3, void
.line 73
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 73
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet20multitouchPressEventE9MAPoint2di
//****************************************

.func __ZThn152_N6MAUtil6Moblet20multitouchPressEventE9MAPoint2di_77, 4, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet20multitouchPressEventE9MAPoint2di_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet20multitouchPressEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil6Moblet20multitouchPressEventE9MAPoint2di_77, 4, void
.line 78
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 78
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet19multitouchMoveEventE9MAPoint2di
//****************************************

.func __ZThn152_N6MAUtil6Moblet19multitouchMoveEventE9MAPoint2di_77, 4, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet19multitouchMoveEventE9MAPoint2di_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet19multitouchMoveEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil6Moblet19multitouchMoveEventE9MAPoint2di_77, 4, void
.line 83
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 83
	pop fr,fr
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6Moblet22multitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZThn152_N6MAUtil6Moblet22multitouchReleaseEventE9MAPoint2di_77, 4, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet22multitouchReleaseEventE9MAPoint2di_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet22multitouchReleaseEventE9MAPoint2di
//****************************************

.func __ZN6MAUtil6Moblet22multitouchReleaseEventE9MAPoint2di_77, 4, void
.line 88
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 88
	pop fr,fr
	ret

//****************************************
// Function: __ZThn160_N6MAUtil6Moblet11customEventERK7MAEvent
//****************************************

.func __ZThn160_N6MAUtil6Moblet11customEventERK7MAEvent_77, 2, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff60
	call &__ZN6MAUtil6Moblet11customEventERK7MAEvent_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet11customEventERK7MAEvent
//****************************************

.func __ZN6MAUtil6Moblet11customEventERK7MAEvent_77, 2, void
.line 99
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 99
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil6MobletC2Ev
//****************************************

.func __ZN6MAUtil6MobletC2Ev_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 23
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
LBB2_77:
.line 23
	call &__ZN6MAUtil11EnvironmentC2Ev_73
LBB3_77:
	ld i1,d0
	add i1,#0x94
LBE3_77:
	ld d1,d0
	add d1,#0x98
LBE4_77:
	ld d2,d0
	add d2,#0x9c
LBE5_77:
	ld d3,d0
	add d3,#0xa0
LBE6_77:
	ld r14,&__ZTVN6MAUtil6MobletE_77+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+72
	ld [i1],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+108
	ld [d1],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+148
	ld [d2],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+160
	ld [d3],r14
	ld r14,#0x1
	ld.b [d0,164],r14
.line 26
	ld i0,d0
	call &__ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_73
.line 27
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11Environment18addPointerListenerEPNS_15PointerListenerE_73
.line 28
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11Environment16addCloseListenerEPNS_13CloseListenerE_73
.line 29
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11Environment22addCustomEventListenerEPNS_19CustomEventListenerE_73
LBE2_77:
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet5closeEv
//****************************************

.func __ZN6MAUtil6Moblet5closeEv_77, 0, void
.line 150
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_77:
.line 151
	ld i0,#0x0
	syscall 2

//****************************************
// Function: __ZThn156_N6MAUtil6Moblet10closeEventEv
//****************************************

.func __ZThn156_N6MAUtil6Moblet10closeEventEv_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff64
	call &__ZN6MAUtil6Moblet10closeEventEv_77

//****************************************
// Function: __ZN6MAUtil6Moblet10closeEventEv
//****************************************

.func __ZN6MAUtil6Moblet10closeEventEv_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 146
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB13_77:
.line 147
	call &__ZN6MAUtil6Moblet5closeEv_77

//****************************************
// Function: __ZN6MAUtil6Moblet15timeToNextTimerEv
//****************************************

.func __ZN6MAUtil6Moblet15timeToNextTimerEv_77, 1, int
.line 37
	push rt,d2
	sub sp,#0x18
	ld fr,sp
	add fr,#0x2c
	ld d0,i0
LBB14_77:
.line 38
	syscall 86
	ld d2,r14
.line 39
	ld d1,#0xffffffff
LBB16_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld i1,fr
	add i1,#0xffffffd4
	add d0,#0x58
LBB20_77:
	ld [i1],d0
LBB21_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d0]
LBE22_77:
	ld [fr,-40],r0
Ltext8_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-36],r1
.line 72
	jc le,r0,r1,&L46_77
LBB23_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d0,8]
LBE24_77:
	ld r14,[r14,4]
	jc ne,r14,r1,&L46_77
	ld r1,r14
L39_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L46_77
LBB27_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE28_77:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L39_77
L46_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-28]
L69_77:
.line 69
	ld r14,#0x0
	ld r0,[fr,-24]
	jc ge,r0,r3,&L51_77
	ld r14,#0x1
L51_77:
	ld r1,#0x0
	jc eq,r14,r1,&L71_77
LBB31_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d0]
LBB36_77:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE36_77:
	ld r14,[r0]
LBE34_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[r14,16]
	sub r14,d2
Ltext15_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 42
	ld r0,#0x0
	jc lt,r14,r0,&L72_77
L54_77:
.line 44
	ld r1,#0xffffffff
	jc eq,d1,r1,&L68_77
.line 47
	jc gt,d1,r14,&L68_77
L49_77:
	ld r1,[d0,8]
	ld r2,[d0,4]
L58_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d0,8],r0
.line 64
	jc eq,r0,r2,&L69_77
LBB39_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d0]
LBB40_77:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE40_77:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L58_77
	jp &L69_77
L68_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 47
	ld d1,r14
	jp &L49_77
L72_77:
.line 43
	ld r14,r0
	jp &L54_77
L71_77:
.line 51
	ld r14,d1
	add sp,#0x18
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet16runPendingTimersEv
//****************************************

.func __ZN6MAUtil6Moblet16runPendingTimersEv_77, 1, void
.line 53
	push rt,d6
	sub sp,#0x28
	ld fr,sp
	add fr,#0x4c
	ld d0,i0
LBB43_77:
.line 54
	syscall 86
	ld d5,r14
LBB45_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 124
	ld d4,d0
	add d4,#0x54
LBB46_77:
.line 125
	ld r0,#0x1
	ld.b [d4],r0
LBE47_77:
.line 71
	ld i1,fr
	add i1,#0xffffffc4
	ld d3,d0
	add d3,#0x58
LBB52_77:
	ld [i1],d3
LBB53_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r0,[d3]
LBE54_77:
	ld [fr,-56],r0
Ltext21_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 71
	ld r1,#0x0
	ld [fr,-52],r1
.line 72
	jc le,r0,r1,&L110_77
LBB55_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d3,8]
LBE56_77:
	ld r14,[r14,4]
	jc ne,r14,r1,&L110_77
	ld r1,r14
L103_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 63
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 64
	jc eq,r14,r0,&L110_77
LBB59_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	sll r14,#0x3
	ld r2,[d3,8]
	add r14,r2
LBE60_77:
	ld r14,[r14,4]
	ld r3,#0x0
	jc eq,r14,r3,&L103_77
L110_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 86
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-44]
L225_77:
.line 69
	ld r14,#0x0
	ld i0,[fr,-40]
	jc ge,i0,r3,&L115_77
	ld r14,#0x1
L115_77:
	ld r1,#0x0
	jc eq,r14,r1,&L226_77
LBB63_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB66_77:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE66_77:
	ld i0,[i0]
LBE64_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[i0,16]
	jc le,r14,d5,&L227_77
L113_77:
	ld r1,[d1,8]
	ld r2,[d1,4]
L164_77:
.line 63
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 64
	jc eq,r0,r2,&L225_77
LBB69_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB70_77:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE70_77:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L164_77
	jp &L225_77
L227_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld i0,[i0]
	ld r14,[i0]
	ld d0,[r14]
	call d0
LBB71_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r0,[d1]
	ld r2,[fr,-40]
LBB74_77:
	ld r14,r2
	sll r14,#0x3
	ld r1,[r0,8]
	add r14,r1
LBE74_77:
	ld r14,[r14]
LBE72_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[r14,12]
	ld r3,#0x0
	jc le,r0,r3,&L121_77
	add r0,#0xffffffff
	ld [r14,12],r0
LBB75_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r2,[fr,-40]
LBB78_77:
	ld r14,r2
	sll r14,#0x3
	add r1,r14
LBE78_77:
	ld r1,[r1]
LBE76_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r14,[r1,12]
	jc ne,r14,r3,&L121_77
LBB79_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,[d3,8]
LBE84_77:
.line 341
	ld r14,[d3]
	sll r14,#0x3
	add r14,d0
LBE86_77:
	jc eq,r14,d0,&L121_77
L229_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 103
	ld i0,[d0]
	jc eq,i0,r1,&L228_77
.line 102
	add d0,#0x8
LBB87_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r0,d4
	add r0,#0x4
LBB88_77:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE88_77:
	jc ne,r14,d0,&L229_77
L121_77:
.line 362
	ld r14,[d1]
LBB92_77:
	sll r2,#0x3
	ld r14,[r14,8]
	add r2,r14
LBE92_77:
	ld r14,[r2]
LBE90_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[r14,16]
	ld r1,[r14,8]
	add r0,r1
	ld [r14,16],r0
	ld r3,[fr,-44]
	jp &L113_77
L226_77:
.line 125
	ld r2,#0x0
	ld.b [d4],r2
LBB96_77:
.line 126
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r3,r1
	jc eq,r14,r1,&L73_77
LBB97_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d2,[d3]
LBE99_77:
.line 334
	ld d0,[d3,8]
LBE102_77:
.line 341
	ld i0,d2
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE104_77:
	jc eq,r14,d0,&L210_77
L231_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 130
	ld r14,[d0,4]
	ld r0,#0x0
	jc le,r14,r0,&L230_77
L176_77:
.line 129
	add d0,#0x8
LBB105_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 341
	ld r14,[d1]
	sll r14,#0x3
	ld r2,[d1,8]
	add r14,r2
LBE106_77:
	jc ne,r14,d0,&L231_77
L210_77:
.line 295
	ld r14,[d1,4]
	jc lt,r14,d2,&L232_77
	ld r14,[d1]
L183_77:
.line 281
	ld r0,d2
	jc le,r14,d2,&L214_77
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffb4
L193_77:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-76],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L193_77
L214_77:
.line 285
	ld [d1],d2
LBE109_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 137
	ld r14,#0x0
	ld.b [d4,1],r14
L73_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 71
	add sp,#0x28
	pop rt,d6
	ret
L230_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 131
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r0,&L233_77
L179_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	add d2,#0xffffffff
LBB123_77:
	ld i0,d2
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE123_77:
	ld r1,[r14]
	ld [d0],r1
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L176_77
L228_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 104
	ld.b r0,[d4]
	and r0,#0xff
	ld r14,#0x0
	jc eq,r0,r14,&L137_77
.line 105
	ld [d0,4],r14
.line 106
	ld r0,#0x1
	ld.b [d4,1],r0
	ld r2,[fr,-40]
L235_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d1]
LBB132_77:
	sll r2,#0x3
	ld r14,[r14,8]
	add r2,r14
LBE132_77:
	ld r14,[r2]
LBE130_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	ld r0,[r14,16]
	ld r1,[r14,8]
	add r0,r1
	ld [r14,16],r0
	ld r3,[fr,-44]
	jp &L113_77
L233_77:
.line 132
	ld i0,[d0]
	call &__ZdlPv_23
	jp &L179_77
L137_77:
.line 108
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r0,&L139_77
.line 109
	call &__ZdlPv_23
L139_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 197
	ld d2,d4
	add d2,#0x4
	ld r14,d0
LBB145_77:
.line 341
	ld r1,[d2]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d2,8]
	add r0,i0
LBE148_77:
.line 206
	add r0,#0xfffffff8
	jc eq,r0,d0,&L204_77
L143_77:
.line 205
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 206
	add r14,#0x8
	jc ne,r0,r14,&L143_77
	ld r1,[d2]
L204_77:
.line 272
	ld d0,r1
	add d0,#0xffffffff
LBB150_77:
.line 295
	ld r14,[d2,4]
	jc lt,r14,d0,&L234_77
L145_77:
.line 281
	ld r0,d0
	jc le,r1,d0,&L208_77
	ld r1,fr
	add r1,#0xffffffbc
L155_77:
.line 282
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 281
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L155_77
L208_77:
.line 285
	ld [d2],d0
	ld r2,[fr,-40]
	jp &L235_77
L234_77:
.line 298
	ld i0,d0
	sll i0,#0x3
	call &__Znam_20
	ld d6,r14
LBB159_77:
.line 300
	ld r2,#0x0
	ld r1,[d2]
	jc le,r1,r2,&L215_77
	ld i0,[d2,8]
L149_77:
.line 301
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d6
	add r14,i0
	ld r3,[r14]
	ld [r0],r3
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r2,#0x1
	ld r1,[d2]
	jc gt,r1,r2,&L149_77
L206_77:
.line 304
	ld [d2,4],d0
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L236_77
.line 307
	ld i0,d6
	ld [d2,8],d6
	jp &L145_77
L232_77:
.line 298
	call &__Znam_20
	ld d0,r14
LBB171_77:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L218_77
	ld i0,[d1,8]
L187_77:
.line 301
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r3,[r14]
	ld [r0],r3
	ld r14,[r14,4]
	ld [r0,4],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L187_77
L212_77:
.line 304
	ld [d1,4],d2
.line 305
	ld r0,#0x0
	jc ne,i0,r0,&L237_77
.line 307
	ld [d1,8],d0
	jp &L183_77
L237_77:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L183_77
L236_77:
.line 305
	call &__ZdaPv_22
	ld r1,[d2]
.line 307
	ld i0,d6
	ld [d2,8],d6
	jp &L145_77
L215_77:
	ld i0,[d2,8]
	jp &L206_77
L218_77:
	ld i0,[d1,8]
	jp &L212_77

//****************************************
// Function: __ZN6MAUtil6Moblet3runEPS0_
//****************************************

.func __ZN6MAUtil6Moblet3runEPS0__77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 73
	push rt,d2
	sub sp,#0x10
	ld fr,sp
	add fr,#0x24
	ld d1,i0
LBB186_77:
.line 140
	ld.b r14,[i0,164]
	and r14,#0xff
	ld d2,fr
	add d2,#0xffffffdc
	ld r0,#0x0
	jc eq,r14,r0,&L274_77
L273_77:
.line 122
	ld i0,d2
	syscall 82
	ld r0,#0x0
	jc eq,r14,r0,&L275_77
L261_77:
.line 77
	ld r14,[fr,-36]
	case r14,#0x1,#0x16,#L260_77,#L259_77
.data
	.align 4
L260_77:
	.word L244_77
	.word L247_77
	.word L248_77
	.word L256_77
	.word L257_77
	.word L259_77
	.word L259_77
	.word L250_77
	.word L254_77
	.word L252_77
	.word L259_77
	.word L259_77
	.word L246_77
	.word L245_77
	.word L259_77
	.word L259_77
	.word L259_77
	.word L259_77
	.word L259_77
	.word L259_77
	.word L259_77
	.word L249_77
	.word L258_77


.code
L258_77:
.line 119
	ld i0,d1
	ld i1,[fr,-32]
	ld i2,[fr,-28]
	call &__ZN6MAUtil11Environment20fireTextBoxListenersEii_73
.line 122
	ld i0,d2
	syscall 82
	ld r0,#0x0
	jc ne,r14,r0,&L261_77
L275_77:
.line 126
	ld i0,d1
	call &__ZN6MAUtil6Moblet16runPendingTimersEv_77
.line 132
	ld i0,d1
	call &__ZN6MAUtil11Environment16runIdleListenersEv_73
LBB190_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d0,[d1,72]
LBE194_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 141
	ld r14,#0x0
	jc eq,d0,r14,&L276_77
L239_77:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 140
	ld.b r14,[d1,164]
	and r14,#0xff
L280_77:
	ld r0,#0x0
	jc ne,r14,r0,&L273_77
L274_77:
	add sp,#0x10
	pop rt,d2
	ret
L249_77:
.line 95
	ld i0,d1
	ld i1,[fr,-32]
	call &__ZN6MAUtil11Environment13fireCharEventEj_73
	jp &L273_77
L259_77:
.line 122
	ld i0,d1
	ld i1,d2
	call &__ZN6MAUtil11Environment24fireCustomEventListenersERK7MAEvent_73
	jp &L273_77
L245_77:
.line 83
	ld i0,d1
	call &__ZN6MAUtil11Environment20fireFocusGainedEventEv_73
	jp &L273_77
L246_77:
.line 86
	ld i0,d1
	call &__ZN6MAUtil11Environment18fireFocusLostEventEv_73
	jp &L273_77
L252_77:
.line 103
	ld i3,[fr,-24]
	ld r0,#0x0
	jc eq,i3,r0,&L277_77
L253_77:
.line 105
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment23fireMultitouchMoveEventE9MAPoint2di_73
	jp &L273_77
L254_77:
.line 108
	ld i3,[fr,-24]
	ld r14,#0x0
	jc eq,i3,r14,&L278_77
L255_77:
.line 110
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment26fireMultitouchReleaseEventE9MAPoint2di_73
	jp &L273_77
L250_77:
.line 98
	ld i3,[fr,-24]
	ld r14,#0x0
	jc eq,i3,r14,&L279_77
L251_77:
.line 100
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment24fireMultitouchPressEventE9MAPoint2di_73
	jp &L273_77
L257_77:
.line 116
	ld i0,d1
	ld i1,[fr,-32]
	call &__ZN6MAUtil11Environment18fireBluetoothEventEi_73
	jp &L273_77
L256_77:
.line 113
	ld i0,d1
	ld i1,fr
	add i1,#0xffffffe0
	call &__ZN6MAUtil11Environment13fireConnEventERK15MAConnEventData_73
	jp &L273_77
L248_77:
.line 92
	ld i0,d1
	ld i1,[fr,-32]
	ld i2,[fr,-28]
	call &__ZN6MAUtil11Environment19fireKeyReleaseEventEii_73
	jp &L273_77
L247_77:
.line 89
	ld i0,d1
	ld i1,[fr,-32]
	ld i2,[fr,-28]
	call &__ZN6MAUtil11Environment17fireKeyPressEventEii_73
	jp &L273_77
L244_77:
.line 79
	ld i0,d1
	call &__ZN6MAUtil11Environment14fireCloseEventEv_73
.line 80
	call &__ZN6MAUtil6Moblet5closeEv_77
L276_77:
.line 136
	ld i0,d1
	call &__ZN6MAUtil6Moblet15timeToNextTimerEv_77
	ld i0,r14
.line 139
	jc eq,r14,d0,&L239_77
.line 140
	syscall 83
LBE200_77:
	ld.b r14,[d1,164]
	and r14,#0xff
	jp &L280_77
L277_77:
.line 104
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment20firePointerMoveEventE9MAPoint2d_73
	ld i3,[fr,-24]
	jp &L253_77
L279_77:
.line 99
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment21firePointerPressEventE9MAPoint2d_73
	ld i3,[fr,-24]
	jp &L251_77
L278_77:
.line 109
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment23firePointerReleaseEventE9MAPoint2d_73
	ld i3,[fr,-24]
	jp &L255_77

//****************************************
// Function: __ZThn152_N6MAUtil6MobletD1Ev
//****************************************

.func __ZThn152_N6MAUtil6MobletD1Ev_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6MobletD1Ev_77
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6MobletD1Ev
//****************************************

.func __ZThn148_N6MAUtil6MobletD1Ev_77, 1, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6MobletD1Ev_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6MobletD1Ev
//****************************************

.func __ZN6MAUtil6MobletD1Ev_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 153
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB203_77:
.line 153
	ld r14,&__ZTVN6MAUtil6MobletE_77+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+72
	ld [i0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+108
	ld [i0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+148
	ld [i0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+160
	ld [i0,160],r14
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_73
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_73
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_73
LBE203_77:
	pop rt,d0
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6MobletD0Ev
//****************************************

.func __ZThn152_N6MAUtil6MobletD0Ev_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6MobletD0Ev_77
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6MobletD0Ev
//****************************************

.func __ZThn148_N6MAUtil6MobletD0Ev_77, 1, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6MobletD0Ev_77
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6MobletD0Ev
//****************************************

.func __ZN6MAUtil6MobletD0Ev_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 153
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB204_77:
.line 153
	ld r14,&__ZTVN6MAUtil6MobletE_77+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+72
	ld [i0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+108
	ld [i0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+148
	ld [i0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_77+160
	ld [i0,160],r14
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_73
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_73
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_73
LBE204_77:
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil15PlaceholderPool3putEi
//****************************************

.func __ZN6MAUtil15PlaceholderPool3putEi_78, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 35
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld [fr,-24],i0
LBB2_78:
.line 36
	syscall 59
LBB3_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 168
	ld d0,[zr,_sPool_78+4]
	ld r14,d0
	add r14,#0xffffffff
	ld r0,[zr,_sPool_78]
	jc lt,r0,r14,&L2_78
.line 169
	ld r1,#0x0
	jc eq,d0,r1,&L3_78
LBB5_78:
.line 293
	ld d2,&_sPool_78
	ld d1,d0
	add d1,d0
LBB6_78:
.line 295
	jc lt,d0,d1,&L29_78
L2_78:
.line 174
	ld r14,r0
	sll r14,#0x2
	ld r1,[zr,_sPool_78+8]
	add r14,r1
	ld r1,[fr,-24]
	ld [r14],r1
	add r0,#0x1
	ld [zr,_sPool_78],r0
LBE4_78:
	add sp,#0x4
	pop rt,d2
	ret
L3_78:
.line 293
	ld d2,&_sPool_78
LBB12_78:
.line 298
	ld i0,#0x10
	call &__Znam_20
	ld d1,r14
LBB14_78:
.line 300
	ld r1,d0
	ld r0,[zr,_sPool_78]
	jc le,r0,d0,&L27_78
	ld i0,[zr,_sPool_78+8]
L18_78:
.line 301
	ld r14,r1
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r1,#0x1
	ld r0,[zr,_sPool_78]
	jc gt,r0,r1,&L18_78
L25_78:
.line 304
	ld r1,#0x4
	ld [d2,4],r1
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L30_78
.line 307
	ld [d2,8],d1
L32_78:
.line 174
	ld r14,r0
	sll r14,#0x2
	ld r1,[zr,_sPool_78+8]
	add r14,r1
	ld r1,[fr,-24]
	ld [r14],r1
	add r0,#0x1
	ld [zr,_sPool_78],r0
LBE10_78:
	add sp,#0x4
	pop rt,d2
	ret
L29_78:
.line 298
	ld i0,d1
	sll i0,#0x2
	call &__Znam_20
	ld d0,r14
LBB21_78:
.line 300
	ld r1,#0x0
	ld r0,[zr,_sPool_78]
	jc le,r0,r1,&L26_78
	ld i0,[zr,_sPool_78+8]
L9_78:
.line 301
	ld r14,r1
	sll r14,#0x2
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r1,#0x1
	ld r0,[zr,_sPool_78]
	jc gt,r0,r1,&L9_78
L23_78:
.line 304
	ld [d2,4],d1
.line 305
	ld r14,#0x0
	jc ne,i0,r14,&L31_78
.line 307
	ld [d2,8],d0
L33_78:
.line 174
	ld r14,r0
	sll r14,#0x2
	ld r1,[zr,_sPool_78+8]
	add r14,r1
	ld r1,[fr,-24]
	ld [r14],r1
	add r0,#0x1
	ld [zr,_sPool_78],r0
LBE17_78:
	add sp,#0x4
	pop rt,d2
	ret
L27_78:
	ld i0,[zr,_sPool_78+8]
	jp &L25_78
L30_78:
.line 305
	call &__ZdaPv_22
	ld r0,[zr,_sPool_78]
.line 307
	ld [d2,8],d1
	jp &L32_78
L31_78:
.line 305
	call &__ZdaPv_22
	ld r0,[zr,_sPool_78]
.line 307
	ld [d2,8],d0
	jp &L33_78
L26_78:
	ld i0,[zr,_sPool_78+8]
	jp &L23_78

//****************************************
// Function: __ZN6MAUtil15PlaceholderPool5allocEv
//****************************************

.func __ZN6MAUtil15PlaceholderPool5allocEv_78, 0, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 26
	push rt,d3
	ld fr,sp
	add fr,#0x18
LBB31_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r2,[zr,_sPool_78]
LBE34_78:
	ld r1,#0x0
	jc eq,r2,r1,&L65_78
	ld r14,r2
	add r14,#0xffffffff
LBB35_78:
.line 362
	sll r14,#0x2
	ld i0,[zr,_sPool_78+8]
	add r14,i0
LBE36_78:
	ld d2,[r14]
LBB37_78:
.line 197
	ld r0,r14
LBB40_78:
.line 341
	ld r1,r2
	sll r1,#0x2
	add r1,i0
LBE43_78:
.line 206
	add r1,#0xfffffffc
	jc eq,r1,r14,&L59_78
L42_78:
.line 205
	ld r14,[r0,4]
	ld [r0],r14
.line 206
	add r0,#0x4
	jc ne,r1,r0,&L42_78
	ld r2,[zr,_sPool_78]
L59_78:
.line 272
	ld d0,r2
	add d0,#0xffffffff
LBB45_78:
.line 293
	ld d3,&_sPool_78
LBB48_78:
.line 295
	ld r14,[zr,_sPool_78+4]
	jc lt,r14,d0,&L66_78
L44_78:
.line 281
	ld r0,d0
	jc le,r2,d0,&L63_78
	ld i0,[zr,_sPool_78+8]
L54_78:
.line 282
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r1,#0x0
	ld [r14],r1
.line 281
	add r0,#0x1
	ld r14,[zr,_sPool_78]
	jc gt,r14,r0,&L54_78
L63_78:
.line 285
	ld [zr,_sPool_78],d0
LBE46_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 32
	ld r14,d2
LBE32_78:
.line 33
	pop rt,d3
	ret
L66_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d0
	sll i0,#0x2
	call &__Znam_20
	ld d1,r14
LBB64_78:
.line 300
	ld r1,#0x0
	ld r2,[zr,_sPool_78]
	jc le,r2,r1,&L64_78
	ld i0,[zr,_sPool_78+8]
L48_78:
.line 301
	ld r14,r1
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 300
	add r1,#0x1
	ld r2,[zr,_sPool_78]
	jc gt,r2,r1,&L48_78
L61_78:
.line 304
	ld [d3,4],d0
.line 305
	ld r1,#0x0
	jc ne,i0,r1,&L67_78
.line 307
	ld [d3,8],d1
	jp &L44_78
L65_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 28
	syscall 58
LBE52_78:
.line 33
	pop rt,d3
	ret
L67_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r2,[zr,_sPool_78]
.line 307
	ld [d3,8],d1
	jp &L44_78
L64_78:
	ld i0,[zr,_sPool_78+8]
	jp &L61_78

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_78, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 38
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB78_78:
.line 24
	ld r14,#0xffff
	jc eq,i1,r14,&L78_78
L68_78:
.line 38
	pop rt,d0
	ret
L78_78:
.line 24
	ld r14,#0x1
	jc eq,i0,r14,&L79_78
LBE79_78:
	ld r14,#0x0
	jc ne,i0,r14,&L68_78
LBB80_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld r14,[zr,_sPool_78+8]
	jc eq,r14,i0,&L68_78
	ld i0,r14
	call &__ZdaPv_22
LBE81_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 38
	pop rt,d0
	ret
L79_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 109
	ld d0,&_sPool_78
	ld i0,#0x10
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r14,#0x0
	ld [zr,_sPool_78],r14
LBE83_78:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 38
	pop rt,d0
	ret

//****************************************
// Function: __GLOBAL__I__ZN6MAUtil15PlaceholderPool5allocEv
//****************************************

.func __GLOBAL__I__ZN6MAUtil15PlaceholderPool5allocEv_78, 0, void
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 39
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_78
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN6MAUtil15PlaceholderPool5allocEv
//****************************************

.func __GLOBAL__D__ZN6MAUtil15PlaceholderPool5allocEv_78, 0, void
.line 40
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 40
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_78
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD1Ev
//****************************************

.func __ZN6MAUtil10RefCountedD1Ev_79, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB2_79:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_79+8
	ld [i0],r14
LBE2_79:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD0Ev
//****************************************

.func __ZN6MAUtil10RefCountedD0Ev_79, 1, void
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB3_79:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_79+8
	ld [i0],r14
LBE3_79:
	call &__ZdlPv_23
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedC2Ei
//****************************************

.func __ZN6MAUtil10RefCountedC2Ei_79, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.cpp'
.line 22
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB4_79:
.line 22
	ld r14,&__ZTVN6MAUtil10RefCountedE_79+8
	ld [i0],r14
	ld [i0,4],i1
LBE4_79:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCounted6addRefEv
//****************************************

.func __ZN6MAUtil10RefCounted6addRefEv_79, 1, void
.line 24
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_79:
.line 25
	ld r14,[i0,4]
	add r14,#0x1
	ld [i0,4],r14
LBE6_79:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCounted7releaseEv
//****************************************

.func __ZN6MAUtil10RefCounted7releaseEv_79, 1, void
.line 28
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB7_79:
.line 29
	ld r0,[i0,4]
	add r0,#0xffffffff
	ld [i0,4],r0
.line 30
	ld r1,#0x0
	jc ne,r0,r1,&L12_79
.line 31
	jc eq,i0,r0,&L12_79
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L12_79:
.line 33
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10RefCounted11getRefCountEv
//****************************************

.func __ZN6MAUtil10RefCounted11getRefCountEv_79, 1, int
.line 35
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 37
	ld r14,[i0,4]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD1Ev
//****************************************

.func __ZN6MAUtil10RefCountedD1Ev_81, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB2_81:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_81+8
	ld [i0],r14
LBE2_81:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD0Ev
//****************************************

.func __ZN6MAUtil10RefCountedD0Ev_81, 1, void
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB3_81:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_81+8
	ld [i0],r14
LBE3_81:
	call &__ZdlPv_23
	pop rt,fr
	ret

//****************************************
// Function: __Z7tstrlenIcEiPKT_
//****************************************

.func __Z7tstrlenIcEiPKT__81, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 429
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_81:
.line 429
	call &_strlen_34
LBE4_81:
	pop rt,fr
	ret

//****************************************
// Function: __Z7tstrcmpIcEiPKT_S2_
//****************************************

.func __Z7tstrcmpIcEiPKT_S2__81, 2, int
.line 430
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_81:
.line 430
	syscall 6
LBE5_81:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEC1ERKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcEC1ERKS1__81, 2, void
.line 111
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB7_81:
.line 112
	ld i1,[i1]
	ld [i0],i1
.line 113
	ld i0,i1
	call &__ZN6MAUtil10RefCounted6addRefEv_79
LBE7_81:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE5c_strEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE5c_strEv_81, 1, int
.line 116
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB8_81:
.line 117
	ld r14,[i0]
LBE8_81:
	ld r14,[r14,16]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEaSERKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcEaSERKS1__81, 2, int
.line 120
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
LBB9_81:
.line 121
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 122
	ld d1,[d1]
	ld [d0],d1
.line 123
	ld i0,d1
	call &__ZN6MAUtil10RefCounted6addRefEv_79
LBE9_81:
.line 124
	ld r14,d0
	pop rt,d1
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEixEi
//****************************************

.func __ZNK6MAUtil11BasicStringIcEixEi_81, 2, int
.line 359
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB10_81:
.line 360
	ld r14,[i0]
LBE10_81:
	ld r14,[r14,16]
	add r14,i1
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEltERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEltERKS1__81, 2, int
.line 142
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i1
LBB11_81:
.line 143
	ld d2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d0,r14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d0
	ld i1,r14
	call &__Z7tstrcmpIcEiPKT_S2__81
	jc lt,r14,d2,&L19_81
LBE11_81:
	ld r14,d2
	pop rt,d2
	ret
L19_81:
	ld d2,#0x1
LBE12_81:
	ld r14,d2
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcED1Ev
//****************************************

.func __ZN6MAUtil11BasicStringIcED1Ev_81, 1, void
.line 375
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB17_81:
.line 376
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
LBE17_81:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE6lengthEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE6lengthEv_81, 1, int
.line 367
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB18_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r14,[i0]
	add r14,#0x8
LBE19_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 368
	ld r14,[r14]
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEeqERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEeqERKS1__81, 2, int
.line 127
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
LBB20_81:
.line 128
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d0,r14
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
.line 129
	ld r0,#0x0
.line 128
	jc eq,d0,r14,&L36_81
L32_81:
.line 134
	ld r14,r0
	pop rt,d2
	ret
L36_81:
.line 131
	ld i0,[d1]
	ld i1,[d2]
.line 132
	ld r0,#0x1
.line 131
	jc eq,i0,i1,&L32_81
.line 134
	ld d0,#0x0
	ld i0,[i0,16]
	ld i1,[i1,16]
	call &__Z7tstrcmpIcEiPKT_S2__81
	jc ne,r14,d0,&L35_81
	ld d0,#0x1
L35_81:
	ld r0,d0
LBE21_81:
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEneERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEneERKS1__81, 2, int
.line 137
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB22_81:
.line 138
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__81
	xor r14,#0x1
LBE22_81:
	and r14,#0xff
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE4findERKS1_j
//****************************************

.func __ZNK6MAUtil11BasicStringIcE4findERKS1_j_81, 3, int
.line 239
	push rt,d6
	ld fr,sp
	add fr,#0x24
	ld d0,i0
	ld d2,i1
	ld d1,i2
LBB23_81:
.line 240
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d3,r14
	add r14,d1
LBB26_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d6,[d0]
LBB27_81:
	ld d4,[d6,8]
LBE27_81:
	jc gtu,r14,d4,&L39_81
LBB28_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 241
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
.line 242
	ld r14,d1
.line 241
	ld r0,#0x0
	jc eq,d3,r0,&L38_81
.line 243
	ld d0,[d6,16]
	add d1,d0
.line 244
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d5,r14
Ltext7_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	add d0,d4
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	sub d0,d3
	add d0,#0x1
Ltext8_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 246
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r3,d3
	add r3,d5
L43_81:
.line 255
	jc eq,d1,d0,&L39_81
	ld.b r1,[d5]
L51_81:
.line 249
	ld.b r4,[d1]
	xb r0,r4
	xb r14,r1
	add d1,#0x1
	jc eq,r0,r14,&L56_81
LBE31_81:
.line 255
	jc ne,d1,d0,&L51_81
L39_81:
.line 259
	ld r14,#0xffffffff
L38_81:
	pop rt,d6
	ret
L56_81:
.line 251
	ld r2,d1
.line 252
	ld r1,d5
	add r1,#0x1
L55_81:
.line 254
	jc eq,r1,r3,&L54_81
	ld.b r14,[r2]
	xb r0,r14
	ld.b r4,[r1]
	xb r14,r4
	add r1,#0x1
	add r2,#0x1
	jc ne,r0,r14,&L43_81
	jp &L55_81
L54_81:
.line 255
	ld r14,d1
	ld d6,[d6,16]
	sub r14,d6
	add r14,#0xffffffff
LBE39_81:
.line 259
	pop rt,d6
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE4sizeEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE4sizeEv_81, 1, int
.line 363
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB58_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld r14,[i0]
	add r14,#0x8
LBE59_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 364
	ld r14,[r14]
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE8capacityEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE8capacityEv_81, 1, int
.line 371
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB60_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld r14,[i0]
	add r14,#0x8
LBE61_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 372
	ld r14,[r14,4]
	add r14,#0xffffffff
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE7pointerEv
//****************************************

.func __ZN6MAUtil11BasicStringIcE7pointerEv_81, 1, int
.line 418
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB62_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 389
	ld r14,[i0]
	add r14,#0x8
LBE63_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 419
	ld r14,[r14,8]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcED0Ev
//****************************************

.func __ZN6MAUtil10StringDataIcED0Ev_81, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB488_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_81+8
	ld [i0],r14
LBE490_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L649_81
LBE492_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret
L649_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE495_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcED1Ev
//****************************************

.func __ZN6MAUtil10StringDataIcED1Ev_81, 1, void
.line 94
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB496_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_81+8
	ld [i0],r14
LBE498_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	ld i0,[i0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L663_81
LBE500_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	pop rt,fr
	ret
L663_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE503_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcEC1ERKS1_
//****************************************

.func __ZN6MAUtil10StringDataIcEC1ERKS1__81, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 59
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d3,i1
LBB512_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x8
	ld d1,[i1,8]
	add d1,#0x1
LBB514_81:
.line 109
	ld i0,d1
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld [d0,4],d1
.line 113
	ld r14,#0x0
	ld [d0],r14
LBE514_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 60
	ld i0,d2
	ld i1,#0x1
	call &__ZN6MAUtil10RefCountedC2Ei_79
	ld r14,&__ZTVN6MAUtil10StringDataIcEE_81+8
	ld [d2],r14
.line 61
	ld r14,[d3,8]
	ld [d0],r14
.line 62
	ld i0,[d2,16]
	ld i1,[d3,16]
	ld i2,r14
	add i2,#0x1
	syscall 5
LBE512_81:
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEixEi
//****************************************

.func __ZN6MAUtil11BasicStringIcEixEi_81, 2, int
.line 162
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i1
LBB515_81:
.line 165
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_79
	ld r0,#0x1
	jc gt,r14,r0,&L685_81
	ld i0,[d0]
LBE517_81:
.line 172
	ld r14,[i0,16]
	add r14,d2
	pop rt,d2
	ret
L685_81:
.line 166
	ld i0,#0x14
	call &__Znwm_21
	ld d1,r14
	ld i0,r14
	ld i1,[d0]
	call &__ZN6MAUtil10StringDataIcEC1ERKS1__81
.line 167
	ld r14,#0x0
	jc eq,d1,r14,&L686_81
.line 168
	ld i0,[d0]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 169
	ld i0,d1
	ld [d0],d1
LBE521_81:
.line 172
	ld r14,[i0,16]
	add r14,d2
	pop rt,d2
	ret
L686_81:
.line 167
	ld i0,&LC0_81
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xa7
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10StringDataIcEC1Ei
//****************************************

.func __ZN6MAUtil10StringDataIcEC1Ei_81, 2, void
.line 50
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d2,i1
LBB529_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d1,i0
	add d1,#0x8
	ld d0,i1
	add d0,#0x1
LBB531_81:
.line 109
	ld i0,d0
	call &__Znam_20
	ld [d1,8],r14
.line 111
	ld [d1,4],d0
.line 113
	ld r0,#0x0
	ld [d1],r0
LBE531_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 51
	ld i0,d3
	ld i1,#0x1
	call &__ZN6MAUtil10RefCountedC2Ei_79
	ld r1,&__ZTVN6MAUtil10StringDataIcEE_81+8
	ld [d3],r1
LBB532_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 295
	ld r14,[d1,4]
	jc lt,r14,d2,&L710_81
	ld r14,[d1]
L692_81:
.line 281
	ld r0,d2
	jc le,r14,d2,&L707_81
L702_81:
.line 282
	ld r14,[d1,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L702_81
L707_81:
.line 285
	ld [d1],d2
LBE534_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 53
	ld d3,[d3,16]
	add d2,d3
	ld r14,#0x0
	ld.b [d2],r14
LBE529_81:
	pop rt,d3
	ret
L710_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	call &__Znam_20
	ld d0,r14
LBB546_81:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L705_81
L711_81:
.line 301
	ld r0,r1
	add r0,d0
	ld r14,[d1,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L711_81
L705_81:
.line 304
	ld [d1,4],d2
.line 305
	ld i0,[d1,8]
	ld r0,#0x0
	jc ne,i0,r0,&L712_81
.line 307
	ld [d1,8],d0
	jp &L692_81
L712_81:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L692_81

//****************************************
// Function: __ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv
//****************************************

.func __ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_81, 0, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 69
	push rt,d2
	ld fr,sp
	add fr,#0x14
LBB547_81:
.line 71
	ld d1,[zr,_ZZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEvE2ed_81]
	ld d2,d1
	ld r14,#0x0
	jc ne,d1,r14,&L714_81
.line 72
	ld i0,#0x14
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10StringDataIcEC1Ei_81
	ld d1,d0
	ld [zr,_ZZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEvE2ed_81],d0
.line 73
	jc eq,d0,d2,&L717_81
L714_81:
.line 75
	ld i0,d1
	call &__ZN6MAUtil10RefCounted6addRefEv_79
LBE548_81:
.line 76
	ld r14,[zr,_ZZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEvE2ed_81]
	pop rt,d2
	ret
L717_81:
.line 73
	ld i0,&LC0_81
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x49
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE5clearEv
//****************************************

.func __ZN6MAUtil11BasicStringIcE5clearEv_81, 1, void
.line 400
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB551_81:
.line 401
	ld i0,[i0]
	ld r14,#0x0
	jc ne,i0,r14,&L720_81
.line 404
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_81
	ld [d0],r14
LBE551_81:
	pop rt,d0
	ret
L720_81:
.line 402
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 404
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_81
	ld [d0],r14
LBE552_81:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEC1Ev
//****************************************

.func __ZN6MAUtil11BasicStringIcEC1Ev_81, 1, void
.line 79
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB553_81:
.line 80
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_81
	ld [d0],r14
LBE553_81:
	pop rt,d0
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE6substrEii
//****************************************

.func __ZNK6MAUtil11BasicStringIcE6substrEii_81, 4, int
.line 336
	push rt,d5
	ld fr,sp
	add fr,#0x20
	ld d5,i0
	ld d4,i1
	ld d2,i2
	ld d3,i3
LBB555_81:
.line 337
	ld r0,#0x0
	jc lt,i2,r0,&L726_81
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d1,r14
	jc ge,r14,d2,&L724_81
L726_81:
	ld i0,&LC1_81
.line 340
	ld i1,&_ZZNK6MAUtil11BasicStringIcE6substrEiiE12__FUNCTION___81
	call &_panicFunction_28
L724_81:
.line 338
	ld r14,#0xffffffff
	jc eq,d3,r14,&L735_81
L727_81:
.line 340
	ld r0,#0x0
	jc lt,d3,r0,&L730_81
	ld d0,d2
	add d0,d3
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc le,d0,d1,&L728_81
L730_81:
	ld i0,&LC2_81
	ld i1,&_ZZNK6MAUtil11BasicStringIcE6substrEiiE12__FUNCTION___81
	call &_panicFunction_28
L735_81:
.line 339
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d3,d1
	sub d3,d2
	jp &L727_81
L728_81:
.line 342
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
.line 348
	ld r14,#0x0
	jc le,d3,r14,&L723_81
.line 349
	ld i0,[d5]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 350
	ld i0,#0x14
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d3
	call &__ZN6MAUtil10StringDataIcEC1Ei_81
	ld [d5],d0
LBB557_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 389
	ld r14,[d4]
	add r14,#0x8
LBE557_81:
	ld i0,[d0,16]
	ld i1,[r14,8]
	add i1,d2
	ld i2,d3
	syscall 5
Ltext145_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 352
	ld i0,d5
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEixEi_81
	ld r0,#0x0
	ld.b [r14],r0
L723_81:
.line 355
	ld r14,d5
	pop rt,d5
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcEC1EPKci
//****************************************

.func __ZN6MAUtil10StringDataIcEC1EPKci_81, 3, void
.line 32
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
	ld d2,i2
LBB576_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d1,i0
	add d1,#0x8
	ld d0,i2
	add d0,#0x1
LBB578_81:
.line 109
	ld i0,d0
	call &__Znam_20
	ld [d1,8],r14
.line 111
	ld [d1,4],d0
.line 113
	ld r0,#0x0
	ld [d1],r0
LBE578_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 33
	ld i0,d3
	ld i1,#0x1
	call &__ZN6MAUtil10RefCountedC2Ei_79
	ld r1,&__ZTVN6MAUtil10StringDataIcEE_81+8
	ld [d3],r1
LBB579_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 295
	ld r14,[d1,4]
	jc lt,r14,d2,&L781_81
	ld r14,[d1]
L763_81:
.line 281
	ld r0,d2
	jc le,r14,d2,&L778_81
L773_81:
.line 282
	ld r14,[d1,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 281
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L773_81
L778_81:
.line 285
	ld [d1],d2
LBE581_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 35
	ld r14,[d3,16]
	add r14,d2
	ld r0,#0x0
	ld.b [r14],r0
.line 36
	ld i0,[d3,16]
	ld i1,d4
	ld i2,d2
	syscall 5
LBE576_81:
	pop rt,d4
	ret
L781_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d2
	call &__Znam_20
	ld d0,r14
LBB593_81:
.line 300
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L776_81
L782_81:
.line 301
	ld r0,r1
	add r0,d0
	ld r14,[d1,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 300
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L782_81
L776_81:
.line 304
	ld [d1,4],d2
.line 305
	ld i0,[d1,8]
	ld r0,#0x0
	jc ne,i0,r0,&L783_81
.line 307
	ld [d1,8],d0
	jp &L763_81
L783_81:
.line 305
	call &__ZdaPv_22
	ld r14,[d1]
.line 307
	ld [d1,8],d0
	jp &L763_81

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE15allocStringDataEPKci
//****************************************

.func __ZN6MAUtil11BasicStringIcE15allocStringDataEPKci_81, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 88
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d1,i1
	ld d2,i2
LBB594_81:
.line 89
	ld r0,#0x0
	jc lt,i2,r0,&L791_81
.line 93
	ld r14,#0x0
	jc eq,i1,r14,&L787_81
	ld.b r0,[i1]
	xb r14,r0
	ld r0,#0x0
	jc eq,r14,r0,&L787_81
	jc ne,i2,r0,&L786_81
L787_81:
.line 94
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_81
	ld [d3],r14
L784_81:
.line 97
	pop rt,d3
	ret
L786_81:
.line 96
	ld i0,#0x14
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d1
	ld i2,d2
	call &__ZN6MAUtil10StringDataIcEC1EPKci_81
	ld [d3],d0
.line 97
	ld r14,#0x0
	jc ne,d0,r14,&L784_81
	ld i0,&LC0_81
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x61
	call &_bfeHandler_28
L791_81:
.line 90
	ld i0,r0
	ld i1,&LC3_81
	syscall 3

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEC1EPKc
//****************************************

.func __ZN6MAUtil11BasicStringIcEC1EPKc_81, 2, void
.line 106
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB600_81:
.line 107
	ld r14,#0x0
	jc eq,i1,r14,&L800_81
.line 108
	ld i0,i1
	call &__Z7tstrlenIcEiPKT__81
	ld i0,d1
	ld i1,d0
	ld i2,r14
	call &__ZN6MAUtil11BasicStringIcE15allocStringDataEPKci_81
LBE600_81:
	pop rt,d1
	ret
L800_81:
.line 107
	ld i0,i1
	ld i1,&LC5_81
	syscall 3

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6appendEPKci
//****************************************

.func __ZN6MAUtil11BasicStringIcE6appendEPKci_81, 3, void
.line 200
	push rt,d7
	ld fr,sp
	add fr,#0x28
	ld d1,i0
	ld d7,i1
	ld d6,i2
LBB638_81:
.line 202
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d4,r14
.line 204
	ld d2,r14
	add d2,d6
LBB640_81:
.line 205
	ld i0,[d1]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_79
	ld r0,#0x1
	jc gt,r14,r0,&L908_81
LBB641_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 293
	ld r0,[d1]
	ld d0,r0
	add d0,#0x8
	ld d3,d2
	add d3,#0x1
LBB642_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d3,&L909_81
L876_81:
.line 389
	ld i0,[r0,16]
	add i0,d4
	ld i1,d7
	ld i2,d6
	syscall 5
Ltext173_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 214
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_81
	add r14,d2
	ld r0,#0x0
	ld.b [r14],r0
LBB644_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 272
	ld d0,[d1]
	add d0,#0x8
LBB645_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d2,&L910_81
L905_81:
	ld r14,[d0]
L887_81:
.line 281
	ld r0,d2
	jc le,r14,d2,&L904_81
L897_81:
.line 282
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 281
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L897_81
L904_81:
.line 285
	ld [d0],d2
LBE646_81:
	pop rt,d7
	ret
L909_81:
.line 298
	ld i0,d3
	call &__Znam_20
	ld d5,r14
LBB657_81:
.line 300
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L900_81
L911_81:
.line 301
	ld r14,r1
	add r14,d5
	ld r0,[d0,8]
	add r0,r1
	ld.b r0,[r0]
	ld.b [r14],r0
.line 300
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L911_81
L900_81:
.line 304
	ld [d0,4],d3
.line 305
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L912_81
.line 307
	ld [d0,8],d5
	ld r0,[d1]
L915_81:
.line 389
	ld i0,[r0,16]
	add i0,d4
	ld i1,d7
	ld i2,d6
	syscall 5
Ltext175_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 214
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_81
	add r14,d2
	ld r0,#0x0
	ld.b [r14],r0
LBB658_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 272
	ld d0,[d1]
	add d0,#0x8
LBB659_81:
.line 295
	ld r14,[d0,4]
	jc ge,r14,d2,&L905_81
L910_81:
.line 298
	ld i0,d2
	call &__Znam_20
	ld d1,r14
LBB664_81:
.line 300
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L902_81
L913_81:
.line 301
	ld r0,r1
	add r0,d1
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 300
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L913_81
L902_81:
.line 304
	ld [d0,4],d2
.line 305
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L914_81
.line 307
	ld [d0,8],d1
	jp &L887_81
L908_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 206
	ld i0,#0x14
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d2
	call &__ZN6MAUtil10StringDataIcEC1Ei_81
LBB667_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 389
	ld r14,[d1]
	add r14,#0x8
LBE667_81:
	ld i0,[d0,16]
	ld i1,[r14,8]
	ld i2,d4
	syscall 5
Ltext179_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 208
	ld i0,[d1]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 209
	ld r0,d0
	ld [d1],d0
	jp &L876_81
L914_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 305
	call &__ZdaPv_22
	ld r14,[d0]
.line 307
	ld [d0,8],d1
	jp &L887_81
L912_81:
.line 305
	call &__ZdaPv_22
.line 307
	ld [d0,8],d5
	ld r0,[d1]
	jp &L915_81

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEpLERKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcEpLERKS1__81, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 219
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d1,i1
LBB681_81:
.line 220
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld d2,r14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld i0,d0
	ld i1,d2
	ld i2,r14
	call &__ZN6MAUtil11BasicStringIcE6appendEPKci_81
LBE681_81:
.line 221
	ld r14,d0
	pop rt,d2
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEplERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEplERKS1__81, 3, int
.line 177
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i2
LBB682_81:
.line 193
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__81
.line 194
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
LBE683_81:
.line 195
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE7reserveEi
//****************************************

.func __ZN6MAUtil11BasicStringIcE7reserveEi_81, 2, void
.line 385
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d2,i0
	ld d1,i1
LBB684_81:
.line 386
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_79
	ld r0,#0x1
	jc le,r14,r0,&L921_81
LBB687_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld r14,[d2]
	add r14,#0x8
LBB689_81:
	ld r14,[r14,4]
LBE689_81:
	jc gt,r14,d1,&L962_81
Ltext183_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 389
	ld i0,#0x14
	call &__Znwm_21
	ld d4,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10StringDataIcEC1Ei_81
LBB690_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 272
	ld d0,d4
	add d0,#0x8
LBB691_81:
.line 265
	ld r14,[d2]
	add r14,#0x8
LBB692_81:
	ld d1,[r14]
LBE692_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L963_81
L959_81:
	ld r14,[d0]
L927_81:
.line 281
	ld r0,d1
	jc le,r14,d1,&L956_81
L937_81:
.line 282
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 281
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L937_81
L956_81:
.line 285
	ld [d0],d1
LBE694_81:
.line 265
	ld r14,[d2]
	add r14,#0x8
LBE699_81:
.line 389
	ld i0,[d0,8]
	ld i1,[r14,8]
	ld i2,[r14]
	add i2,#0x1
	syscall 5
Ltext185_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 392
	ld i0,[d2]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 393
	ld [d2],d4
LBE687_81:
.line 396
	pop rt,d4
	ret
L921_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 293
	ld r0,[d2]
	ld d0,r0
	add d0,#0x8
	add d1,#0x1
LBB704_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L964_81
LBE705_81:
.line 362
	ld r14,[r0,16]
	ld r1,[r0,8]
	add r14,r1
LBE707_81:
.line 266
	ld r0,#0x0
	ld.b [r14],r0
L969_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 396
	pop rt,d4
	ret
L962_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d1,r14
Ltext189_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 389
	ld i0,#0x14
	call &__Znwm_21
	ld d4,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10StringDataIcEC1Ei_81
LBB712_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 272
	ld d0,d4
	add d0,#0x8
LBB713_81:
.line 265
	ld r14,[d2]
	add r14,#0x8
LBB714_81:
	ld d1,[r14]
LBE714_81:
.line 295
	ld r14,[d0,4]
	jc ge,r14,d1,&L959_81
L963_81:
.line 298
	ld i0,d1
	call &__Znam_20
	ld d3,r14
LBB720_81:
.line 300
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L954_81
L965_81:
.line 301
	ld r0,r1
	add r0,d3
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 300
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L965_81
L954_81:
.line 304
	ld [d0,4],d1
.line 305
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L966_81
.line 307
	ld [d0,8],d3
	jp &L927_81
L964_81:
.line 298
	ld i0,d1
	call &__Znam_20
	ld d3,r14
LBB724_81:
.line 300
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L958_81
L967_81:
.line 301
	ld r14,r1
	add r14,d3
	ld r0,[d0,8]
	add r0,r1
	ld.b r0,[r0]
	ld.b [r14],r0
.line 300
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L967_81
L958_81:
.line 304
	ld [d0,4],d1
.line 305
	ld i0,[d0,8]
	ld r14,#0x0
	jc ne,i0,r14,&L968_81
.line 307
	ld [d0,8],d3
	ld r0,[d2]
L970_81:
.line 362
	ld r14,[r0,16]
	ld r1,[r0,8]
	add r14,r1
LBE726_81:
.line 266
	ld r0,#0x0
	ld.b [r14],r0
	jp &L969_81
L966_81:
.line 305
	call &__ZdaPv_22
	ld r14,[d0]
.line 307
	ld [d0,8],d3
	jp &L927_81
L968_81:
.line 305
	call &__ZdaPv_22
.line 307
	ld [d0,8],d3
	ld r0,[d2]
	jp &L970_81

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6resizeEi
//****************************************

.func __ZN6MAUtil11BasicStringIcE6resizeEi_81, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 379
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d1,i1
LBB737_81:
.line 380
	call &__ZN6MAUtil11BasicStringIcE7reserveEi_81
LBB738_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 272
	ld d0,[d3]
	add d0,#0x8
LBB739_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L992_81
	ld r14,[d0]
L973_81:
.line 281
	ld r0,d1
	jc le,r14,d1,&L989_81
L983_81:
.line 282
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 281
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L983_81
L989_81:
.line 285
	ld [d0],d1
LBE740_81:
.line 362
	ld r14,[d3]
	add r14,#0x8
LBB746_81:
	ld r14,[r14,8]
	add d1,r14
LBE746_81:
	ld r14,#0x0
	ld.b [d1],r14
LBE737_81:
	pop rt,d3
	ret
L992_81:
.line 298
	ld i0,d1
	call &__Znam_20
	ld d2,r14
LBB754_81:
.line 300
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L987_81
L993_81:
.line 301
	ld r0,r1
	add r0,d2
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 300
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L993_81
L987_81:
.line 304
	ld [d0,4],d1
.line 305
	ld i0,[d0,8]
	ld r0,#0x0
	jc ne,i0,r0,&L994_81
.line 307
	ld [d0,8],d2
	jp &L973_81
L994_81:
.line 305
	call &__ZdaPv_22
	ld r14,[d0]
.line 307
	ld [d0,8],d2
	jp &L973_81

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6insertEiRKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcE6insertEiRKS1__81, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 286
	push rt,d5
	ld fr,sp
	add fr,#0x20
	ld d4,i0
	ld d2,i1
	ld d5,i2
LBB765_81:
.line 287
	ld i0,i2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d3,r14
.line 288
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d0,r14
	add d0,d3
.line 289
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcE6resizeEi_81
.line 290
	ld r2,d2
	add r2,d3
LBB767_81:
.line 291
	add d0,#0xffffffff
	jc lt,d0,r2,&L1025_81
L1030_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d4]
	add r14,#0x8
LBB769_81:
	ld r14,[r14,8]
	ld r1,r14
	add r1,d0
LBE769_81:
	ld r0,d0
	sub r0,d3
LBB771_81:
	add r14,r0
LBE771_81:
	ld.b r14,[r14]
	ld.b [r1],r14
Ltext199_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 291
	add d0,#0xffffffff
	jc ge,d0,r2,&L1030_81
L1025_81:
.line 294
	ld d1,#0x0
	jc le,d3,d1,&L1027_81
L1031_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 362
	ld r14,[d4]
	add r14,#0x8
	ld d0,d2
	add d2,#0x1
LBB774_81:
	ld r14,[r14,8]
	add d0,r14
LBE774_81:
	ld i0,d5
	ld i1,d1
	call &__ZNK6MAUtil11BasicStringIcEixEi_81
	ld.b r14,[r14]
	ld.b [d0],r14
Ltext201_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 294
	add d1,#0x1
	jc gt,d3,d1,&L1031_81
L1027_81:
	pop rt,d5
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6removeEii
//****************************************

.func __ZN6MAUtil11BasicStringIcE6removeEii_81, 3, void
.line 313
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d1,i1
	ld d4,i2
LBB777_81:
.line 314
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_79
	ld r0,#0x1
	jc le,r14,r0,&L1035_81
LBB780_81:
.line 315
	ld r1,#0x0
	jc lt,d1,r1,&L1038_81
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld d2,r14
	jc gt,r14,d1,&L1036_81
L1038_81:
	ld i0,&LC6_81
.line 316
	ld i1,&_ZZN6MAUtil11BasicStringIcE6removeEiiE12__FUNCTION___81
	call &_panicFunction_28
L1035_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 224
	ld d0,[d3]
	add d0,#0x8
LBB782_81:
.line 229
	ld i1,d1
.line 230
	ld r1,d1
	add r1,d4
.line 234
	ld r2,[d0]
	jc le,r2,r1,&L1078_81
L1089_81:
.line 232
	ld r14,[d0,8]
	ld r0,i1
	add r0,r14
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 233
	add i1,#0x1
.line 234
	add r1,#0x1
	ld r2,[d0]
	jc gt,r2,r1,&L1089_81
L1078_81:
.line 272
	ld d1,r2
	sub d1,d4
LBB785_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L1090_81
L1053_81:
.line 281
	ld r0,d1
	jc le,r2,d1,&L1082_81
L1063_81:
.line 282
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 281
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L1063_81
L1082_81:
.line 285
	ld [d0],d1
LBE786_81:
.line 293
	ld i0,[d3]
	ld d0,i0
	add d0,#0x8
.line 265
	ld d1,[d0]
	add d1,#0x1
LBB792_81:
.line 295
	ld r14,[d0,4]
	jc lt,r14,d1,&L1091_81
L1048_81:
.line 362
	ld r14,[i0,16]
	ld r0,[i0,8]
	add r14,r0
LBE795_81:
.line 266
	ld r1,#0x0
	ld.b [r14],r1
LBE778_81:
	pop rt,d4
	ret
L1036_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 316
	ld r14,#0x0
	jc le,d4,r14,&L1041_81
	ld d0,d1
	add d0,d4
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc le,d0,d2,&L1039_81
L1041_81:
	ld i0,&LC7_81
	ld i1,&_ZZN6MAUtil11BasicStringIcE6removeEiiE12__FUNCTION___81
	call &_panicFunction_28
L1090_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	ld i0,d1
	call &__Znam_20
	ld d2,r14
LBB809_81:
.line 300
	ld r1,#0x0
	ld r2,[d0]
	jc le,r2,r1,&L1080_81
L1092_81:
.line 301
	ld r0,r1
	add r0,d2
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 300
	add r1,#0x1
	ld r2,[d0]
	jc gt,r2,r1,&L1092_81
L1080_81:
.line 304
	ld [d0,4],d1
.line 305
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L1093_81
.line 307
	ld [d0,8],d2
	jp &L1053_81
L1091_81:
.line 298
	ld i0,d1
	call &__Znam_20
	ld d2,r14
LBB813_81:
.line 300
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L1084_81
L1094_81:
.line 301
	ld r14,r1
	add r14,d2
	ld r0,[d0,8]
	add r0,r1
	ld.b r0,[r0]
	ld.b [r14],r0
.line 300
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L1094_81
L1084_81:
.line 304
	ld [d0,4],d1
.line 305
	ld i0,[d0,8]
	ld r14,#0x0
	jc ne,i0,r14,&L1095_81
.line 307
	ld [d0,8],d2
	ld i0,[d3]
L1096_81:
.line 362
	ld r14,[i0,16]
	ld r0,[i0,8]
	add r14,r0
LBE815_81:
.line 266
	ld r1,#0x0
	ld.b [r14],r1
LBE797_81:
	pop rt,d4
	ret
L1095_81:
.line 305
	call &__ZdaPv_22
.line 307
	ld [d0,8],d2
	ld i0,[d3]
	jp &L1096_81
L1093_81:
.line 305
	call &__ZdaPv_22
	ld r2,[d0]
.line 307
	ld [d0,8],d2
	jp &L1053_81
L1039_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 317
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE4sizeEv_81
	ld d2,r14
	sub d2,d4
.line 318
	ld i0,#0x14
	call &__Znwm_21
	ld d0,r14
	ld i0,r14
	ld i1,d2
	call &__ZN6MAUtil10StringDataIcEC1Ei_81
.line 319
	ld r0,#0x0
	jc le,d1,r0,&L1042_81
LBB832_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 389
	ld r14,[d3]
	add r14,#0x8
LBE832_81:
	ld i0,[d0,16]
	ld i1,[r14,8]
	ld i2,d1
	syscall 5
L1042_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 322
	jc lt,d1,d2,&L1097_81
L1045_81:
.line 326
	ld i0,[d3]
	call &__ZN6MAUtil10RefCounted7releaseEv_79
.line 327
	ld i0,d0
	ld [d3],d0
	jp &L1048_81
L1097_81:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 389
	ld r14,[d3]
	add r14,#0x8
LBE833_81:
	ld i1,[r14,8]
	add i1,d1
	ld i0,[d0,16]
	add i0,d1
	add i1,d4
	ld i2,d2
	sub i2,d1
	syscall 5
	jp &L1045_81

//****************************************
// Function: __ZN6MAUtil15stringToIntegerERKNS_11BasicStringIcEEi
//****************************************

.func __ZN6MAUtil15stringToIntegerERKNS_11BasicStringIcEEi_82, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\util.cpp'
.line 85
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i1
LBB18_82:
.line 86
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,r14
	ld i1,#0x0
	ld i2,d0
	call &_strtoul_44
LBE18_82:
.line 87
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_85, 2, void
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Environment.h'
.line 57
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 57
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener15keyReleaseEventEi
//****************************************

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_85, 2, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox10deactivateEv
//****************************************

.func __ZN4MAUI7EditBox10deactivateEv_85, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 107
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB2_85:
.line 108
	ld.b r14,[i0,169]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L8_85
.line 109
	ld.b r14,[i0,168]
	and r14,#0xff
	jc ne,r14,r0,&L14_85
L10_85:
.line 114
	ld r14,#0x0
	ld.b [d1,176],r14
.line 115
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	call &__ZN6MAUtil9CharInput15forceDeploymentEv_70
.line 117
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld d0,d1
	add d0,#0x9c
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil9CharInput19isCharInputListenerEPNS_17CharInputListenerE_70
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L15_85
L12_85:
.line 119
	ld r14,#0x0
	ld.b [d1,169],r14
.line 120
	ld r14,[d1]
	ld d0,[r14,48]
	ld i0,d1
	ld i1,#0x0
	call d0
L8_85:
.line 121
	pop rt,d1
	ret
L14_85:
.line 110
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld d0,d1
	add d0,#0xa0
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_73
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L10_85
.line 111
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_73
	jp &L10_85
L15_85:
.line 118
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil9CharInput23removeCharInputListenerEPNS_17CharInputListenerE_70
	jp &L12_85

//****************************************
// Function: __ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_85, 2, void
.line 136
	push rt,d4
	sub sp,#0x8
	ld fr,sp
	add fr,#0x24
	ld d2,i0
	ld d3,i1
LBB5_85:
.line 137
	ld.b r14,[i0,205]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L19_85
LBB8_85:
.line 138
	ld d0,i0
	add d0,#0xd0
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcE5clearEv_81
.line 139
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
.line 140
	ld d4,fr
	add d4,#0xffffffe0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
LBB9_85:
.line 141
	ld d1,#0x0
	jp &L20_85
L23_85:
.line 142
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i1,&LC1_85
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__81
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 141
	add d1,#0x1
L20_85:
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc gt,r14,d1,&L23_85
LBE9_85:
.line 144
	ld i0,d2
	ld i1,d4
	call &__ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE_90
.line 145
	ld d0,d2
	add d0,#0x78
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,[d2,164]
	jc gt,r0,r14,&L27_85
L24_85:
.line 146
	ld i0,d2
	call &__ZN4MAUI6Widget14requestRepaintEv_95
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBE8_85:
.line 153
	add sp,#0x8
	pop rt,d4
	ret
L19_85:
.line 149
	call &__ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE_90
.line 150
	ld d0,d2
	add d0,#0x78
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,[d2,164]
	jc gt,r0,r14,&L28_85
.line 151
	ld i0,d2
	call &__ZN4MAUI6Widget14requestRepaintEv_95
L29_85:
.line 153
	add sp,#0x8
	pop rt,d4
	ret
L28_85:
.line 150
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld [d2,164],r14
.line 151
	ld i0,d2
	call &__ZN4MAUI6Widget14requestRepaintEv_95
	jp &L29_85
L27_85:
.line 145
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld [d2,164],r14
	jp &L24_85

//****************************************
// Function: __ZN4MAUI7EditBox10setCaptionERKN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN4MAUI7EditBox10setCaptionERKN6MAUtil11BasicStringIcEE_85, 2, void
.line 132
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB17_85:
.line 133
	call &__ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_85
LBE17_85:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK4MAUI7EditBox7getTextEv
//****************************************

.func __ZNK4MAUI7EditBox7getTextEv_85, 1, int
.line 155
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB18_85:
.line 156
	ld.b r14,[i0,205]
	and r14,#0xff
	ld r15,i0
	add r15,#0xd0
	ld r0,#0x0
	jc ne,r14,r0,&L33_85
	add r15,#0xffffffa8
L33_85:
.line 157
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox12setInputModeENS0_9InputModeE
//****************************************

.func __ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_85, 2, void
.line 177
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB20_85:
.line 178
	ld r14,#0x1
	jc eq,i1,r14,&L43_85
.line 180
	ld r14,#0x0
	jc eq,i1,r14,&L44_85
.line 183
	ld r14,#0x2
	jc eq,i1,r14,&L45_85
L38_85:
.line 186
	ld [d1,188],d0
LBE20_85:
	pop rt,d1
	ret
L44_85:
.line 181
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	ld i1,#0x2
	call &__ZN6MAUtil9CharInput7setModeENS0_8CharModeE_70
L46_85:
.line 186
	ld [d1,188],d0
LBE21_85:
	pop rt,d1
	ret
L43_85:
.line 179
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	ld i1,#0x0
.line 181
	call &__ZN6MAUtil9CharInput7setModeENS0_8CharModeE_70
	jp &L46_85
L45_85:
.line 184
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	ld i1,#0x1
	call &__ZN6MAUtil9CharInput9setQwertyEb_70
	jp &L38_85

//****************************************
// Function: __ZN4MAUI7EditBox8activateEv
//****************************************

.func __ZN4MAUI7EditBox8activateEv_85, 1, void
.line 95
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB23_85:
.line 96
	ld.b r0,[i0,169]
	and r0,#0xff
	ld r14,#0x0
	jc ne,r0,r14,&L47_85
.line 97
	ld.b r14,[i0,168]
	and r14,#0xff
	jc eq,r14,r0,&L49_85
.line 98
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d1
	add i1,#0xa0
	call &__ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_73
L49_85:
.line 100
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	ld i1,d1
	add i1,#0x9c
	call &__ZN6MAUtil9CharInput20addCharInputListenerEPNS_17CharInputListenerE_70
.line 101
	ld r14,#0x1
	ld.b [d1,169],r14
.line 102
	ld i0,d1
	ld i1,[d1,188]
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_85
.line 103
	ld r14,[d1]
	ld d0,[r14,48]
	ld i0,d1
	ld i1,#0x1
	call d0
L47_85:
.line 105
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI7EditBox11setSelectedEb
//****************************************

.func __ZN4MAUI7EditBox11setSelectedEb_85, 2, void
.line 83
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
LBB24_85:
.line 84
	ld.b r0,[i0,169]
	ld r14,r0
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L51_85
	ld r14,i1
	and r14,#0xff
	ld r1,#0x1
	jc eq,r14,r1,&L54_85
L51_85:
.line 87
	ld r14,r0
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L52_85
	ld r14,d1
	and r14,#0xff
	jc eq,r14,r0,&L55_85
L52_85:
.line 90
	ld i0,d0
	ld i1,d1
	call &__ZN4MAUI6Widget11setSelectedEb_95
LBE24_85:
	pop rt,d1
	ret
L55_85:
.line 88
	ld i0,d0
	call &__ZN4MAUI7EditBox10deactivateEv_85
.line 90
	ld i0,d0
	ld i1,d1
	call &__ZN4MAUI6Widget11setSelectedEb_95
LBE25_85:
	pop rt,d1
	ret
L54_85:
.line 85
	call &__ZN4MAUI7EditBox8activateEv_85
	jp &L52_85

//****************************************
// Function: __ZN4MAUI7EditBox10drawWidgetEv
//****************************************

.func __ZN4MAUI7EditBox10drawWidgetEv_85, 1, void
.line 221
	push rt,d4
	sub sp,#0x2c
	ld fr,sp
	add fr,#0x48
	ld d0,i0
LBB30_85:
.line 222
	ld r14,[i0,128]
	ld r0,#0x0
	jc ne,r14,r0,&L73_85
L63_85:
.line 278
	add sp,#0x2c
	pop rt,d4
	ret
L73_85:
.line 226
	ld d4,r0
.line 227
	ld d3,r0
LBB34_85:
.line 229
	ld d2,fr
	add d2,#0xffffffd0
	ld r14,i0
	add r14,#0x50
LBB35_85:
	ld r0,&__ZTVN6MAUtil4RectE_75+8
	ld [d2],r0
	ld r0,[r14,12]
	ld [fr,-36],r0
	ld r14,[r14,16]
	ld [fr,-32],r14
LBE35_85:
.line 230
	ld [fr,-44],d4
.line 231
	ld [fr,-40],d4
.line 232
	ld i1,fr
	add i1,#0xffffffd4
	ld i2,fr
	add i2,#0xffffffd8
	call &__ZN4MAUI5Label12getTextStartEPiS1__90
.line 233
	ld.b r14,[d0,134]
	and r14,#0xff
	jc eq,r14,d4,&L74_85
.line 237
	ld r0,#0x0
	ld [fr,-44],r0
.line 241
	ld d1,d0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i1,[d0,128]
	ld i2,[d0,164]
	ld [sp],d2
	ld i0,fr
	add i0,#0xffffffbc
	ld i3,r14
	call &__ZNK4MAUI4Font20calculateRectOfIndexEiPKcRKN6MAUtil4RectE_87
.line 243
	ld.b r14,[d0,134]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L68_85
L75_85:
.line 245
	ld r0,[fr,-40]
	ld r14,[fr,-60]
	add r0,r14
	ld r14,[fr,-52]
	add r0,r14
	ld r14,r0
	add r14,#0x2
	ld r1,[d0,96]
	jc le,r14,r1,&L69_85
.line 246
	ld d4,r1
	sub d4,r0
	add d4,#0xfffffffe
L69_85:
.line 251
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d0,128]
	ld i3,[fr,-40]
	add i3,d4
	ld [sp],d2
	ld i1,r14
	ld i2,[fr,-44]
	call &__ZN4MAUI4Font17drawBoundedStringEPKciiRKN6MAUtil4RectE_87
L70_85:
.line 267
	ld i0,[d0,172]
	syscall 32
LBB36_85:
.line 268
	ld.b r14,[d0,61]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L63_85
LBB37_85:
.line 271
	ld r14,[fr,-64]
	add d3,r14
	ld r0,[fr,-44]
	add d3,r0
.line 272
	ld r14,[fr,-60]
	add d4,r14
	ld r0,[fr,-40]
	add d4,r0
.line 276
	ld i0,d3
	ld i1,d4
	ld i2,d3
	ld i3,[fr,-52]
	add i3,d4
	call &_Gfx_line_71
	jp &L63_85
L74_85:
.line 234
	ld r14,#0xffff
	ld [fr,-32],r14
.line 235
	ld [fr,-36],r14
.line 241
	ld d1,d0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i1,[d0,128]
	ld i2,[d0,164]
	ld [sp],d2
	ld i0,fr
	add i0,#0xffffffbc
	ld i3,r14
	call &__ZNK4MAUI4Font20calculateRectOfIndexEiPKcRKN6MAUtil4RectE_87
.line 243
	ld.b r14,[d0,134]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L75_85
L68_85:
.line 255
	ld r0,[fr,-44]
	ld r14,[fr,-64]
	add r0,r14
	ld r14,[fr,-56]
	add r0,r14
	ld r14,r0
	add r14,#0x2
	ld r1,[d0,92]
	jc le,r14,r1,&L71_85
.line 256
	ld d3,r1
	sub d3,r0
	add d3,#0xfffffffe
L71_85:
.line 262
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_81
	ld i0,[d0,128]
	ld i1,r14
	ld i2,[fr,-44]
	add i2,d3
	ld i3,[fr,-40]
	call &__ZN4MAUI4Font10drawStringEPKcii_87
	jp &L70_85

//****************************************
// Function: __ZThn160_N4MAUI7EditBox15keyReleaseEventEii
//****************************************

.func __ZThn160_N4MAUI7EditBox15keyReleaseEventEii_85, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBox15keyReleaseEventEii_85
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox15keyReleaseEventEii
//****************************************

.func __ZN4MAUI7EditBox15keyReleaseEventEii_85, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 309
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 309
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox10setEnabledEb
//****************************************

.func __ZN4MAUI7EditBox10setEnabledEb_85, 2, void
.line 446
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB38_85:
.line 447
	call &__ZN4MAUI6Widget10setEnabledEb_95
.line 448
	and d0,#0xff
	ld r14,#0x0
	jc eq,d0,r14,&L80_85
LBE38_85:
.line 450
	pop rt,d1
	ret
L80_85:
.line 449
	ld i0,d1
	call &__ZN4MAUI7EditBox10deactivateEv_85
LBE39_85:
.line 450
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI7EditBox18fireCharacterAddedEc
//****************************************

.func __ZN4MAUI7EditBox18fireCharacterAddedEc_85, 2, void
.line 481
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
LBB40_85:
.line 482
	ld d2,#0x0
LBB43_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld d1,i0
	add d1,#0xc0
LBB44_85:
	ld r14,[d1]
LBE44_85:
	jc le,r14,d2,&L89_85
L91_85:
.line 362
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE46_85:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,16]
	ld i1,d3
	ld i2,d4
	call d0
Ltext6_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 482
	add d2,#0x1
LBB47_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld r14,[d1]
LBE48_85:
	jc gt,r14,d2,&L91_85
L89_85:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox20fireCharacterChangedEc
//****************************************

.func __ZN4MAUI7EditBox20fireCharacterChangedEc_85, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 475
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
LBB49_85:
.line 476
	ld d2,#0x0
LBB52_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld d1,i0
	add d1,#0xc0
LBB53_85:
	ld r14,[d1]
LBE53_85:
	jc le,r14,d2,&L100_85
L102_85:
.line 362
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE55_85:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,12]
	ld i1,d3
	ld i2,d4
	call d0
Ltext10_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 476
	add d2,#0x1
LBB56_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld r14,[d1]
LBE57_85:
	jc gt,r14,d2,&L102_85
L100_85:
	pop rt,d4
	ret

//****************************************
// Function: __ZThn156_N4MAUI7EditBox16characterChangedEc
//****************************************

.func __ZThn156_N4MAUI7EditBox16characterChangedEc_85, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff64
	call &__ZN4MAUI7EditBox16characterChangedEc_85
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox16characterChangedEc
//****************************************

.func __ZN4MAUI7EditBox16characterChangedEc_85, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 314
	push rt,d4
	sub sp,#0xc
	ld fr,sp
	add fr,#0x28
	ld d0,i0
	ld d2,i1
LBB58_85:
.line 317
	ld.b r0,[i0,176]
	ld r14,r0
	and r14,#0xff
	ld d1,i0
	add d1,#0x78
	ld r1,#0x0
	jc eq,r14,r1,&L113_85
.line 327
	ld r14,r0
	and r14,#0xff
	ld r1,#0x0
	jc eq,r14,r1,&L114_85
L112_85:
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
L108_85:
.line 333
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEixEi_81
	ld.b [r14],d2
L107_85:
.line 335
	ld r0,#0x1
	ld.b [d0,176],r0
.line 336
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_95
.line 338
	ld i0,d0
	ld i1,d2
	call &__ZN4MAUI7EditBox20fireCharacterChangedEc_85
.line 341
	ld r1,#0x1
	ld.b [d0,116],r1
LBE59_85:
	add sp,#0xc
	pop rt,d4
	ret
L113_85:
.line 317
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,[d0,184]
	jc lt,r14,r0,&L115_85
	ld.b r0,[d0,176]
.line 327
	ld r14,r0
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L112_85
L114_85:
.line 328
	ld r14,[d0,164]
	ld [zr,__ZN4MAUI12currentIndexE_85],r14
.line 329
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	add r14,#0xffffffff
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
	jc ge,r14,i1,&L108_85
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	add r14,#0xffffffff
	ld [zr,__ZN4MAUI12currentIndexE_85],r14
	ld i1,r14
	jp &L108_85
L115_85:
.line 320
	ld d4,fr
	add d4,#0xffffffe0
	xb r14,d2
	ld [sp],r14
	ld i0,d4
	ld i1,&LC2_85
	call &_sprintf_37
.line 321
	ld r1,[d0,164]
	ld [zr,__ZN4MAUI12currentIndexE_85],r1
.line 323
	ld d3,fr
	add d3,#0xffffffdc
	ld i0,d3
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d1
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
	ld i2,d3
	call &__ZN6MAUtil11BasicStringIcE6insertEiRKS1__81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
.line 324
	ld.b r14,[d0,205]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L107_85
.line 325
	ld i0,d3
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_81
	ld i0,d0
	add i0,#0xd0
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
	ld i2,d3
	call &__ZN6MAUtil11BasicStringIcE6insertEiRKS1__81
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	jp &L107_85

//****************************************
// Function: __ZN4MAUI7EditBox20fireCharacterDeletedEc
//****************************************

.func __ZN4MAUI7EditBox20fireCharacterDeletedEc_85, 2, void
.line 469
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
LBB65_85:
.line 470
	ld d2,#0x0
LBB68_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld d1,i0
	add d1,#0xc0
LBB69_85:
	ld r14,[d1]
LBE69_85:
	jc le,r14,d2,&L124_85
L126_85:
.line 362
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE71_85:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,d3
	ld i2,d4
	call d0
Ltext15_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 470
	add d2,#0x1
LBB72_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld r14,[d1]
LBE73_85:
	jc gt,r14,d2,&L126_85
L124_85:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox15fireCursorMovedEi
//****************************************

.func __ZN4MAUI7EditBox15fireCursorMovedEi_85, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 463
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d2,i0
	ld d4,i1
LBB74_85:
.line 464
	ld d3,#0x0
LBB77_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld d1,i0
	add d1,#0xc0
LBB78_85:
	ld r14,[d1]
LBE78_85:
	jc le,r14,d3,&L135_85
L137_85:
.line 362
	ld r14,d3
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE80_85:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,4]
	ld i1,d2
	ld i2,[d2,164]
	ld i3,d4
	call d0
Ltext19_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 464
	add d3,#0x1
LBB81_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld r14,[d1]
LBE82_85:
	jc gt,r14,d3,&L137_85
L135_85:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox20moveCursorHorizontalEib
//****************************************

.func __ZN4MAUI7EditBox20moveCursorHorizontalEib_85, 3, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 367
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d0,i1
	ld d3,i2
LBB83_85:
.line 369
	ld d1,[i0,164]
	add d1,i1
	ld r0,#0x0
	jc lt,d1,r0,&L140_85
	add i0,#0x78
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc le,d1,r14,&L139_85
L140_85:
.line 370
	ld r14,d3
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L143_85
.line 372
	ld r14,#0x0
L138_85:
.line 381
	pop rt,d3
	ret
L139_85:
.line 375
	ld i1,[d2,164]
.line 376
	add d0,i1
	ld [d2,164],d0
.line 377
	ld r14,d3
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L144_85
.line 380
	ld r14,#0x1
L145_85:
.line 381
	pop rt,d3
	ret
L143_85:
.line 371
	ld i0,d2
	ld i1,[d2,164]
	call &__ZN4MAUI7EditBox15fireCursorMovedEi_85
.line 372
	ld r14,#0x0
	jp &L138_85
L144_85:
.line 378
	ld i0,d2
	call &__ZN4MAUI7EditBox15fireCursorMovedEi_85
.line 380
	ld r14,#0x1
	jp &L145_85

//****************************************
// Function: __ZN4MAUI7EditBox15fireTextChangedEv
//****************************************

.func __ZN4MAUI7EditBox15fireTextChangedEv_85, 1, void
.line 456
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
LBB89_85:
.line 457
	ld d2,#0x0
LBB92_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld d1,i0
	add d1,#0xc0
LBB93_85:
	ld r14,[d1]
LBE93_85:
	jc le,r14,d2,&L154_85
	ld d4,i0
	add d4,#0x78
L152_85:
.line 362
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE95_85:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d3
	ld i2,d4
	call d0
Ltext23_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 457
	add d2,#0x1
LBB96_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 265
	ld r14,[d1]
LBE97_85:
	jc gt,r14,d2,&L152_85
L154_85:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox15deleteCharacterEi
//****************************************

.func __ZN4MAUI7EditBox15deleteCharacterEi_85, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 383
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d0,i1
LBB98_85:
.line 390
	ld r0,#0x0
	jc lt,i1,r0,&L157_85
	ld d2,i0
	add d2,#0x78
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	jc gt,r14,d0,&L156_85
L157_85:
	ld r14,#0x0
LBE99_85:
.line 415
	pop rt,d3
	ret
L156_85:
.line 391
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEixEi_81
	ld.b d3,[r14]
.line 393
	ld.b r14,[d1,205]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L158_85
.line 394
	ld i0,d1
	add i0,#0xd0
	ld i1,d0
	ld i2,#0x1
	call &__ZN6MAUtil11BasicStringIcE6removeEii_81
L158_85:
.line 397
	ld i0,d2
	ld i1,d0
	ld i2,#0x1
	call &__ZN6MAUtil11BasicStringIcE6removeEii_81
.line 407
	ld i0,d1
	ld i1,d3
	call &__ZN4MAUI7EditBox20fireCharacterDeletedEc_85
.line 408
	ld i0,d1
	call &__ZN4MAUI7EditBox15fireTextChangedEv_85
.line 409
	ld i0,d1
	call &__ZN4MAUI6Widget14requestRepaintEv_95
.line 412
	ld r14,#0x1
	ld.b [d1,116],r14
.line 414
	ld r14,#0x1
LBE101_85:
.line 415
	pop rt,d3
	ret

//****************************************
// Function: __ZN4MAUI7EditBox23deletePreviousCharacterEv
//****************************************

.func __ZN4MAUI7EditBox23deletePreviousCharacterEv_85, 1, int
.line 421
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB102_85:
.line 436
	ld d2,[i0,164]
	add d2,#0xffffffff
.line 437
	ld i1,d2
	call &__ZN4MAUI7EditBox15deleteCharacterEi_85
.line 438
	ld d0,r14
	and d0,#0xff
	ld r14,d0
	ld r0,#0x0
	jc ne,d0,r0,&L163_85
LBE103_85:
.line 444
	pop rt,d2
	ret
L163_85:
.line 439
	ld [d1,164],d2
.line 441
	ld d2,d1
	add d2,#0x78
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,[d1,164]
	jc gt,r0,r14,&L164_85
.line 443
	ld r14,d0
L165_85:
.line 444
	pop rt,d2
	ret
L164_85:
.line 441
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld [d1,164],r14
.line 443
	ld r14,d0
	jp &L165_85

//****************************************
// Function: __ZThn160_N4MAUI7EditBox13keyPressEventEii
//****************************************

.func __ZThn160_N4MAUI7EditBox13keyPressEventEii_85, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBox13keyPressEventEii_85
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox13keyPressEventEii
//****************************************

.func __ZN4MAUI7EditBox13keyPressEventEii_85, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 280
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB108_85:
.line 281
	ld r0,#0x23
	jc eq,i1,r0,&L174_85
	jc le,i1,r0,&L179_85
	ld r0,#0x113
	jc eq,i1,r0,&L171_85
	ld r14,#0x114
	jc eq,i1,r14,&L180_85
L167_85:
.line 307
	pop rt,d1
	ret
L179_85:
.line 281
	ld r14,#0xc
	jc ne,i1,r14,&L167_85
.line 294
	ld r14,#0x0
	ld.b [i0,176],r14
.line 295
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	call &__ZN6MAUtil9CharInput15forceDeploymentEv_70
.line 296
	ld i0,d1
	call &__ZN4MAUI7EditBox23deletePreviousCharacterEv_85
LBE109_85:
.line 307
	pop rt,d1
	ret
L174_85:
.line 299
	ld.b r14,[i0,204]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L168_85
	ld r14,[i0,188]
	ld r0,#0x1
	jc eq,r14,r0,&L181_85
L168_85:
.line 305
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	call &__ZN6MAUtil9CharInput15forceDeploymentEv_70
.line 306
	ld i0,d1
	call &__ZN4MAUI6Widget14requestRepaintEv_95
LBE110_85:
.line 307
	pop rt,d1
	ret
L171_85:
.line 286
	ld i1,#0x1
	ld i2,i1
L178_85:
	call &__ZN4MAUI7EditBox20moveCursorHorizontalEib_85
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L168_85
LBE111_85:
.line 307
	pop rt,d1
	ret
L180_85:
.line 283
	ld i1,#0xffffffff
	ld i2,#0x1
	jp &L178_85
L181_85:
.line 300
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld d0,r14
	call &__ZN6MAUtil9CharInput12getCharInputEv_70
	ld i0,r14
	call &__ZNK6MAUtil9CharInput7getModeEv_70
	add r14,#0x1
	ld i0,d0
	ld i1,r14
	and i1,#0x1
	call &__ZN6MAUtil9CharInput7setModeENS0_8CharModeE_70
	jp &L168_85

//****************************************
// Function: __ZThn156_N4MAUI7EditBox17characterDeployedEc
//****************************************

.func __ZThn156_N4MAUI7EditBox17characterDeployedEc_85, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff64
	call &__ZN4MAUI7EditBox17characterDeployedEc_85
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox17characterDeployedEc
//****************************************

.func __ZN4MAUI7EditBox17characterDeployedEc_85, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 344
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i1
LBB114_85:
.line 348
	ld r0,#0x0
	ld.b [i0,176],r0
.line 349
	ld d1,i0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_81
	ld r0,[d0,184]
	add r0,#0x1
	jc ge,r14,r0,&L184_85
.line 351
	ld r14,[d0,164]
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
	jc eq,r14,i1,&L190_85
L186_85:
.line 356
	ld.b r14,[d0,205]
	and r14,#0xff
	ld r0,#0x0
.line 360
	ld i0,d1
.line 356
	jc eq,r14,r0,&L189_85
.line 357
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEixEi_81
	ld r0,#0x2a
	ld.b [r14],r0
.line 358
	ld i0,d0
	add i0,#0xd0
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
L189_85:
.line 360
	call &__ZN6MAUtil11BasicStringIcEixEi_81
	ld.b [r14],d2
.line 362
	ld i0,d0
	call &__ZN4MAUI7EditBox15fireTextChangedEv_85
.line 363
	ld i0,d0
	ld i1,d2
	call &__ZN4MAUI7EditBox18fireCharacterAddedEc_85
.line 364
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_95
L184_85:
.line 365
	pop rt,d2
	ret
L190_85:
.line 353
	ld i0,d0
	ld i1,#0x1
	ld i2,#0x0
	call &__ZN4MAUI7EditBox20moveCursorHorizontalEib_85
	ld i1,[zr,__ZN4MAUI12currentIndexE_85]
	jp &L186_85

//****************************************
// Function: __ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE
//****************************************

.func __ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE_85, 13, void
.line 47
	push rt,d6
	sub sp,#0x14
	ld fr,sp
	add fr,#0x38
	ld d3,i0
	ld d2,[fr,8]
	ld d1,[fr,12]
	ld d4,[fr,16]
	ld d5,[fr,28]
	ld d6,[fr,32]
LBB125_85:
.line 63
	ld r14,[fr]
	ld [sp],r14
	ld r14,[fr,4]
	ld [sp,4],r14
	ld [sp,8],d2
	ld [sp,12],d1
	ld [sp,16],d4
	call &__ZN4MAUI5LabelC2EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_90
	ld r14,&__ZTVN4MAUI7EditBoxE_85+8
	ld [d3],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_85+128
	ld [d3,156],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_85+144
	ld [d3,160],r14
	ld r14,#0x0
	ld [d3,164],r14
	ld.b r14,[fr,20]
	ld.b [d3,168],r14
	ld r14,#0x0
	ld.b [d3,169],r14
	ld r14,#0xffffff
	ld [d3,172],r14
	ld r14,#0x0
	ld.b [d3,176],r14
	ld r14,#0x0
	ld [d3,180],r14
	ld [d3,184],d5
	ld [d3,188],d6
LBB126_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 104
	ld d0,d3
	add d0,#0xc0
LBB127_85:
.line 109
	ld i0,#0x10
	call &__Znam_20
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r14,#0x0
	ld [d0],r14
LBE127_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,#0x1
	ld.b [d3,204],r14
	ld r14,#0x0
	ld.b [d3,205],r14
	ld i0,d3
	add i0,#0xd0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_81
.line 64
	ld i0,d3
	ld i1,d1
	call &__ZN4MAUI6Widget18setBackgroundColorEi_95
.line 65
	ld i0,d3
	ld i1,#0x1
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_95
.line 67
	ld i0,d3
	ld.b i1,[fr,24]
	call &__ZN4MAUI5Label12setMultiLineEb_90
.line 69
	ld i0,d3
	ld i1,d2
	call &__ZN4MAUI7EditBox10setCaptionERKN6MAUtil11BasicStringIcEE_85
.line 71
	ld r14,#0x0
	jc eq,d4,r14,&L207_85
.line 74
	ld [d3,128],d4
L206_85:
.line 78
	ld i0,d3
	add i0,#0x78
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcE7reserveEi_81
.line 80
	ld i0,d3
	ld i1,d6
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_85
LBE125_85:
	add sp,#0x14
	pop rt,d6
	ret
L207_85:
.line 72
	call &__ZN4MAUI6Engine12getSingletonEv_86
	ld i0,r14
	call &__ZN4MAUI6Engine14getDefaultFontEv_86
	ld [d3,128],r14
	jp &L206_85

//****************************************
// Function: __ZThn160_N4MAUI7EditBoxD1Ev
//****************************************

.func __ZThn160_N4MAUI7EditBoxD1Ev_85, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBoxD1Ev_85
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBoxD1Ev
//****************************************

.func __ZN4MAUI7EditBoxD1Ev_85, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 504
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB159_85:
.line 504
	ld r14,&__ZTVN4MAUI7EditBoxE_85+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_85+128
	ld [i0,156],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_85+144
	ld [i0,160],r14
	add i0,#0xd0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB160_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 143
	ld i0,[d0,200]
	ld r14,#0x0
	jc ne,i0,r14,&L264_85
LBE161_85:
	ld i0,d0
	add i0,#0xa0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBB162_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,&__ZTVN4MAUI5LabelE_90+8
	ld [d0],r14
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN4MAUI6WidgetD2Ev_95
LBE163_85:
.line 504
	pop rt,d0
	ret
L264_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
LBE166_85:
	ld i0,d0
	add i0,#0xa0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBB167_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,&__ZTVN4MAUI5LabelE_90+8
	ld [d0],r14
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN4MAUI6WidgetD2Ev_95
LBE168_85:
.line 504
	pop rt,d0
	ret

//****************************************
// Function: __ZThn160_N4MAUI7EditBoxD0Ev
//****************************************

.func __ZThn160_N4MAUI7EditBoxD0Ev_85, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBoxD0Ev_85
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBoxD0Ev
//****************************************

.func __ZN4MAUI7EditBoxD0Ev_85, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 504
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB169_85:
.line 504
	ld r14,&__ZTVN4MAUI7EditBoxE_85+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_85+128
	ld [i0,156],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_85+144
	ld [i0,160],r14
	add i0,#0xd0
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
LBB170_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 143
	ld i0,[d0,200]
	ld r14,#0x0
	jc ne,i0,r14,&L279_85
L272_85:
	ld i0,d0
	add i0,#0xa0
	call &__ZN6MAUtil11KeyListenerD2Ev_73
LBB172_85:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,&__ZTVN4MAUI5LabelE_90+8
	ld [d0],r14
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcED1Ev_81
	ld i0,d0
	call &__ZN4MAUI6WidgetD2Ev_95
LBE173_85:
.line 504
	ld i0,d0
	call &__ZdlPv_23
	pop rt,d0
	ret
L279_85:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 143
	call &__ZdaPv_22
	jp &L272_85

//****************************************
// Function: __ZN4MAUI6EngineC1Ev
//****************************************

.func __ZN4MAUI6EngineC1Ev_86, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.cpp'
.line 34
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB6_86:
.line 34
	ld d0,i0
	add d0,#0x4
LBE7_86:
	ld r0,&__ZTVN4MAUI6EngineE_86+8
	ld [i0],r0
	ld r14,&__ZTVN4MAUI6EngineE_86+36
	ld [d0],r14
LBB8_86:
.sourcefile 'c:\mb\MoSyncReleasePackage\include\MAUtil\Geometry.h'
.line 39
	ld r14,i0
	add r14,#0xc
LBB9_86:
	ld r0,#0x0
	ld [r14,4],r0
	ld [r14],r0
LBE9_86:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.cpp'
.line 35
	ld [i0,20],r0
.line 36
	ld [i0,24],r0
.line 37
	ld [i0,28],r0
.line 38
	ld [i0,8],r0
.line 39
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_86],i0
.line 41
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment16addFocusListenerEPNS_13FocusListenerE_73
LBE6_86:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI6Engine7setMainEPNS_6WidgetE
//****************************************

.func __ZN4MAUI6Engine7setMainEPNS_6WidgetE_86, 2, void
.line 44
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d0,i1
LBB10_86:
.line 45
	ld i0,i1
	call &__ZNK4MAUI6Widget11getPositionEv_95
	ld d2,r14
	ld i0,d0
	call &__ZNK4MAUI6Widget11getPositionEv_95
	ld r0,[d0]
	ld d1,[r0,24]
	ld i0,d0
	ld i1,[d2]
	ld i2,[r14,4]
	call d1
.line 46
	ld [d3,20],d0
LBE10_86:
	pop rt,d3
	ret

//****************************************
// Function: __ZN4MAUI6EngineD1Ev
//****************************************

.func __ZN4MAUI6EngineD1Ev_86, 1, void
.line 50
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB13_86:
.line 50
	ld r14,&__ZTVN4MAUI6EngineE_86+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI6EngineE_86+36
	ld [i0,4],r14
.line 51
	ld i0,[i0,20]
	ld r14,#0x0
	jc ne,i0,r14,&L28_86
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_86],r14
LBE13_86:
.line 54
	pop rt,d0
	ret
L28_86:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_86],r14
LBE14_86:
.line 54
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI6EngineD0Ev
//****************************************

.func __ZN4MAUI6EngineD0Ev_86, 1, void
.line 50
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB15_86:
.line 50
	ld r14,&__ZTVN4MAUI6EngineE_86+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI6EngineE_86+36
	ld [i0,4],r14
.line 51
	ld i0,[i0,20]
	ld r14,#0x0
	jc ne,i0,r14,&L36_86
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_86],r14
LBE15_86:
.line 54
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d1
	ret
L36_86:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_86],r14
LBE16_86:
.line 54
	ld i0,d1
	call &__ZdlPv_23
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI6Engine14setDefaultSkinEPNS_10WidgetSkinE
//****************************************

.func __ZN4MAUI6Engine14setDefaultSkinEPNS_10WidgetSkinE_86, 2, void
.line 56
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB17_86:
.line 57
	ld [i0,28],i1
LBE17_86:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine14setDefaultFontEPNS_4FontE
//****************************************

.func __ZN4MAUI6Engine14setDefaultFontEPNS_4FontE_86, 2, void
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB18_86:
.line 61
	ld [i0,24],i1
LBE18_86:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine14getDefaultSkinEv
//****************************************

.func __ZN4MAUI6Engine14getDefaultSkinEv_86, 1, int
.line 64
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 66
	ld r14,[i0,28]
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine14getDefaultFontEv
//****************************************

.func __ZN4MAUI6Engine14getDefaultFontEv_86, 1, int
.line 69
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 71
	ld r14,[i0,24]
	pop fr,fr
	ret

//****************************************
// Function: __ZThn4_N4MAUI6Engine9focusLostEv
//****************************************

.func __ZThn4_N4MAUI6Engine9focusLostEv_86, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.h'
.line 41
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 41
	add i0,#0xfffffffc
	call &__ZN4MAUI6Engine9focusLostEv_86
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine9focusLostEv
//****************************************

.func __ZN4MAUI6Engine9focusLostEv_86, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.cpp'
.line 171
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 171
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine15requestUIUpdateEv
//****************************************

.func __ZN4MAUI6Engine15requestUIUpdateEv_86, 1, void
.line 178
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB19_86:
.line 179
	call &__ZN6MAUtil11Environment14getEnvironmentEv_73
	ld r0,[r14]
	ld d0,[r0]
	ld i0,r14
	ld i1,d1
	call d0
LBE19_86:
	pop rt,d1
	ret

//****************************************
// Function: __ZThn4_N4MAUI6Engine11focusGainedEv
//****************************************

.func __ZThn4_N4MAUI6Engine11focusGainedEv_86, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.h'
.line 41
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 41
	add i0,#0xfffffffc
	call &__ZN4MAUI6Engine11focusGainedEv_86
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine11focusGainedEv
//****************************************

.func __ZN4MAUI6Engine11focusGainedEv_86, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.cpp'
.line 174
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB20_86:
.line 175
	call &__ZN4MAUI6Engine15requestUIUpdateEv_86
LBE20_86:
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine7repaintEv
//****************************************

.func __ZN4MAUI6Engine7repaintEv_86, 1, void
.line 182
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
LBB21_86:
.line 184
	ld r14,[i0,20]
	ld r0,#0x0
	jc ne,r14,r0,&L49_86
LBE22_86:
.line 215
	pop rt,d3
	ret
L49_86:
.line 187
	call &_Gfx_beginRendering_71
.line 190
	call &_Gfx_clearClipRect_71
.line 191
	call &_Gfx_clearMatrix_71
.line 194
	syscall 46
	ld d3,r14
	sra d3,#0x10
.line 195
	syscall 46
	xh d2,r14
.line 197
	ld i0,#0x0
	ld i1,i0
	ld i2,d3
	ld i3,d2
	call &_Gfx_pushClipRect_71
.line 198
	ld i0,[d1,20]
	ld r14,[i0]
	ld d0,[r14,12]
	call d0
.line 199
	ld i0,[d1,20]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,#0x0
	call d0
.line 200
	call &_Gfx_popClipRect_71
.line 202
	ld r14,[d1,8]
	ld r0,#0x0
	jc ne,r14,r0,&L50_86
.line 214
	call &_Gfx_updateScreen_71
L51_86:
.line 215
	pop rt,d3
	ret
L50_86:
.line 203
	call &_Gfx_clearClipRect_71
.line 204
	call &_Gfx_clearMatrix_71
.line 205
	ld i0,#0x0
	ld i1,i0
	ld i2,d3
	ld i3,d2
	call &_Gfx_pushClipRect_71
.line 207
	ld i0,[d1,8]
	call &__ZN4MAUI6Widget14requestRepaintEv_95
.line 208
	ld i0,[d1,12]
	ld i1,[d1,16]
	call &_Gfx_translate_71