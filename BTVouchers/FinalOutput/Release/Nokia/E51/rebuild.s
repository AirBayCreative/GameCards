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
	call &__ZN3Mtx7Context4initEPNS_11MtxListenerEPNS_11XmlListenerE_98
.line 12
	ld i0,[d0,68]
	ld i1,d0
	call &__ZN6MAUtil10Connection11setListenerEPNS_18ConnectionListenerE_78
.line 13
	ld i1,d0
	add i1,#0x4c
	ld [d0,2124],i1
.line 14
	ld i0,[d0,68]
	ld i2,#0x7ff
	call &__ZN6MAUtil10Connection4recvEPvi_78
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
	call &__ZN3Mtx7Context4feedEPc_98
.line 30
	ld i1,[d0,2124]
	ld i2,d0
	sub i2,i1
	ld i0,[d0,68]
	add i2,#0x84b
	call &__ZN6MAUtil10Connection4recvEPvi_78
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
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
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
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
.line 41
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88
.line 42
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
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
	call &__Znwm_56
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
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_89
.line 54
	ld d3,fr
	add d3,#0xffffffd8
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 55
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88
.line 56
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 63
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88
.line 64
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88
.line 72
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
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
	call &__Znwm_56
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
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_89
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 97
	ld i0,[zr,_softKeys_4]
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_56
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
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_90
.line 99
	ld i0,#0x1
	syscall 50
.line 101
	xh d0,r14
.line 103
	ld i0,#0x84
	call &__Znwm_56
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
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_86
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
	call &__ZN4MAUI5Label12setAutoSizeYEb_88
.line 107
	ld i0,d3
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_88
.line 108
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d3
	call d0
.line 110
	ld i0,[zr,_softKeys_4]
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,r14
	ld i0,d3
	call &__ZNK4MAUI6Widget9getHeightEv_93
	add d0,r14
	ld d1,[zr,_scrHeight_4]
	sub d1,d0
	ld i0,#0xb4
	call &__Znwm_56
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
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_90
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
	call &__Znwm_56
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
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_89
.line 122
	ld i0,#0x2a
	ld i1,d0
	ld i2,&LC0_4
	ld i3,i2
	call &__Z16createSoftKeyBariPKcS0_S0__4
	ld [zr,_softKeys_4],r14
.line 123
	ld i0,r14
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_56
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
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_90
.line 124
	ld i0,#0x1
	syscall 50
.line 126
	xh d0,r14
.line 128
	ld i0,#0x84
	call &__Znwm_56
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
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_86
	ld [zr,_image_4],d1
.line 129
	ld r14,[d2]
	ld d0,[r14]
	ld i0,d2
	ld i1,d1
	call d0
.line 130
	ld i0,[zr,_softKeys_4]
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_56
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
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_90
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
	call &__Znwm_56
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
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_89
.line 142
	ld i0,#0x2a
	ld i1,d0
	ld i2,d2
	ld i3,d3
	call &__Z16createSoftKeyBariPKcS0_S0__4
	ld [zr,_softKeys_4],r14
.line 143
	ld i0,r14
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,[zr,_scrHeight_4]
	sub d0,r14
	ld i0,#0xb4
	call &__Znwm_56
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
	call &__ZN4MAUI7ListBoxC1EiiiiPNS_6WidgetENS0_18ListBoxOrientationENS0_20ListBoxAnimationTypeEb_90
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
	call &__Znam_57
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
	call &__ZN4MAUI5Image11setResourceEi_86
.line 200
	ld r14,[d1]
	ld d0,[r14,12]
	ld i0,d1
	call d0
.line 201
	ld i0,d1
	call &__ZN4MAUI6Widget14requestRepaintEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d2,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld r14,#0xffffffff
	jc eq,d2,r14,&L42_4
LBB52_4:
.line 227
	ld i0,#0x10
	call &__Znwm_56
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,#0x0
	syscall 64
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d2,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld r14,#0xffffffff
	jc eq,d2,r14,&L49_4
LBB62_4:
.line 254
	ld i0,#0x10
	call &__Znwm_56
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,#0x0
	syscall 64
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d2,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld r14,#0xffffffff
	jc eq,d2,r14,&L56_4
LBB70_4:
.line 278
	ld i0,#0x10
	call &__Znwm_56
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,#0x0
	syscall 64
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_4
	ld i1,&LC3_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC4_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC5_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC6_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC7_4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_4
	ld i1,&_URL_4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6ScreenC2Ev_92
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
	call &__Znwm_56
	ld d1,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB12_5:
	ld r14,[r14,8]
LBE12_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d0,28],r14
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 13
	ld i0,[d0,28]
	ld i1,d4
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
.line 14
	ld i0,[d0,24]
	ld r14,[i0]
	ld d1,[r14]
	ld i1,[d0,28]
	call d1
.line 15
	ld i0,d2
	ld i1,[zr,_redeemlbl_5]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d0,28],r14
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 16
	ld i0,[d0,28]
	ld i1,d4
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
.line 17
	ld i0,[d0,24]
	ld r14,[i0]
	ld d1,[r14]
	ld i1,[d0,28]
	call d1
.line 18
	ld i0,[d0,24]
	ld i1,#0x0
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
.line 20
	ld i0,d0
	ld i1,[d0,20]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB24_5:
	ld r14,[r14,8]
LBE24_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB25_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB26_5:
.line 258
	ld r14,[r14]
LBE26_5:
.line 359
	jc le,r14,d2,&L55_5
L42_5:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_5:
	ld r14,[r14,8]
LBE30_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB31_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB36_5:
	ld r14,[r14,8]
LBE36_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB37_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE37_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB42_5:
	ld r14,[r14,8]
	add r14,#0x4
LBE42_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB46_5:
	ld r14,[r14,8]
	add r14,#0x4
LBE46_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB53_5:
	ld r14,[r14,8]
LBE53_5:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB54_5:
	ld r14,[r14,8]
	add r14,#0x8
LBE54_5:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
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
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
LBE61_5:
.line 97
	pop rt,fr
	ret
L65_5:
.line 95
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
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
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__Znwm_56
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
	call &__ZN4MAUI7ListBox14selectNextItemEb_90
LBE71_5:
.line 129
	add sp,#0x28
	pop rt,d7
	ret
L84_5:
.line 126
	ld i0,[i0,24]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox18selectPreviousItemEb_90
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d4
	ld i1,d0
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE89_5:
	ld i0,d0
	ld i1,&LC6_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,d4
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d7,fr
	add d7,#0xffffffbc
	ld i0,d7
	ld i1,[zr,_voucherlbl_5]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d3
	ld i2,d7
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d1,fr
	add d1,#0xffffffb8
	ld i0,d1
	ld i1,&LC7_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d7
	ld i1,&LC8_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x8d0
	call &__Znwm_56
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 116
	ld i0,[d6,32]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE90_5:
.line 39
	ld i0,d1
	call &__ZdlPv_55
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE109_5:
.line 39
	ld i0,d1
	call &__ZdlPv_55
	pop rt,d2
	ret
L167_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L91_5
L176_5:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L105_5
L174_5:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE182_5:
.line 39
	pop rt,d2
	ret
L260_5:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L184_5
L269_5:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L198_5
L267_5:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_5
	ld i1,&LC10_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC11_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC12_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC13_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC14_5
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_5
	ld i1,&_URL_5
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6ScreenC2Ev_92
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
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB16_6:
	ld r14,[r14,8]
LBE16_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
.line 13
	ld d5,fr
	add d5,#0xffffffd8
	ld i0,d5
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d4,36],d0
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 14
	ld i0,[d4,36]
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d0
.line 15
	ld i0,[d4,36]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_88
.line 16
	ld i0,d5
	ld i1,[zr,_phoneNumlbl_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 17
	ld d0,fr
	add d0,#0xffffffd4
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i1,&LC7_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d5
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d4,28],d2
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 18
	ld i0,[d4,28]
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d0
.line 20
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,#0x30
	call &__Z15createEditLabelN6MAUtil11BasicStringIcEEi_4
	ld [d4,32],r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 21
	ld i0,[d4,32]
	call &__ZNK4MAUI6Widget8getWidthEv_93
	ld d3,r14
	add d3,#0xfffffff6
	ld i0,[d4,32]
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,r14
	add d0,#0xfffffff6
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xd4
	call &__Znwm_56
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
	call &__ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE_83
	ld [d4,40],d2
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 22
	ld i0,[d4,40]
	ld i1,#0x0
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_83
.line 23
	ld i0,[d4,40]
	ld i1,#0x0
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
.line 24
	ld i0,[d4,32]
	ld i1,d6
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d4,40]
	ld i1,d1
	call &__ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_83
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 32
	ld i0,d4
	ld i1,[d4,20]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
.line 34
	ld i0,[d4,40]
	ld r14,[i0]
	ld d0,[r14,48]
	ld i1,#0x1
	call d0
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_6:
	ld r14,[r14,8]
LBE30_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB31_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB32_6:
.line 258
	ld r14,[r14]
LBE32_6:
.line 359
	jc le,r14,d2,&L59_6
L46_6:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB36_6:
	ld r14,[r14,8]
LBE36_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB37_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE37_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB42_6:
	ld r14,[r14,8]
LBE42_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB43_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE43_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB48_6:
	ld r14,[r14,8]
	add r14,#0x4
LBE48_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB52_6:
	ld r14,[r14,8]
	add r14,#0x4
LBE52_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB59_6:
	ld r14,[r14,8]
LBE59_6:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB60_6:
	ld r14,[r14,8]
	add r14,#0x8
LBE60_6:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
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
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
LBE67_6:
.line 115
	pop rt,fr
	ret
L69_6:
.line 113
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
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
	call &__ZNK4MAUI7EditBox7getTextEv_83
	ld d0,r14
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d1
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld d4,d0
	and d4,#0xff
	ld r14,#0x0
	jc ne,d4,r14,&L87_6
LBB78_6:
.line 129
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,&LC6_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d7,36]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffffc0
	add i1,fr
	call d0
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,d1
	ld i2,#0xffffffb8
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE80_6:
	ld i0,d1
	ld i1,[zr,_friend_with_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,#0xffffffbc
	add i1,fr
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,[zr,_phoneNumlbl_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,#0xffffffb0
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d5,fr
	add d5,#0xffffffac
	ld i0,d5
	ld i1,&LC9_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,#0xffffffcc
	add i1,fr
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,[d7,40]
	call &__ZNK4MAUI7EditBox7getTextEv_83
	ld i0,d2
	ld i1,d3
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d6,fr
	add d6,#0xffffffa8
	ld i0,d6
	ld i1,&LC10_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,d2
	ld i2,d6
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK4MAUI7EditBox7getTextEv_83
	ld i0,d6
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
.line 135
	ld i0,d6
	ld i1,&LC11_6
	ld i2,#0x8
	call &__ZN6MAUtil11BasicStringIcE6appendEPKci_70
.line 136
	ld i0,d5
	ld i1,#0xffffffc0
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0x8d0
	call &__Znwm_56
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 137
	ld i0,[d7,44]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 126
	ld d2,fr
	add d2,#0xffffffcc
	ld d3,fr
	add d3,#0xffffffc8
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,[zr,_phoneNumlbl_6]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,#0xffffffc4
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	add d1,#0xffffffec
	ld i0,d1
	ld i1,&LC8_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d3
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,[d7,36]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d2
	call d0
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd0
LBE90_6:
.line 137
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE92_6:
.line 56
	ld i0,d1
	call &__ZdlPv_55
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE111_6:
.line 56
	ld i0,d1
	call &__ZdlPv_55
	pop rt,d2
	ret
L173_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L93_6
L184_6:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L107_6
L182_6:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE184_6:
.line 56
	pop rt,d2
	ret
L272_6:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L192_6
L283_6:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d2
	jp &L206_6
L281_6:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_6
	ld i1,&LC13_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC14_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC15_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC16_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC17_6
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_6
	ld i1,&_URL_6
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6ScreenC2Ev_92
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
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_78
	ld i0,d0
	add i0,#0x64
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d0
	add i0,#0x8b8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d0
	add i0,#0x8bc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d0
	add i0,#0x8c0
	ld i1,[fr,4]
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x8c4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d0
	add i0,#0x8c8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d0
	add i0,#0x8cc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
.line 9
	ld r14,#0x0
	ld.b [d0,59],r14
.line 10
	ld i0,#0xc
	call &__Znwm_56
	ld d1,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d2,#0x0
LBB12_7:
	ld r14,[r14,8]
LBE12_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d0,40],d1
.line 15
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88
.line 16
	ld i0,[d0,40]
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
.line 17
	ld i0,[d0,40]
	ld r14,[i0]
	ld d1,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d1
.line 18
	ld i0,[d0,40]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_88
.line 19
	ld i0,[d0,36]
	ld r14,[i0]
	ld d1,[r14]
	ld i1,[d0,40]
	call d1
.line 21
	ld i0,d0
	ld i1,[d0,32]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB24_7:
	ld r14,[r14,8]
LBE24_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB25_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB26_7:
.line 258
	ld r14,[r14]
LBE26_7:
.line 359
	jc le,r14,d2,&L65_7
L52_7:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_7:
	ld r14,[r14,8]
LBE30_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB31_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB36_7:
	ld r14,[r14,8]
LBE36_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB37_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE37_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB42_7:
	ld r14,[r14,8]
	add r14,#0x4
LBE42_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB46_7:
	ld r14,[r14,8]
	add r14,#0x4
LBE46_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB53_7:
	ld r14,[r14,8]
LBE53_7:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB54_7:
	ld r14,[r14,8]
	add r14,#0x8
LBE54_7:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d4,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 108
	ld i0,#0xff
	call &__Znam_57
	ld d0,r14
.line 109
	ld i0,r14
	ld i1,d5
	ld i2,#0xff
	syscall 4
.line 110
	ld i0,&_TRADE_7
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d3,r14
	ld i0,d4
	add i0,#0x8c0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d2,r14
	ld i0,d1
	ld i1,[d4,52]
	call &__ZN4Card5getIdEv_15
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil14HttpConnection6createEPKci_78
	ld d0,r14
.line 115
	ld i0,d1
	ld i1,[d4,28]
	call &__ZN4Feed11getUsernameEv_14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,[zr,_auth_user_7]
	ld i2,r14
	call &__ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2__78
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 116
	ld i0,d1
	ld i1,[d4,28]
	call &__ZN4Feed10getEncryptEv_14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,[zr,_auth_pw_7]
	ld i2,r14
	call &__ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2__78
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 118
	jc lt,d0,d5,&L73_7
.line 121
	ld i0,d2
	call &__ZN6MAUtil14HttpConnection6finishEv_78
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
	call &__ZN6MAUtil10Connection5closeEv_78
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8b8
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x28
	call &__Znwm_56
	ld d1,r14
	ld i0,r14
	ld i1,[d2,28]
	ld i2,d0
	call &__ZN19TradeCompleteScreenC1EP4FeedN6MAUtil11BasicStringIcEE_8
	ld [d2,44],d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,40]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d5,d6
	add d5,#0x8b8
	ld i0,d5
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 42
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d4,d6
	add d4,#0x8bc
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 43
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d3,d6
	add d3,#0x8c4
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 44
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d2,d6
	add d2,#0x8c8
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 45
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d6
	add d1,#0x8cc
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	add i0,#0x8c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	add i0,#0x64
	call &__ZN13XmlConnectionD1Ev_3
LBB96_7:
.line 8
	ld i0,d6
	add i0,#0x3c
LBB97_7:
	ld r0,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r0
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE97_7:
	ld i0,d6
	call &__ZN4MAUI6ScreenD2Ev_92
LBE77_7:
.line 46
	ld i0,d6
	call &__ZdlPv_55
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L118_7
L207_7:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L132_7
L205_7:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d5,d6
	add d5,#0x8b8
	ld i0,d5
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 42
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d4,d6
	add d4,#0x8bc
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 43
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d3,d6
	add d3,#0x8c4
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 44
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d2,d6
	add d2,#0x8c8
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 45
	ld i0,d0
	ld i1,&LC12_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d6
	add d1,#0x8cc
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	add i0,#0x8c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	add i0,#0x64
	call &__ZN13XmlConnectionD1Ev_3
LBB170_7:
.line 8
	ld i0,d6
	add i0,#0x3c
LBB171_7:
	ld r0,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r0
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE171_7:
	ld i0,d6
	call &__ZN4MAUI6ScreenD2Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L215_7
L304_7:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L229_7
L302_7:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_7
	ld i1,&LC14_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC15_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC16_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC17_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC18_7
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_7
	ld i1,&_URL_7
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6ScreenC2Ev_92
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB11_8:
	ld r14,[r14,8]
LBE11_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,#0x0
	jc ne,r14,r0,&L19_8
	ld d3,fr
	add d3,#0xffffffe4
	ld i0,d3
	ld i1,[zr,_card_sent_message_8]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
L20_8:
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d1,28],d0
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 11
	ld i0,[d1,28]
	ld i1,#0x1
	call &__ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88
.line 12
	ld i0,[d1,28]
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
.line 13
	ld i0,[d1,28]
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,[zr,_gSkinBack_4]
	call d0
.line 14
	ld i0,[d1,28]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_88
.line 15
	ld i0,[d1,24]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d1,28]
	call d0
.line 17
	ld i0,d1
	ld i1,[d1,20]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB24_8:
	ld r14,[r14,8]
LBE24_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB25_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB26_8:
.line 258
	ld r14,[r14]
LBE26_8:
.line 359
	jc le,r14,d2,&L59_8
L46_8:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_8:
	ld r14,[r14,8]
LBE30_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB31_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE31_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB35_8:
	ld r14,[r14,8]
LBE35_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB36_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE36_8:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB40_8:
	ld r14,[r14,8]
LBE40_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB41_8:
	ld r14,[r14,8]
	add r14,#0x8
LBE41_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB46_8:
	ld r14,[r14,8]
	add r14,#0x4
LBE46_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB50_8:
	ld r14,[r14,8]
	add r14,#0x4
LBE50_8:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
LBE60_8:
.line 95
	pop rt,fr
	ret
L67_8:
.line 93
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc ne,i0,r2,&L157_8
L130_8:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_92
LBE64_8:
.line 37
	ld i0,d2
	call &__ZdlPv_55
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc eq,i0,r2,&L130_8
L157_8:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_92
LBE83_8:
.line 37
	ld i0,d2
	call &__ZdlPv_55
	add sp,#0x4
	pop rt,d2
	ret
L152_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L78_8
L160_8:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L92_8
L158_8:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc ne,i0,r2,&L247_8
L220_8:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_92
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d2
	add d1,#0x20
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 36
	ld i0,[d2,28]
	ld r2,#0x0
	jc eq,i0,r2,&L220_8
L247_8:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_92
LBE156_8:
.line 37
	add sp,#0x4
	pop rt,d2
	ret
L242_8:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L168_8
L250_8:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L182_8
L248_8:
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_8
	ld i1,&LC4_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC5_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC6_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC7_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC8_8
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_8
	ld i1,&_URL_8
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	jc eq,d1,r14,&L10_9
LBB3_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
L10_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc ne,r14,r1,&L24_9
.line 66
	ld.b r1,[i0,2325]
	and r1,#0xff
	jc eq,r1,r14,&L20_9
.line 67
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 69
	call d0
L17_9:
.line 71
	pop rt,d0
	ret
L20_9:
.line 68
	ld.b r14,[i0,2324]
	and r14,#0xff
	jc eq,r14,r1,&L17_9
.line 69
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L17_9
L24_9:
.line 65
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 69
	call d0
	jp &L17_9

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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d0,d1
	add d0,#0x910
	ld i0,d0
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 76
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed8setTouchEPKc_14
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L55_9
L26_9:
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
	jp &L30_9
L42_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB18_9:
	ld r14,[r14,8]
LBE18_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB19_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE19_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc ne,r14,r0,&L56_9
Ltext15_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 85
	add d2,#0x1
L30_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB24_9:
	ld r14,[r14,8]
LBE24_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB25_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB26_9:
.line 258
	ld r14,[r14]
LBE26_9:
.line 359
	jc gt,r14,d2,&L42_9
LBE14_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 94
	ld d2,#0x0
	jp &L43_9
L54_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_9:
	ld r14,[r14,8]
	add r14,#0x4
LBE30_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc ne,r14,r0,&L57_9
Ltext19_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 94
	add d2,#0x1
L43_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB34_9:
	ld r14,[r14,8]
	add r14,#0x4
LBE34_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB35_9:
.line 258
	ld r14,[r14]
LBE35_9:
.line 359
	jc gt,r14,d2,&L54_9
	jp &L25_9
L56_9:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB39_9:
	ld r14,[r14,8]
LBE39_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB40_9:
	ld r14,[r14,8]
	add r14,#0x8
LBE40_9:
	ld i0,[r14]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
Ltext21_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 90
	ld r14,#0x1
	ld.b [d1,2324],r14
L25_9:
.line 106
	add sp,#0xc
	pop rt,d4
	ret
L55_9:
.line 77
	ld i0,d4
	ld i1,[d1,2332]
	call &__ZN4Feed6getAllEv_14
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[zr,_FEED_9]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L26_9
L57_9:
.line 98
	jc ne,d2,r0,&L51_9
.line 99
	ld r14,#0x1
	ld.b [d1,2325],r14
LBE43_9:
.line 106
	add sp,#0xc
	pop rt,d4
	ret
L51_9:
.line 100
	ld r0,#0x2
	jc ne,d2,r0,&L25_9
.line 101
	ld r14,#0x1
	ld.b [d1,2326],r14
	jp &L25_9

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
.line 355
	ld i0,[i0,40]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d1,40]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__ZN4MAUI6Screen4showEv_92
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
.line 355
	ld i0,[i0,40]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d1,40]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__ZN4MAUI6Screen4hideEv_92
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
	call &__ZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUID_69
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
.line 258
	ld r0,i0
	add r0,#0x7c
LBB58_9:
	ld r14,[r0]
LBE58_9:
	jc le,r14,r1,&L69_9
LBB59_9:
.line 355
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
L69_9:
.line 146
	ld d0,fr
	add d0,#0xffffffe4
	ld i0,d0
	ld i1,&LC15_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d1,44]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
LBB64_9:
.line 159
	case d0,#0x111,#0xd,#L82_9,#L73_9
.data
	.align 4
L82_9:
	.word L80_9
	.word L80_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L73_9
	.word L78_9
	.word L76_9


.code
L80_9:
.line 178
	ld i0,[d1,40]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
L73_9:
.line 183
	add sp,#0x108
	pop rt,d2
	ret
L76_9:
.line 163
	ld d2,fr
	add d2,#0xffffffe8
	ld i0,d2
	ld i1,&LC16_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d1,48]
	ld i1,d2
	call &__ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_83
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBB70_9:
.line 165
	ld.b r14,[d1,2340]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L73_9
LBB71_9:
.line 166
	ld r14,#0x1
	ld.b [d1,2340],r14
.line 167
	ld i0,#0xc
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN6MAUtil19BluetoothDiscovererC1Ev_71
	ld [d1,120],d0
.line 169
	ld i0,d0
	ld i1,d1
	add i1,#0x10
	ld i2,#0x1
	call &__ZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEb_71
	ld d0,fr
	add d0,#0xfffffee8
	ld [sp],r14
	ld i0,d0
	ld i1,&LC17_9
	call &_sprintf_37
.line 170
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d1,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d2
	call d0
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L73_9
L78_9:
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
	jc eq,i2,r0,&L86_9
	ld r14,#0x1
	jc eq,i2,r14,&L86_9
.line 190
	ld r14,#0x14
	jc eq,i2,r14,&L96_9
.line 197
	ld d0,fr
	add d0,#0xfffff788
	ld i0,d0
	ld i1,[zr,_no_connect_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,44]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 198
	ld r14,#0x0
	ld.b [d2,2340],r14
L84_9:
.line 200
	add sp,#0x870
	pop rt,d3
	ret
L96_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 258
	ld r1,i0
	add r1,#0x7c
LBB75_9:
	ld r14,[r1]
LBE75_9:
	ld r0,[i0,140]
	jc le,r14,r0,&L84_9
LBB76_9:
.line 355
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
	jp &L84_9
L86_9:
.line 187
	ld i0,[d2,48]
	call &__ZNK4MAUI7EditBox7getTextEv_83
	ld i0,r14
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,r14
	ld i0,[d2,48]
	call &__ZNK4MAUI7EditBox7getTextEv_83
	ld i0,r14
	call &__ZNK6MAUtil11BasicStringIcE4sizeEv_70
	ld i0,d2
	add i0,#0x34
	ld i1,d0
	ld i2,r14
	call &__ZN6MAUtil10Connection5writeEPKvi_78
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8e4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_username_9]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L111_9
.line 222
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x904
L120_9:
.line 230
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L110_9:
.line 232
	add sp,#0x4
	pop rt,d2
	ret
L111_9:
.line 223
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_credits_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L110_9
.line 225
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_email_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L110_9
.line 227
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_handle_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L110_9
.line 229
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_error_9]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L110_9
.line 230
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x90c
	jp &L120_9

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
	jc eq,r14,r0,&L130_9
.line 243
	ld i0,d0
	ld i1,[zr,_xml_error_9]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L131_9
.line 248
	ld.b r0,[d1,2327]
	and r0,#0xff
	ld r14,#0x0
	jc ne,r0,r14,&L122_9
.line 249
	ld r14,[d1,44]
	jc eq,r14,r0,&L122_9
.line 250
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	ld i1,&LC18_9
	jp &L129_9
L131_9:
.line 244
	ld r14,#0x1
	ld.b [d1,2327],r14
.line 245
	ld d0,d1
	add d0,#0x90c
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed15setUnsuccessfulEPKc_14
.line 246
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	ld i1,r14
L129_9:
.line 250
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d1,44]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L122_9:
.line 254
	add sp,#0x4
	pop rt,d1
	ret
L130_9:
.line 236
	ld i0,[d1,2332]
	ld i1,[zr,_success_9]
	call &__ZN4Feed15setUnsuccessfulEPKc_14
.line 237
	ld i0,d1
	add i0,#0x910
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed8setTouchEPKc_14
.line 238
	ld d0,fr
	add d0,#0xffffffec
	ld i0,d0
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x90c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 239
	ld i0,d0
	ld i1,[d1,2332]
	call &__ZN4Feed6getAllEv_14
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[zr,_FEED_9]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 240
	ld i0,[zr,_ALBUM_9]
	call &__Z7getDataPKc_4
	ld i0,[d1,2332]
	ld i1,r14
	call &__ZN4Feed8setAlbumEPKc_14
.line 241
	ld i0,#0x8d4
	call &__Znwm_56
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
	ld r14,&__ZTV5Login_9+152
	ld [i0,12],r14
	ld r14,&__ZTV5Login_9+176
	ld [i0,16],r14
	ld r14,&__ZTV5Login_9+192
	ld [i0,20],r14
	ld r14,&__ZTV5Login_9+204
	ld [i0,24],r14
	ld r14,&__ZTV5Login_9+248
	ld [i0,28],r14
	add i0,#0x910
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x90c
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x908
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x904
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x900
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8fc
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8f8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8f4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8f0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8ec
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8e8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8e4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x90
	call &__ZN13XmlConnectionD1Ev_3
LBB89_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 135
	ld d2,d1
	add d2,#0x7c
LBB90_9:
.line 136
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L183_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
	jc eq,i0,d0,&L178_9
L186_9:
	add d0,#0xfffffff4
LBB91_9:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
LBE92_9:
	jc ne,i0,d0,&L186_9
L178_9:
	add i0,#0xfffffffc
	call &__ZdaPv_54
L183_9:
	ld i0,d1
	add i0,#0x34
	call &__ZN6MAUtil19BluetoothConnectionD1Ev_69
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_92
LBE88_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 42
	ld i0,d1
	call &__ZdlPv_55
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
	ld r14,&__ZTV5Login_9+152
	ld [i0,12],r14
	ld r14,&__ZTV5Login_9+176
	ld [i0,16],r14
	ld r14,&__ZTV5Login_9+192
	ld [i0,20],r14
	ld r14,&__ZTV5Login_9+204
	ld [i0,24],r14
	ld r14,&__ZTV5Login_9+248
	ld [i0,28],r14
	add i0,#0x910
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x90c
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x908
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x904
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x900
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8fc
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8f8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8f4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8f0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8ec
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8e8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x8e4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	add i0,#0x90
	call &__ZN13XmlConnectionD1Ev_3
LBB94_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 135
	ld d2,d1
	add d2,#0x7c
LBB95_9:
.line 136
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L199_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
	jc eq,i0,d0,&L194_9
L202_9:
	add d0,#0xfffffff4
LBB96_9:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
LBE97_9:
	jc ne,i0,d0,&L202_9
L194_9:
	add i0,#0xfffffffc
	call &__ZdaPv_54
L199_9:
	ld i0,d1
	add i0,#0x34
	call &__ZN6MAUtil19BluetoothConnectionD1Ev_69
	ld i0,d1
	call &__ZN4MAUI6ScreenD2Ev_92
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
	call &__ZN4MAUI6ScreenC2Ev_92
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
	ld r0,&__ZTV5Login_9+152
	ld [d6],r0
	ld r14,&__ZTV5Login_9+176
	ld [d3,16],r14
	ld r0,&__ZTV5Login_9+192
	ld [d3,20],r0
	ld r14,&__ZTV5Login_9+204
	ld [d3,24],r14
	ld r0,&__ZTV5Login_9+248
	ld [i1],r0
	ld i0,d3
	add i0,#0x34
	call &__ZN6MAUtil19BluetoothConnectionC1EPNS_18ConnectionListenerE_69
LBB106_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 104
	ld d2,d3
	add d2,#0x7c
LBB107_9:
.line 109
	ld i0,#0x34
	call &__Znam_57
	ld d4,r14
	add d4,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d4
	ld d1,#0x3
L229_9:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
LBE109_9:
	add d0,#0xc
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L229_9
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
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x8e8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x8ec
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x8f0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x8f4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x8f8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x8fc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x900
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x904
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x908
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d3
	add i0,#0x90c
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld d7,d3
	add d7,#0x910
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
LBB110_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,[d3,36]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB112_9:
	ld r14,[r14,8]
LBE112_9:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d3,44],d0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 20
	ld i0,[d3,40]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d3,44]
	call d0
.line 22
	ld i0,d4
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d4
	ld i1,#0x30
	call &__Z15createEditLabelN6MAUtil11BasicStringIcEEi_4
	ld [d3,44],r14
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 23
	ld i0,[d3,44]
	call &__ZNK4MAUI6Widget8getWidthEv_93
	ld d2,r14
	add d2,#0xfffffff6
	ld i0,[d3,44]
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld d0,r14
	add d0,#0xfffffff6
	ld i0,d4
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xd4
	call &__Znwm_56
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
	call &__ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE_83
	ld [d3,48],d1
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 24
	ld i0,[d3,48]
	ld i1,#0x0
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_83
.line 25
	ld i0,[d3,48]
	ld i1,#0x0
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
.line 26
	ld i0,[d3,44]
	ld i1,d6
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
.line 27
	ld i0,[d3,40]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d3,44]
	call d0
.line 29
	ld i0,d4
	ld i1,&LC18_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0x9c
	call &__Znwm_56
	ld d0,r14
	ld i3,[zr,_scrWidth_4]
	ld r14,[zr,_scrHeight_4]
	ld r0,#0x0
	jc lt,r14,r0,&L238_9
L233_9:
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d3,44],d0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 30
	ld i0,[d3,44]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_88
.line 31
	ld i0,[d3,40]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d3,44]
	call d0
.line 33
	ld i0,[d3,40]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
.line 35
	ld i0,d4
	ld i1,d5
	call &__ZN4Feed15getUnsuccessfulEv_14
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i1,[zr,_success_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d4
	ld i1,d1
	call &__ZNK6MAUtil11BasicStringIcEneERKS1__70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	and d0,#0xff
	add d1,#0xfffffffc
	ld r14,#0x0
	jc ne,d0,r14,&L239_9
.line 38
	ld i0,d1
	ld i1,[zr,_falsesz_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 39
	ld i0,d3
	ld i1,[d3,36]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
LBE103_9:
	add sp,#0x30
	pop rt,d7
	ret
L239_9:
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 38
	ld i0,d1
	ld i1,[zr,_falsesz_9]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 39
	ld i0,d3
	ld i1,[d3,36]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
LBE114_9:
	add sp,#0x30
	pop rt,d7
	ret
L238_9:
.line 29
	add r14,#0x7
	jp &L233_9

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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 133
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,&LC20_9
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L318_9
LBE130_9:
.line 137
	add sp,#0x108
	pop rt,d6
	ret
L318_9:
.line 134
	ld i0,d1
	ld i1,&LC21_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,44]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBB133_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 160
	add d2,#0x7c
LBB134_9:
.line 161
	ld r1,[d2,4]
	ld r14,r1
	add r14,#0xffffffff
	ld r0,[d2]
	jc lt,r0,r14,&L313_9
.line 162
	ld r14,#0x0
	jc eq,r1,r14,&L266_9
LBB135_9:
.line 286
	ld d5,r1
	add d5,r1
LBB136_9:
.line 288
	jc lt,r1,d5,&L319_9
L313_9:
	ld i0,[d2,8]
L265_9:
.line 167
	ld d0,r0
	mul d0,#0xc
	add d0,i0
	add r0,#0x1
	ld [d2],r0
LBB139_9:
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
L319_9:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,d5
	mul i0,#0xc
	add i0,#0x4
	call &__Znam_57
	ld d6,r14
	add d6,#0x4
	ld [r14],d5
	ld d1,d6
	ld d0,d5
	jp &L314_9
L320_9:
.line 109
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
LBE148_9:
.line 291
	add d1,#0xc
L314_9:
	add d0,#0xffffffff
	ld r0,#0xffffffff
	jc ne,d0,r0,&L320_9
LBB149_9:
.line 293
	ld d4,#0x0
L315_9:
	ld r0,[d2]
	jc le,r0,d4,&L309_9
LBB150_9:
.line 167
	ld r14,d4
	mul r14,#0xc
	ld d1,r14
	add d1,d6
	ld d0,[d2,8]
	add d0,r14
LBB151_9:
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
.line 293
	add d4,#0x1
	jp &L315_9
L266_9:
.line 291
	ld i0,#0x34
	call &__Znam_57
	ld d5,r14
	add d5,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d5
	ld d1,#0x3
L289_9:
	ld r14,#0xffffffff
	jc eq,d1,r14,&L290_9
LBB155_9:
.line 109
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
LBE156_9:
.line 291
	add d0,#0xc
	add d1,#0xffffffff
	jp &L289_9
L290_9:
.line 293
	ld d4,#0x0
L316_9:
	ld r0,[d2]
	jc le,r0,d4,&L311_9
LBB158_9:
.line 167
	ld r14,d4
	mul r14,#0xc
	ld d1,r14
	add d1,d5
	ld d0,[d2,8]
	add d0,r14
LBB159_9:
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
.line 293
	add d4,#0x1
	jp &L316_9
L311_9:
.line 297
	ld r14,#0x4
	ld [d2,4],r14
.line 298
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L300_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
L301_9:
	jc eq,i0,d0,&L302_9
	add d0,#0xfffffff4
LBB160_9:
.line 136
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
	jp &L301_9
L302_9:
	add i0,#0xfffffffc
	call &__ZdaPv_54
	ld r0,[d2]
L300_9:
.line 300
	ld i0,d5
	ld [d2,8],i0
	jp &L265_9
L309_9:
.line 297
	ld [d2,4],d5
.line 298
	ld i0,[d2,8]
	ld r14,#0x0
	jc eq,i0,r14,&L280_9
	ld d0,[i0,-4]
	mul d0,#0xc
	add d0,i0
L281_9:
	jc eq,i0,d0,&L282_9
	add d0,#0xfffffff4
LBB165_9:
.line 136
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
	jp &L281_9
L282_9:
	add i0,#0xfffffffc
	call &__ZdaPv_54
	ld r0,[d2]
L280_9:
.line 300
	ld i0,d6
LBE164_9:
	ld [d2,8],i0
	jp &L265_9

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
	jc eq,i1,r14,&L357_9
L321_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 321
	add sp,#0x4
	pop rt,d0
	ret
L357_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L358_9
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L321_9
	ld i0,&_TRADE_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_9
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L359_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Login.cpp'
.line 321
	add sp,#0x4
	pop rt,d0
	ret
L358_9:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_9
	ld i1,&LC22_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_9
	ld i1,&LC23_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC24_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC25_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC26_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC27_9
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_9
	ld i1,&_URL_9
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L359_9

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
	call &__ZN4MAUI6ScreenC2Ev_92
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
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_92
	ld [d1,16],d0
.line 9
	ld i0,[zr,_back_10]
	call &__Z17createImageLayoutPKc_4
	ld i0,r14
	ld [d1,36],r14
LBB11_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB13_10:
	ld r14,[r14,8]
LBE13_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB14_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE14_10:
	ld i0,[r14]
	ld [d1,40],i0
Ltext9_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 11
	call &__ZNK4MAUI6Widget9getHeightEv_93
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
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB16_10:
	ld r14,[r14,8]
LBE16_10:
	ld i0,[r14]
	ld [d1,40],i0
Ltext11_10:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\ImageScreen.cpp'
.line 19
	call &__ZNK4MAUI6Widget9getHeightEv_93
	ld [d1,44],r14
L20_10:
.line 21
	ld i0,#0x84
	call &__Znwm_56
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
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_86
	ld [d1,32],d0
.line 23
	ld i0,d1
	ld i1,[d1,36]
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
.line 25
	ld r0,#0x0
	jc eq,d3,r0,&L17_10
.line 26
	ld r14,d5
	and r14,#0xff
	jc eq,r14,r0,&L25_10
.line 27
	ld i0,#0x44c
	call &__Znwm_56
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
	call &__Znwm_56
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_10:
	ld r14,[r14]
LBE30_10:
	jc le,r14,d2,&L83_10
L64_10:
.line 355
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB38_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE38_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB42_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE42_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB51_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE51_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB55_10:
	ld r14,[r14,8]
	add r14,#0x4
LBE55_10:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__Znwm_56
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
	call &__ZNK4MAUI5Image11getResourceEv_86
	ld r0,#0xc
	jc eq,r14,r0,&L99_10
.line 146
	ld i0,[d1,32]
	call &__ZNK4MAUI5Image11getResourceEv_86
	ld i0,r14
	syscall 59
L99_10:
.line 148
	ld i0,[d1,32]
	ld i1,#0xc
	call &__ZN4MAUI5Image11setResourceEi_86
.line 149
	ld i0,[d1,32]
	ld r14,[i0]
	ld d0,[r14,12]
	call d0
.line 150
	ld i0,[d1,32]
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 151
	syscall 44
.line 152
	ld.b r14,[d1,48]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L100_10
.line 153
	ld i0,#0x44c
	call &__Znwm_56
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
	call &__Znwm_56
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
	call &__ZNK4MAUI5Image11getResourceEv_86
	ld r0,#0xc
	jc eq,r14,r0,&L108_10
.line 111
	ld i0,[d1,32]
	call &__ZNK4MAUI5Image11getResourceEv_86
	ld i0,r14
	syscall 59
L108_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE71_10:
.line 126
	ld i0,d1
	call &__ZdlPv_55
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE81_10:
.line 126
	ld i0,d1
	call &__ZdlPv_55
	pop rt,d2
	ret
L143_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZNK4MAUI5Image11getResourceEv_86
	ld r0,#0xc
	jc eq,r14,r0,&L153_10
.line 111
	ld i0,[d1,32]
	call &__ZNK4MAUI5Image11getResourceEv_86
	ld i0,r14
	syscall 59
L153_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,d1
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN4MAUI6ScreenD2Ev_92
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
	call &__ZN4MAUI6ScreenD2Ev_92
LBE102_10:
.line 126
	pop rt,d2
	ret
L188_10:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r2
	call &__Znam_57
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
	call &__ZdaPv_54
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_10
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_10
	ld i1,&LC5_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC6_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC7_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC8_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC9_10
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_10
	ld i1,&_URL_10
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d3]
	ld i1,r14
	call &__ZN4Card8setThumbEPKc_15
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 26
	ld i0,d1
	ld i1,[d3]
	call &__ZN4Card5getIdEv_15
	ld i0,d2
	ld i1,&LC1_11
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d4
	ld i1,d1
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
LBB9_11:
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
LBE9_11:
.line 32
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d3]
	ld i1,r14
	call &__ZN4Card8setFrontEPKc_15
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 29
	ld i0,d2
	ld i1,[d3]
	call &__ZN4Card5getIdEv_15
	ld i0,d1
	ld i1,&LC2_11
L23_11:
.line 32
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d4
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
LBB12_11:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d3]
	ld i1,r14
	call &__ZN4Card7setBackEPKc_15
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_78
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
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [d0],r14
	ld i0,d0
	call &__ZN6MAUtil10ConnectionD2Ev_78
.line 42
	add d0,#0xfffffffc
	ld i0,d0
	ld i1,[d1,1096]
	call &__ZN17ImageCacheRequest6getUrlEv_11
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,r14
	ld i2,#0x1
	call &__ZN6MAUtil14HttpConnection6createEPKci_78
	ld d1,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 43
	ld r14,#0x0
	jc lt,d1,r14,&L1_12
.line 46
	ld i0,d2
	call &__ZN6MAUtil14HttpConnection6finishEv_78
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
	call &__Znwm_56
	ld d2,r14
	ld i0,r14
	ld i1,&LC0_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 64
	ld d3,d1
	add d3,#0x10
	ld i0,d3
	ld i1,&LC1_12
	ld i2,d2
	call &__ZN6MAUtil14HttpConnection17getResponseHeaderEPKcPNS_11BasicStringIcEE_78
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
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
	call &__ZN6MAUtil10Connection4recvEPvi_78
LBE15_12:
.line 84
	pop rt,d3
	ret
L26_12:
.line 73
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZdlPv_55
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
	call &__ZN6MAUtil10Connection4recvEPvi_78
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
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r14
	call &__ZN6MAUtil10ConnectionD2Ev_78
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
	call &__ZdaPv_54
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
	call &__Znam_57
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
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_78
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
	call &__Znam_57
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
	call &__Znam_57
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
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d2
	jp &L90_12
L93_12:
.line 298
	call &__ZdaPv_54
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[d1,1084]
	call &__Z8saveFilePKci_4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__Znam_57
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
	call &__ZdlPv_55
	jp &L98_12
L127_12:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
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
	call &__ZN6MAUtil10Connection4recvEPvi_78
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_12
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_12
	ld i1,&LC3_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC4_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC5_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC6_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC7_12
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_12
	ld i1,&_URL_12
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcEltERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__70
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
	call &_dict_free_nodes_61
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0xb0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0xac
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE8_13:
	ld r14,&__ZTVN6MAUtil6MobletE_75+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+60
	ld [d0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+96
	ld [d0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+124
	ld [d0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+136
	ld [d0,160],r14
	ld i0,d0
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_62
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_62
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_62
LBE14_13:
.line 36
	ld i0,d0
	call &__ZdlPv_55
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0xb0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0xac
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE17_13:
	ld r14,&__ZTVN6MAUtil6MobletE_75+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+60
	ld [d0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+96
	ld [d0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+124
	ld [d0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+136
	ld [d0,160],r14
	ld i0,d0
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_62
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_62
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_62
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
	call &_dict_init_61
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
	call &__ZN6MAUtil6MobletC2Ev_75
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
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d1
	add i0,#0xac
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d1
	add i0,#0xb0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d1
	add i0,#0xb4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,#0x2
	call &__ZN4MAUI4FontC1Ei_85
	ld [zr,_gFontWhite_4],d0
.line 13
	ld i0,#0xc4
	call &__Znwm_56
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
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_94
	ld [zr,_gSkinEditBox_4],d0
.line 14
	ld i0,#0xc4
	call &__Znwm_56
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
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_94
	ld [zr,_gSkinButton_4],d0
.line 15
	ld i0,#0xc4
	call &__Znwm_56
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
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_94
	ld [zr,_gSkinBack_4],d0
.line 16
	ld i0,#0xc4
	call &__Znwm_56
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
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_94
	ld [zr,_gSkinList_4],d0
.line 17
	ld i0,#0xc4
	call &__Znwm_56
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
	call &__ZN4MAUI10WidgetSkinC1Eiiiiiibb_94
	ld [zr,_gSkinAlbum_4],d0
.line 18
	call &__ZN4MAUI6Engine12getSingletonEv_84
	ld d0,r14
.line 19
	ld i0,r14
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI6Engine14setDefaultFontEPNS_4FontE_84
.line 20
	ld i0,d0
	ld i1,[zr,_gSkinBack_4]
	call &__ZN4MAUI6Engine14setDefaultSkinEPNS_10WidgetSkinE_84
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
	call &__Znwm_56
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
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN10MAUIMobletC1Ev_13
	ld i0,d0
	call &__ZN6MAUtil6Moblet3runEPS0__75
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_13
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_13
	ld i1,&LC1_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC2_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC3_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC4_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC5_13
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_13
	ld i1,&_URL_13
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d2
	add d1,#0xc
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 14
	ld i0,d0
	ld i1,[zr,_truesz_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__70
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed15setTouchEnabledEb_14
	ld d1,r14
	and d1,#0xff
LBB5_14:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,d0
	add i1,#0x4
	ld i2,#0xffffffbc
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,#0xffffffc0
	add i1,fr
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d2,fr
	add d2,#0xffffffb8
	ld i0,d2
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d6
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d5
	ld i1,d6
	ld i2,d0
	add i2,#0x8
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d1,fr
	add d1,#0xffffffb4
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d4
	ld i1,d5
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d3
	ld i1,d4
	ld i2,d0
	add i2,#0xc
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d0,fr
	add d0,#0xffffffb0
	ld i0,d0
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d7
	ld i1,d3
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
LBB14_14:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 66
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 67
	ld r14,#0xffffffff
	jc le,d0,r14,&L18_14
.line 68
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed11setUsernameEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 70
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed10setEncryptEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 72
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 74
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed15setUnsuccessfulEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 76
	ld i0,d1
	ld i1,[zr,_delim_14]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d3
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	ld i1,r14
	call &__ZN4Feed8setTouchEPKc_14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 78
	ld i0,d1
	ld i1,d3
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	jc le,r14,d4,&L21_14
	ld d0,fr
	add d0,#0xffffffd4
	ld i0,d0
	ld i1,d2
	call &__ZN4Feed10getEncryptEv_14
	ld d4,#0x1
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,#0x0
	jc le,r14,r0,&L21_14
L25_14:
	ld i0,fr
	add i0,#0xffffffd4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld r14,d5
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L27_14
L24_14:
.line 90
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcEltERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__70
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
	call &_dict_free_nodes_61
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
	call &_dict_init_61
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
	call &_dict_first_61
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x1c
	ld i1,d1
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &_dict_next_61
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
	call &_dict_load_begin_61
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d2,fr
	add d2,#0xffffffa8
	ld i0,d2
	ld i1,d0
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
LBE47_14:
	ld i0,#0x20
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5__14
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 65
	ld i0,d6
	ld i1,d0
	add d0,#0x18
	ld i2,[d4,52]
	add i2,d0
	call &_dict_load_next_61
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
	call &_dict_load_end_61
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_14
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_14
	ld i1,&LC6_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC7_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC8_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC9_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC10_14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_14
	ld i1,&_URL_14
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0xc
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x10
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x14
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x18
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x1c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffa0
	add i0,fr
	ld i1,#0xffffff9c
	add i1,fr
	ld i2,#0xffffff98
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff90
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffa8
	add i0,fr
	ld i1,#0xffffffa4
	add i1,fr
	ld i2,#0xffffff90
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff88
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,#0xffffffac
	add i1,fr
	ld i2,#0xffffff88
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff80
	add i0,fr
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,#0xffffffb4
	add i1,fr
	ld i2,#0xffffff80
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d6,fr
	add d6,#0xffffff78
	ld i0,d6
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,#0xffffffbc
	add i1,fr
	ld i2,d6
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d4,fr
	add d4,#0xffffff70
	ld i0,d4
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffc8
	add i0,fr
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,d4
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d2,fr
	add d2,#0xffffff68
	ld i0,d2
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,#0xffffffcc
	add i1,fr
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
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
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d0,fr
	add d0,#0xffffff60
	ld i0,d0
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-164]
	ld i1,#0xffffffd4
	add i1,fr
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
LBB20_15:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff80
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff84
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff88
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffac
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffa8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff90
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffa4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff94
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffa0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff98
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 80
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 81
	ld r0,#0xffffffff
	jc le,d0,r0,&L21_15
.line 82
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card11setQuantityEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 83
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 84
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 85
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card7setTextEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 86
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 87
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 88
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card8setThumbEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 89
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 90
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 91
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card8setFrontEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 92
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 93
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 94
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card7setBackEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 95
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 96
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 97
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card5setIdEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 98
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 99
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 100
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card7setRateEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 101
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 102
	ld i0,d1
	ld i1,[zr,_delim_15]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d1
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d0,r14
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 103
	ld i3,d0
	add d0,#0x1
	ld i0,d1
	ld i1,d2
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN4Card8setValueEPKc_15
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 104
	ld i0,d1
	ld i1,d2
	ld i2,d0
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	jc le,r14,d4,&L24_15
	ld d0,fr
	add d0,#0xffffffd4
	ld i0,d0
	ld i1,d3
	call &__ZN4Card11getQuantityEv_15
	ld d4,#0x1
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,#0x0
	jc le,r14,r0,&L24_15
L28_15:
	ld i0,fr
	add i0,#0xffffffd4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld r14,d5
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L32_15
L27_15:
.line 120
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_15
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_15
	ld i1,&LC3_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC4_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC5_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC6_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC7_15
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_15
	ld i1,&_URL_15
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &_dict_first_61
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
	call &_dict_lookup_61
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
.line 28
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &_dict_free_nodes_61
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
	call &_dict_next_61
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
	call &__Znam_57
	ld d3,r14
	add d3,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d3
	ld d1,#0x3
L35_16:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
LBE34_16:
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__Znam_57
	ld d4,r14
	add d4,#0x4
	ld [r14],d3
	ld d1,d4
	ld d0,d3
	jp &L81_16
L87_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
	jc ne,i0,d0,&L89_16
L55_16:
	add i0,#0xfffffffc
	call &__ZdaPv_54
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
	call &__Znam_57
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
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
	jc ne,i0,d0,&L92_16
L70_16:
	add i0,#0xfffffffc
	call &__ZdaPv_54
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
	call &__Znam_57
	ld d3,r14
	add d3,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d3
	ld d1,#0x3
L97_16:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
LBE57_16:
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__Znam_57
	ld d4,r14
	add d4,#0x4
	ld [r14],d3
	ld d1,d4
	ld d0,d3
	jp &L143_16
L149_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
	jc ne,i0,d0,&L151_16
L117_16:
	add i0,#0xfffffffc
	call &__ZdaPv_54
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
	call &__Znam_57
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
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d2,8]
	jc ne,i0,d0,&L154_16
L132_16:
	add i0,#0xfffffffc
	call &__ZdaPv_54
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,fr
	add d0,#0xffffffd0
	ld i0,d0
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 17
	ld i0,d0
	ld i1,[zr,_delim_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 18
	ld i0,d2
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8IteratorptEv_16
	ld i0,r14
	add i0,#0x4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d0
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 19
	ld i0,d0
	ld i1,[zr,_newline_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x1c
	ld i1,d1
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d1,fr
	add d1,#0xffffffe0
	ld i0,d1
	ld i1,d2
	add i1,#0x4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
LBE83_16:
	ld i0,#0x20
	call &__Znwm_56
	ld d2,r14
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE8DictNodeC1ES5__16
Ltext24_16:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
Ltext25_16:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 87
	ld i0,d2
	ld i1,#0x0
	call &_dnode_init_61
.line 88
	ld d1,d2
	add d1,#0x18
.line 90
	ld i0,d3
	ld i1,d2
	ld i2,[d3,52]
	add i2,d1
	call &_dict_insert_61
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE89_16:
	ld i0,d2
	call &__ZdlPv_55
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d2,fr
	add d2,#0xffffffd0
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
LBB92_16:
.line 48
	ld r14,#0x0
	ld [fr,-56],r14
	ld [fr,-52],r14
	ld d0,fr
	add d0,#0xffffffc8
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d1,fr
	add d1,#0xffffffcc
	ld i0,d1
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,fr
	add i0,#0xffffffd8
	ld i1,d4
	ld i2,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE6insertERKS5__16
LBB94_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE96_16:
.line 47
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 39
	ld d7,fr
	add d7,#0xffffffd0
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
.line 40
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld d6,fr
	add d6,#0xffffffc4
	jp &L186_16
L188_16:
.line 48
	ld i0,d4
	ld i1,d5
	ld i2,d2
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d5
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L186_16:
	ld i0,d6
	ld i1,[zr,_newline_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d5
	ld i1,d6
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d2,r14
	ld d1,r14
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,d7
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 43
	ld i0,d0
	ld i1,[zr,_delim_16]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d7
	ld i1,d0
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d1,r14
	ld d3,r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,#0xffffffc8
	add i0,fr
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 45
	ld i0,d4
	ld i1,d7
	ld i2,d1
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d1,fr
	add d1,#0xffffffac
	ld i0,d1
	ld i1,#0xffffffcc
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,fr
	add i0,#0xffffffb0
	ld i1,[fr,-92]
	ld i2,d0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_S2_EEE6insertERKS5__16
LBB102_16:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L188_16
L195_16:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\Albums.cpp'
.line 48
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_16
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_16
	ld i1,&LC6_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC7_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC8_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC9_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC10_16
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_16
	ld i1,&_URL_16
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	jc gt,r14,r0,&L10_17
.line 75
	ld.b r14,[i0,2290]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L18_17
.line 77
	ld.b r0,[i0,2289]
	and r0,#0xff
	jc eq,r0,r14,&L13_17
.line 78
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 80
	call d0
L10_17:
.line 83
	ld r14,#0x0
	ld [d1,2284],r14
LBE2_17:
	pop rt,d1
	ret
L13_17:
.line 79
	ld.b r14,[i0,2288]
	and r14,#0xff
	jc eq,r14,r0,&L10_17
.line 80
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L10_17
L18_17:
.line 76
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 80
	call d0
	jp &L10_17

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
	jc ne,r14,r0,&L47_17
L20_17:
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
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB12_17:
	ld r14,[r14,8]
LBE12_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB13_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE13_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB14_17:
.line 258
	ld r14,[r14]
LBE14_17:
.line 359
	jc le,r14,d1,&L48_17
L34_17:
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB18_17:
	ld r14,[r14,8]
LBE18_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB19_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE19_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc eq,r14,r0,&L26_17
Ltext9_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 102
	ld r14,#0x1
	ld.b [d2,2288],r14
L26_17:
.line 97
	add d1,#0x1
LBB21_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB24_17:
	ld r14,[r14,8]
LBE24_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB25_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE25_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB26_17:
.line 258
	ld r14,[r14]
LBE26_17:
.line 359
	jc gt,r14,d1,&L34_17
L48_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 105
	ld d1,#0x0
	jp &L35_17
L46_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB30_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE30_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc ne,r14,r0,&L49_17
Ltext13_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 105
	add d1,#0x1
L35_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB34_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE34_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB35_17:
.line 258
	ld r14,[r14]
LBE35_17:
.line 359
	jc gt,r14,d1,&L46_17
L19_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 119
	add sp,#0xc
	pop rt,d4
	ret
L47_17:
.line 89
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,[d2,2292]
	call &__ZN4Feed6getAllEv_14
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[zr,_FEED_17]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L20_17
L49_17:
.line 109
	jc ne,d1,r0,&L43_17
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
L43_17:
.line 112
	ld r0,#0x2
	jc ne,d1,r0,&L19_17
.line 113
	ld r14,#0x1
	ld.b [d2,2290],r14
.line 114
	ld r0,#0x0
	ld [d2,2284],r0
	jp &L19_17

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
	jc eq,r14,i1,&L55_17
	ld r15,#0x1
L55_17:
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
	jc eq,i2,r14,&L59_17
LBB46_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB47_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE47_17:
	ld i0,[r14]
	ld i1,[zr,_gFontBlue_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
LBE45_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 200
	pop rt,fr
	ret
L59_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB50_17:
	ld r14,[r14,8]
	add r14,#0x4
LBE50_17:
	ld i0,[r14]
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
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
.line 355
	ld i0,[i0,48]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d1,48]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__ZN4MAUI6Screen4showEv_92
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
.line 355
	ld i0,[i0,48]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d1,48]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__ZN4MAUI6Screen4hideEv_92
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	add i0,#0x8d8
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 246
	ld r14,#0xc8
	jc eq,d0,r14,&L75_17
.line 250
	ld i0,d2
	add i0,#0x38
	call &__ZN6MAUtil10Connection5closeEv_78
.line 251
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE57_17:
.line 253
	add sp,#0x85c
	pop rt,d3
	ret
L75_17:
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8b4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_cardid_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L88_17
.line 274
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8bc
L105_17:
.line 290
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L87_17:
.line 292
	add sp,#0x4
	pop rt,d2
	ret
L88_17:
.line 275
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_carddescription_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L90_17
.line 276
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8c0
	jp &L105_17
L90_17:
.line 277
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_cardquantity_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L106_17
.line 279
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_thumburl_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L94_17
.line 280
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8c8
	jp &L105_17
L106_17:
.line 278
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8c4
	jp &L105_17
L94_17:
.line 281
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_fronturl_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L107_17
.line 283
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_backurl_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L98_17
.line 284
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8d0
	jp &L105_17
L107_17:
.line 282
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8cc
	jp &L105_17
L98_17:
.line 285
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_rate_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L100_17
.line 286
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8dc
	jp &L105_17
L100_17:
.line 287
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_value_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L102_17
.line 288
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8e0
	jp &L105_17
L102_17:
.line 289
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_error_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L87_17
.line 290
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8d8
	jp &L105_17

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
	call &__ZNK6MAUtil11BasicStringIcEltERKS1__70
	ld d0,r14
	and d0,#0xff
.line 45
	ld r0,#0xffffffff
.line 44
	ld r14,#0x0
	jc ne,d0,r14,&L119_17
.line 46
	ld i0,d1
	ld i1,d2
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__70
	and r14,#0xff
.line 47
	ld r0,#0x0
.line 46
	jc eq,r14,d0,&L124_17
L119_17:
.line 49
	ld r14,r0
	pop rt,d2
	ret
L124_17:
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
	call &_dict_first_61
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
	jc eq,i0,r14,&L129_17
LBE73_17:
.line 198
	ld r14,i0
	add r14,#0x18
	pop rt,fr
	ret
L129_17:
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
	call &_dict_lookup_61
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
	call &_dict_free_nodes_61
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
	call &_dict_free_nodes_61
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
	jc eq,r14,i1,&L140_17
	ld r15,#0x1
L140_17:
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
	jc eq,i0,r14,&L144_17
LBE82_17:
.line 274
	ld r14,i0
	add r14,#0x18
	pop rt,fr
	ret
L144_17:
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
	jc eq,i1,r14,&L148_17
.line 205
	ld i0,[i0,4]
	call &_dict_next_61
	ld [d0],r14
LBE84_17:
.line 206
	ld r14,d0
	pop rt,d0
	ret
L148_17:
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
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	jp &L151_17
L154_17:
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,d2
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d6
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 331
	ld i0,fr
	add i0,#0xffffffb8
	ld i1,d3
	ld i2,#0x0
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorppEi_17
L151_17:
	ld i0,d5
	ld i1,d4
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,d3
	ld i1,d5
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L154_17
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
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
	ld d1,r14
.line 214
	case d0,#0x111,#0xd,#L172_17,#L155_17
.data
	.align 4
L172_17:
	.word L157_17
	.word L158_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L155_17
	.word L160_17
	.word L159_17
	.word L167_17


.code
L167_17:
.line 235
	ld i0,[d2,28]
	ld r14,#0x0
	jc ne,i0,r14,&L174_17
L168_17:
.line 238
	ld d0,fr
	add d0,#0xffffffdc
LBB93_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
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
	call &__Znwm_56
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
L155_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L158_17:
.line 219
	ld i0,[d2,48]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox14selectNextItemEb_90
LBE96_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L160_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 258
	ld d3,d2
	add d3,#0x9ac
LBB100_17:
	ld r14,[d3]
LBE100_17:
	ld r0,#0xffffffff
	jc le,r14,r0,&L155_17
Ltext59_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 227
	ld i0,[d2,28]
	ld r14,#0x0
	jc ne,i0,r14,&L175_17
L163_17:
.line 230
	ld d0,fr
	add d0,#0xffffffdc
LBB101_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
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
	call &__Znwm_56
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
L176_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L159_17:
.line 222
	ld i0,d2
	add i0,#0x8d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d1,r14
	ld d0,fr
	add d0,#0xffffffe4
	ld i0,d0
	ld i1,d2
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d1
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 223
	ld i0,[d2,32]
	ld r14,[i0]
	ld d0,[r14,28]
.line 231
	call d0
	jp &L176_17
L157_17:
.line 216
	ld i0,[d2,48]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox18selectPreviousItemEb_90
LBE104_17:
.line 242
	add sp,#0x14
	pop rt,d3
	ret
L174_17:
.line 236
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L168_17
L175_17:
.line 228
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L163_17

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
	ld r14,&__ZTV15AlbumViewScreen_17+140
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumViewScreen_17+164
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumViewScreen_17+176
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumViewScreen_17+220
	ld [i0,24],r14
LBB108_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,52]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB109_17:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L286_17
	ld r1,[d0]
L181_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L271_17
	ld i0,[d0,8]
L191_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L191_17
L271_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE112_17:
.line 306
	ld i0,[d2,48]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB118_17:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L287_17
	ld r1,[d0]
L195_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L275_17
	ld i0,[d0,8]
L205_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L205_17
L275_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE121_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 162
	ld i0,[d2,48]
	jc ne,i0,r14,&L288_17
L209_17:
.line 163
	ld i0,[d2,52]
	ld r0,#0x0
	jc ne,i0,r0,&L289_17
L211_17:
.line 164
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L290_17
L212_17:
.line 168
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L291_17
L215_17:
.line 173
	ld i0,[d2,44]
	ld r2,#0x0
	jc ne,i0,r2,&L292_17
L233_17:
.line 174
	ld i0,[d2,40]
	ld r14,#0x0
	jc ne,i0,r14,&L293_17
L235_17:
.line 175
	ld i0,[d2,28]
	ld r0,#0x0
	jc ne,i0,r0,&L294_17
L237_17:
.line 176
	ld d0,[d2,36]
	ld r2,#0x0
	jc ne,d0,r2,&L295_17
L239_17:
.line 178
	ld d5,d2
	add d5,#0x8d4
	ld i0,d5
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,r14
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,d2
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d0
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 180
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d2
	add r14,#0x8b4
	ld [fr,-48],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 181
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r0,d2
	add r0,#0x8b8
	ld [fr,-52],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 182
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r2,d2
	add r2,#0x8bc
	ld [fr,-56],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 183
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d2
	add r14,#0x8c0
	ld [fr,-60],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 184
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r0,d2
	add r0,#0x8c4
	ld [fr,-64],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 185
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r2,d2
	add r2,#0x8c8
	ld [fr,-68],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 186
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d2
	add r14,#0x8cc
	ld [fr,-72],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 187
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d7,d2
	add d7,#0x8d0
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 188
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d5
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 189
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d6,d2
	add d6,#0x8d8
	ld i0,d6
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 190
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d4,d2
	add d4,#0x8dc
	ld i0,d4
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 191
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d3,d2
	add d3,#0x8e0
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBB126_17:
.line 11
	ld d0,d2
	add d0,#0x9b8
LBB127_17:
	ld i0,d2
	add i0,#0x9d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9cc
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9c8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9c4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9bc
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE127_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 135
	ld d1,d2
	add d1,#0x9ac
LBB129_17:
.line 136
	ld i0,[d1,8]
	ld r0,#0x0
	jc eq,i0,r0,&L249_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L247_17
L296_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d1,8]
	jc ne,i0,d0,&L296_17
L247_17:
	add i0,#0xfffffffc
	call &__ZdaPv_54
L249_17:
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-72]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-68]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-64]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-60]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-56]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-48]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x60
	call &__ZN13XmlConnectionD1Ev_3
LBB138_17:
	ld i0,d2
	add i0,#0x38
LBB139_17:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE139_17:
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_92
LBE107_17:
.line 192
	ld i0,d2
	call &__ZdlPv_55
	add sp,#0x20
	pop rt,d7
	ret
L295_17:
.line 176
	ld i0,d0
	call &__ZN10ImageCacheD1Ev_12
	ld i0,d0
	call &__ZdlPv_55
	jp &L239_17
L294_17:
.line 175
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L237_17
L293_17:
.line 174
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L235_17
L292_17:
.line 173
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L233_17
L291_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB142_17:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L297_17
	ld r1,[d0]
L217_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L279_17
	ld i0,[d0,8]
L227_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L227_17
L279_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE145_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L298_17
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L215_17
L290_17:
.line 165
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 166
	ld r14,#0x0
	ld [zr,_image_4],r14
	jp &L212_17
L289_17:
.line 163
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L211_17
L288_17:
.line 162
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L209_17
L287_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB158_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L283_17
	ld i0,[d0,8]
L199_17:
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
	jc gt,r1,r2,&L199_17
L273_17:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L299_17
.line 300
	ld [d0,8],d1
	jp &L195_17
L286_17:
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB167_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L281_17
	ld i0,[d0,8]
L185_17:
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
	jc gt,r1,r2,&L185_17
L269_17:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L300_17
.line 300
	ld [d0,8],d1
	jp &L181_17
L298_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L215_17
L300_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L181_17
L299_17:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L195_17
L297_17:
.line 291
	ld i0,r2
	call &__Znam_57
	ld d1,r14
LBB192_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L285_17
	ld i0,[d0,8]
L221_17:
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
	jc gt,r1,r2,&L221_17
L277_17:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L301_17
.line 300
	ld [d0,8],d1
	jp &L217_17
L301_17:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L217_17
L283_17:
	ld i0,[d0,8]
	jp &L273_17
L281_17:
	ld i0,[d0,8]
	jp &L269_17
L285_17:
	ld i0,[d0,8]
	jp &L277_17

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
	ld r14,&__ZTV15AlbumViewScreen_17+140
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumViewScreen_17+164
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumViewScreen_17+176
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumViewScreen_17+220
	ld [i0,24],r14
LBB194_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,52]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB195_17:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L411_17
	ld r1,[d0]
L306_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L396_17
	ld i0,[d0,8]
L316_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L316_17
L396_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE198_17:
.line 306
	ld i0,[d2,48]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB204_17:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L412_17
	ld r1,[d0]
L320_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L400_17
	ld i0,[d0,8]
L330_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L330_17
L400_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE207_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 162
	ld i0,[d2,48]
	jc ne,i0,r14,&L413_17
L334_17:
.line 163
	ld i0,[d2,52]
	ld r0,#0x0
	jc ne,i0,r0,&L414_17
L336_17:
.line 164
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L415_17
L337_17:
.line 168
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L416_17
L340_17:
.line 173
	ld i0,[d2,44]
	ld r2,#0x0
	jc ne,i0,r2,&L417_17
L358_17:
.line 174
	ld i0,[d2,40]
	ld r14,#0x0
	jc ne,i0,r14,&L418_17
L360_17:
.line 175
	ld i0,[d2,28]
	ld r0,#0x0
	jc ne,i0,r0,&L419_17
L362_17:
.line 176
	ld d0,[d2,36]
	ld r2,#0x0
	jc ne,d0,r2,&L420_17
L364_17:
.line 178
	ld d5,d2
	add d5,#0x8d4
	ld i0,d5
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,r14
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,d2
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d0
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 180
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d2
	add r14,#0x8b4
	ld [fr,-48],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 181
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r0,d2
	add r0,#0x8b8
	ld [fr,-52],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 182
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r2,d2
	add r2,#0x8bc
	ld [fr,-56],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 183
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d2
	add r14,#0x8c0
	ld [fr,-60],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 184
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r0,d2
	add r0,#0x8c4
	ld [fr,-64],r0
	ld i0,r0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 185
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r2,d2
	add r2,#0x8c8
	ld [fr,-68],r2
	ld i0,r2
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 186
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d2
	add r14,#0x8cc
	ld [fr,-72],r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 187
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d7,d2
	add d7,#0x8d0
	ld i0,d7
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 188
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d5
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 189
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d6,d2
	add d6,#0x8d8
	ld i0,d6
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 190
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d4,d2
	add d4,#0x8dc
	ld i0,d4
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 191
	ld i0,d1
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d3,d2
	add d3,#0x8e0
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBB212_17:
.line 11
	ld d0,d2
	add d0,#0x9b8
LBB213_17:
	ld i0,d2
	add i0,#0x9d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9cc
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9c8
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9c4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9c0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x9bc
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE213_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 135
	ld d1,d2
	add d1,#0x9ac
LBB215_17:
.line 136
	ld i0,[d1,8]
	ld r0,#0x0
	jc eq,i0,r0,&L374_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L372_17
L421_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d1,8]
	jc ne,i0,d0,&L421_17
L372_17:
	add i0,#0xfffffffc
	call &__ZdaPv_54
L374_17:
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-72]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-68]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-64]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-60]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-56]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[fr,-48]
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	add i0,#0x60
	call &__ZN13XmlConnectionD1Ev_3
LBB224_17:
	ld i0,d2
	add i0,#0x38
LBB225_17:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE225_17:
	ld i0,d2
	call &__ZN4MAUI6ScreenD2Ev_92
LBE193_17:
.line 192
	add sp,#0x20
	pop rt,d7
	ret
L420_17:
.line 176
	ld i0,d0
	call &__ZN10ImageCacheD1Ev_12
	ld i0,d0
	call &__ZdlPv_55
	jp &L364_17
L419_17:
.line 175
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L362_17
L418_17:
.line 174
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L360_17
L417_17:
.line 173
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L358_17
L416_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB228_17:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L422_17
	ld r1,[d0]
L342_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L404_17
	ld i0,[d0,8]
L352_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L352_17
L404_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE231_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L423_17
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L340_17
L415_17:
.line 165
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 166
	ld r14,#0x0
	ld [zr,_image_4],r14
	jp &L337_17
L414_17:
.line 163
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L336_17
L413_17:
.line 162
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
	jp &L334_17
L412_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB244_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L408_17
	ld i0,[d0,8]
L324_17:
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
	jc gt,r1,r2,&L324_17
L398_17:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L424_17
.line 300
	ld [d0,8],d1
	jp &L320_17
L411_17:
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB253_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L406_17
	ld i0,[d0,8]
L310_17:
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
	jc gt,r1,r2,&L310_17
L394_17:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L425_17
.line 300
	ld [d0,8],d1
	jp &L306_17
L423_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 170
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 171
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L340_17
L425_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L306_17
L424_17:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L320_17
L422_17:
.line 291
	ld i0,r2
	call &__Znam_57
	ld d1,r14
LBB278_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L410_17
	ld i0,[d0,8]
L346_17:
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
	jc gt,r1,r2,&L346_17
L402_17:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L426_17
.line 300
	ld [d0,8],d1
	jp &L342_17
L426_17:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L342_17
L408_17:
	ld i0,[d0,8]
	jp &L398_17
L406_17:
	ld i0,[d0,8]
	jp &L394_17
L410_17:
	ld i0,[d0,8]
	jp &L402_17

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
.line 306
	ld i0,[i0,48]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB368_17:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L647_17
	ld r1,[d0]
L553_17:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L627_17
	ld i0,[d0,8]
L563_17:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L563_17
L627_17:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE371_17:
.line 306
	ld d3,d5
	add d3,#0x9ac
LBB377_17:
.line 288
	ld r14,[d3,4]
	ld r0,#0x0
	jc lt,r14,r0,&L648_17
	ld r14,[d3]
L567_17:
.line 274
	ld d0,#0x0
	jc le,r14,d0,&L631_17
	ld d4,fr
	add d4,#0xffffffd4
L583_17:
.line 275
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld r14,d0
	sll r14,#0x2
	ld i0,[d3,8]
	add i0,r14
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 274
	add d0,#0x1
	ld r14,[d3]
	jc gt,r14,d0,&L583_17
L631_17:
.line 278
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
	jc eq,r14,r0,&L649_17
L621_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 160
	ld d4,fr
	add d4,#0xffffffd4
	ld i0,d7
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,d4
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card5getIdEv_15
LBB389_17:
.line 161
	ld r1,[d3,4]
	ld r14,r1
	add r14,#0xffffffff
	ld r0,[d3]
	jc lt,r0,r14,&L640_17
.line 162
	ld r2,#0x0
	jc eq,r1,r2,&L590_17
LBB390_17:
.line 286
	ld d2,r1
	add d2,r1
LBB391_17:
.line 288
	jc lt,r1,d2,&L650_17
L640_17:
	ld i0,[d3,8]
L589_17:
.line 167
	add r0,#0x1
	ld [d3],r0
	add r0,#0xffffffff
	sll r0,#0x2
	add i0,r0
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
LBE389_17:
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 129
	ld i0,d4
	ld i1,&LC21_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 130
	ld i0,d7
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorptEv_17
	ld i0,d4
	ld i1,r14
	add i1,#0x4
	call &__ZN4Card11getQuantityEv_15
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 132
	ld i0,[d5,48]
	call &__ZNK4MAUI6Widget8getWidthEv_93
	ld d0,r14
	add d0,#0xfffffff6
	ld i0,#0x9c
	call &__Znwm_56
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
	call &__ZN4MAUI6LayoutC1EiiiiPNS_6WidgetEii_89
.line 133
	ld r14,[d1]
	ld d0,[r14,20]
	ld i0,d1
	ld i1,[zr,_gSkinAlbum_4]
	call d0
.line 134
	ld i0,d1
	ld i1,#0x1
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
.line 135
	ld i0,d1
	ld i1,d5
	add i1,#0xc
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
.line 138
	ld i0,#0x84
	call &__Znwm_56
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
	call &__ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_86
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
	call &__Znwm_56
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
	call &__ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld [d5,44],d0
.line 146
	ld i0,d0
	ld i1,#0x1
	call &__ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88
.line 147
	ld i0,[d5,44]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setAutoSizeYEb_88
.line 148
	ld i0,[d5,44]
	ld i1,#0x1
	call &__ZN4MAUI5Label12setMultiLineEb_88
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
	jc ne,r14,r0,&L621_17
L649_17:
.line 150
	ld i0,[fr,-72]
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE4sizeEv_17
	ld d2,r14
	ld r2,#0x0
	jc eq,r14,r2,&L622_17
.line 151
	ld i0,[d5,48]
	ld i1,r2
.line 154
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
LBE366_17:
.line 156
	add sp,#0x34
	pop rt,d7
	ret
L650_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x2
	add i0,#0x4
	call &__Znam_57
	ld d6,r14
	add d6,#0x4
	ld [r14],d2
	ld d1,d6
	ld d0,d2
	jp &L642_17
L651_17:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	add d1,#0x4
L642_17:
	add d0,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d0,r14,&L651_17
LBB403_17:
.line 293
	ld d0,#0x0
	ld r0,[d3]
	jc le,r0,d0,&L633_17
L652_17:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d6
	ld i1,[d3,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
.line 293
	add d0,#0x1
	ld r0,[d3]
	jc gt,r0,d0,&L652_17
L633_17:
.line 297
	ld [d3,4],d2
.line 298
	ld i0,[d3,8]
	ld r2,#0x0
	jc eq,i0,r2,&L602_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L604_17
L653_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d3,8]
	jc ne,i0,d0,&L653_17
L604_17:
	add i0,#0xfffffffc
	call &__ZdaPv_54
	ld r0,[d3]
L602_17:
.line 300
	ld i0,d6
LBE402_17:
	ld [d3,8],i0
	jp &L589_17
L590_17:
.line 291
	ld i0,#0x14
	call &__Znam_57
	ld d2,r14
	add d2,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d2
	ld d1,#0x3
	ld r2,#0xffffffff
	jc eq,d1,r2,&L609_17
L654_17:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	add d0,#0x4
	add d1,#0xffffffff
	ld r2,#0xffffffff
	jc ne,d1,r2,&L654_17
L609_17:
.line 293
	ld d0,#0x0
	ld r0,[d3]
	jc le,r0,d0,&L635_17
L655_17:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d2
	ld i1,[d3,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
.line 293
	add d0,#0x1
	ld r0,[d3]
	jc gt,r0,d0,&L655_17
L635_17:
.line 297
	ld r14,#0x4
	ld [d3,4],r14
.line 298
	ld i0,[d3,8]
	ld r2,#0x0
	jc eq,i0,r2,&L617_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
	jc eq,i0,d0,&L619_17
L656_17:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d3,8]
	jc ne,i0,d0,&L656_17
L619_17:
	add i0,#0xfffffffc
	call &__ZdaPv_54
	ld r0,[d3]
L617_17:
.line 300
	ld i0,d2
	ld [d3,8],i0
	jp &L589_17
L622_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 153
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i1,[zr,_empty_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld i0,[d5,48]
	ld r0,[i0]
	ld d0,[r0]
	ld i1,r14
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 154
	ld i0,[d5,48]
	ld i1,d2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
LBE394_17:
.line 156
	add sp,#0x34
	pop rt,d7
	ret
L648_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,#0x4
	call &__Znam_57
	ld d1,r14
	add d1,#0x4
	ld r2,#0x0
	ld [r14],r2
	ld d0,d1
	ld d2,#0xffffffff
L568_17:
	ld r14,#0xffffffff
	jc ne,d2,r14,&L657_17
LBB418_17:
.line 293
	ld d0,#0x0
	ld r14,[d3]
	jc le,r14,d0,&L629_17
L658_17:
.line 294
	ld r14,d0
	sll r14,#0x2
	ld i0,r14
	add i0,d1
	ld i1,[d3,8]
	add i1,r14
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
.line 293
	add d0,#0x1
	ld r14,[d3]
	jc gt,r14,d0,&L658_17
L629_17:
.line 297
	ld r0,#0x0
	ld [d3,4],r0
.line 298
	ld i0,[d3,8]
	jc eq,i0,r0,&L577_17
	ld d0,[i0,-4]
	sll d0,#0x2
	add d0,i0
L578_17:
	jc eq,i0,d0,&L579_17
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d3,8]
	jp &L578_17
L647_17:
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB427_17:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L637_17
	ld i0,[d0,8]
L557_17:
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
	jc gt,r1,r2,&L557_17
L625_17:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L659_17
.line 300
	ld [d0,8],d1
	jp &L553_17
L579_17:
.line 298
	add i0,#0xfffffffc
	call &__ZdaPv_54
	ld r14,[d3]
L577_17:
.line 300
	ld [d3,8],d1
	jp &L567_17
L659_17:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L553_17
L637_17:
	ld i0,[d0,8]
	jp &L625_17
L657_17:
.line 291
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	add d0,#0x4
	add d2,#0xffffffff
	jp &L568_17

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
	jc eq,i1,r14,&L663_17
.line 287
	ld i0,[i0,4]
	call &_dict_next_61
	ld [d0],r14
LBE452_17:
.line 288
	ld r14,d0
	pop rt,d0
	ret
L663_17:
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
	call &_dict_first_61
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x20
	ld i1,d1
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x24
	ld i1,d1
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x28
	ld i1,d1
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x2c
	ld i1,d1
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x30
	ld i1,d1
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x34
	ld i1,d1
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d0
	add i0,#0x38
	ld i1,d1
	add i1,#0x20
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
LBB468_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld d6,d0
	add d6,#0x4
LBB469_17:
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,d0
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,d0
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d3,fr
	add d3,#0xffffffc0
	ld i0,d3
	ld i1,d0
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d5,fr
	add d5,#0xffffffc4
	ld i0,d5
	ld i1,d0
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d4,fr
	add d4,#0xffffffc8
	ld i0,d4
	ld i1,d0
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d2,fr
	add d2,#0xffffffcc
	ld i0,d2
	ld i1,d0
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i1,d0
	add i1,#0x20
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld.b d6,[d6,32]
	ld.b [fr,-44],d6
LBE469_17:
	ld i0,#0x40
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,#0xffffffb0
	add i1,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8DictNodeC1ES6__17
Ltext106_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
Ltext107_17:
.sourcefile 'c:\MoSync\include\MAUtil\Dictionary_impl.h'
.line 87
	ld i0,d0
	ld i1,#0x0
	call &_dnode_init_61
.line 88
	ld d2,d0
	add d2,#0x18
.line 90
	ld i0,[fr,-84]
	ld i1,d0
	ld i2,[i0,52]
	add i2,d2
	call &_dict_insert_61
	ld d1,r14
.line 91
	ld r14,#0x0
	jc eq,d1,r14,&L680_17
.line 92
	jc ne,d0,r14,&L694_17
L682_17:
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
L694_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d0
	add i0,#0x38
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x34
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x30
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x2c
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x28
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x24
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x20
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	add d0,#0x1c
	ld i0,d0
	add d0,#0xffffffe4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE477_17:
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE475_17:
	ld i0,d0
	call &__ZdlPv_55
	jp &L682_17
L680_17:
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 53
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
.line 54
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	jp &L696_17
L706_17:
.line 56
	ld d1,fr
	add d1,#0xffffffc0
	add d6,#0x1
	ld i0,d1
	ld i1,#0xffffffd4
	add i1,fr
	ld i2,#0x0
	ld i3,d0
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 57
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
LBB483_17:
	ld i0,#0xffffff90
	add i0,fr
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff94
	add i0,fr
	ld i1,d7
	add i1,#0x9bc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff98
	add i0,fr
	ld i1,d7
	add i1,#0x9c0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff9c
	add i0,fr
	ld i1,d7
	add i1,#0x9c4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d5,fr
	add d5,#0xffffffa0
	ld i0,d5
	ld i1,d7
	add i1,#0x9c8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d4,fr
	add d4,#0xffffffa4
	ld i0,d4
	ld i1,d7
	add i1,#0x9cc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d2,fr
	add d2,#0xffffffa8
	ld i0,d2
	ld i1,d7
	add i1,#0x9d0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d0,fr
	add d0,#0xffffffac
	ld i0,d0
	ld i1,d7
	add i1,#0x9d4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff98
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff94
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff90
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE489_17:
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE487_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
Ltext114_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 59
	ld i0,d1
	ld i1,#0xffffffd4
	add i1,fr
	ld i2,d6
	ld i3,#0xffffffff
	call &__ZNK6MAUtil11BasicStringIcE6substrEii_70
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L696_17:
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,[zr,_newline_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE4findERKS1_j_70
	ld d6,r14
	ld d0,r14
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld r14,#0xffffffff
	jc gt,d6,r14,&L706_17
.line 63
	ld i0,d7
	call &__ZN15AlbumViewScreen8drawListEv_17
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
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
	call &_dict_load_begin_61
.line 61
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,[fr,-132]
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE5beginEv_17
	jp &L709_17
L719_17:
.line 63
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratordeEv_17
	ld d0,r14
LBB496_17:
	ld i0,#0xffffff84
	add i0,fr
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
LBB497_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 48
	ld d6,d0
	add d6,#0x4
LBB498_17:
	ld i0,#0xffffff88
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff8c
	add i0,fr
	ld i1,d0
	add i1,#0x8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d4,fr
	add d4,#0xffffff90
	ld i0,d4
	ld i1,d0
	add i1,#0xc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d7,fr
	add d7,#0xffffff94
	ld i0,d7
	ld i1,d0
	add i1,#0x10
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d5,fr
	add d5,#0xffffff98
	ld i0,d5
	ld i1,d0
	add i1,#0x14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d3,fr
	add d3,#0xffffff9c
	ld i0,d3
	ld i1,d0
	add i1,#0x18
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d2,fr
	add d2,#0xffffffa0
	ld i0,d2
	ld i1,d0
	add i1,#0x1c
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d1,fr
	add d1,#0xffffffa4
	ld i0,d1
	ld i1,d0
	add i1,#0x20
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld.b d6,[d6,32]
	ld.b [fr,-88],d6
LBE498_17:
	ld i0,#0x40
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,#0xffffff84
	add i1,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8DictNodeC1ES6__17
Ltext117_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 11
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff88
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff84
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &_dict_load_next_61
.line 66
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE13ConstIteratorppEv_17
L709_17:
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
	jc ne,r14,r0,&L719_17
.line 68
	ld i0,#0xffffffbc
	add i0,fr
	call &_dict_load_end_61
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
	jc eq,r14,r0,&L740_17
.line 316
	ld i0,d5
	ld i1,[zr,_xml_error_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L741_17
.line 319
	ld i0,d5
	ld i1,[zr,_xml_carddone_17]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L734_17
L742_17:
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,r14
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d7
	call &__ZN15AlbumViewScreen6getAllEv_17
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d0
	ld i1,r14
	call &__Z8saveDataPKcS0__4
.line 325
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE499_17:
.line 327
	add sp,#0xc0
	pop rt,d7
	ret
L741_17:
.line 317
	ld i0,d7
	add i0,#0x8d8
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d7,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffff7c
	add i1,fr
	call d0
L738_17:
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 319
	ld i0,d5
	ld i1,[zr,_xml_carddone_17]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L742_17
L734_17:
.line 325
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d7,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffff7c
	add i1,fr
	call d0
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE502_17:
.line 327
	add sp,#0xc0
	pop rt,d7
	ret
L740_17:
.line 296
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d7,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,#0xffffffd4
	add i1,fr
	call d0
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 297
	ld i0,#0xffffff98
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld r14,d7
	add r14,#0x8c4
	ld [fr,-196],r14
	ld i0,#0xffffff9c
	add i0,fr
	ld i1,r14
	ld i2,#0xffffff98
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r0,d7
	add r0,#0x8c0
	ld [fr,-200],r0
	ld i0,#0xffffffa0
	add i0,fr
	ld i1,#0xffffff9c
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff94
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffa4
	add i0,fr
	ld i1,#0xffffffa0
	add i1,fr
	ld i2,#0xffffff94
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r14,d7
	add r14,#0x8c8
	ld [fr,-204],r14
	ld i0,#0xffffffa8
	add i0,fr
	ld i1,#0xffffffa4
	add i1,fr
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff90
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffac
	add i0,fr
	ld i1,#0xffffffa8
	add i1,fr
	ld i2,#0xffffff90
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r0,d7
	add r0,#0x8cc
	ld [fr,-208],r0
	ld i0,#0xffffffb0
	add i0,fr
	ld i1,#0xffffffac
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff8c
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffb4
	add i0,fr
	ld i1,#0xffffffb0
	add i1,fr
	ld i2,#0xffffff8c
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r14,d7
	add r14,#0x8d0
	ld [fr,-212],r14
	ld i0,#0xffffffb8
	add i0,fr
	ld i1,#0xffffffb4
	add i1,fr
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d2,fr
	add d2,#0xffffff88
	ld i0,d2
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffbc
	add i0,fr
	ld i1,#0xffffffb8
	add i1,fr
	ld i2,d2
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r0,d7
	add r0,#0x8bc
	ld [fr,-216],r0
	ld i0,#0xffffffc0
	add i0,fr
	ld i1,#0xffffffbc
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d1,fr
	add d1,#0xffffff84
	ld i0,d1
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffc4
	add i0,fr
	ld i1,#0xffffffc0
	add i1,fr
	ld i2,d1
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r14,d7
	add r14,#0x8dc
	ld [fr,-220],r14
	ld i0,#0xffffffc8
	add i0,fr
	ld i1,#0xffffffc4
	add i1,fr
	ld i2,r14
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld d0,fr
	add d0,#0xffffff80
	ld i0,d0
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffcc
	add i0,fr
	ld i1,#0xffffffc8
	add i1,fr
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld r0,d7
	add r0,#0x8e0
	ld [fr,-224],r0
	ld i0,#0xffffffd0
	add i0,fr
	ld i1,#0xffffffcc
	add i1,fr
	ld i2,r0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,[zr,_delim_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,#0xffffffd4
	add i0,fr
	ld i1,#0xffffffd0
	add i1,fr
	ld i2,#0xffffff7c
	add i2,fr
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d6,d7
	add d6,#0x9b8
	ld i0,d6
	ld i1,r14
	call &__ZN4Card6setAllEPKc_15
	ld i0,#0xffffffd4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffd0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffcc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffc0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffbc
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff8c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffb0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffac
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff90
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffa8
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffa4
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff94
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffffa0
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff9c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff98
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 299
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE3endEv_17
	ld i0,d2
	ld i1,d0
	call &__ZNK6MAUtil10DictionaryIKNS_11BasicStringIcEENS_4PairIS3_4CardEEE8IteratorneERKS8__17
	and r14,#0xff
	jc eq,r14,d3,&L723_17
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d6
	ld i1,r14
	call &__ZN4Card8setThumbEPKc_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d6
	ld i1,r14
	call &__ZN4Card7setBackEPKc_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d6
	ld i1,r14
	call &__ZN4Card8setFrontEPKc_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 303
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card8getThumbEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld [sp],r14
	ld i0,&LC22_17
	call &_lprintfln_37
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 304
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card7getBackEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld [sp],r14
	ld i0,&LC23_17
	call &_lprintfln_37
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 305
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,d6
	call &__ZN4Card8getFrontEv_15
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld [sp],r14
	ld i0,&LC24_17
	call &_lprintfln_37
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L723_17:
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
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
LBB507_17:
	ld i0,#0xffffff44
	add i0,fr
	ld i1,d6
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff48
	add i0,fr
	ld i1,d7
	add i1,#0x9bc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff4c
	add i0,fr
	ld i1,d7
	add i1,#0x9c0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d4,fr
	add d4,#0xffffff50
	ld i0,d4
	ld i1,d7
	add i1,#0x9c4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0xffffff54
	add i0,fr
	ld i1,d7
	add i1,#0x9c8
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d2,fr
	add d2,#0xffffff58
	ld i0,d2
	ld i1,d7
	add i1,#0x9cc
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d1,fr
	add d1,#0xffffff5c
	ld i0,d1
	ld i1,d7
	add i1,#0x9d0
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld d0,fr
	add d0,#0xffffff60
	ld i0,d0
	ld i1,d7
	add i1,#0x9d4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
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
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff54
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff4c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff48
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,#0xffffff44
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE513_17:
	ld i0,#0xffffff40
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE511_17:
.sourcefile 'c:\MoSync\include\MAUtil\Map.h'
.line 47
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
Ltext124_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 308
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-216]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 309
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-200]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 310
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-196]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 311
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-204]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 312
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-208]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 313
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-212]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 314
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-220]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,#0xffffff7c
	add i0,fr
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 315
	ld i0,#0xffffff7c
	add i0,fr
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[fr,-224]
	ld i1,#0xffffff7c
	add i1,fr
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	jp &L738_17

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
	call &_dict_init_61
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
	call &_dict_init_61
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
	call &__ZN4MAUI6ScreenC2Ev_92
LBB519_17:
	ld i1,d2
	add i1,#0x18
LBE519_17:
	ld r0,&__ZTV15AlbumViewScreen_17+8
	ld [d2],r0
	ld r14,&__ZTV15AlbumViewScreen_17+112
	ld [d2,4],r14
	ld r0,&__ZTV15AlbumViewScreen_17+140
	ld [d2,12],r0
	ld r14,&__ZTV15AlbumViewScreen_17+164
	ld [d2,16],r14
	ld r0,&__ZTV15AlbumViewScreen_17+176
	ld [d2,20],r0
	ld r14,&__ZTV15AlbumViewScreen_17+220
	ld [i1],r14
	ld [d2,32],d0
	ld i0,d2
	add i0,#0x38
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_78
	ld i0,d2
	add i0,#0x60
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d2
	add i0,#0x8b4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8b8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8bc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8c0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8c4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8c8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8cc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld d0,d2
	add d0,#0x8d4
	ld d5,fr
	add d5,#0xffffffd4
	ld i0,d5
	ld i1,[zr,_ALBUMEND_17]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,[fr,-48]
	ld i2,d5
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld d6,d2
	add d6,#0x8d8
	ld i0,d6
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8dc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8e0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
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
	call &__Znam_57
	ld d4,r14
	add d4,#0x4
	ld r0,#0x4
	ld [r14],r0
	ld d0,d4
	ld d1,#0x3
L761_17:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	add d0,#0x4
	add d1,#0xffffffff
	ld r14,#0xffffffff
	jc ne,d1,r14,&L761_17
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
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9bc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9c0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9c4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9c8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9cc
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x9d4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
LBE531_17:
.line 12
	ld i0,#0xc
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_92
	ld [d2,28],d0
.line 13
	ld i0,d5
	ld i1,&LC19_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d6
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 14
	ld i0,d7
	call &__ZN4Feed15getTouchEnabledEv_14
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L764_17
.line 15
	ld i0,[zr,_back_17]
	ld i1,[zr,_tradelbl_17]
	ld i2,&LC19_17
L772_17:
.line 17
	ld i3,#0x1
	call &__Z16createMainLayoutPKcS0_S0_b_4
	ld i0,r14
	ld [d2,52],r14
LBB533_17:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB535_17:
	ld r14,[r14,8]
LBE535_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB536_17:
	ld r14,[r14,8]
	add r14,#0x8
LBE536_17:
	ld r14,[r14]
	ld [d2,48],r14
LBB537_17:
	ld i0,[d2,52]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB539_17:
	ld r14,[r14,8]
LBE539_17:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,40]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d5
	call d0
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 22
	ld i0,#0x44c
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN10ImageCacheC1Ev_12
	ld [d2,36],d0
.line 23
	ld i0,d2
	call &__ZN15AlbumViewScreen8loadFileEv_17
.line 24
	ld i0,#0x64
	call &__Znam_57
	ld d1,r14
.line 25
	ld i0,r14
	ld i1,#0x0
	ld i2,#0x64
	syscall 4
.line 26
	ld i0,&_CARDS_17
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,r14
	ld i0,[fr,-48]
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
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
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
.line 38
	ld r14,#0x0
	ld [d2,2284],r14
LBE532_17:
	add sp,#0x18
	pop rt,d7
	ret
L764_17:
.line 17
	ld i0,[zr,_back_17]
	ld i1,[zr,_tradelbl_17]
	ld i2,[zr,_select_17]
	jp &L772_17

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
	jc eq,i1,r14,&L835_17
L799_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 347
	add sp,#0x4
	pop rt,d0
	ret
L835_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L836_17
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L799_17
	ld i0,&_TRADE_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_17
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L837_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumViewScreen.cpp'
.line 347
	add sp,#0x4
	pop rt,d0
	ret
L836_17:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_17
	ld i1,&LC26_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_17
	ld i1,&LC27_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC28_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC29_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC30_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC31_17
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_17
	ld i1,&_URL_17
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L837_17

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
	jc gt,r14,r0,&L11_18
.line 86
	ld.b r14,[i0,2234]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L19_18
.line 88
	ld.b r0,[i0,2233]
	and r0,#0xff
	jc eq,r0,r14,&L14_18
.line 89
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11d
.line 91
	call d0
L11_18:
.line 94
	ld r14,#0x0
	ld [d1,2228],r14
LBE3_18:
	pop rt,d1
	ret
L14_18:
.line 90
	ld.b r14,[i0,2232]
	and r14,#0xff
	jc eq,r14,r0,&L11_18
.line 91
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11c
	call d0
	jp &L11_18
L19_18:
.line 87
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,#0x11e
.line 91
	call d0
	jp &L11_18

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
	jc ne,r14,r0,&L48_18
L21_18:
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
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB13_18:
	ld r14,[r14,8]
LBE13_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB14_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE14_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB15_18:
.line 258
	ld r14,[r14]
LBE15_18:
.line 359
	jc le,r14,d1,&L49_18
L35_18:
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB19_18:
	ld r14,[r14,8]
LBE19_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB20_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE20_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc eq,r14,r0,&L27_18
Ltext10_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 114
	ld r14,#0x1
	ld.b [d2,2232],r14
L27_18:
.line 109
	add d1,#0x1
LBB22_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB25_18:
	ld r14,[r14,8]
LBE25_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB26_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE26_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB27_18:
.line 258
	ld r14,[r14]
LBE27_18:
.line 359
	jc gt,r14,d1,&L35_18
L49_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 117
	ld d1,#0x0
	jp &L36_18
L47_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB31_18:
	ld r14,[r14,8]
	add r14,#0x4
LBE31_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	jc ne,r14,r0,&L50_18
Ltext14_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 117
	add d1,#0x1
L36_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,d2
	call &__ZN4MAUI6Screen7getMainEv_92
	ld i0,r14
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB35_18:
	ld r14,[r14,8]
	add r14,#0x4
LBE35_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB36_18:
.line 258
	ld r14,[r14]
LBE36_18:
.line 359
	jc gt,r14,d1,&L47_18
L20_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 131
	add sp,#0xc
	pop rt,d4
	ret
L48_18:
.line 100
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,[d2,2252]
	call &__ZN4Feed6getAllEv_14
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[zr,_FEED_18]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L21_18
L50_18:
.line 121
	jc ne,d1,r0,&L44_18
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
L44_18:
.line 124
	ld r0,#0x2
	jc ne,d1,r0,&L20_18
.line 125
	ld r14,#0x0
	ld [d2,2228],r14
.line 126
	ld r0,#0x1
	ld.b [d2,2234],r0
	jp &L20_18

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
	jc eq,i2,r14,&L57_18
.line 155
	ld i1,[zr,_gFontBlue_4]
.line 157
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
LBE45_18:
.line 159
	pop rt,fr
	ret
L57_18:
.line 157
	ld i1,[zr,_gFontWhite_4]
	call &__ZN4MAUI5Label7setFontEPNS_4FontE_88
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
.line 355
	ld i0,[i0,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d1,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__ZN4MAUI6Screen4showEv_92
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
.line 355
	ld i0,[i0,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d1,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
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
	call &__ZN4MAUI6Screen4hideEv_92
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
	jc eq,i2,r14,&L71_18
.line 215
	add i0,#0x20
	call &__ZN6MAUtil10Connection5closeEv_78
.line 216
	ld d0,fr
	add d0,#0xfffff790
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE53_18:
.line 218
	add sp,#0x85c
	pop rt,d3
	ret
L71_18:
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
	jc eq,r14,r0,&L81_18
.line 233
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	add i0,#0x89c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE57_18:
	add sp,#0x4
	pop rt,d2
	ret
L81_18:
.line 231
	ld i0,[d2,2256]
	call &__ZN6Albums8clearAllEv_16
.line 233
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	add i0,#0x89c
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_albumname_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L86_18
.line 241
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8a4
L91_18:
.line 245
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L85_18:
.line 247
	add sp,#0x4
	pop rt,d2
	ret
L86_18:
.line 242
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_albumid_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L88_18
.line 243
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8a0
	jp &L91_18
L88_18:
.line 244
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,[zr,_xml_error_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L85_18
.line 245
	ld d0,fr
	add d0,#0xffffffe8
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	add i0,#0x8a8
	jp &L91_18

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
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
LBB63_18:
.line 174
	case d0,#0x111,#0xd,#L124_18,#L99_18
.data
	.align 4
L124_18:
	.word L101_18
	.word L102_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L99_18
	.word L104_18
	.word L127_18
	.word L110_18


.code
L104_18:
.line 185
	ld.b d1,[d3,2235]
	and d1,#0xff
	ld r0,#0x0
	jc ne,d1,r0,&L99_18
LBB66_18:
.line 186
	ld d4,fr
	add d4,#0xffffffe0
LBB67_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	ld i0,[d3,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
	ld i0,[d3,2240]
	call &__ZNK4MAUI7ListBox16getSelectedIndexEv_90
LBB68_18:
	sll r14,#0x2
	ld d0,[d0,8]
	add r14,d0
LBE68_18:
	ld i0,[r14]
	call &__ZNK4MAUI5Label10getCaptionEv_88
	ld d2,fr
	add d2,#0xffffffdc
	ld i0,d2
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,d4
	ld i1,[d3,2256]
	ld i2,d2
	call &__ZN6Albums5getIdEN6MAUtil11BasicStringIcEE_16
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
Ltext48_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 187
	ld i0,[d3,28]
	jc eq,i0,d1,&L107_18
.line 188
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L107_18:
.line 190
	ld i0,d2
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
	ld i0,#0x9dc
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d3
	ld i2,[d3,2252]
	ld i3,d2
	call &__ZN15AlbumViewScreenC1EPN4MAUI6ScreenEP4FeedN6MAUtil11BasicStringIcEE_17
	ld [d3,28],d0
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 191
	ld i0,[d3,28]
	ld r14,[i0]
	ld d0,[r14,28]
	call d0
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L99_18:
.line 208
	add sp,#0x14
	pop rt,d4
	ret
L110_18:
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
.line 327
	ld d0,[fr,-40]
LBE76_18:
.line 334
	ld r14,[d4]
	sll r14,#0x2
	add r14,d0
LBE78_18:
	jc eq,r14,d0,&L126_18
	ld d2,fr
	add d2,#0xffffffe0
	ld d1,fr
	add d1,#0xffffffdc
L116_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 198
	ld i0,d0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d1
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 199
	ld i0,d2
	ld i1,&LC10_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d2
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 200
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,&LC9_18
	call &__Z8saveDataPKcS0__4
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE80_18:
.line 197
	add d0,#0x4
LBB81_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 334
	ld r14,[d4]
	sll r14,#0x2
	ld r0,[fr,-40]
	add r14,r0
LBE82_18:
	jc ne,r14,d0,&L116_18
L126_18:
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
L127_18:
.line 205
	ld i0,#0x0
	syscall 2
L102_18:
.line 179
	ld i0,[d3,2240]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox14selectNextItemEb_90
LBE72_18:
.line 208
	add sp,#0x14
	pop rt,d4
	ret
L101_18:
.line 176
	ld i0,[d3,2240]
	ld i1,#0x1
	call &__ZN4MAUI7ListBox18selectPreviousItemEb_90
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
.line 306
	ld i0,[i0,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB90_18:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L166_18
	ld r1,[d0]
L130_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L161_18
	ld i0,[d0,8]
L140_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L140_18
L161_18:
.line 278
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
.line 327
	ld d1,[fr,-36]
LBE100_18:
.line 334
	ld r14,[d5]
	sll r14,#0x2
	add r14,d1
LBE102_18:
	jc eq,r14,d1,&L163_18
	ld d3,fr
	add d3,#0xffffffd0
	ld d4,d2
	add d4,#0xc
L148_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 138
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d3
	ld i1,r14
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d2,2248],r14
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 139
	ld i0,[d2,2248]
	ld i1,d4
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
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
.line 334
	ld r14,[d5]
	sll r14,#0x2
	ld r0,[fr,-36]
	add r14,r0
LBE104_18:
	jc ne,r14,d1,&L148_18
L163_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 143
	ld i0,[d2,2256]
	call &__ZN6Albums4sizeEv_16
	ld r2,#0x0
	jc le,r14,r2,&L149_18
.line 144
	ld i0,[d2,2240]
	ld i1,r2
	call &__ZN4MAUI7ListBox16setSelectedIndexEi_90
L150_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 136
	ld r14,[fr,-36]
	ld r0,#0x0
	jc eq,r14,r0,&L128_18
	ld d0,[r14,-4]
	sll d0,#0x2
	add d0,r14
	ld i0,[d5,8]
	jc eq,i0,d0,&L155_18
L167_18:
	add d0,#0xfffffffc
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,[d5,8]
	jc ne,i0,d0,&L167_18
L155_18:
	add i0,#0xfffffffc
	call &__ZdaPv_54
L128_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 151
	add sp,#0x10
	pop rt,d5
	ret
L149_18:
.line 146
	ld r14,#0x1
	ld.b [d2,2235],r14
.line 147
	ld d0,fr
	add d0,#0xffffffd0
	ld i0,d0
	ld i1,[zr,_empty_18]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	ld i1,#0x30
	call &__Z14createSubLabelN6MAUtil11BasicStringIcEEi_4
	ld [d2,2248],r14
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 148
	ld i0,[d2,2248]
	ld i1,d2
	add i1,#0xc
	call &__ZN4MAUI6Widget17addWidgetListenerEPNS_14WidgetListenerE_93
.line 149
	ld i0,[d2,2240]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,[d2,2248]
	call d0
	jp &L150_18
L166_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r2
	call &__Znam_57
	ld d1,r14
LBB117_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L165_18
	ld i0,[d0,8]
L134_18:
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
	jc gt,r1,r2,&L134_18
L159_18:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L168_18
.line 300
	ld [d0,8],d1
	jp &L130_18
L168_18:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L130_18
L165_18:
	ld i0,[d0,8]
	jp &L159_18

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
	jc eq,r14,r0,&L180_18
.line 255
	ld i0,d0
	ld i1,[zr,_xml_albumdone_18]
	syscall 6
	ld r0,#0x0
	jc eq,r14,r0,&L181_18
.line 259
	ld i0,d0
	ld i1,[zr,_xml_error_18]
	syscall 6
	ld r0,#0x0
	jc ne,r14,r0,&L175_18
.line 260
	ld i0,d4
	add i0,#0x8a8
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,r14
L177_18:
.line 262
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d4,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
L179_18:
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE118_18:
.line 264
	add sp,#0x4
	pop rt,d4
	ret
L181_18:
.line 256
	ld d1,fr
	add d1,#0xffffffe0
	ld i0,d1
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d4,2244]
	ld r14,[i0]
	ld d0,[r14,92]
	ld i1,d1
	call d0
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 257
	ld i0,d4
	call &__ZN15AlbumLoadScreen8drawListEv_18
.line 258
	ld i0,d1
	ld i1,[d4,2256]
	call &__ZN6Albums6getAllEv_16
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[zr,_ALBUM_18]
	ld i1,r14
	call &__Z8saveDataPKcS0__4
	ld i0,d1
.line 262
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE119_18:
.line 264
	add sp,#0x4
	pop rt,d4
	ret
L180_18:
.line 251
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d4,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 252
	ld d2,d4
	add d2,#0x8a4
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d1,r14
	ld d3,d4
	add d3,#0x8a0
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d4,2256]
	ld i1,d1
	ld i2,r14
	call &__ZN6Albums8addAlbumEPKcS1__16
.line 253
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 254
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	jp &L179_18
L175_18:
.line 262
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i1,&LC9_18
	jp &L177_18

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
	call &__ZN4MAUI6ScreenC2Ev_92
LBB122_18:
	ld i1,d2
	add i1,#0x18
LBE122_18:
	ld r0,&__ZTV15AlbumLoadScreen_18+8
	ld [d2],r0
	ld r14,&__ZTV15AlbumLoadScreen_18+112
	ld [d2,4],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+140
	ld [d2,12],r0
	ld r14,&__ZTV15AlbumLoadScreen_18+164
	ld [d2,16],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+176
	ld [d2,20],r0
	ld r14,&__ZTV15AlbumLoadScreen_18+220
	ld [i1],r14
	ld i0,d2
	add i0,#0x20
	call &__ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_78
	ld i0,d2
	add i0,#0x48
	call &__ZN13XmlConnectionC1Ev_3
	ld i0,d2
	add i0,#0x89c
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8a0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8a4
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld i0,d2
	add i0,#0x8a8
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld [d2,2252],d1
.line 21
	ld i0,#0xc
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6ScreenC1Ev_92
	ld [d2,28],d0
.line 22
	ld i0,d1
	call &__ZN4Feed15getTouchEnabledEv_14
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L189_18
.line 23
	ld i0,&LC11_18
	ld i1,&LC12_18
	ld i2,&LC9_18
L195_18:
.line 25
	ld i3,#0x1
	call &__Z16createMainLayoutPKcS0_S0_b_4
	ld i0,r14
	ld [d2,2236],r14
LBB123_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 355
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB125_18:
	ld r14,[r14,8]
LBE125_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB126_18:
	ld r14,[r14,8]
	add r14,#0x8
LBE126_18:
	ld r14,[r14]
	ld [d2,2240],r14
LBB127_18:
	ld i0,[d2,2236]
	call &__ZN4MAUI6Widget11getChildrenEv_93
LBB129_18:
	ld r14,[r14,8]
LBE129_18:
	ld i0,[r14]
	call &__ZN4MAUI6Widget11getChildrenEv_93
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,[d2,2244]
	ld r14,[i0]
	ld d1,[r14,92]
	ld i1,d0
	call d1
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
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
	call &__ZN4MAUI6Screen7setMainEPNS_6WidgetE_92
.line 44
	ld [zr,_orig_4],d2
.line 45
	ld r14,#0x0
	ld [d2,2228],r14
LBE121_18:
	add sp,#0x4
	pop rt,d2
	ret
L189_18:
.line 25
	ld i0,&LC11_18
	ld i1,&LC12_18
	ld i2,[zr,_select_18]
	jp &L195_18

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
	ld r14,&__ZTV15AlbumLoadScreen_18+140
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+164
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumLoadScreen_18+176
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumLoadScreen_18+220
	ld [i0,24],r14
LBB144_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,2236]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB145_18:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L295_18
	ld r1,[d0]
L214_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L280_18
	ld i0,[d0,8]
L224_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L224_18
L280_18:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE148_18:
.line 306
	ld i0,[d5,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB154_18:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L296_18
	ld r1,[d0]
L228_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L284_18
	ld i0,[d0,8]
L238_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L238_18
L284_18:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE157_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 52
	ld i0,[d5,2240]
	jc ne,i0,r14,&L297_18
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc ne,i0,r0,&L298_18
L244_18:
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L299_18
L245_18:
.line 58
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L300_18
L248_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc ne,i0,r2,&L301_18
L266_18:
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc ne,i0,r14,&L302_18
L268_18:
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc ne,i0,r0,&L303_18
L270_18:
.line 66
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d4,d5
	add d4,#0x89c
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 67
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d3,d5
	add d3,#0x8a0
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 68
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d2,d5
	add d2,#0x8a4
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d5
	add d1,#0x8a8
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	add i0,#0x48
	call &__ZN13XmlConnectionD1Ev_3
LBB162_18:
.line 20
	ld i0,d5
	add i0,#0x20
LBB163_18:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE163_18:
	ld i0,d5
	call &__ZN4MAUI6ScreenD2Ev_92
LBE143_18:
.line 70
	ld i0,d5
	call &__ZdlPv_55
	add sp,#0x4
	pop rt,d5
	ret
L297_18:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc eq,i0,r0,&L244_18
L298_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L245_18
L299_18:
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
	jc eq,i0,r0,&L248_18
L300_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB166_18:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L304_18
	ld r1,[d0]
L250_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L288_18
	ld i0,[d0,8]
L260_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L260_18
L288_18:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE169_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L305_18
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L308_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc eq,i0,r2,&L266_18
L301_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc eq,i0,r14,&L268_18
L302_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc eq,i0,r0,&L270_18
L303_18:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L270_18
L296_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB182_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L292_18
	ld i0,[d0,8]
L232_18:
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
	jc gt,r1,r2,&L232_18
L282_18:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L306_18
.line 300
	ld [d0,8],d1
	jp &L228_18
L295_18:
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB191_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L290_18
	ld i0,[d0,8]
L218_18:
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
	jc gt,r1,r2,&L218_18
L278_18:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L307_18
.line 300
	ld [d0,8],d1
	jp &L214_18
L305_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L308_18
L307_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L214_18
L306_18:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L228_18
L304_18:
.line 291
	ld i0,r2
	call &__Znam_57
	ld d1,r14
LBB216_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L294_18
	ld i0,[d0,8]
L254_18:
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
	jc gt,r1,r2,&L254_18
L286_18:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L309_18
.line 300
	ld [d0,8],d1
	jp &L250_18
L309_18:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L250_18
L292_18:
	ld i0,[d0,8]
	jp &L282_18
L290_18:
	ld i0,[d0,8]
	jp &L278_18
L294_18:
	ld i0,[d0,8]
	jp &L286_18

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
	ld r14,&__ZTV15AlbumLoadScreen_18+140
	ld [i0,12],r14
	ld r0,&__ZTV15AlbumLoadScreen_18+164
	ld [i0,16],r0
	ld r2,&__ZTV15AlbumLoadScreen_18+176
	ld [i0,20],r2
	ld r14,&__ZTV15AlbumLoadScreen_18+220
	ld [i0,24],r14
LBB218_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	ld i0,[i0,2236]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB219_18:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L395_18
	ld r1,[d0]
L314_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L380_18
	ld i0,[d0,8]
L324_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L324_18
L380_18:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE222_18:
.line 306
	ld i0,[d5,2240]
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB228_18:
.line 288
	ld r14,[r14,4]
	ld r0,#0x0
	jc lt,r14,r0,&L396_18
	ld r1,[d0]
L328_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L384_18
	ld i0,[d0,8]
L338_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L338_18
L384_18:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE231_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 52
	ld i0,[d5,2240]
	jc ne,i0,r14,&L397_18
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc ne,i0,r0,&L398_18
L344_18:
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc ne,i0,r2,&L399_18
L345_18:
.line 58
	ld i0,[zr,_softKeys_4]
	ld r0,#0x0
	jc ne,i0,r0,&L400_18
L348_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc ne,i0,r2,&L401_18
L366_18:
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc ne,i0,r14,&L402_18
L368_18:
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc ne,i0,r0,&L403_18
L370_18:
.line 66
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d4,d5
	add d4,#0x89c
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 67
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d3,d5
	add d3,#0x8a0
	ld i0,d3
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 68
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d2,d5
	add d2,#0x8a4
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,d0
	ld i1,&LC9_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld d1,d5
	add d1,#0x8a8
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d2
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d4
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d5
	add i0,#0x48
	call &__ZN13XmlConnectionD1Ev_3
LBB236_18:
.line 20
	ld i0,d5
	add i0,#0x20
LBB237_18:
	ld r2,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r2
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE237_18:
	ld i0,d5
	call &__ZN4MAUI6ScreenD2Ev_92
LBE217_18:
.line 70
	add sp,#0x4
	pop rt,d5
	ret
L397_18:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld i0,[d5,2236]
	ld r0,#0x0
	jc eq,i0,r0,&L344_18
L398_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 54
	ld i0,[zr,_image_4]
	ld r2,#0x0
	jc eq,i0,r2,&L345_18
L399_18:
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
	jc eq,i0,r0,&L348_18
L400_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 306
	call &__ZN4MAUI6Widget11getChildrenEv_93
	ld d0,r14
LBB240_18:
.line 288
	ld r14,[r14,4]
	ld r2,#0x0
	jc lt,r14,r2,&L404_18
	ld r1,[d0]
L350_18:
.line 274
	ld r0,#0x0
	jc le,r1,r0,&L388_18
	ld i0,[d0,8]
L360_18:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r2,#0x0
	ld [r14],r2
.line 274
	add r0,#0x1
	jc gt,r1,r0,&L360_18
L388_18:
.line 278
	ld r14,#0x0
	ld [d0],r14
LBE243_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld i0,[zr,_softKeys_4]
	jc ne,i0,r14,&L405_18
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
L408_18:
.line 63
	ld i0,[d5,2248]
	ld r2,#0x0
	jc eq,i0,r2,&L366_18
L401_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 64
	ld i0,[d5,2244]
	ld r14,#0x0
	jc eq,i0,r14,&L368_18
L402_18:
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 65
	ld i0,[d5,28]
	ld r0,#0x0
	jc eq,i0,r0,&L370_18
L403_18:
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L370_18
L396_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB256_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L392_18
	ld i0,[d0,8]
L332_18:
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
	jc gt,r1,r2,&L332_18
L382_18:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L406_18
.line 300
	ld [d0,8],d1
	jp &L328_18
L395_18:
.line 291
	ld i0,r0
	call &__Znam_57
	ld d1,r14
LBB265_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L390_18
	ld i0,[d0,8]
L318_18:
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
	jc gt,r1,r2,&L318_18
L378_18:
.line 297
	ld r2,#0x0
	ld [d0,4],r2
.line 298
	jc ne,i0,r2,&L407_18
.line 300
	ld [d0,8],d1
	jp &L314_18
L405_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 60
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 61
	ld r0,#0x0
	ld [zr,_softKeys_4],r0
	jp &L408_18
L407_18:
.sourcefile 'c:\MoSync\include\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L314_18
L406_18:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L328_18
L404_18:
.line 291
	ld i0,r2
	call &__Znam_57
	ld d1,r14
LBB290_18:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L394_18
	ld i0,[d0,8]
L354_18:
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
	jc gt,r1,r2,&L354_18
L386_18:
.line 297
	ld r14,#0x0
	ld [d0,4],r14
.line 298
	jc ne,i0,r14,&L409_18
.line 300
	ld [d0,8],d1
	jp &L350_18
L409_18:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld [d0,8],d1
	jp &L350_18
L392_18:
	ld i0,[d0,8]
	jp &L382_18
L390_18:
	ld i0,[d0,8]
	jp &L378_18
L394_18:
	ld i0,[d0,8]
	jp &L386_18

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
	jc eq,i1,r14,&L545_18
L509_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 276
	add sp,#0x4
	pop rt,d0
	ret
L545_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 61
	ld r14,#0x1
	jc eq,i0,r14,&L546_18
.line 77
	ld r14,#0x0
	jc ne,i0,r14,&L509_18
	ld i0,&_TRADE_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,&_CARDS_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,&_ALBUMS_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 71
	ld i0,&_USER_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 69
	ld i0,&_URL_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 61
	ld i0,&_base64_chars_18
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
L547_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\AlbumLoadScreen.cpp'
.line 276
	add sp,#0x4
	pop rt,d0
	ret
L546_18:
.sourcefile 'E:\My Dropbox\workspace\GameCards\BTVouchers\\Util.h'
.line 65
	ld i0,&_base64_chars_18
	ld i1,&LC13_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 69
	ld i0,&_URL_18
	ld i1,&LC14_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
.line 71
	ld d0,fr
	add d0,#0xfffffff0
	ld i0,d0
	ld i1,&LC15_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_USER_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 73
	ld i0,d0
	ld i1,&LC16_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_ALBUMS_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 75
	ld i0,d0
	ld i1,&LC17_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_CARDS_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 77
	ld i0,d0
	ld i1,&LC18_18
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,&_TRADE_18
	ld i1,&_URL_18
	ld i2,d0
	call &__ZNK6MAUtil11BasicStringIcEplERKS1__70
	ld i0,d0
.line 61
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L547_18

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
	ld i0,#0x959507e8
	syscall 1
	ld r0,#0x959507e8
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
.line 138
	ld d0,[zr,_gMallocHook_31]
	call d0
.line 140
	ld r0,#0x0
	jc eq,r14,r0,&L20_31
L18_31:
.line 158
	ld r0,r14
L17_31:
.line 159
	ld r14,r0
	pop rt,d1
	ret
L20_31:
.line 142
	ld d0,[zr,_gMallocHandler_31]
	jc eq,d0,r14,&L17_31
.line 144
	ld i0,d1
	call d0
.line 145
	ld i0,d1
	ld d0,[zr,_gMallocHook_31]
	call d0
	jp &L18_31

//****************************************
// Function: _free
//****************************************

.func _free_31, 1, void
.line 185
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 188
	ld r14,#0x0
	jc eq,i0,r14,&L23_31
.line 198
	ld d0,[zr,_gFreeHook_31]
	call d0
L23_31:
.line 204
	pop rt,d0
	ret

//****************************************
// Function: _realloc
//****************************************

.func _realloc_31, 2, int
.line 209
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d2,i0
	ld d1,i1
.line 213
	ld d0,[zr,_gReallocHook_31]
	call d0
.line 214
	ld r0,#0x0
	jc eq,r14,r0,&L28_31
L26_31:
.line 221
	ld r0,r14
L25_31:
.line 222
	ld r14,r0
	pop rt,d2
	ret
L28_31:
.line 216
	ld d0,[zr,_gMallocHandler_31]
	jc eq,d0,r14,&L25_31
.line 218
	ld i0,d1
	call d0
.line 219
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
.line 1861
	ld i0,#0x14
	ld i1,d1
	ld i2,d0
	ld i3,#0x0
	syscall 96
	ld r0,r14
	ld r1,r15
LBE43_37:
.line 1860
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
// Function: ___cxa_pure_virtual
//****************************************

.func ___cxa_pure_virtual_39, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAStd\macpp.cpp'
.line 20
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_39:
.line 21
	ld i0,#0xffffffd6
	syscall 2

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
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1861
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
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1861
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
// Function: __ZdaPv
//****************************************

.func __ZdaPv_54, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\del_opvnt.cc'
.line 35
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_54:
.line 36
	call &__ZdlPv_55
LBE2_54:
	pop rt,fr
	ret

//****************************************
// Function: __ZdlPv
//****************************************

.func __ZdlPv_55, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\del_opnt.cc'
.line 37
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_55:
.line 38
	ld r14,#0x0
	jc eq,i0,r14,&L1_55
.line 39
	call &_free_31
L1_55:
.line 40
	pop rt,fr
	ret

//****************************************
// Function: __Znwm
//****************************************

.func __Znwm_56, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\new_opnt.cc'
.line 41
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_56:
.line 45
	ld r14,#0x0
	jc ne,i0,r14,&L2_56
.line 46
	ld i0,#0x1
L2_56:
.line 47
	call &_malloc_31
LBE3_56:
.line 68
	pop rt,fr
	ret

//****************************************
// Function: __Znam
//****************************************

.func __Znam_57, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\libsupc++\new_opvnt.cc'
.line 35
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_57:
.line 36
	call &__Znwm_56
LBE2_57:
.line 37
	pop rt,fr
	ret

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
	ld i0,&__global_ctor_chain_98
	call &_crt_tor_chain_27
	call &_MAMain_13
crt_exit_58:
	ld [sp],r14
	ld i0,&__global_dtor_chain_98
	call &_crt_tor_chain_27
	ld i0,[sp]
	syscall 2
	ret

//****************************************
// Function: _compute_bits
//****************************************

.func _compute_bits_60, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\kazlib\hash.c'
.line 89
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 90
	ld r14,#0xffffffff
.line 91
	ld r15,#0x0
L4_60:
.line 94
	add r15,#0x1
.line 95
	srl r14,#0x1
	ld r0,#0x0
	jc ne,r14,r0,&L4_60
.line 98
	ld [zr,_hash_val_t_bit_60],r15
	pop fr,fr
	ret

//****************************************
// Function: _is_power_of_two
//****************************************

.func _is_power_of_two_60, 1, int
.line 106
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 108
	ld r14,i0
.line 107
	ld r0,#0x0
	jc eq,i0,r0,&L8_60
.line 110
	xor r14,#0x1
	and r14,#0x1
	jc eq,r14,r0,&L15_60
L17_60:
	srl i0,#0x1
	ld r14,i0
	xor r14,#0x1
	and r14,#0x1
	ld r0,#0x0
	jc ne,r14,r0,&L17_60
L15_60:
.line 111
	ld r14,#0x0
	ld r0,#0x1
	jc eq,i0,r0,&L18_60
L8_60:
.line 112
	pop fr,fr
	ret
L18_60:
.line 111
	ld r14,i0
.line 112
	pop fr,fr
	ret

//****************************************
// Function: _clear_table
//****************************************

.func _clear_table_60, 1, void
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

.func _hash_verify_60, 1, int
.line 739
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
.line 740
	ld d1,#0x0
.line 744
	ld r14,[i0,48]
	jc eq,r14,d1,&L21_60
.line 745
	ld r14,[i0,20]
	ld i0,[i0,16]
.line 746
	ld r0,d1
.line 745
	jc ltu,r14,i0,&L39_60
L20_60:
.line 765
	ld r14,r0
	pop rt,d1
	ret
L39_60:
.line 747
	call &_is_power_of_two_60
.line 748
	ld r0,r14
.line 747
	ld r1,d1
	jc eq,r14,d1,&L20_60
.line 749
	ld i0,[d0,20]
	call &_is_power_of_two_60
.line 750
	ld r0,r14
.line 749
	ld r1,d1
	jc eq,r14,d1,&L20_60
L21_60:
.line 753
	ld r2,#0x0
	ld r3,[d0,4]
	jc leu,r3,r2,&L36_60
	ld r4,[d0]
L33_60:
.line 754
	ld r14,r2
	sll r14,#0x2
	add r14,r4
	ld r0,[r14]
	ld r14,#0x0
	jc eq,r0,r14,&L38_60
	ld r1,[d0,44]
L32_60:
.line 755
	ld r14,[r0,12]
	and r14,r1
	jc ne,r14,r2,&L40_60
.line 757
	add d1,#0x1
.line 754
	ld r0,[r0]
	ld r14,#0x0
	jc ne,r0,r14,&L32_60
L38_60:
.line 753
	add r2,#0x1
	jc gtu,r3,r2,&L33_60
L36_60:
.line 761
	ld r14,[d0,8]
.line 762
	ld r0,#0x0
.line 761
	jc ne,r14,d1,&L20_60
.line 764
	ld r0,#0x1
	jp &L20_60
L40_60:
.line 756
	ld r0,#0x0
.line 765
	ld r14,r0
	pop rt,d1
	ret

//****************************************
// Function: _hash_set_allocator
//****************************************

.func _hash_set_allocator_60, 4, void
.line 343
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 344
	ld r14,[i0,8]
	ld r0,#0x0
	jc ne,r14,r0,&L63_60
.line 345
	jc eq,i1,r14,&L64_60
L58_60:
	ld r14,#0x0
	jc eq,i1,r14,&L59_60
	jc eq,i2,r14,&L59_60
L56_60:
.line 347
	ld r14,i1
	ld r0,#0x0
	jc eq,i1,r0,&L65_60
L60_60:
	ld [i0,32],r14
.line 348
	ld r14,i2
	ld r0,#0x0
	jc eq,i2,r0,&L66_60
	ld [i0,36],r14
.line 349
	ld [i0,40],i3
	pop rt,fr
	ret
L59_60:
.line 345
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x159
	call &_bfeHandler_28
L64_60:
	jc ne,i2,i1,&L58_60
	jp &L56_60
L66_60:
.line 348
	ld r14,&_hnode_free_60
	ld [i0,36],r14
.line 349
	ld [i0,40],i3
	pop rt,fr
	ret
L65_60:
.line 347
	ld r14,&_hnode_alloc_60
	jp &L60_60
L63_60:
.line 344
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x158
.line 345
	call &_bfeHandler_28

//****************************************
// Function: _hash_scan_begin
//****************************************

.func _hash_scan_begin_60, 2, void
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
	jc leu,r0,r15,&L69_60
	ld r1,[i1]
	ld r14,[r1]
	jc ne,r14,r15,&L69_60
L71_60:
	add r15,#0x1
	jc geu,r15,r0,&L72_60
	ld r14,r15
	sll r14,#0x2
	add r14,r1
	ld r14,[r14]
	ld r2,#0x0
	jc eq,r14,r2,&L71_60
L69_60:
.line 460
	jc geu,r15,r0,&L72_60
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
L72_60:
.line 464
	ld r14,#0x0
	ld [i0,8],r14
.line 466
	pop fr,fr
	ret

//****************************************
// Function: _hash_scan_next
//****************************************

.func _hash_scan_next_60, 1, int
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
	ld r14,[zr,_hash_val_t_bit_60]
	ld r4,#0x0
	jc eq,r14,r4,&L89_60
.line 515
	ld r5,#0x0
	jc eq,r2,r5,&L78_60
.line 516
	ld r14,[r2]
	jc ne,r14,r5,&L88_60
.line 520
	jc geu,r0,r1,&L84_60
	ld r4,[r3]
L87_60:
	ld r14,r0
	sll r14,#0x2
	add r14,r4
	ld r14,[r14]
	ld r5,#0x0
	jc ne,r14,r5,&L82_60
	add r0,#0x1
	jc ltu,r0,r1,&L87_60
L84_60:
.line 525
	ld r14,#0x0
L88_60:
	ld [i0,8],r14
L78_60:
.line 530
	ld r14,r2
	pop rt,fr
	ret
L82_60:
.line 521
	jc geu,r0,r1,&L84_60
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
L89_60:
.line 513
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x201
	call &_bfeHandler_28

//****************************************
// Function: _hash_init
//****************************************

.func _hash_init_60, 6, int
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
	ld r14,[zr,_hash_val_t_bit_60]
	ld r0,#0x0
	jc eq,r14,r0,&L112_60
L99_60:
.line 420
	ld i0,d1
	call &_is_power_of_two_60
	ld r0,#0x0
	jc eq,r14,r0,&L113_60
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
	jc eq,d2,r0,&L114_60
L102_60:
	ld [d0,24],r14
.line 427
	ld r14,d3
	ld r0,#0x0
	jc eq,d3,r0,&L115_60
L103_60:
	ld [d0,28],r14
.line 428
	ld r14,#0x0
	ld [d0,48],r14
LBB2_60:
.line 120
	ld i0,d1
	call &_is_power_of_two_60
	ld r0,#0x0
	jc eq,r14,r0,&L116_60
.line 121
	ld r14,#0x1
	jc leu,d1,r14,&L117_60
	add d1,#0xffffffff
LBE3_60:
.line 119
	ld [d0,44],d1
.line 430
	ld i0,d0
	call &_clear_table_60
.line 432
	ld i0,d0
	call &_hash_verify_60
	ld r0,#0x0
	jc eq,r14,r0,&L118_60
.line 435
	ld r14,d0
	pop rt,d4
	ret
L112_60:
.line 418
	call &_compute_bits_60
	jp &L99_60
L115_60:
.line 427
	ld r14,&_hash_fun_default_60
	jp &L103_60
L114_60:
.line 426
	ld r14,&_hash_comp_default_60
	jp &L102_60
L113_60:
.line 420
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x1a4
.line 432
	call &_bfeHandler_28
L116_60:
.line 120
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x78
LBE5_60:
.line 432
	call &_bfeHandler_28
L117_60:
.line 121
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x79
LBE7_60:
.line 432
	call &_bfeHandler_28
L118_60:
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x1b0
	call &_bfeHandler_28

//****************************************
// Function: _hash_scan_init
//****************************************

.func _hash_scan_init_60, 3, void
.line 472
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 473
	ld [i0],i1
.line 474
	ld r14,#0x0
	jc eq,i2,r14,&L120_60
.line 475
	ld r14,[i2,12]
	ld i1,[i1,44]
	and r14,i1
	ld [i0,4],r14
L120_60:
.line 477
	ld [i0,8],i2
	pop fr,fr
	ret

//****************************************
// Function: _hash_lookup_hkey
//****************************************

.func _hash_lookup_hkey_60, 3, int
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
	jc eq,d1,r14,&L128_60
L131_60:
.line 612
	ld r14,[d1,12]
	jc eq,r14,d2,&L130_60
L124_60:
.line 611
	ld d1,[d1]
	ld r14,#0x0
	jc ne,d1,r14,&L131_60
L128_60:
.line 616
	ld r14,#0x0
.line 617
	pop rt,d4
	ret
L130_60:
.line 612
	ld d0,[d3,24]
	ld i0,[d1,4]
	ld i1,d4
	call d0
	ld r0,#0x0
	jc ne,r14,r0,&L124_60
.line 613
	ld r14,d1
.line 617
	pop rt,d4
	ret

//****************************************
// Function: _hash_clone_insert
//****************************************

.func _hash_clone_insert_60, 2, int
.line 557
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
.line 561
	ld r14,[zr,_hash_val_t_bit_60]
	ld r0,#0x0
	jc eq,r14,r0,&L167_60
.line 562
	ld r14,[i0,8]
	ld r1,[i0,12]
	jc geu,r14,r1,&L168_60
.line 564
	ld i1,[i1,4]
	ld i2,[d1,12]
	call &_hash_lookup_hkey_60
	ld r0,r14
.line 566
	ld r1,r14
.line 565
	ld r10,#0x0
	jc eq,r14,r10,&L169_60
L132_60:
.line 581
	ld r14,r1
	pop rt,d1
	ret
L169_60:
.line 569
	ld r14,[d0,48]
	jc eq,r14,r0,&L164_60
	ld r0,[d0,8]
	ld r14,[d0,16]
	jc ltu,r0,r14,&L138_60
LBB8_60:
.line 171
	ld i1,[d0,4]
	ld r14,i1
	add r14,i1
	jc leu,r14,i1,&L170_60
.line 173
	ld i0,[d0]
	sll i1,#0x3
	call &_realloc_31
	ld r7,r14
.line 176
	ld r0,#0x0
	jc eq,r14,r0,&L141_60
LBB10_60:
.line 177
	ld r14,[d0,44]
	ld r9,r14
	sll r9,#0x1
	or r9,#0x1
.line 178
	ld r6,r14
	xor r6,r9
.line 181
	jc eq,r14,r9,&L171_60
.line 183
	ld r8,#0x0
	ld r5,[d0,4]
	jc leu,r5,r8,&L160_60
L173_60:
.line 184
	ld r4,#0x0
	ld r2,r4
.line 186
	ld r3,r8
	sll r3,#0x2
	ld r14,r3
	add r14,r7
	ld r0,[r14]
	jc ne,r0,r4,&L152_60
	jp &L162_60
L172_60:
.line 190
	ld [r0],r4
.line 191
	ld r4,r0
.line 186
	ld r0,r1
	ld r14,#0x0
	jc eq,r1,r14,&L162_60
L152_60:
.line 187
	ld r1,[r0]
.line 189
	ld r14,[r0,12]
	and r14,r6
	ld r10,#0x0
	jc ne,r14,r10,&L172_60
.line 193
	ld [r0],r2
.line 194
	ld r2,r0
.line 186
	ld r0,r1
	ld r14,#0x0
	jc ne,r1,r14,&L152_60
L162_60:
.line 198
	add r3,r7
	ld [r3],r2
.line 199
	ld r14,r8
	add r14,r5
	sll r14,#0x2
	add r14,r7
	ld [r14],r4
LBE11_60:
.line 183
	add r8,#0x1
	jc gtu,r5,r8,&L173_60
L160_60:
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
L141_60:
.line 208
	ld i0,d0
	call &_hash_verify_60
	ld r0,#0x0
	jc eq,r14,r0,&L174_60
L164_60:
	ld r0,[d0,8]
L138_60:
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
	call &_hash_verify_60
.line 580
	ld r1,#0x0
.line 578
	jc ne,r14,r1,&L132_60
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x242
	call &_bfeHandler_28
L174_60:
.line 208
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xd0
LBE13_60:
.line 578
	call &_bfeHandler_28
L168_60:
.line 562
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x232
.line 578
	call &_bfeHandler_28
L167_60:
.line 561
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x231
.line 578
	call &_bfeHandler_28
L170_60:
.line 171
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xab
LBE15_60:
.line 578
	call &_bfeHandler_28
L171_60:
.line 181
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xb5
LBE18_60:
.line 578
	call &_bfeHandler_28

//****************************************
// Function: _hash_insert
//****************************************

.func _hash_insert_60, 3, int
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
	jc ne,r14,r0,&L178_60
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
	call &_hash_clone_insert_60
.line 553
	pop rt,d3
	ret
L178_60:
.line 547
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x223
	call &_bfeHandler_28

//****************************************
// Function: _hash_lookup
//****************************************

.func _hash_lookup_60, 2, int
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
	call &_hash_lookup_hkey_60
.line 602
	pop rt,d2
	ret

//****************************************
// Function: _hash_scan_delete
//****************************************

.func _hash_scan_delete_60, 2, int
.line 694
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
.line 698
	ld i1,[i1,4]
	call &_hash_lookup_60
	jc ne,r14,d0,&L196_60
.line 699
	ld r14,[zr,_hash_val_t_bit_60]
	ld r0,#0x0
	jc eq,r14,r0,&L197_60
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
	jc eq,r0,d0,&L198_60
.line 708
	ld r14,[r0]
	jc eq,r14,d0,&L193_60
L199_60:
	ld r0,r14
	ld r14,[r14]
	jc ne,r14,d0,&L199_60
L193_60:
.line 709
	ld r14,[d0]
	ld [r0],r14
L186_60:
.line 712
	ld r14,[d1,8]
	add r14,#0xffffffff
	ld [d1,8],r14
.line 713
	ld i0,d1
	call &_hash_verify_60
	ld r0,#0x0
	jc eq,r14,r0,&L200_60
.line 714
	ld r14,#0x0
	ld [d0],r14
.line 717
	ld r14,d0
	pop rt,d1
	ret
L198_60:
.line 705
	ld r0,[d0]
	ld [r14],r0
	jp &L186_60
L196_60:
.line 698
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2ba
.line 713
	call &_bfeHandler_28
L197_60:
.line 699
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2bb
.line 713
	call &_bfeHandler_28
L200_60:
	ld i0,&LC0_60
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2c9
	call &_bfeHandler_28

//****************************************
// Function: _hash_free_nodes_noclear
//****************************************

.func _hash_free_nodes_noclear_60, 1, void
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
	call &_hash_scan_begin_60
	jp &L202_60
L204_60:
.line 369
	ld i0,d2
	ld i1,d1
	call &_hash_scan_delete_60
.line 370
	ld d0,[d2,36]
	ld i0,d1
	ld i1,[d2,40]
	call d0
L202_60:
	ld i0,d3
	call &_hash_scan_next_60
	ld d1,r14
	ld r14,#0x0
	jc ne,d1,r14,&L204_60
.line 372
	ld [d2,8],r14
	add sp,#0xc
	pop rt,d3
	ret

//****************************************
// Function: _hash_free_nodes
//****************************************

.func _hash_free_nodes_60, 1, void
.line 358
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
.line 359
	call &_hash_free_nodes_noclear_60
.line 360
	ld i0,d0
	call &_clear_table_60
	pop rt,d0
	ret

//****************************************
// Function: _hnode_alloc
//****************************************

.func _hnode_alloc_60, 1, int
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

.func _hnode_free_60, 2, void
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

.func _hash_fun_default_60, 1, int
.line 865
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 874
	ld r1,#0x0
.line 882
	ld.b r14,[i0]
	and r14,#0xff
	jc eq,r14,r1,&L286_60
	ld r15,r14
L284_60:
.line 877
	ld r14,r15
	add r14,r1
	and r14,#0xf
	sll r14,#0x2
	ld r14,[r14,randbox_0_60]
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
	ld r15,[r15,randbox_0_60]
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
	jc ne,r15,r0,&L284_60
L286_60:
.line 885
	ld r14,r1
	pop fr,fr
	ret

//****************************************
// Function: _hash_comp_default
//****************************************

.func _hash_comp_default_60, 2, int
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
// Function: _rotate_left
//****************************************

.func _rotate_left_61, 1, void
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
	jc eq,r14,i0,&L7_61
.line 102
	ld r14,[r0,4]
	jc ne,r14,i0,&L8_61
.line 103
	ld [r0,4],r1
.line 106
	ld [r1],i0
.line 107
	ld [i0,8],r1
	pop rt,fr
	ret
L7_61:
.line 100
	ld [r0],r1
.line 106
	ld [r1],i0
.line 107
	ld [i0,8],r1
	pop rt,fr
	ret
L8_61:
.line 102
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x66
	call &_bfeHandler_28

//****************************************
// Function: _rotate_right
//****************************************

.func _rotate_right_61, 1, void
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
	jc eq,r14,i0,&L14_61
.line 128
	ld r14,[r0]
	jc ne,r14,i0,&L15_61
.line 129
	ld [r0],r1
.line 132
	ld [r1,4],i0
.line 133
	ld [i0,8],r1
	pop rt,fr
	ret
L14_61:
.line 126
	ld [r0,4],r1
.line 132
	ld [r1,4],i0
.line 133
	ld [i0,8],r1
	pop rt,fr
	ret
L15_61:
.line 128
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x80
	call &_bfeHandler_28

//****************************************
// Function: _free_nodes
//****************************************

.func _free_nodes_61, 3, void
.line 142
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d2,i0
	ld d1,i1
	ld d0,i2
.line 143
	jc eq,i1,i2,&L16_61
.line 145
	ld i1,[i1]
	call &_free_nodes_61
.line 146
	ld i0,d2
	ld i1,[d1,4]
	ld i2,d0
	call &_free_nodes_61
.line 147
	ld d0,[d2,40]
	ld i0,d1
	ld i1,[d2,44]
	call d0
L16_61:
.line 148
	pop rt,d2
	ret

//****************************************
// Function: _dict_first
//****************************************

.func _dict_first_61, 1, int
.line 851
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 852
	ld r15,[i0]
.line 854
	jc eq,r15,i0,&L24_61
.line 856
	ld r14,[r15]
	jc eq,r14,i0,&L27_61
L29_61:
	ld r15,r14
	ld r14,[r14]
	jc ne,r14,i0,&L29_61
L27_61:
.line 858
	ld r14,r15
	jc eq,r15,i0,&L24_61
.line 859
	pop fr,fr
	ret
L24_61:
.line 858
	ld r14,#0x0
.line 859
	pop fr,fr
	ret

//****************************************
// Function: _dict_next
//****************************************

.func _dict_next_61, 2, int
.line 885
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 888
	ld r14,[i1,4]
	jc eq,r14,i0,&L31_61
.line 889
	ld i1,r14
.line 891
	ld r14,[r14]
	jc eq,r14,i0,&L30_61
L44_61:
	ld i1,r14
	ld r14,[r14]
	jc ne,r14,i0,&L44_61
L30_61:
.line 903
	ld r14,i1
	pop fr,fr
	ret
L31_61:
.line 895
	ld r15,[i1,8]
.line 899
	jc eq,r15,i0,&L38_61
	ld r14,[r15,4]
	jc eq,r14,i1,&L37_61
.line 902
	ld i1,r15
	jc ne,r15,i0,&L30_61
L38_61:
	ld i1,#0x0
	jp &L30_61
L37_61:
.line 898
	ld i1,r15
.line 899
	ld r15,[r15,8]
	jc eq,r15,i0,&L38_61
	ld r14,[r15,4]
	jc eq,r14,i1,&L37_61
.line 902
	ld i1,r15
	jc ne,r15,i0,&L30_61
	jp &L38_61

//****************************************
// Function: _verify_bintree
//****************************************

.func _verify_bintree_61, 1, int
.line 160
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
.line 163
	call &_dict_first_61
	ld d2,r14
.line 165
	ld r14,[d3,48]
	ld r0,#0x0
	jc eq,r14,r0,&L52_61
.line 169
	ld r14,#0x0
	jc eq,d2,r14,&L51_61
L57_61:
	ld i0,d3
	ld i1,d2
	call &_dict_next_61
	ld d1,r14
	ld r0,#0x0
	jc eq,r14,r0,&L51_61
.line 167
	ld d0,[d3,32]
	ld i0,[d2,16]
	ld i1,[d1,16]
	call d0
	ld r0,#0x0
	jc gt,r14,r0,&L56_61
.line 169
	ld d2,d1
	ld r14,#0x0
	jc ne,d2,r14,&L57_61
L51_61:
.line 178
	ld r14,#0x1
.line 179
	pop rt,d3
	ret
L52_61:
.line 175
	ld r14,#0x0
	jc eq,d2,r14,&L51_61
	ld i0,d3
	ld i1,d2
	call &_dict_next_61
	ld d1,r14
	ld r0,#0x0
	jc eq,r14,r0,&L51_61
.line 173
	ld d0,[d3,32]
	ld i0,[d2,16]
	ld i1,[d1,16]
	call d0
	ld r0,#0x0
	jc ge,r14,r0,&L56_61
.line 175
	ld d2,d1
	jp &L52_61
L56_61:
.line 174
	ld r14,r0
.line 179
	pop rt,d3
	ret

//****************************************
// Function: _verify_redblack
//****************************************

.func _verify_redblack_61, 2, int
.line 196
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d1,i1
.line 217
	ld r0,#0x1
.line 199
	jc eq,i1,i0,&L58_61
.line 200
	ld i1,[i1]
	call &_verify_redblack_61
	ld d2,r14
.line 201
	ld i0,d0
	ld i1,[d1,4]
	call &_verify_redblack_61
.line 202
	ld r0,#0x0
	jc ne,d2,r0,&L68_61
L62_61:
.line 203
	ld r0,#0x0
L58_61:
.line 218
	ld r14,r0
	pop rt,d2
	ret
L68_61:
.line 202
	jc eq,r14,r0,&L62_61
.line 205
	ld r0,#0x0
.line 204
	jc ne,d2,r14,&L58_61
.line 206
	ld r14,[d1,12]
	jc ne,r14,r0,&L64_61
.line 207
	ld r14,[d1]
	ld r1,[r14,12]
	ld r14,#0x1
	jc ne,r1,r14,&L58_61
.line 209
	ld r14,[d1,4]
	ld r14,[r14,12]
	jc ne,r14,r1,&L58_61
.line 211
	ld r0,d2
	jp &L58_61
L64_61:
.line 214
	ld r0,#0x0
.line 213
	ld r1,#0x1
	jc ne,r14,r1,&L58_61
.line 215
	ld r0,d2
	add r0,r1
	jp &L58_61

//****************************************
// Function: _verify_node_count
//****************************************

.func _verify_node_count_61, 2, int
.line 227
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d2,i0
	ld d1,i1
.line 229
	ld r14,#0x0
.line 228
	jc eq,i1,i0,&L69_61
.line 231
	ld i1,[i1]
	call &_verify_node_count_61
	ld d0,r14
	ld i0,d2
	ld i1,[d1,4]
	call &_verify_node_count_61
	add r14,d0
	add r14,#0x1
L69_61:
.line 233
	pop rt,d2
	ret

//****************************************
// Function: _verify_dict_has_node
//****************************************

.func _verify_dict_has_node_61, 3, int
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
	jc eq,i1,i0,&L73_61
.line 245
	ld d3,r14
	jc eq,i1,i2,&L76_61
	ld i1,[i1]
	call &_verify_dict_has_node_61
	jc eq,r14,d3,&L78_61
L76_61:
	ld d3,#0x1
L75_61:
	ld r14,d3
L73_61:
.line 250
	pop rt,d3
	ret
L78_61:
.line 245
	ld i0,d1
	ld i1,[d0,4]
	ld i2,d2
	call &_verify_dict_has_node_61
	jc eq,r14,d3,&L75_61
	ld d3,#0x1
	jp &L75_61

//****************************************
// Function: _dict_free_nodes
//****************************************

.func _dict_free_nodes_61, 1, void
.line 309
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
.line 311
	ld i1,[i0]
	ld i2,i0
	call &_free_nodes_61
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

.func _dict_init_61, 3, int
.line 334
	push fr,fr
	ld fr,sp
	add fr,#0x4
	ld r14,i0
.line 335
	ld [i0,32],i2
.line 336
	ld r0,&_dnode_alloc_61
	ld [i0,36],r0
.line 337
	ld r0,&_dnode_free_61
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

.func _dict_verify_61, 1, int
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
	jc eq,r14,r1,&L121_61
L113_61:
.line 414
	ld r14,r0
	pop rt,d2
	ret
L121_61:
.line 398
	ld d2,[i0,12]
	jc ne,d2,r14,&L113_61
.line 400
	ld r14,[i0,4]
	jc ne,r14,i0,&L113_61
.line 403
	ld r14,[d1,8]
	jc ne,r14,i0,&L113_61
.line 406
	call &_verify_bintree_61
.line 407
	ld r0,r14
.line 406
	ld r1,#0x0
	jc eq,r14,r1,&L113_61
.line 409
	ld i0,d0
	ld i1,d1
	call &_verify_redblack_61
.line 410
	ld r0,r14
.line 409
	ld r1,#0x0
	jc eq,r14,r1,&L113_61
.line 411
	ld i0,d0
	ld i1,d1
	call &_verify_node_count_61
.line 412
	ld r0,#0x0
.line 411
	ld d0,[d0,24]
	jc ne,r14,d0,&L113_61
.line 413
	ld r0,d2
	jp &L113_61

//****************************************
// Function: _dict_lookup
//****************************************

.func _dict_lookup_61, 2, int
.line 449
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d2,i0
	ld d3,i1
.line 450
	ld d1,[i0]
L142_61:
.line 473
	jc eq,d1,d2,&L139_61
L145_61:
.line 458
	ld d0,[d2,32]
	ld i0,d3
	ld i1,[d1,16]
	call d0
.line 459
	ld r0,#0x0
	jc lt,r14,r0,&L144_61
.line 461
	ld r1,#0x0
	jc le,r14,r1,&L127_61
.line 462
	ld d1,[d1,4]
.line 473
	jc ne,d1,d2,&L145_61
L139_61:
.line 478
	ld r0,#0x0
L122_61:
.line 479
	ld r14,r0
	pop rt,d4
	ret
L144_61:
.line 460
	ld d1,[d1]
	jp &L142_61
L127_61:
.line 464
	ld r14,[d2,48]
.line 465
	ld r0,d1
.line 464
	ld r1,#0x0
	jc eq,r14,r1,&L122_61
.line 468
	ld d4,d1
.line 469
	ld d1,[d1]
L134_61:
.line 471
	jc eq,d1,d2,&L140_61
L147_61:
	ld d0,[d2,32]
	ld i0,d3
	ld i1,[d1,16]
	call d0
	ld r0,#0x0
	jc eq,r14,r0,&L146_61
	ld d1,[d1,4]
	jc ne,d1,d2,&L147_61
L140_61:
.line 473
	ld r0,d4
.line 479
	ld r14,r0
	pop rt,d4
	ret
L146_61:
.line 472
	jc eq,d1,d2,&L140_61
.line 468
	ld d4,d1
.line 469
	ld d1,[d1]
	jp &L134_61

//****************************************
// Function: _dict_contains
//****************************************

.func _dict_contains_61, 2, int
.line 959
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld i2,i1
.line 960
	ld i1,[i0]
	call &_verify_dict_has_node_61
.line 961
	pop rt,fr
	ret

//****************************************
// Function: _dnode_is_in_a_dict
//****************************************

.func _dnode_is_in_a_dict_61, 1, int
.line 1016
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 1017
	ld r15,#0x0
	ld r14,[i0,8]
	jc eq,r14,r15,&L183_61
	ld r14,[i0]
	jc eq,r14,r15,&L183_61
	ld r14,[i0,4]
	jc eq,r14,r15,&L183_61
	ld r15,#0x1
L183_61:
.line 1018
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: _dict_insert
//****************************************

.func _dict_insert_61, 3, int
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
	jc eq,r14,r0,&L224_61
.line 562
	call &_dict_contains_61
	ld d5,r14
	ld r1,#0x0
	jc ne,r14,r1,&L225_61
.line 563
	ld i0,d3
	call &_dnode_is_in_a_dict_61
	jc ne,r14,d5,&L226_61
L223_61:
.line 576
	jc eq,d1,d4,&L197_61
L228_61:
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
	jc ne,d0,r14,&L193_61
	ld r14,[d4,48]
	jc eq,r14,d0,&L227_61
L194_61:
.line 576
	ld d1,[d1,4]
	jc ne,d1,d4,&L228_61
L197_61:
.line 581
	ld r1,#0x0
	jc lt,d0,r1,&L229_61
.line 584
	ld [d2,4],d3
L200_61:
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
	jc eq,r14,r0,&L215_61
	jp &L202_61
L203_61:
.line 620
	ld r0,[r14,12]
	ld r1,#0x0
	jc ne,r0,r1,&L230_61
L221_61:
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
	jc ne,r14,r1,&L202_61
L215_61:
.line 597
	ld d0,[d2,8]
.line 598
	ld r14,[d0]
	jc ne,r14,d2,&L203_61
.line 599
	ld r14,[d0,4]
.line 600
	ld r0,[r14,12]
	ld r1,#0x0
	jc eq,r0,r1,&L221_61
.line 607
	ld r14,[d2,4]
	jc eq,r14,d3,&L231_61
L206_61:
.line 613
	ld r14,#0x1
	ld [d2,12],r14
.line 614
	ld r0,#0x0
	ld [d0,12],r0
.line 615
	ld i0,d0
	call &_rotate_right_61
L202_61:
.line 640
	ld r14,[d4]
	ld r0,#0x1
	ld [r14,12],r0
.line 642
	ld i0,d4
	call &_dict_verify_61
.line 644
	ld r0,#0x0
.line 642
	jc ne,r14,r0,&L184_61
L233_61:
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x282
	call &_bfeHandler_28
L193_61:
.line 573
	ld r0,#0x0
	jc ge,d0,r0,&L194_61
.line 574
	ld d1,[d1]
	jp &L223_61
L227_61:
.line 571
	ld r0,d1
L184_61:
.line 645
	ld r14,r0
	pop rt,d6
	ret
L229_61:
.line 582
	ld [d2],d3
	jp &L200_61
L230_61:
.line 627
	ld r14,[d2]
	jc eq,r14,d3,&L232_61
L212_61:
.line 632
	ld r14,#0x1
	ld [d2,12],r14
.line 633
	ld r0,#0x0
	ld [d0,12],r0
.line 634
	ld i0,d0
	call &_rotate_left_61
.line 640
	ld r14,[d4]
	ld r0,#0x1
	ld [r14,12],r0
.line 642
	ld i0,d4
	call &_dict_verify_61
.line 644
	ld r0,#0x0
.line 642
	jc ne,r14,r0,&L184_61
	jp &L233_61
L226_61:
.line 563
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x233
.line 642
	call &_bfeHandler_28
L232_61:
.line 628
	ld i0,d2
	call &_rotate_right_61
.line 629
	ld d2,d3
.line 630
	ld r14,[d3,8]
	jc eq,r14,d0,&L212_61
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x276
.line 642
	call &_bfeHandler_28
L224_61:
.line 561
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x231
.line 642
	call &_bfeHandler_28
L225_61:
.line 562
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x232
.line 642
	call &_bfeHandler_28
L231_61:
.line 608
	ld i0,d2
	call &_rotate_left_61
.line 609
	ld d2,d3
.line 610
	ld r14,[d3,8]
	jc eq,r14,d0,&L206_61
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x262
.line 642
	call &_bfeHandler_28

//****************************************
// Function: _dnode_init
//****************************************

.func _dnode_init_61, 2, int
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

.func _dict_isempty_61, 1, int
.line 949
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 950
	ld r15,#0x0
	ld r14,[i0,24]
	jc ne,r14,r15,&L368_61
	ld r15,#0x1
L368_61:
.line 951
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: _dnode_alloc
//****************************************

.func _dnode_alloc_61, 1, int
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

.func _dnode_free_61, 2, void
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

.func _load_begin_internal_61, 2, void
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

.func _dict_load_begin_61, 2, void
.line 1042
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
.line 1043
	ld i0,i1
	call &_dict_isempty_61
	ld r0,#0x0
	jc eq,r14,r0,&L396_61
.line 1044
	ld i0,d1
	ld i1,d0
	call &_load_begin_internal_61
	pop rt,d1
	ret
L396_61:
.line 1043
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x413
	call &_bfeHandler_28

//****************************************
// Function: _dict_load_next
//****************************************

.func _dict_load_next_61, 3, void
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
	call &_dnode_is_in_a_dict_61
	ld r0,#0x0
	jc ne,r14,r0,&L412_61
.line 1053
	ld r0,[d1,24]
	ld r14,[d1,28]
	jc geu,r0,r14,&L413_61
.line 1056
	ld r14,#0x0
	jc eq,r0,r14,&L402_61
.line 1057
	ld d5,[d1,48]
	jc eq,d5,r14,&L403_61
.line 1058
	ld r14,[d3]
	ld d0,[d1,32]
	ld i0,[r14,16]
	ld i1,d4
	call d0
	ld r0,#0x0
	jc gt,r14,r0,&L414_61
L410_61:
	ld r0,[d1,24]
L402_61:
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
L403_61:
.line 1060
	ld r14,[d3]
	ld d0,[d1,32]
	ld i0,[r14,16]
	ld i1,d4
	call d0
	jc lt,r14,d5,&L410_61
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x424
	call &_bfeHandler_28
L414_61:
.line 1058
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x422
.line 1060
	call &_bfeHandler_28
L412_61:
.line 1052
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x41c
.line 1060
	call &_bfeHandler_28
L413_61:
.line 1053
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x41d
.line 1060
	call &_bfeHandler_28

//****************************************
// Function: _dict_load_end
//****************************************

.func _dict_load_end_61, 1, void
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
L420_61:
.line 1084
	srl r14,#0x1
	jc ltu,r14,r0,&L419_61
	ld r1,#0x0
	jc ne,r14,r1,&L420_61
L419_61:
.line 1086
	ld r5,r0
	sub r5,r14
.line 1088
	ld r1,[d0]
	jc eq,r1,d0,&L458_61
L440_61:
.line 1089
	ld r4,[r1]
.line 1091
	ld r7,#0x0
	jc eq,r2,r7,&L460_61
L433_61:
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
L423_61:
.line 1088
	ld r1,r4
	jc ne,r4,d0,&L440_61
L464_61:
.line 1132
	ld r0,#0x0
	jc eq,r2,r0,&L458_61
L441_61:
.line 1135
	ld r1,#0x0
L446_61:
.line 1136
	ld r14,r1
	sll r14,#0x2
	ld r3,#0xfffffff0
	add r3,fr
	add r14,r3
	add r14,#0xffffff00
	ld r0,[r14]
	ld r7,#0x0
	jc eq,r0,r7,&L444_61
.line 1137
	ld [r0,4],r2
.line 1138
	ld r0,[r14]
	ld [r2,8],r0
.line 1139
	ld r2,[r14]
L444_61:
.line 1135
	add r1,#0x1
	ld r3,#0x3f
	jc leu,r1,r3,&L446_61
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
	call &_dict_verify_61
	ld r0,#0x0
	jc eq,r14,r0,&L461_61
.line 1150
	add sp,#0x100
	pop rt,d1
	ret
L458_61:
.line 1133
	ld r2,d1
	jp &L441_61
L460_61:
.line 1091
	add r5,#0xffffffff
	ld r14,#0xffffffff
	jc eq,r5,r14,&L462_61
L457_61:
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
	jc ne,r3,r6,&L463_61
.line 1120
	ld r0,r3
	sll r0,#0x2
	ld r1,#0xfffffff0
	add r1,fr
	add r0,r1
	ld r14,[r0,-256]
	ld r7,#0x0
	jc eq,r14,r7,&L423_61
L438_61:
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
	jc ne,r14,r1,&L438_61
.line 1088
	ld r1,r4
	jc ne,r4,d0,&L440_61
	jp &L464_61
L462_61:
.line 1092
	jc ne,r6,r7,&L465_61
.line 1093
	ld r0,#0x0
	jc ne,r3,r0,&L466_61
.line 1094
	ld r3,#0x1
	ld r6,r3
.line 1095
	ld r2,[fr,-272]
.line 1097
	ld r7,#0x0
	jc eq,r2,r7,&L457_61
.line 1098
	ld [fr,-272],r7
.line 1099
	ld [r2,4],d1
.line 1104
	ld r14,[fr,-268]
	jc eq,r14,r7,&L424_61
	ld r0,#0x4
L432_61:
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
	jc ne,r14,r7,&L432_61
L424_61:
.line 1109
	ld r14,#0x0
	jc ne,r2,r14,&L433_61
	jp &L457_61
L463_61:
.line 1115
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x45b
.line 1149
	call &_bfeHandler_28
L461_61:
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x47d
	call &_bfeHandler_28
L466_61:
.line 1093
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x445
.line 1149
	call &_bfeHandler_28
L465_61:
.line 1092
	ld i0,&LC0_61
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x444
.line 1149
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_62, 2, void
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

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_62, 2, void
.line 58
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 58
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEii
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEii_62, 3, void
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

.func __ZN6MAUtil11KeyListener15keyReleaseEventEii_62, 3, void
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

.func __ZN6MAUtil11KeyListener9charEventEj_62, 2, void
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

.func __ZN6MAUtil11Environment18TimerEventInstanceC1EPNS_13TimerListenerEii_62, 4, void
.line 39
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_62:
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
LBE3_62:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment14getEnvironmentEv
//****************************************

.func __ZN6MAUtil11Environment14getEnvironmentEv_62, 0, int
.line 64
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_62:
.line 65
	ld r14,[zr,__ZN6MAUtil11Environment12sEnvironmentE_62]
	ld r0,#0x0
	jc eq,r14,r0,&L11_62
LBE4_62:
.line 69
	pop rt,fr
	ret
L11_62:
.line 66
	ld i0,&LC0_62
	ld i1,&_ZZN6MAUtil11Environment14getEnvironmentEvE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE
//****************************************

.func __ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE_62, 2, void
.line 117
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_62:
.line 119
	ld [i0,36],i1
LBE6_62:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment23removeBluetoothListenerEv
//****************************************

.func __ZN6MAUtil11Environment23removeBluetoothListenerEv_62, 1, void
.line 122
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB7_62:
.line 124
	ld r14,#0x0
	ld [i0,36],r14
LBE7_62:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment18fireBluetoothEventEi
//****************************************

.func __ZN6MAUtil11Environment18fireBluetoothEventEi_62, 2, void
.line 298
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB8_62:
.line 300
	ld i0,[i0,36]
	ld r14,#0x0
	jc ne,i0,r14,&L16_62
LBE8_62:
.line 301
	pop rt,d0
	ret
L16_62:
.line 300
	ld r14,[i0]
	ld d0,[r14]
	call d0
LBE9_62:
.line 301
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment14fireCloseEventEv
//****************************************

.func __ZN6MAUtil11Environment14fireCloseEventEv_62, 1, void
.line 315
	push rt,d2
	ld fr,sp
	add fr,#0x14
LBB10_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d2,i0
	add d2,#0x28
LBB14_62:
	ld d1,[d2,8]
LBE14_62:
.line 334
	ld r14,[d2]
	sll r14,#0x2
	add r14,d1
LBE16_62:
	jc eq,r14,d1,&L25_62
L27_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 318
	ld i0,[d1]
	ld r14,[i0]
	ld d0,[r14]
	call d0
.line 317
	add d1,#0x4
LBB17_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x2
	ld r0,[d2,8]
	add r14,r0
LBE18_62:
	jc ne,r14,d1,&L27_62
L25_62:
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil11EnvironmentD0Ev
//****************************************

.func __ZN6MAUtil11EnvironmentD0Ev_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 71
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB19_62:
.line 71
	ld r14,&__ZTVN6MAUtil11EnvironmentE_62+8
	ld [i0],r14
LBB20_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,144]
	ld r14,#0x0
	jc ne,i0,r14,&L102_62
LBE23_62:
	ld i0,[d0,128]
	ld r14,#0x0
	jc ne,i0,r14,&L103_62
L45_62:
	ld i0,[d0,112]
	ld r14,#0x0
	jc ne,i0,r14,&L104_62
L53_62:
	ld i0,[d0,96]
	ld r14,#0x0
	jc ne,i0,r14,&L105_62
L61_62:
	ld i0,[d0,80]
	ld r14,#0x0
	jc ne,i0,r14,&L106_62
L69_62:
	ld i0,[d0,64]
	ld r14,#0x0
	jc ne,i0,r14,&L107_62
L77_62:
	ld i0,[d0,48]
	ld r14,#0x0
	jc ne,i0,r14,&L108_62
L82_62:
	ld i0,[d0,32]
	ld r14,#0x0
	jc ne,i0,r14,&L109_62
L90_62:
	ld i0,[d0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L110_62
L101_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret
L102_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE58_62:
	ld i0,[d0,128]
	ld r14,#0x0
	jc eq,i0,r14,&L45_62
L103_62:
	call &__ZdaPv_54
LBE62_62:
	ld i0,[d0,112]
	ld r14,#0x0
	jc eq,i0,r14,&L53_62
L104_62:
	call &__ZdaPv_54
LBE66_62:
	ld i0,[d0,96]
	ld r14,#0x0
	jc eq,i0,r14,&L61_62
L105_62:
	call &__ZdaPv_54
LBE70_62:
	ld i0,[d0,80]
	ld r14,#0x0
	jc eq,i0,r14,&L69_62
L106_62:
	call &__ZdaPv_54
LBE74_62:
	ld i0,[d0,64]
	ld r14,#0x0
	jc eq,i0,r14,&L77_62
L107_62:
	call &__ZdaPv_54
LBE78_62:
	ld i0,[d0,48]
	ld r14,#0x0
	jc eq,i0,r14,&L82_62
L108_62:
	call &__ZdaPv_54
LBE80_62:
	ld i0,[d0,32]
	ld r14,#0x0
	jc eq,i0,r14,&L90_62
L109_62:
	call &__ZdaPv_54
LBE84_62:
	ld i0,[d0,16]
	ld r14,#0x0
	jc eq,i0,r14,&L101_62
L110_62:
	call &__ZdaPv_54
LBE88_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11EnvironmentD1Ev
//****************************************

.func __ZN6MAUtil11EnvironmentD1Ev_62, 1, void
.line 71
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB89_62:
.line 71
	ld r14,&__ZTVN6MAUtil11EnvironmentE_62+8
	ld [i0],r14
LBB90_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,144]
	ld r14,#0x0
	jc ne,i0,r14,&L184_62
L120_62:
	ld i0,[d0,128]
	ld r14,#0x0
	jc ne,i0,r14,&L185_62
L128_62:
	ld i0,[d0,112]
	ld r14,#0x0
	jc ne,i0,r14,&L186_62
L136_62:
	ld i0,[d0,96]
	ld r14,#0x0
	jc ne,i0,r14,&L187_62
L144_62:
	ld i0,[d0,80]
	ld r14,#0x0
	jc ne,i0,r14,&L188_62
L152_62:
	ld i0,[d0,64]
	ld r14,#0x0
	jc ne,i0,r14,&L189_62
L160_62:
	ld i0,[d0,48]
	ld r14,#0x0
	jc ne,i0,r14,&L190_62
L165_62:
	ld i0,[d0,32]
	ld r14,#0x0
	jc ne,i0,r14,&L191_62
L173_62:
	ld i0,[d0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L192_62
LBE123_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L192_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE128_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L191_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
	jp &L173_62
L190_62:
	call &__ZdaPv_54
	jp &L165_62
L189_62:
	call &__ZdaPv_54
	jp &L160_62
L188_62:
	call &__ZdaPv_54
	jp &L152_62
L187_62:
	call &__ZdaPv_54
	jp &L144_62
L186_62:
	call &__ZdaPv_54
	jp &L136_62
L185_62:
	call &__ZdaPv_54
	jp &L128_62
L184_62:
	call &__ZdaPv_54
	jp &L120_62

//****************************************
// Function: __ZN6MAUtil11EnvironmentD2Ev
//****************************************

.func __ZN6MAUtil11EnvironmentD2Ev_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 71
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB160_62:
.line 71
	ld r14,&__ZTVN6MAUtil11EnvironmentE_62+8
	ld [i0],r14
LBB161_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,144]
	ld r14,#0x0
	jc ne,i0,r14,&L266_62
L202_62:
	ld i0,[d0,128]
	ld r14,#0x0
	jc ne,i0,r14,&L267_62
L210_62:
	ld i0,[d0,112]
	ld r14,#0x0
	jc ne,i0,r14,&L268_62
L218_62:
	ld i0,[d0,96]
	ld r14,#0x0
	jc ne,i0,r14,&L269_62
L226_62:
	ld i0,[d0,80]
	ld r14,#0x0
	jc ne,i0,r14,&L270_62
L234_62:
	ld i0,[d0,64]
	ld r14,#0x0
	jc ne,i0,r14,&L271_62
L242_62:
	ld i0,[d0,48]
	ld r14,#0x0
	jc ne,i0,r14,&L272_62
L247_62:
	ld i0,[d0,32]
	ld r14,#0x0
	jc ne,i0,r14,&L273_62
L255_62:
	ld i0,[d0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L274_62
LBE194_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L274_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE199_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 72
	pop rt,d0
	ret
L273_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
	jp &L255_62
L272_62:
	call &__ZdaPv_54
	jp &L247_62
L271_62:
	call &__ZdaPv_54
	jp &L242_62
L270_62:
	call &__ZdaPv_54
	jp &L234_62
L269_62:
	call &__ZdaPv_54
	jp &L226_62
L268_62:
	call &__ZdaPv_54
	jp &L218_62
L267_62:
	call &__ZdaPv_54
	jp &L210_62
L266_62:
	call &__ZdaPv_54
	jp &L202_62

//****************************************
// Function: __ZN6MAUtil11EnvironmentC2Ev
//****************************************

.func __ZN6MAUtil11EnvironmentC2Ev_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 48
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB267_62:
.line 57
	ld r0,&__ZTVN6MAUtil11EnvironmentE_62+8
	ld [i0],r0
LBB268_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,i0
	add r14,#0x4
LBB269_62:
.line 74
	ld r0,#0x0
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB270_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x8
LBB271_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE271_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x14
LBB273_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB274_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB275_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE275_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 57
	ld [d1,36],r0
LBB276_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB277_62:
.line 109
	ld i0,#0x10
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE277_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x34
LBB279_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB280_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB281_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE281_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x44
LBB283_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB284_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB285_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE285_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x54
LBB287_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld r0,#0x1
	ld.b [r14,2],r0
LBB288_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB289_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE289_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x64
LBB291_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB292_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB293_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE293_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x74
LBB295_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB296_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB297_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE297_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,d1
	add r14,#0x84
LBB299_62:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB300_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	add d0,#0x10
LBB301_62:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE301_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 58
	ld r14,[zr,__ZN6MAUtil11Environment12sEnvironmentE_62]
	jc ne,r14,r0,&L314_62
.line 61
	ld [zr,__ZN6MAUtil11Environment12sEnvironmentE_62],d1
LBE267_62:
	pop rt,d1
	ret
L314_62:
.line 59
	ld i0,&LC1_62
	ld i1,&_ZZN6MAUtil11EnvironmentC1EvE12__FUNCTION___62
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE
//****************************************

.func __ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_62, 2, int
.line 98
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB319_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 108
	ld r1,i0
	add r1,#0x4
LBB321_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x8
LBB325_62:
	ld r15,[i0,8]
LBE325_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r15
LBE327_62:
	jc eq,r14,r15,&L339_62
L342_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 110
	ld r14,[r15]
	jc eq,r14,i1,&L341_62
.line 109
	add r15,#0x8
LBB328_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,r1
	add r0,#0x4
LBB329_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE329_62:
	jc ne,r14,r15,&L342_62
L339_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 111
	ld r14,#0x0
LBE322_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 100
	pop fr,fr
	ret
L341_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 111
	ld r14,#0x1
LBE334_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 100
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE
//****************************************

.func __ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_62, 2, int
.line 112
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB335_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 108
	ld r1,i0
	add r1,#0x14
LBB337_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x18
LBB341_62:
	ld r15,[i0,8]
LBE341_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r15
LBE343_62:
	jc eq,r14,r15,&L353_62
L356_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 110
	ld r14,[r15]
	jc eq,r14,i1,&L355_62
.line 109
	add r15,#0x8
LBB344_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,r1
	add r0,#0x4
LBB345_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE345_62:
	jc ne,r14,r15,&L356_62
L353_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 111
	ld r14,#0x0
LBE338_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 114
	pop fr,fr
	ret
L355_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 111
	ld r14,#0x1
LBE350_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 114
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11Environment16addCloseListenerEPNS_13CloseListenerE
//****************************************

.func __ZN6MAUtil11Environment16addCloseListenerEPNS_13CloseListenerE_62, 2, void
.line 152
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld [fr,-24],i1
LBB351_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d1,i0
	add d1,#0x28
LBB355_62:
	ld r0,[d1,8]
	ld r2,r0
LBE355_62:
.line 334
	ld r1,[d1]
	sll r1,#0x2
	ld r14,r0
	add r14,r1
LBE357_62:
	jc eq,r14,r0,&L386_62
L397_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 155
	ld r14,[r0]
	jc eq,r14,i1,&L357_62
.line 154
	add r0,#0x4
LBB358_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,r2
	add r14,r1
LBE359_62:
	jc ne,r14,r0,&L397_62
L386_62:
.line 161
	ld d0,[d1,4]
	ld r14,d0
	add r14,#0xffffffff
	ld r1,[d1]
	jc lt,r1,r14,&L392_62
.line 162
	ld r0,#0x0
	jc eq,d0,r0,&L366_62
LBB362_62:
.line 286
	ld d2,d0
	add d2,d0
LBB363_62:
.line 288
	jc lt,d0,d2,&L398_62
L392_62:
	ld i0,[d1,8]
L365_62:
.line 167
	ld r14,r1
	sll r14,#0x2
	add r14,i0
	ld r0,[fr,-24]
	ld [r14],r0
	add r1,#0x1
	ld [d1],r1
L357_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 158
	add sp,#0x4
	pop rt,d2
	ret
L398_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x2
	call &__Znam_57
	ld d0,r14
LBB372_62:
.line 293
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L393_62
	ld i0,[d1,8]
L372_62:
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
	jc gt,r1,r2,&L372_62
L388_62:
.line 297
	ld [d1,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L399_62
.line 300
	ld i0,d0
L396_62:
	ld [d1,8],i0
	jp &L365_62
L366_62:
.line 291
	ld i0,#0x10
	call &__Znam_57
	ld d2,r14
LBB376_62:
.line 293
	ld r2,d0
	ld r1,[d1]
	jc le,r1,d0,&L394_62
	ld i0,[d1,8]
L381_62:
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
	jc gt,r1,r2,&L381_62
L390_62:
.line 297
	ld r0,#0x4
	ld [d1,4],r0
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L400_62
.line 300
	ld i0,d2
L401_62:
	ld [d1,8],i0
	jp &L365_62
L400_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d2
	jp &L401_62
L399_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d0
	jp &L396_62
L394_62:
	ld i0,[d1,8]
	jp &L390_62
L393_62:
	ld i0,[d1,8]
	jp &L388_62

//****************************************
// Function: __ZN6MAUtil11Environment18fireFocusLostEventEv
//****************************************

.func __ZN6MAUtil11Environment18fireFocusLostEventEv_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 233
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
LBB417_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x64
LBB420_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE421_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x68
LBB426_62:
	ld [i1],d2
LBB427_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE428_62:
	ld [fr,-48],r0
Ltext101_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L477_62
LBB429_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE430_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L477_62
	ld r1,r14
L470_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L477_62
LBB433_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE434_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L470_62
L477_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L536_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L482_62
	ld r14,#0x1
L482_62:
	ld r2,#0x0
	jc eq,r14,r2,&L537_62
LBB437_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB440_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE440_62:
	ld i0,[i0]
LBE438_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14]
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L485_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L536_62
LBB443_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB444_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE444_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L485_62
	jp &L536_62
L537_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB448_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L440_62
LBB449_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE451_62:
.line 327
	ld d0,[d2,8]
LBE454_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE456_62:
	jc eq,r14,d0,&L524_62
L539_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L538_62
L497_62:
.line 120
	add d0,#0x8
LBB457_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE458_62:
	jc ne,r14,d0,&L539_62
L524_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d3,&L540_62
	ld r14,[d1]
L504_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L528_62
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L514_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L514_62
L528_62:
.line 278
	ld [d1],d3
LBE461_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L440_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 240
	add sp,#0x20
	pop rt,d4
	ret
L538_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L541_62
L500_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB475_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE475_62:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L497_62
L541_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L500_62
L540_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB482_62:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L531_62
	ld i0,[d1,8]
L508_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L508_62
L526_62:
.line 297
	ld [d1,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L542_62
.line 300
	ld [d1,8],d0
	jp &L504_62
L542_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L504_62
L531_62:
	ld i0,[d1,8]
	jp &L526_62

//****************************************
// Function: __ZN6MAUtil11Environment20fireFocusGainedEventEv
//****************************************

.func __ZN6MAUtil11Environment20fireFocusGainedEventEv_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 224
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
LBB483_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x64
LBB486_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE487_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x68
LBB492_62:
	ld [i1],d2
LBB493_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE494_62:
	ld [fr,-48],r0
Ltext122_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L580_62
LBB495_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE496_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L580_62
	ld r1,r14
L573_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L580_62
LBB499_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE500_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L573_62
L580_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L639_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L585_62
	ld r14,#0x1
L585_62:
	ld r2,#0x0
	jc eq,r14,r2,&L640_62
LBB503_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB506_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE506_62:
	ld i0,[i0]
LBE504_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L588_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L639_62
LBB509_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB510_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE510_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L588_62
	jp &L639_62
L640_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB514_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L543_62
LBB515_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE517_62:
.line 327
	ld d0,[d2,8]
LBE520_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE522_62:
	jc eq,r14,d0,&L627_62
L642_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L641_62
L600_62:
.line 120
	add d0,#0x8
LBB523_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE524_62:
	jc ne,r14,d0,&L642_62
L627_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d3,&L643_62
	ld r14,[d1]
L607_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L631_62
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L617_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L617_62
L631_62:
.line 278
	ld [d1],d3
LBE527_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L543_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 231
	add sp,#0x20
	pop rt,d4
	ret
L641_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L644_62
L603_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB541_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE541_62:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L600_62
L644_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L603_62
L643_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB548_62:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L634_62
	ld i0,[d1,8]
L611_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L611_62
L629_62:
.line 297
	ld [d1,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L645_62
.line 300
	ld [d1,8],d0
	jp &L607_62
L645_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L607_62
L634_62:
	ld i0,[d1,8]
	jp &L629_62

//****************************************
// Function: __ZN6MAUtil11Environment16addFocusListenerEPNS_13FocusListenerE
//****************************************

.func __ZN6MAUtil11Environment16addFocusListenerEPNS_13FocusListenerE_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 74
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB597_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,i0
	add r1,#0x64
LBB599_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x68
LBB603_62:
	ld r0,[i0,8]
LBE603_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE605_62:
	jc eq,r14,r0,&L725_62
L698_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,i1,&L731_62
.line 82
	add r0,#0x8
LBB606_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB607_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE607_62:
	jc ne,r14,r0,&L698_62
L720_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB608_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L727_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L700_62
LBB610_62:
.line 286
	ld d2,d1
	add d2,d1
LBB611_62:
.line 288
	jc lt,d1,d2,&L732_62
L727_62:
	ld i0,[d0,8]
L699_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE609_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 77
	add sp,#0x8
	pop rt,d3
	ret
L731_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r1,#0x1
	ld [r0,4],r1
LBE617_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 77
	add sp,#0x8
	pop rt,d3
	ret
L725_62:
	ld d0,r1
	add d0,#0x4
	jp &L720_62
L732_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB627_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L728_62
	ld i0,[d0,8]
L706_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L706_62
L722_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L733_62
.line 300
	ld i0,d1
L730_62:
	ld [d0,8],i0
	jp &L699_62
L700_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB631_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L729_62
	ld i0,[d0,8]
L715_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L715_62
L724_62:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L734_62
.line 300
	ld i0,d2
L735_62:
	ld [d0,8],i0
	jp &L699_62
L734_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L735_62
L733_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L730_62
L729_62:
	ld i0,[d0,8]
	jp &L724_62
L728_62:
	ld i0,[d0,8]
	jp &L722_62

//****************************************
// Function: __ZN6MAUtil11Environment13fireCharEventEj
//****************************************

.func __ZN6MAUtil11Environment13fireCharEventEj_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 263
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d3,i1
LBB635_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x4
LBB638_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE639_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x8
LBB644_62:
	ld [i1],d2
LBB645_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE646_62:
	ld [fr,-48],r0
Ltext166_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L775_62
LBB647_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE648_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L775_62
	ld r1,r14
L768_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L775_62
LBB651_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE652_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L768_62
L775_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L836_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L780_62
	ld r14,#0x1
L780_62:
	ld r2,#0x0
	jc eq,r14,r2,&L837_62
LBB655_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB658_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE658_62:
	ld i0,[i0]
LBE656_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14,16]
	ld i1,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L783_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L836_62
LBB661_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB662_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE662_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L783_62
	jp &L836_62
L837_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB666_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L736_62
LBB667_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE669_62:
.line 327
	ld d1,[d2,8]
LBE672_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE674_62:
	jc eq,r14,d1,&L824_62
L839_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L838_62
L795_62:
.line 120
	add d1,#0x8
LBB675_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE676_62:
	jc ne,r14,d1,&L839_62
L824_62:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L840_62
	ld r14,[d2]
L804_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L828_62
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc4
L814_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L814_62
L828_62:
.line 278
	ld [d2],d3
LBE679_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L736_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 269
	add sp,#0x20
	pop rt,d4
	ret
L838_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L798_62
.line 123
	ld i0,[d1]
	jc ne,i0,r1,&L841_62
L798_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB693_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE693_62:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L795_62
L840_62:
.line 291
	call &__Znam_57
	ld d0,r14
LBB700_62:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L831_62
	ld i0,[d2,8]
L808_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L808_62
L826_62:
.line 297
	ld [d2,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L842_62
.line 300
	ld [d2,8],d0
	jp &L804_62
L842_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L804_62
L841_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L798_62
L831_62:
	ld i0,[d2,8]
	jp &L826_62

//****************************************
// Function: __ZN6MAUtil11Environment19fireKeyReleaseEventEii
//****************************************

.func __ZN6MAUtil11Environment19fireKeyReleaseEventEii_62, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 253
	push rt,d5
	sub sp,#0x20
	ld fr,sp
	add fr,#0x40
	ld d2,i1
	ld d3,i2
LBB702_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d5,i0
	add d5,#0x4
LBB705_62:
.line 116
	ld r0,#0x1
	ld.b [d5],r0
LBE706_62:
.line 62
	ld i1,fr
	add i1,#0xffffffc8
	ld d4,i0
	add d4,#0x8
LBB711_62:
	ld [i1],d4
LBB712_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d4]
LBE713_62:
	ld [fr,-52],r0
Ltext186_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-48],r1
.line 63
	jc le,r0,r1,&L882_62
LBB714_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d4,8]
LBE715_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L882_62
	ld r1,r14
L875_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L882_62
LBB718_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d4,8]
	add r14,r2
LBE719_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L875_62
L882_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L945_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L887_62
	ld r14,#0x1
L887_62:
	ld r2,#0x0
	jc eq,r14,r2,&L946_62
LBB722_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB725_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE725_62:
	ld i0,[i0]
LBE723_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14,24]
	ld i1,d2
	call d0
LBB726_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r0,[d1]
	ld r14,[fr,-36]
LBB729_62:
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE729_62:
	ld i0,[r14]
LBE727_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14,12]
	ld i1,d2
	ld i2,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L892_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L945_62
LBB732_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB733_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE733_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L892_62
	jp &L945_62
L946_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d5],r14
LBB737_62:
.line 117
	ld.b r14,[d5,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L843_62
LBB738_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d4]
LBE740_62:
.line 327
	ld d1,[d4,8]
LBE743_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d5
	add d2,#0x4
LBE745_62:
	jc eq,r14,d1,&L933_62
L948_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L947_62
L904_62:
.line 120
	add d1,#0x8
LBB746_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE747_62:
	jc ne,r14,d1,&L948_62
L933_62:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L949_62
	ld r14,[d2]
L913_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L937_62
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc0
L923_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-64],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L923_62
L937_62:
.line 278
	ld [d2],d3
LBE750_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d5,1],r14
L843_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 261
	add sp,#0x20
	pop rt,d5
	ret
L947_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d5,2]
	and r14,#0xff
	jc eq,r14,r1,&L907_62
.line 123
	ld i0,[d1]
	jc ne,i0,r1,&L950_62
L907_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB764_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE764_62:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L904_62
L949_62:
.line 291
	call &__Znam_57
	ld d0,r14
LBB771_62:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L940_62
	ld i0,[d2,8]
L917_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L917_62
L935_62:
.line 297
	ld [d2,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L951_62
.line 300
	ld [d2,8],d0
	jp &L913_62
L951_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L913_62
L950_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L907_62
L940_62:
	ld i0,[d2,8]
	jp &L935_62

//****************************************
// Function: __ZN6MAUtil11Environment17fireKeyPressEventEii
//****************************************

.func __ZN6MAUtil11Environment17fireKeyPressEventEii_62, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 242
	push rt,d5
	sub sp,#0x20
	ld fr,sp
	add fr,#0x40
	ld d2,i1
	ld d3,i2
LBB773_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d5,i0
	add d5,#0x4
LBB776_62:
.line 116
	ld r0,#0x1
	ld.b [d5],r0
LBE777_62:
.line 62
	ld i1,fr
	add i1,#0xffffffc8
	ld d4,i0
	add d4,#0x8
LBB782_62:
	ld [i1],d4
LBB783_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d4]
LBE784_62:
	ld [fr,-52],r0
Ltext208_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-48],r1
.line 63
	jc le,r0,r1,&L991_62
LBB785_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d4,8]
LBE786_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L991_62
	ld r1,r14
L984_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L991_62
LBB789_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d4,8]
	add r14,r2
LBE790_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L984_62
L991_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1054_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L996_62
	ld r14,#0x1
L996_62:
	ld r2,#0x0
	jc eq,r14,r2,&L1055_62
LBB793_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB796_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE796_62:
	ld i0,[i0]
LBE794_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14,20]
	ld i1,d2
	call d0
LBB797_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r0,[d1]
	ld r14,[fr,-36]
LBB800_62:
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE800_62:
	ld i0,[r14]
LBE798_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,d2
	ld i2,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1001_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L1054_62
LBB803_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB804_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE804_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1001_62
	jp &L1054_62
L1055_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d5],r14
LBB808_62:
.line 117
	ld.b r14,[d5,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L952_62
LBB809_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d4]
LBE811_62:
.line 327
	ld d1,[d4,8]
LBE814_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d5
	add d2,#0x4
LBE816_62:
	jc eq,r14,d1,&L1042_62
L1057_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1056_62
L1013_62:
.line 120
	add d1,#0x8
LBB817_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE818_62:
	jc ne,r14,d1,&L1057_62
L1042_62:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L1058_62
	ld r14,[d2]
L1022_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L1046_62
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc0
L1032_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-64],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1032_62
L1046_62:
.line 278
	ld [d2],d3
LBE821_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d5,1],r14
L952_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 251
	add sp,#0x20
	pop rt,d5
	ret
L1056_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d5,2]
	and r14,#0xff
	jc eq,r14,r1,&L1016_62
.line 123
	ld i0,[d1]
	jc ne,i0,r1,&L1059_62
L1016_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB835_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE835_62:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1013_62
L1058_62:
.line 291
	call &__Znam_57
	ld d0,r14
LBB842_62:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1049_62
	ld i0,[d2,8]
L1026_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1026_62
L1044_62:
.line 297
	ld [d2,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L1060_62
.line 300
	ld [d2,8],d0
	jp &L1022_62
L1060_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L1022_62
L1059_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1016_62
L1049_62:
	ld i0,[d2,8]
	jp &L1044_62

//****************************************
// Function: __ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE
//****************************************

.func __ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 93
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
LBB844_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld d2,i0
	add d2,#0x4
LBB846_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x8
LBB850_62:
	ld d1,[i0,8]
LBE850_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,d1
LBE852_62:
	jc eq,r14,d1,&L1061_62
L1103_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d1]
	jc eq,i0,i1,&L1102_62
.line 93
	add d1,#0x8
LBB853_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d2
	add r0,#0x4
LBB854_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE854_62:
	jc ne,r14,d1,&L1103_62
L1061_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 96
	add sp,#0x8
	pop rt,d2
	ret
L1102_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 95
	ld.b r0,[d2]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L1104_62
.line 99
	ld.b r14,[d2,2]
	and r14,#0xff
	jc eq,r14,r0,&L1070_62
.line 100
	ld r14,#0x0
	jc ne,i0,r14,&L1105_62
L1070_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	ld d0,d2
	add d0,#0x4
	ld r14,d1
LBB861_62:
.line 334
	ld r1,[d0]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d0,8]
	add r0,i0
LBE864_62:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d1,&L1095_62
L1076_62:
.line 198
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L1076_62
	ld r1,[d0]
L1095_62:
.line 265
	ld d1,r1
	add d1,#0xffffffff
LBB866_62:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L1106_62
L1078_62:
.line 274
	ld r0,d1
	jc le,r1,d1,&L1099_62
	ld r1,fr
	add r1,#0xffffffe4
L1088_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-28],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L1088_62
L1099_62:
.line 278
	ld [d0],d1
LBE867_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 96
	add sp,#0x8
	pop rt,d2
	ret
L1104_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 96
	ld [d1,4],r1
.line 97
	ld r2,#0x1
	ld.b [d2,1],r2
LBE876_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 96
	add sp,#0x8
	pop rt,d2
	ret
L1106_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d1
	sll i0,#0x3
	call &__Znam_57
	ld d2,r14
LBB891_62:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L1100_62
	ld i0,[d0,8]
L1082_62:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d0]
	jc gt,r1,r2,&L1082_62
L1097_62:
.line 297
	ld [d0,4],d1
.line 298
	ld r2,#0x0
	jc ne,i0,r2,&L1107_62
.line 300
	ld i0,d2
	ld [d0,8],d2
	jp &L1078_62
L1107_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld i0,d2
	ld [d0,8],d2
	jp &L1078_62
L1105_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 100
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1070_62
L1100_62:
	ld i0,[d0,8]
	jp &L1097_62

//****************************************
// Function: __ZN6MAUtil11KeyListenerD0Ev
//****************************************

.func __ZN6MAUtil11KeyListenerD0Ev_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB892_62:
.line 29
	ld r0,&__ZTVN6MAUtil11KeyListenerE_62+8
	ld [i0],r0
LBB893_62:
.line 30
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_62
.line 31
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1114_62
LBE893_62:
.line 33
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret
L1114_62:
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_62
LBE895_62:
.line 33
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListenerD1Ev
//****************************************

.func __ZN6MAUtil11KeyListenerD1Ev_62, 1, void
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB896_62:
.line 29
	ld r0,&__ZTVN6MAUtil11KeyListenerE_62+8
	ld [i0],r0
LBB897_62:
.line 30
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_62
.line 31
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1120_62
LBE897_62:
.line 33
	pop rt,d0
	ret
L1120_62:
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_62
LBE899_62:
.line 33
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListenerD2Ev
//****************************************

.func __ZN6MAUtil11KeyListenerD2Ev_62, 1, void
.line 29
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB900_62:
.line 29
	ld r0,&__ZTVN6MAUtil11KeyListenerE_62+8
	ld [i0],r0
LBB901_62:
.line 30
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_62
.line 31
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1126_62
LBE901_62:
.line 33
	pop rt,d0
	ret
L1126_62:
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_62
LBE903_62:
.line 33
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE
//****************************************

.func __ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_62, 2, void
.line 88
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB904_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,i0
	add r1,#0x4
LBB906_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x8
LBB910_62:
	ld r0,[i0,8]
LBE910_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE912_62:
	jc eq,r14,r0,&L1162_62
L1135_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,i1,&L1168_62
.line 82
	add r0,#0x8
LBB913_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB914_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE914_62:
	jc ne,r14,r0,&L1135_62
L1157_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB915_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L1164_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L1137_62
LBB917_62:
.line 286
	ld d2,d1
	add d2,d1
LBB918_62:
.line 288
	jc lt,d1,d2,&L1169_62
L1164_62:
	ld i0,[d0,8]
L1136_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE916_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 91
	add sp,#0x8
	pop rt,d3
	ret
L1168_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r1,#0x1
	ld [r0,4],r1
LBE924_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 91
	add sp,#0x8
	pop rt,d3
	ret
L1162_62:
	ld d0,r1
	add d0,#0x4
	jp &L1157_62
L1169_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB934_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L1165_62
	ld i0,[d0,8]
L1143_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1143_62
L1159_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L1170_62
.line 300
	ld i0,d1
L1167_62:
	ld [d0,8],i0
	jp &L1136_62
L1137_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB938_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L1166_62
	ld i0,[d0,8]
L1152_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1152_62
L1161_62:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L1171_62
.line 300
	ld i0,d2
L1172_62:
	ld [d0,8],i0
	jp &L1136_62
L1171_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L1172_62
L1170_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L1167_62
L1166_62:
	ld i0,[d0,8]
	jp &L1161_62
L1165_62:
	ld i0,[d0,8]
	jp &L1159_62

//****************************************
// Function: __ZN6MAUtil11Environment23firePointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil11Environment23firePointerReleaseEventE9MAPoint2d_62, 3, void
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
LBB942_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x14
LBB945_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE946_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x18
LBB951_62:
	ld [i1],d2
LBB952_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE953_62:
	ld [fr,-48],r0
Ltext254_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L1212_62
LBB954_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE955_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1212_62
	ld r1,r14
L1205_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L1212_62
LBB958_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE959_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1205_62
L1212_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1273_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1217_62
	ld r14,#0x1
L1217_62:
	ld r2,#0x0
	jc eq,r14,r2,&L1274_62
LBB962_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB965_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE965_62:
	ld i0,[i0]
LBE963_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r0,[i0]
	ld r14,[fr,-60]
	ld r15,[d3,4]
	ld d0,[r0,16]
	ld i1,r14
	ld i2,r15
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1220_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L1273_62
LBB968_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB969_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE969_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1220_62
	jp &L1273_62
L1274_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB973_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1173_62
LBB974_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE976_62:
.line 327
	ld d1,[d2,8]
LBE979_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE981_62:
	jc eq,r14,d1,&L1261_62
L1276_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1275_62
L1232_62:
.line 120
	add d1,#0x8
LBB982_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE983_62:
	jc ne,r14,d1,&L1276_62
L1261_62:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L1277_62
	ld r14,[d2]
L1241_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L1265_62
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffbc
L1251_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1251_62
L1265_62:
.line 278
	ld [d2],d3
LBE986_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L1173_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 296
	add sp,#0x28
	pop rt,d4
	ret
L1275_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1235_62
.line 123
	ld i0,[d1]
	jc ne,i0,r1,&L1278_62
L1235_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB1000_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1000_62:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1232_62
L1277_62:
.line 291
	call &__Znam_57
	ld d0,r14
LBB1007_62:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1268_62
	ld i0,[d2,8]
L1245_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1245_62
L1263_62:
.line 297
	ld [d2,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L1279_62
.line 300
	ld [d2,8],d0
	jp &L1241_62
L1279_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L1241_62
L1278_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1235_62
L1268_62:
	ld i0,[d2,8]
	jp &L1263_62

//****************************************
// Function: __ZN6MAUtil11Environment20firePointerMoveEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil11Environment20firePointerMoveEventE9MAPoint2d_62, 3, void
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
LBB1009_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x14
LBB1012_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE1013_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x18
LBB1018_62:
	ld [i1],d2
LBB1019_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1020_62:
	ld [fr,-48],r0
Ltext274_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L1319_62
LBB1021_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1022_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1319_62
	ld r1,r14
L1312_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L1319_62
LBB1025_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1026_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1312_62
L1319_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1380_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1324_62
	ld r14,#0x1
L1324_62:
	ld r2,#0x0
	jc eq,r14,r2,&L1381_62
LBB1029_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1032_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1032_62:
	ld i0,[i0]
LBE1030_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r0,[i0]
	ld r14,[fr,-60]
	ld r15,[d3,4]
	ld d0,[r0,12]
	ld i1,r14
	ld i2,r15
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1327_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L1380_62
LBB1035_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1036_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1036_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1327_62
	jp &L1380_62
L1381_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB1040_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1280_62
LBB1041_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE1043_62:
.line 327
	ld d1,[d2,8]
LBE1046_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1048_62:
	jc eq,r14,d1,&L1368_62
L1383_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1382_62
L1339_62:
.line 120
	add d1,#0x8
LBB1049_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1050_62:
	jc ne,r14,d1,&L1383_62
L1368_62:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L1384_62
	ld r14,[d2]
L1348_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L1372_62
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffbc
L1358_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1358_62
L1372_62:
.line 278
	ld [d2],d3
LBE1053_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L1280_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 287
	add sp,#0x28
	pop rt,d4
	ret
L1382_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1342_62
.line 123
	ld i0,[d1]
	jc ne,i0,r1,&L1385_62
L1342_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB1067_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1067_62:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1339_62
L1384_62:
.line 291
	call &__Znam_57
	ld d0,r14
LBB1074_62:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1375_62
	ld i0,[d2,8]
L1352_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1352_62
L1370_62:
.line 297
	ld [d2,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L1386_62
.line 300
	ld [d2,8],d0
	jp &L1348_62
L1386_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L1348_62
L1385_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1342_62
L1375_62:
	ld i0,[d2,8]
	jp &L1370_62

//****************************************
// Function: __ZN6MAUtil11Environment21firePointerPressEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil11Environment21firePointerPressEventE9MAPoint2d_62, 3, void
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
LBB1076_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x14
LBB1079_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE1080_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x18
LBB1085_62:
	ld [i1],d2
LBB1086_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1087_62:
	ld [fr,-48],r0
Ltext294_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L1426_62
LBB1088_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1089_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1426_62
	ld r1,r14
L1419_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L1426_62
LBB1092_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1093_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1419_62
L1426_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1487_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1431_62
	ld r14,#0x1
L1431_62:
	ld r2,#0x0
	jc eq,r14,r2,&L1488_62
LBB1096_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1099_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1099_62:
	ld i0,[i0]
LBE1097_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r0,[i0]
	ld r14,[fr,-60]
	ld r15,[d3,4]
	ld d0,[r0,8]
	ld i1,r14
	ld i2,r15
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1434_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L1487_62
LBB1102_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1103_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1103_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1434_62
	jp &L1487_62
L1488_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB1107_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1387_62
LBB1108_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE1110_62:
.line 327
	ld d1,[d2,8]
LBE1113_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d1
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE1115_62:
	jc eq,r14,d1,&L1475_62
L1490_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d1,4]
	ld r1,#0x0
	jc le,r14,r1,&L1489_62
L1446_62:
.line 120
	add d1,#0x8
LBB1116_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d2]
	sll r14,#0x3
	ld r0,[d2,8]
	add r14,r0
LBE1117_62:
	jc ne,r14,d1,&L1490_62
L1475_62:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L1491_62
	ld r14,[d2]
L1455_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L1479_62
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffbc
L1465_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L1465_62
L1479_62:
.line 278
	ld [d2],d3
LBE1120_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L1387_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 278
	add sp,#0x28
	pop rt,d4
	ret
L1489_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r1,&L1449_62
.line 123
	ld i0,[d1]
	jc ne,i0,r1,&L1492_62
L1449_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB1134_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d2,8]
	add r14,i0
LBE1134_62:
	ld r2,[r14]
	ld [d1],r2
	ld r14,[r14,4]
	ld [d1,4],r14
	jp &L1446_62
L1491_62:
.line 291
	call &__Znam_57
	ld d0,r14
LBB1141_62:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L1482_62
	ld i0,[d2,8]
L1459_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L1459_62
L1477_62:
.line 297
	ld [d2,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L1493_62
.line 300
	ld [d2,8],d0
	jp &L1455_62
L1493_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L1455_62
L1492_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1449_62
L1482_62:
	ld i0,[d2,8]
	jp &L1477_62

//****************************************
// Function: __ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE
//****************************************

.func __ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 107
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
LBB1143_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld d2,i0
	add d2,#0x14
LBB1145_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x18
LBB1149_62:
	ld d1,[i0,8]
LBE1149_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,d1
LBE1151_62:
	jc eq,r14,d1,&L1494_62
L1536_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d1]
	jc eq,i0,i1,&L1535_62
.line 93
	add d1,#0x8
LBB1152_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d2
	add r0,#0x4
LBB1153_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE1153_62:
	jc ne,r14,d1,&L1536_62
L1494_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 110
	add sp,#0x8
	pop rt,d2
	ret
L1535_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 95
	ld.b r0,[d2]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L1537_62
.line 99
	ld.b r14,[d2,2]
	and r14,#0xff
	jc eq,r14,r0,&L1503_62
.line 100
	ld r14,#0x0
	jc ne,i0,r14,&L1538_62
L1503_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	ld d0,d2
	add d0,#0x4
	ld r14,d1
LBB1160_62:
.line 334
	ld r1,[d0]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d0,8]
	add r0,i0
LBE1163_62:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d1,&L1528_62
L1509_62:
.line 198
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L1509_62
	ld r1,[d0]
L1528_62:
.line 265
	ld d1,r1
	add d1,#0xffffffff
LBB1165_62:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L1539_62
L1511_62:
.line 274
	ld r0,d1
	jc le,r1,d1,&L1532_62
	ld r1,fr
	add r1,#0xffffffe4
L1521_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-28],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L1521_62
L1532_62:
.line 278
	ld [d0],d1
LBE1166_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 110
	add sp,#0x8
	pop rt,d2
	ret
L1537_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 96
	ld [d1,4],r1
.line 97
	ld r2,#0x1
	ld.b [d2,1],r2
LBE1175_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 110
	add sp,#0x8
	pop rt,d2
	ret
L1539_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d1
	sll i0,#0x3
	call &__Znam_57
	ld d2,r14
LBB1190_62:
.line 293
	ld r2,#0x0
	ld r1,[d0]
	jc le,r1,r2,&L1533_62
	ld i0,[d0,8]
L1515_62:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d0]
	jc gt,r1,r2,&L1515_62
L1530_62:
.line 297
	ld [d0,4],d1
.line 298
	ld r2,#0x0
	jc ne,i0,r2,&L1540_62
.line 300
	ld i0,d2
	ld [d0,8],d2
	jp &L1511_62
L1540_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d0]
.line 300
	ld i0,d2
	ld [d0,8],d2
	jp &L1511_62
L1538_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 100
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
	jp &L1503_62
L1533_62:
	ld i0,[d0,8]
	jp &L1530_62

//****************************************
// Function: __ZN6MAUtil15PointerListenerD0Ev
//****************************************

.func __ZN6MAUtil15PointerListenerD0Ev_62, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB1191_62:
.line 23
	ld r0,&__ZTVN6MAUtil15PointerListenerE_62+8
	ld [i0],r0
LBB1192_62:
.line 24
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_62
.line 25
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1547_62
LBE1192_62:
.line 27
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret
L1547_62:
.line 26
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_62
LBE1194_62:
.line 27
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListenerD1Ev
//****************************************

.func __ZN6MAUtil15PointerListenerD1Ev_62, 1, void
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB1195_62:
.line 23
	ld r0,&__ZTVN6MAUtil15PointerListenerE_62+8
	ld [i0],r0
LBB1196_62:
.line 24
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_62
.line 25
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1553_62
LBE1196_62:
.line 27
	pop rt,d0
	ret
L1553_62:
.line 26
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_62
LBE1198_62:
.line 27
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil15PointerListenerD2Ev
//****************************************

.func __ZN6MAUtil15PointerListenerD2Ev_62, 1, void
.line 23
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB1199_62:
.line 23
	ld r0,&__ZTVN6MAUtil15PointerListenerE_62+8
	ld [i0],r0
LBB1200_62:
.line 24
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17isPointerListenerEPNS_15PointerListenerE_62
.line 25
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L1559_62
LBE1200_62:
.line 27
	pop rt,d0
	ret
L1559_62:
.line 26
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment21removePointerListenerEPNS_15PointerListenerE_62
LBE1202_62:
.line 27
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11Environment18addPointerListenerEPNS_15PointerListenerE
//****************************************

.func __ZN6MAUtil11Environment18addPointerListenerEPNS_15PointerListenerE_62, 2, void
.line 102
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB1203_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,i0
	add r1,#0x14
LBB1205_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x18
LBB1209_62:
	ld r0,[i0,8]
LBE1209_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE1211_62:
	jc eq,r14,r0,&L1595_62
L1568_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,i1,&L1601_62
.line 82
	add r0,#0x8
LBB1212_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB1213_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1213_62:
	jc ne,r14,r0,&L1568_62
L1590_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB1214_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L1597_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L1570_62
LBB1216_62:
.line 286
	ld d2,d1
	add d2,d1
LBB1217_62:
.line 288
	jc lt,d1,d2,&L1602_62
L1597_62:
	ld i0,[d0,8]
L1569_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1215_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 105
	add sp,#0x8
	pop rt,d3
	ret
L1601_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r1,#0x1
	ld [r0,4],r1
LBE1223_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 105
	add sp,#0x8
	pop rt,d3
	ret
L1595_62:
	ld d0,r1
	add d0,#0x4
	jp &L1590_62
L1602_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB1233_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L1598_62
	ld i0,[d0,8]
L1576_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1576_62
L1592_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L1603_62
.line 300
	ld i0,d1
L1600_62:
	ld [d0,8],i0
	jp &L1569_62
L1570_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB1237_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L1599_62
	ld i0,[d0,8]
L1585_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1585_62
L1594_62:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L1604_62
.line 300
	ld i0,d2
L1605_62:
	ld [d0,8],i0
	jp &L1569_62
L1604_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L1605_62
L1603_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L1600_62
L1599_62:
	ld i0,[d0,8]
	jp &L1594_62
L1598_62:
	ld i0,[d0,8]
	jp &L1592_62

//****************************************
// Function: __ZN6MAUtil11Environment13fireConnEventERK15MAConnEventData
//****************************************

.func __ZN6MAUtil11Environment13fireConnEventERK15MAConnEventData_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 303
	push rt,d3
	sub sp,#0x20
	ld fr,sp
	add fr,#0x38
	ld d2,i1
LBB1241_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d3,i0
	add d3,#0x34
LBB1244_62:
.line 116
	ld r0,#0x1
	ld.b [d3],r0
LBE1245_62:
.line 62
	ld i1,fr
	add i1,#0xffffffd0
	ld d1,i0
	add d1,#0x38
LBB1250_62:
	ld [i1],d1
LBB1251_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d1]
LBE1252_62:
	ld [fr,-44],r0
Ltext338_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-40],r1
.line 63
	jc le,r0,r1,&L1643_62
LBB1253_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1,8]
LBE1254_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1643_62
	ld r1,r14
L1636_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L1643_62
LBB1257_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d1,8]
	add r14,r2
LBE1258_62:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L1636_62
L1643_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-32]
L1705_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-28]
	jc ge,i0,r3,&L1648_62
	ld r14,#0x1
L1648_62:
	ld r0,#0x0
	jc eq,r14,r0,&L1645_62
LBB1261_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r2,[d0]
LBB1264_62:
	sll i0,#0x3
	ld r14,[r2,8]
	add i0,r14
LBE1264_62:
	ld i0,[i0]
LBE1262_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0,4]
	ld r0,[d2]
	jc eq,r14,r0,&L1706_62
	ld r0,[d0,8]
	ld r1,[d0,4]
L1654_62:
.line 54
	ld r14,r0
	add r14,#0x1
	ld r0,r14
	ld [d0,8],r14
.line 55
	jc eq,r14,r1,&L1705_62
LBB1267_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r4,[r2,8]
	add r14,r4
LBE1268_62:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L1654_62
	jp &L1705_62
L1706_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d2
	call d0
L1645_62:
.line 116
	ld r1,#0x0
	ld.b [d3],r1
LBB1272_62:
.line 117
	ld.b r14,[d3,1]
	and r14,#0xff
	ld r2,#0x0
	jc eq,r14,r2,&L1606_62
LBB1273_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d2,[d1]
LBE1275_62:
.line 327
	ld d0,[d1,8]
LBE1278_62:
.line 334
	ld i0,d2
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d3
	add d1,#0x4
LBE1280_62:
	jc eq,r14,d0,&L1693_62
L1708_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r4,#0x0
	jc le,r14,r4,&L1707_62
L1666_62:
.line 120
	add d0,#0x8
LBB1281_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r1,[d1,8]
	add r14,r1
LBE1282_62:
	jc ne,r14,d0,&L1708_62
L1693_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d2,&L1709_62
	ld r14,[d1]
L1673_62:
.line 274
	ld r0,d2
	jc le,r14,d2,&L1697_62
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc8
L1683_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-56],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r4,[r1,4]
	ld [r14,4],r4
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L1683_62
L1697_62:
.line 278
	ld [d1],d2
LBE1285_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d3,1],r14
L1606_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 313
	add sp,#0x20
	pop rt,d3
	ret
L1707_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d3,2]
	and r14,#0xff
	jc ne,r14,r4,&L1710_62
L1669_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d2,#0xffffffff
LBB1299_62:
	ld i0,d2
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1299_62:
	ld r0,[r14]
	ld [d0],r0
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L1666_62
L1710_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L1669_62
L1709_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB1306_62:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L1700_62
	ld i0,[d1,8]
L1677_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L1677_62
L1695_62:
.line 297
	ld [d1,4],d2
.line 298
	ld r4,#0x0
	jc ne,i0,r4,&L1711_62
.line 300
	ld [d1,8],d0
	jp &L1673_62
L1711_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L1673_62
L1700_62:
	ld i0,[d1,8]
	jp &L1695_62

//****************************************
// Function: __ZN6MAUtil11Environment18removeConnListenerEi
//****************************************

.func __ZN6MAUtil11Environment18removeConnListenerEi_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 144
	push rt,d6
	sub sp,#0x20
	ld fr,sp
	add fr,#0x44
	ld d6,i0
	ld d4,i1
LBB1307_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld i1,fr
	add i1,#0xffffffc4
	ld d3,i0
	add d3,#0x38
LBB1313_62:
	ld [i1],d3
LBB1314_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d3]
LBE1315_62:
	ld [fr,-56],r0
Ltext359_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-52],r1
.line 63
	jc le,r0,r1,&L1724_62
LBB1316_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d3,8]
LBE1317_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1724_62
	ld r1,r14
L1717_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L1724_62
LBB1320_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d3,8]
	add r14,r2
LBE1321_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1717_62
L1724_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d2,fr
	add d2,#0xffffffd0
	ld i0,d2
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-44]
L1784_62:
.line 60
	ld r14,#0x0
	ld r0,[fr,-40]
	jc ge,r0,r3,&L1729_62
	ld r14,#0x1
L1729_62:
	ld r1,#0x0
	jc eq,r14,r1,&L1785_62
LBB1324_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2]
LBB1327_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1327_62:
	ld r1,[r0]
LBE1325_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[r1,4]
	jc eq,r14,d4,&L1786_62
L1727_62:
	ld r1,[d2,8]
	ld r2,[d2,4]
L1764_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d2,8],r0
.line 55
	jc eq,r0,r2,&L1784_62
LBB1330_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2]
LBB1331_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1331_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1764_62
	jp &L1784_62
L1786_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld d1,d6
	add d1,#0x34
LBB1333_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d0,[d3,8]
LBE1337_62:
.line 334
	ld r14,[d3]
	sll r14,#0x3
	add r14,d0
L1782_62:
	jc eq,r14,d0,&L1727_62
Ltext369_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d0]
	jc eq,i0,r1,&L1787_62
.line 93
	add d0,#0x8
LBB1340_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d1
	add r0,#0x4
LBB1341_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
	jp &L1782_62
L1785_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 60
	add sp,#0x20
	pop rt,d6
	ret
L1787_62:
.line 95
	ld.b r0,[d1]
	and r0,#0xff
	ld r14,#0x0
	jc eq,r0,r14,&L1741_62
.line 96
	ld [d0,4],r14
.line 97
	ld r0,#0x1
	ld.b [d1,1],r0
	ld r3,[fr,-44]
	jp &L1727_62
L1741_62:
.line 99
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L1743_62
.line 100
	call &__ZdlPv_55
L1743_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	add d1,#0x4
	ld r14,d0
LBB1350_62:
.line 334
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE1353_62:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d0,&L1773_62
L1747_62:
.line 198
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L1747_62
	ld r1,[d1]
L1773_62:
.line 265
	ld d0,r1
	add d0,#0xffffffff
LBB1355_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d0,&L1788_62
L1749_62:
.line 274
	ld r0,d0
	jc le,r1,d0,&L1777_62
	ld r1,fr
	add r1,#0xffffffbc
L1759_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L1759_62
L1777_62:
.line 278
	ld [d1],d0
	ld r3,[fr,-44]
	jp &L1727_62
L1788_62:
.line 291
	ld i0,d0
	sll i0,#0x3
	call &__Znam_57
	ld d5,r14
LBB1364_62:
.line 293
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L1778_62
	ld i0,[d1,8]
L1753_62:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d5
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L1753_62
L1775_62:
.line 297
	ld [d1,4],d0
.line 298
	ld r2,#0x0
	jc ne,i0,r2,&L1789_62
.line 300
	ld i0,d5
	ld [d1,8],d5
	jp &L1749_62
L1789_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d5
	ld [d1,8],d5
	jp &L1749_62
L1778_62:
	ld i0,[d1,8]
	jp &L1775_62

//****************************************
// Function: __ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE
//****************************************

.func __ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_62, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 129
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
	ld d2,i0
	ld d0,i1
	ld d1,i2
LBB1365_62:
.line 130
	ld r1,#0x0
	jc eq,i2,r1,&L1832_62
.line 137
	call &__ZN6MAUtil11Environment18removeConnListenerEi_62
.line 140
	ld [d1,4],d0
LBB1366_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,d2
	add r1,#0x34
LBB1367_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld r14,d2
	add r14,#0x38
LBB1371_62:
	ld r0,[r14,8]
LBE1371_62:
.line 334
	ld r14,[r14]
	sll r14,#0x3
	add r14,r0
LBE1373_62:
	jc eq,r14,r0,&L1826_62
L1799_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,d1,&L1833_62
.line 82
	add r0,#0x8
LBB1374_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB1375_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1375_62:
	jc ne,r14,r0,&L1799_62
L1821_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],d1
LBB1376_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L1828_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L1801_62
LBB1378_62:
.line 286
	ld d2,d1
	add d2,d1
LBB1379_62:
.line 288
	jc lt,d1,d2,&L1834_62
L1828_62:
	ld i0,[d0,8]
L1800_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1377_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 142
	add sp,#0x8
	pop rt,d3
	ret
L1833_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r2,#0x1
	ld [r0,4],r2
LBE1385_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 142
	add sp,#0x8
	pop rt,d3
	ret
L1826_62:
	ld d0,r1
	add d0,#0x4
	jp &L1821_62
L1834_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB1395_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L1829_62
	ld i0,[d0,8]
L1807_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1807_62
L1823_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L1835_62
.line 300
	ld i0,d1
L1831_62:
	ld [d0,8],i0
	jp &L1800_62
L1801_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB1399_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L1830_62
	ld i0,[d0,8]
L1816_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L1816_62
L1825_62:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L1836_62
.line 300
	ld i0,d2
L1837_62:
	ld [d0,8],i0
	jp &L1800_62
L1836_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L1837_62
L1835_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L1831_62
L1830_62:
	ld i0,[d0,8]
	jp &L1825_62
L1832_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 131
	ld i0,&LC2_62
	ld i1,&_ZZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerEE12__FUNCTION___62
	call &_panicFunction_28
L1829_62:
	ld i0,[d0,8]
	jp &L1823_62

//****************************************
// Function: __ZN6MAUtil11Environment16runIdleListenersEv
//****************************************

.func __ZN6MAUtil11Environment16runIdleListenersEv_62, 1, void
.line 340
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
LBB1403_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x44
LBB1406_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE1407_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x48
LBB1412_62:
	ld [i1],d2
LBB1413_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1414_62:
	ld [fr,-48],r0
Ltext387_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L1875_62
LBB1415_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1416_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L1875_62
	ld r1,r14
L1868_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L1875_62
LBB1419_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1420_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L1868_62
L1875_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L1934_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L1880_62
	ld r14,#0x1
L1880_62:
	ld r2,#0x0
	jc eq,r14,r2,&L1935_62
LBB1423_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1426_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1426_62:
	ld i0,[i0]
LBE1424_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14]
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L1883_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L1934_62
LBB1429_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1430_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1430_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L1883_62
	jp &L1934_62
L1935_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB1434_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L1838_62
LBB1435_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE1437_62:
.line 327
	ld d0,[d2,8]
LBE1440_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE1442_62:
	jc eq,r14,d0,&L1922_62
L1937_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L1936_62
L1895_62:
.line 120
	add d0,#0x8
LBB1443_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE1444_62:
	jc ne,r14,d0,&L1937_62
L1922_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d3,&L1938_62
	ld r14,[d1]
L1902_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L1926_62
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L1912_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L1912_62
L1926_62:
.line 278
	ld [d1],d3
LBE1447_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L1838_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 348
	add sp,#0x20
	pop rt,d4
	ret
L1936_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L1939_62
L1898_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB1461_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1461_62:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L1895_62
L1939_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L1898_62
L1938_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB1468_62:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L1929_62
	ld i0,[d1,8]
L1906_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L1906_62
L1924_62:
.line 297
	ld [d1,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L1940_62
.line 300
	ld [d1,8],d0
	jp &L1902_62
L1940_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L1902_62
L1929_62:
	ld i0,[d1,8]
	jp &L1924_62

//****************************************
// Function: __ZN6MAUtil11Environment18removeIdleListenerEPNS_12IdleListenerE
//****************************************

.func __ZN6MAUtil11Environment18removeIdleListenerEPNS_12IdleListenerE_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 175
	push rt,d2
	sub sp,#0x8
	ld fr,sp
	add fr,#0x1c
LBB1469_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld d1,i0
	add d1,#0x44
LBB1471_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x48
LBB1475_62:
	ld d0,[i0,8]
LBE1475_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,d0
LBE1477_62:
	jc eq,r14,d0,&L1941_62
L1981_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d0]
	jc eq,i0,i1,&L1980_62
.line 93
	add d0,#0x8
LBB1478_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d1
	add r0,#0x4
LBB1479_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE1479_62:
	jc ne,r14,d0,&L1981_62
L1941_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 178
	add sp,#0x8
	pop rt,d2
	ret
L1980_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 95
	ld.b r0,[d1]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L1982_62
.line 99
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L1950_62
.line 100
	call &__ZdlPv_55
L1950_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	add d1,#0x4
	ld r14,d0
LBB1486_62:
.line 334
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE1489_62:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d0,&L1973_62
L1954_62:
.line 198
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L1954_62
	ld r1,[d1]
L1973_62:
.line 265
	ld d0,r1
	add d0,#0xffffffff
LBB1491_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d0,&L1983_62
L1956_62:
.line 274
	ld r0,d0
	jc le,r1,d0,&L1977_62
	ld r1,fr
	add r1,#0xffffffe4
L1966_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-28],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L1966_62
L1977_62:
.line 278
	ld [d1],d0
LBE1492_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 178
	add sp,#0x8
	pop rt,d2
	ret
L1982_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 96
	ld [d0,4],r1
.line 97
	ld r2,#0x1
	ld.b [d1,1],r2
LBE1501_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 178
	add sp,#0x8
	pop rt,d2
	ret
L1983_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d0
	sll i0,#0x3
	call &__Znam_57
	ld d2,r14
LBB1516_62:
.line 293
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L1978_62
	ld i0,[d1,8]
L1960_62:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L1960_62
L1975_62:
.line 297
	ld [d1,4],d0
.line 298
	ld r2,#0x0
	jc ne,i0,r2,&L1984_62
.line 300
	ld i0,d2
	ld [d1,8],d2
	jp &L1956_62
L1984_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d2
	ld [d1,8],d2
	jp &L1956_62
L1978_62:
	ld i0,[d1,8]
	jp &L1975_62

//****************************************
// Function: __ZN6MAUtil11Environment15addIdleListenerEPNS_12IdleListenerE
//****************************************

.func __ZN6MAUtil11Environment15addIdleListenerEPNS_12IdleListenerE_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 170
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB1517_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,i0
	add r1,#0x44
LBB1519_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x48
LBB1523_62:
	ld r0,[i0,8]
LBE1523_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE1525_62:
	jc eq,r14,r0,&L2020_62
L1993_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,i1,&L2026_62
.line 82
	add r0,#0x8
LBB1526_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB1527_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1527_62:
	jc ne,r14,r0,&L1993_62
L2015_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB1528_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2022_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L1995_62
LBB1530_62:
.line 286
	ld d2,d1
	add d2,d1
LBB1531_62:
.line 288
	jc lt,d1,d2,&L2027_62
L2022_62:
	ld i0,[d0,8]
L1994_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1529_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 173
	add sp,#0x8
	pop rt,d3
	ret
L2026_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r1,#0x1
	ld [r0,4],r1
LBE1537_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 173
	add sp,#0x8
	pop rt,d3
	ret
L2020_62:
	ld d0,r1
	add d0,#0x4
	jp &L2015_62
L2027_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB1547_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2023_62
	ld i0,[d0,8]
L2001_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2001_62
L2017_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L2028_62
.line 300
	ld i0,d1
L2025_62:
	ld [d0,8],i0
	jp &L1994_62
L1995_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB1551_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2024_62
	ld i0,[d0,8]
L2010_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2010_62
L2019_62:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L2029_62
.line 300
	ld i0,d2
L2030_62:
	ld [d0,8],i0
	jp &L1994_62
L2029_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L2030_62
L2028_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L2025_62
L2024_62:
	ld i0,[d0,8]
	jp &L2019_62
L2023_62:
	ld i0,[d0,8]
	jp &L2017_62

//****************************************
// Function: __ZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEii
//****************************************

.func __ZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEii_62, 4, void
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
LBB1555_62:
.line 181
	ld r0,#0x0
	jc lt,i2,r0,&L2159_62
LBB1557_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld i1,fr
	add i1,#0xffffffc4
	ld d2,i0
	add d2,#0x58
LBB1561_62:
	ld [i1],d2
LBB1562_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1563_62:
	ld [fr,-56],r0
Ltext431_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-52],r1
.line 63
	jc le,r0,r1,&L2045_62
LBB1564_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1565_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2045_62
	ld r1,r14
L2038_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L2045_62
LBB1568_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1569_62:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2038_62
L2045_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-44]
L2158_62:
.line 60
	ld r14,#0x0
	ld r0,[fr,-40]
	jc ge,r0,r3,&L2050_62
	ld r14,#0x1
L2050_62:
	ld r1,#0x0
	jc eq,r14,r1,&L2160_62
LBB1572_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r2,[d1]
LBB1575_62:
	sll r0,#0x3
	ld d0,[r2,8]
	add r0,d0
LBE1575_62:
	ld r0,[r0]
LBE1573_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[r0]
	jc eq,r14,d3,&L2161_62
	ld r0,[d1,8]
	ld r1,[d1,4]
L2094_62:
.line 54
	ld r14,r0
	add r14,#0x1
	ld r0,r14
	ld [d1,8],r14
.line 55
	jc eq,r14,r1,&L2158_62
LBB1578_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r4,[r2,8]
	add r14,r4
LBE1579_62:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2094_62
	jp &L2158_62
L2160_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	add d4,#0x54
	ld i0,#0x14
	call &__Znwm_56
	ld d1,r14
	ld i0,r14
	ld i1,d3
	ld i2,d5
	ld i3,d6
	call &__ZN6MAUtil11Environment18TimerEventInstanceC1EPNS_13TimerListenerEii_62
LBB1581_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld r0,[d2,8]
LBE1585_62:
.line 334
	ld r14,[d2]
	sll r14,#0x3
	add r14,r0
LBE1587_62:
	jc eq,r14,r0,&L2146_62
L2108_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,d1,&L2162_62
.line 82
	add r0,#0x8
LBB1588_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,d4
	add d0,#0x4
LBB1589_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r4,[d0,8]
	add r14,r4
LBE1589_62:
	jc ne,r14,r0,&L2108_62
L2136_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffb4
	ld r14,#0x1
	ld [fr,-72],r14
	ld [fr,-76],d1
LBB1590_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2148_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L2110_62
LBB1592_62:
.line 286
	ld d2,d1
	add d2,d1
LBB1593_62:
.line 288
	jc lt,d1,d2,&L2163_62
L2148_62:
	ld i0,[d0,8]
L2109_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r1,[d3]
	ld [r14],r1
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1591_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 193
	add sp,#0x28
	pop rt,d6
	ret
L2146_62:
	ld d0,d4
	add d0,#0x4
	jp &L2136_62
L2161_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld [r0,8],d5
LBB1598_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[fr,-40]
LBB1601_62:
	sll r14,#0x3
	add r14,d0
LBE1601_62:
	ld r14,[r14]
LBE1599_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld [r14,12],d6
LBB1602_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[fr,-40]
LBB1605_62:
	sll r14,#0x3
	add d0,r14
LBE1605_62:
	ld d0,[d0]
LBE1603_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	syscall 86
	ld [d0,4],r14
LBB1606_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r0,[d1]
	ld r14,[fr,-40]
LBB1609_62:
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE1609_62:
	ld r14,[r14]
LBE1607_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r1,[r14,4]
	add d5,r1
	ld [r14,16],d5
LBB1610_62:
.line 81
	ld r2,d4
	add r2,#0x54
LBB1611_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[fr,-40]
LBB1614_62:
	sll r14,#0x3
	add r0,r14
LBE1614_62:
	ld i0,[r0]
LBE1612_62:
.line 327
	ld r1,[d2,8]
LBE1619_62:
.line 334
	ld r14,[d2]
	sll r14,#0x3
	add r14,r1
LBE1621_62:
	jc eq,r14,r1,&L2141_62
L2073_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r1]
	jc eq,r14,i0,&L2164_62
.line 82
	add r1,#0x8
LBB1622_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r2
	add d0,#0x4
LBB1623_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r4,[d0,8]
	add r14,r4
LBE1623_62:
	jc ne,r14,r1,&L2073_62
L2130_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffbc
	ld r14,#0x1
	ld [fr,-64],r14
	ld [fr,-68],i0
LBB1624_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2148_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L2075_62
LBB1626_62:
.line 286
	ld d2,d1
	add d2,d1
LBB1627_62:
.line 288
	jc ge,d1,d2,&L2148_62
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB1629_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2149_62
	ld i0,[d0,8]
L2081_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2081_62
L2138_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r4,#0x0
	jc ne,i0,r4,&L2165_62
.line 300
	ld i0,d1
L2155_62:
	ld [d0,8],i0
	jp &L2109_62
L2141_62:
	ld d0,r2
	add d0,#0x4
	jp &L2130_62
L2075_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB1650_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2150_62
	ld i0,[d0,8]
L2090_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2090_62
L2140_62:
.line 297
	ld r4,#0x4
	ld [d0,4],r4
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L2166_62
.line 300
	ld i0,d2
L2167_62:
	ld [d0,8],i0
	jp &L2109_62
L2110_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB1659_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2150_62
	ld i0,[d0,8]
L2125_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2125_62
	jp &L2140_62
L2163_62:
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB1663_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2149_62
	ld i0,[d0,8]
L2116_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2116_62
	jp &L2138_62
L2166_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L2167_62
L2165_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L2155_62
L2150_62:
	ld i0,[d0,8]
	jp &L2140_62
L2162_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r2,#0x1
	ld [r0,4],r2
LBE1670_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 193
	add sp,#0x28
	pop rt,d6
	ret
L2164_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r2,#0x1
	ld [r1,4],r2
LBE1677_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 193
	add sp,#0x28
	pop rt,d6
	ret
L2159_62:
.line 181
	ld i0,&LC3_62
	ld i1,&_ZZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEiiE12__FUNCTION___62
	call &_panicFunction_28
L2149_62:
	ld i0,[d0,8]
	jp &L2138_62

//****************************************
// Function: __ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE
//****************************************

.func __ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE_62, 2, void
.line 195
	push rt,d3
	sub sp,#0x20
	ld fr,sp
	add fr,#0x38
	ld d3,i0
	ld d1,i1
LBB1680_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld i1,fr
	add i1,#0xffffffd0
	ld d2,i0
	add d2,#0x58
LBB1686_62:
	ld [i1],d2
LBB1687_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1688_62:
	ld [fr,-44],r0
Ltext464_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-40],r1
.line 63
	jc le,r0,r1,&L2180_62
LBB1689_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1690_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2180_62
	ld r1,r14
L2173_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L2180_62
LBB1693_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1694_62:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2173_62
L2180_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d0,fr
	add d0,#0xffffffdc
	ld i0,d0
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-32]
L2240_62:
.line 60
	ld r14,#0x0
	ld r0,[fr,-28]
	jc ge,r0,r3,&L2185_62
	ld r14,#0x1
L2185_62:
	ld r1,#0x0
	jc eq,r14,r1,&L2168_62
LBB1697_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r2,[d0]
LBB1700_62:
	sll r0,#0x3
	ld r14,[r2,8]
	add r0,r14
LBE1700_62:
	ld r1,[r0]
LBE1698_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[r1]
	jc eq,r14,d1,&L2241_62
	ld r0,[d0,8]
	ld r1,[d0,4]
L2220_62:
.line 54
	ld r14,r0
	add r14,#0x1
	ld r0,r14
	ld [d0,8],r14
.line 55
	jc eq,r14,r1,&L2240_62
LBB1703_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r4,[r2,8]
	add r14,r4
LBE1704_62:
	ld r14,[r14,4]
	ld r4,#0x0
	jc eq,r14,r4,&L2220_62
	jp &L2240_62
L2242_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 95
	ld.b r0,[d1]
	and r0,#0xff
	ld r1,#0x0
	jc eq,r0,r1,&L2197_62
.line 96
	ld [d0,4],r1
.line 97
	ld r2,#0x1
	ld.b [d1,1],r2
L2168_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 202
	add sp,#0x20
	pop rt,d3
	ret
L2241_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld d1,d3
	add d1,#0x54
LBB1713_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d0,[d2,8]
LBE1717_62:
.line 334
	ld r14,[d2]
	sll r14,#0x3
	add r14,d0
L2239_62:
	jc eq,r14,d0,&L2168_62
Ltext476_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d0]
	jc eq,i0,r1,&L2242_62
.line 93
	add d0,#0x8
LBB1720_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d1
	add r0,#0x4
LBB1721_62:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
	jp &L2239_62
L2197_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 99
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L2199_62
.line 100
	call &__ZdlPv_55
L2199_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	add d1,#0x4
	ld r14,d0
LBB1723_62:
.line 334
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE1726_62:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d0,&L2230_62
L2203_62:
.line 198
	ld r4,[r14,8]
	ld [r14],r4
	ld r1,[r14,12]
	ld [r14,4],r1
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L2203_62
	ld r1,[d1]
L2230_62:
.line 265
	ld d0,r1
	add d0,#0xffffffff
LBB1728_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d0,&L2243_62
L2205_62:
.line 274
	ld r0,d0
	jc le,r1,d0,&L2234_62
	ld r1,fr
	add r1,#0xffffffc8
L2215_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-56],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r4,[r1,4]
	ld [r14,4],r4
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2215_62
L2234_62:
.line 278
	ld [d1],d0
	jp &L2168_62
L2243_62:
.line 291
	ld i0,d0
	sll i0,#0x3
	call &__Znam_57
	ld d2,r14
LBB1737_62:
.line 293
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L2235_62
	ld i0,[d1,8]
L2209_62:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r4,[r14]
	ld [r0],r4
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L2209_62
L2232_62:
.line 297
	ld [d1,4],d0
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L2244_62
.line 300
	ld i0,d2
	ld [d1,8],d2
	jp &L2205_62
L2244_62:
.line 298
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d2
	ld [d1,8],d2
	jp &L2205_62
L2235_62:
	ld i0,[d1,8]
	jp &L2232_62

//****************************************
// Function: __ZN6MAUtil11Environment24fireCustomEventListenersERK7MAEvent
//****************************************

.func __ZN6MAUtil11Environment24fireCustomEventListenersERK7MAEvent_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 322
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d3,i1
LBB1738_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,i0
	add d4,#0x74
LBB1741_62:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE1742_62:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld d2,i0
	add d2,#0x78
LBB1747_62:
	ld [i1],d2
LBB1748_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1749_62:
	ld [fr,-48],r0
Ltext483_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-44],r1
.line 63
	jc le,r0,r1,&L2282_62
LBB1750_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1751_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2282_62
	ld r1,r14
L2275_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L2282_62
LBB1754_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1755_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L2275_62
L2282_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L2341_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L2287_62
	ld r14,#0x1
L2287_62:
	ld r2,#0x0
	jc eq,r14,r2,&L2342_62
LBB1758_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1761_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1761_62:
	ld i0,[i0]
LBE1759_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L2290_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L2341_62
LBB1764_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1765_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1765_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L2290_62
	jp &L2341_62
L2342_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d4],r14
LBB1769_62:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L2245_62
LBB1770_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE1772_62:
.line 327
	ld d0,[d2,8]
LBE1775_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE1777_62:
	jc eq,r14,d0,&L2329_62
L2344_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L2343_62
L2302_62:
.line 120
	add d0,#0x8
LBB1778_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE1779_62:
	jc ne,r14,d0,&L2344_62
L2329_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d3,&L2345_62
	ld r14,[d1]
L2309_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L2333_62
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc4
L2319_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2319_62
L2333_62:
.line 278
	ld [d1],d3
LBE1782_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L2245_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 329
	add sp,#0x20
	pop rt,d4
	ret
L2343_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r1,&L2346_62
L2305_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB1796_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1796_62:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L2302_62
L2346_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L2305_62
L2345_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB1803_62:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L2336_62
	ld i0,[d1,8]
L2313_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L2313_62
L2331_62:
.line 297
	ld [d1,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L2347_62
.line 300
	ld [d1,8],d0
	jp &L2309_62
L2347_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L2309_62
L2336_62:
	ld i0,[d1,8]
	jp &L2331_62

//****************************************
// Function: __ZN6MAUtil11Environment22addCustomEventListenerEPNS_19CustomEventListenerE
//****************************************

.func __ZN6MAUtil11Environment22addCustomEventListenerEPNS_19CustomEventListenerE_62, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 204
	push rt,d3
	sub sp,#0x8
	ld fr,sp
	add fr,#0x20
LBB1852_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,i0
	add r1,#0x74
LBB1854_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x78
LBB1858_62:
	ld r0,[i0,8]
LBE1858_62:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r0
LBE1860_62:
	jc eq,r14,r0,&L2427_62
L2400_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,i1,&L2433_62
.line 82
	add r0,#0x8
LBB1861_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB1862_62:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE1862_62:
	jc ne,r14,r0,&L2400_62
L2422_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d3,fr
	add d3,#0xffffffe0
	ld r14,#0x1
	ld [fr,-28],r14
	ld [fr,-32],i1
LBB1863_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L2429_62
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L2402_62
LBB1865_62:
.line 286
	ld d2,d1
	add d2,d1
LBB1866_62:
.line 288
	jc lt,d1,d2,&L2434_62
L2429_62:
	ld i0,[d0,8]
L2401_62:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d3]
	ld [r14],r2
	ld d3,[d3,4]
	ld [r14,4],d3
	add r0,#0x1
	ld [d0],r0
LBE1864_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 207
	add sp,#0x8
	pop rt,d3
	ret
L2433_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r1,#0x1
	ld [r0,4],r1
LBE1872_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 207
	add sp,#0x8
	pop rt,d3
	ret
L2427_62:
	ld d0,r1
	add d0,#0x4
	jp &L2422_62
L2434_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB1882_62:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L2430_62
	ld i0,[d0,8]
L2408_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2408_62
L2424_62:
.line 297
	ld [d0,4],d2
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L2435_62
.line 300
	ld i0,d1
L2432_62:
	ld [d0,8],i0
	jp &L2401_62
L2402_62:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d2,r14
LBB1886_62:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L2431_62
	ld i0,[d0,8]
L2417_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d2
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L2417_62
L2426_62:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L2436_62
.line 300
	ld i0,d2
L2437_62:
	ld [d0,8],i0
	jp &L2401_62
L2436_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d2
	jp &L2437_62
L2435_62:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L2432_62
L2431_62:
	ld i0,[d0,8]
	jp &L2426_62
L2430_62:
	ld i0,[d0,8]
	jp &L2424_62

//****************************************
// Function: __ZN6MAUtil11Environment20fireTextBoxListenersEii
//****************************************

.func __ZN6MAUtil11Environment20fireTextBoxListenersEii_62, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 331
	push rt,d5
	sub sp,#0x20
	ld fr,sp
	add fr,#0x40
	ld d4,i1
	ld d3,i2
LBB1890_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d5,i0
	add d5,#0x84
LBB1893_62:
.line 116
	ld r0,#0x1
	ld.b [d5],r0
LBE1894_62:
.line 62
	ld i1,fr
	add i1,#0xffffffc8
	ld d2,i0
	add d2,#0x88
LBB1899_62:
	ld [i1],d2
LBB1900_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d2]
LBE1901_62:
	ld [fr,-52],r0
Ltext527_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-48],r1
.line 63
	jc le,r0,r1,&L2475_62
LBB1902_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d2,8]
LBE1903_62:
	ld r14,[r14,4]
	jc ne,r14,r1,&L2475_62
	ld r1,r14
L2468_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L2475_62
LBB1906_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d2,8]
	add r14,r2
LBE1907_62:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L2468_62
L2475_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd4
	ld i0,d1
	ld i2,#0xc
	syscall 5
L2534_62:
.line 60
	ld r14,#0x0
	ld i0,[fr,-36]
	ld r1,[fr,-40]
	jc ge,i0,r1,&L2480_62
	ld r14,#0x1
L2480_62:
	ld r2,#0x0
	jc eq,r14,r2,&L2535_62
LBB1910_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1913_62:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE1913_62:
	ld i0,[i0]
LBE1911_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d4
	ld i2,d3
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L2483_62:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L2534_62
LBB1916_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB1917_62:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE1917_62:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L2483_62
	jp &L2534_62
L2535_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 116
	ld r14,#0x0
	ld.b [d5],r14
LBB1921_62:
.line 117
	ld.b r14,[d5,1]
	and r14,#0xff
	ld r0,r2
	jc eq,r14,r2,&L2438_62
LBB1922_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d3,[d2]
LBE1924_62:
.line 327
	ld d0,[d2,8]
LBE1927_62:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d5
	add d1,#0x4
LBE1929_62:
	jc eq,r14,d0,&L2522_62
L2537_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r1,#0x0
	jc le,r14,r1,&L2536_62
L2495_62:
.line 120
	add d0,#0x8
LBB1930_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE1931_62:
	jc ne,r14,d0,&L2537_62
L2522_62:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d3,&L2538_62
	ld r14,[d1]
L2502_62:
.line 274
	ld r0,d3
	jc le,r14,d3,&L2526_62
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffc0
L2512_62:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-64],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L2512_62
L2526_62:
.line 278
	ld [d1],d3
LBE1934_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d5,1],r14
L2438_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Environment.cpp'
.line 338
	add sp,#0x20
	pop rt,d5
	ret
L2536_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d5,2]
	and r14,#0xff
	jc ne,r14,r1,&L2539_62
L2498_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB1948_62:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE1948_62:
	ld r2,[r14]
	ld [d0],r2
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L2495_62
L2539_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L2498_62
L2538_62:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB1955_62:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L2529_62
	ld i0,[d1,8]
L2506_62:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L2506_62
L2524_62:
.line 297
	ld [d1,4],d3
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L2540_62
.line 300
	ld [d1,8],d0
	jp &L2502_62
L2540_62:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L2502_62
L2529_62:
	ld i0,[d1,8]
	jp &L2524_62

//****************************************
// Function: __ZN6MAUtil15stringToIntegerERKNS_11BasicStringIcEEi
//****************************************

.func __ZN6MAUtil15stringToIntegerERKNS_11BasicStringIcEEi_64, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\util.cpp'
.line 85
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i1
LBB18_64:
.line 86
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,r14
	ld i1,#0x0
	ld i2,d0
	call &_strtoul_44
LBE18_64:
.line 87
	pop rt,d0
	ret

//****************************************
// Function: _Gfx_clearMatrix
//****************************************

.func _Gfx_clearMatrix_67, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Graphics.c'
.line 197
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 198
	ld r0,#0x0
	ld [zr,_sTransformStackPtr_67],r0
.line 199
	ld r14,&_sCurrentOffset_67
	ld [r14],r0
.line 200
	ld [r14,4],r0
.line 201
	ld r14,&_sTransformStack_67
	ld [r14],r0
.line 202
	ld [r14,4],r0
	pop fr,fr
	ret

//****************************************
// Function: _Gfx_clearClipRect
//****************************************

.func _Gfx_clearClipRect_67, 0, void
.line 45
	push rt,d1
	ld fr,sp
	add fr,#0x10
.line 46
	syscall 46
.line 47
	ld r0,#0x0
	ld [zr,_sClipStackPtr_67],r0
.line 48
	ld d1,r14
	sra d1,#0x10
	xh d0,r14
	ld i0,r0
	ld i1,r0
	ld i2,d1
	ld i3,d0
	syscall 33
.line 49
	ld r14,&_sClipStack_67
	ld r0,#0x0
	ld [r14],r0
.line 50
	ld [r14,4],r0
.line 51
	ld [r14,8],d1
.line 52
	ld [r14,12],d0
	pop rt,d1
	ret

//****************************************
// Function: __Gfx_init
//****************************************

.func __Gfx_init_67, 0, void
.line 35
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 36
	ld r14,[zr,_sClipStackPtr_67]
	ld r0,#0x0
	jc lt,r14,r0,&L7_67
L4_67:
.line 38
	ld r14,[zr,_sTransformStackPtr_67]
	ld r0,#0x0
	jc lt,r14,r0,&L8_67
.line 40
	pop rt,fr
	ret
L8_67:
.line 39
	call &_Gfx_clearMatrix_67
.line 40
	pop rt,fr
	ret
L7_67:
.line 37
	call &_Gfx_clearClipRect_67
	jp &L4_67

//****************************************
// Function: _Gfx_pushClipRect
//****************************************

.func _Gfx_pushClipRect_67, 4, int
.line 73
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d1,i1
	ld d2,i2
	ld d3,i3
.line 74
	call &__Gfx_init_67
.line 75
	ld r14,[zr,_sClipStackPtr_67]
	ld r0,#0x7e
	jc gt,r14,r0,&L16_67
.line 78
	ld r14,[zr,_sCurrentOffset_67]
	add d0,r14
	ld r0,[zr,_sCurrentOffset_67+4]
	add d1,r0
.line 79
	ld i0,d0
	ld i1,d1
	ld i2,d2
	ld i3,d3
	syscall 33
.line 81
	ld r14,[zr,_sClipStackPtr_67]
	add r14,#0x1
	ld [zr,_sClipStackPtr_67],r14
.line 82
	sll r14,#0x4
	add r14,&_sClipStack_67
	ld [r14],d0
.line 83
	ld [r14,4],d1
.line 84
	ld [r14,8],d2
.line 85
	ld [r14,12],d3
.line 86
	ld r14,#0x0
	jc le,d2,r14,&L14_67
	ld r14,#0x1
	ld r0,#0x0
	jc le,d3,r0,&L14_67
.line 88
	pop rt,d3
	ret
L14_67:
.line 87
	ld r14,#0x0
.line 88
	pop rt,d3
	ret
L16_67:
.line 76
	ld i0,&LC0_67
	ld i1,&__FUNCTION___3_67
	call &_panicFunction_28

//****************************************
// Function: _Gfx_intersectClipRect
//****************************************

.func _Gfx_intersectClipRect_67, 4, int
.line 93
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d1,i1
	ld d2,i2
	ld d3,i3
.line 98
	call &__Gfx_init_67
.line 99
	ld r0,[zr,_sClipStackPtr_67]
	ld r14,r0
	sll r14,#0x4
	add r14,&_sClipStack_67
	ld r2,[r14]
.line 100
	ld r3,[r14,4]
.line 101
	ld r1,[r14,8]
.line 102
	ld r14,[r14,12]
.line 104
	ld r4,[zr,_sCurrentOffset_67]
	add d0,r4
	ld r4,[zr,_sCurrentOffset_67+4]
	add d1,r4
.line 106
	ld r4,#0x7e
	jc gt,r0,r4,&L35_67
.line 110
	ld r0,#0x0
	jc eq,r1,r0,&L34_67
	jc eq,r14,r0,&L34_67
.line 115
	ld r0,d0
	add r0,d2
	jc lt,r0,r2,&L34_67
.line 121
	ld r4,d1
	add r4,d3
	jc lt,r4,r3,&L34_67
.line 127
	add r1,r2
	jc lt,r1,d0,&L34_67
.line 133
	ld r5,r3
	add r5,r14
	jc lt,r5,d1,&L34_67
.line 139
	jc lt,d0,r2,&L36_67
L25_67:
.line 145
	jc ge,d1,r3,&L26_67
.line 147
	ld r14,r3
	sub r14,d1
	sub d3,r14
.line 148
	ld d1,r3
	ld r4,r3
	add r4,d3
L26_67:
.line 151
	jc le,r0,r1,&L27_67
.line 153
	sub r0,r1
	sub d2,r0
L27_67:
.line 156
	jc le,r4,r5,&L28_67
.line 158
	sub r4,r5
	sub d3,r4
L28_67:
.line 161
	ld i0,d0
	ld i1,d1
	ld i2,d2
	ld i3,d3
	syscall 33
.line 163
	ld r14,[zr,_sClipStackPtr_67]
	add r14,#0x1
	ld [zr,_sClipStackPtr_67],r14
.line 164
	sll r14,#0x4
	add r14,&_sClipStack_67
	ld [r14],d0
.line 165
	ld [r14,4],d1
.line 166
	ld [r14,8],d2
.line 167
	ld [r14,12],d3
.line 169
	ld r4,#0x0
	jc le,d2,r4,&L29_67
	ld r14,#0x1
	jc le,d3,r4,&L29_67
.line 172
	pop rt,d3
	ret
L34_67:
.line 135
	ld i0,#0x0
	ld i1,i0
	ld i2,i0
	ld i3,i0
	call &_Gfx_pushClipRect_67
L29_67:
.line 170
	ld r14,#0x0
.line 172
	pop rt,d3
	ret
L36_67:
.line 141
	ld r14,r2
	sub r14,d0
	sub d2,r14
.line 142
	ld d0,r2
	ld r0,r2
	add r0,d2
	jp &L25_67
L35_67:
.line 107
	ld i0,&LC0_67
	ld i1,&__FUNCTION___2_67
	call &_panicFunction_28

//****************************************
// Function: _Gfx_popClipRect
//****************************************

.func _Gfx_popClipRect_67, 0, int
.line 178
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 179
	call &__Gfx_init_67
.line 180
	ld r14,[zr,_sClipStackPtr_67]
	add r14,#0xffffffff
.line 181
	ld r0,#0xffffffff
	jc le,r14,r0,&L42_67
	ld [zr,_sClipStackPtr_67],r14
.line 184
	sll r14,#0x4
	add r14,&_sClipStack_67
	ld i0,[r14]
	ld i1,[r14,4]
	ld i2,[r14,8]
	ld i3,[r14,12]
	syscall 33
.line 190
	ld r0,[zr,_sClipStackPtr_67]
	sll r0,#0x4
	add r0,&_sClipStack_67
	ld r14,[r0,8]
	ld r1,#0x0
	jc le,r14,r1,&L40_67
	ld r14,[r0,12]
	ld r0,#0x1
	jc le,r14,r1,&L40_67
.line 192
	ld r14,r0
	pop rt,fr
	ret
L42_67:
.line 182
	ld [zr,_sClipStackPtr_67],r0
L40_67:
.line 191
	ld r0,#0x0
.line 192
	ld r14,r0
	pop rt,fr
	ret

//****************************************
// Function: _Gfx_pushMatrix
//****************************************

.func _Gfx_pushMatrix_67, 0, void
.line 206
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 207
	call &__Gfx_init_67
.line 208
	ld r0,[zr,_sTransformStackPtr_67]
	ld r14,#0x7e
	jc gt,r0,r14,&L45_67
.line 214
	add r0,#0x1
	ld [zr,_sTransformStackPtr_67],r0
.line 215
	sll r0,#0x3
	add r0,&_sTransformStack_67
	ld r14,[zr,_sCurrentOffset_67]
	ld r15,[zr,_sCurrentOffset_67+4]
	ld [r0],r14
	ld [r0,4],r15
	pop rt,fr
	ret
L45_67:
.line 209
	ld i0,&LC1_67
	ld i1,&__FUNCTION___1_67
	call &_panicFunction_28

//****************************************
// Function: _Gfx_popMatrix
//****************************************

.func _Gfx_popMatrix_67, 0, void
.line 218
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 219
	call &__Gfx_init_67
.line 220
	ld r1,[zr,_sTransformStackPtr_67]
	ld r14,#0x0
	jc lt,r1,r14,&L48_67
.line 224
	ld r0,r1
	sll r0,#0x3
	add r0,&_sTransformStack_67
	ld r14,[r0]
	ld r15,[r0,4]
	ld [zr,_sCurrentOffset_67],r14
	ld [zr,_sCurrentOffset_67+4],r15
.line 225
	add r1,#0xffffffff
	ld [zr,_sTransformStackPtr_67],r1
	pop rt,fr
	ret
L48_67:
.line 221
	ld i0,&LC2_67
	ld i1,&__FUNCTION___0_67
	call &_panicFunction_28

//****************************************
// Function: _Gfx_translate
//****************************************

.func _Gfx_translate_67, 2, void
.line 228
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 229
	ld r14,&_sCurrentOffset_67
	ld r0,[r14]
	add r0,i0
	ld [r14],r0
.line 230
	add r14,#0x4
	ld r0,[r14]
	add r0,i1
	ld [r14],r0
	pop fr,fr
	ret

//****************************************
// Function: _Gfx_getTranslation
//****************************************

.func _Gfx_getTranslation_67, 0, double
.line 233
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 234
	ld r0,[zr,_sCurrentOffset_67]
	ld r1,[zr,_sCurrentOffset_67+4]
	ld r2,r0
	ld r3,r1
.line 235
	ld r14,r0
	ld r15,r1
	pop fr,fr
	ret

//****************************************
// Function: _Gfx_line
//****************************************

.func _Gfx_line_67, 4, void
.line 256
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 257
	ld r14,&_sCurrentOffset_67
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
// Function: _Gfx_fillRect
//****************************************

.func _Gfx_fillRect_67, 4, void
.line 260
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 261
	ld r14,&_sCurrentOffset_67
	ld r0,[r14]
	add i0,r0
	ld r14,[r14,4]
	add i1,r14
	syscall 37
	pop rt,fr
	ret

//****************************************
// Function: _Gfx_drawImage
//****************************************

.func _Gfx_drawImage_67, 3, void
.line 277
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 278
	ld r14,&_sCurrentOffset_67
	ld r0,[r14]
	add i1,r0
	ld r14,[r14,4]
	add i2,r14
	syscall 47
	pop rt,fr
	ret

//****************************************
// Function: _Gfx_drawImageRegion
//****************************************

.func _Gfx_drawImageRegion_67, 4, void
.line 289
	push rt,fr
	sub sp,#0x8
	ld fr,sp
	add fr,#0x10
.line 290
	ld r1,[i2,4]
	ld [fr,-12],r1
.line 291
	ld r0,&_sCurrentOffset_67
	ld r14,[i2]
	ld r1,[r0]
	add r14,r1
	ld [fr,-16],r14
.line 292
	ld r14,[fr,-12]
	ld r0,[r0,4]
	add r14,r0
	ld [fr,-12],r14
.line 293
	ld i2,fr
	add i2,#0xfffffff0
	syscall 49
	add sp,#0x8
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnectionC1EPNS_18ConnectionListenerE
//****************************************

.func __ZN6MAUtil19BluetoothConnectionC1EPNS_18ConnectionListenerE_69, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.cpp'
.line 10
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_69:
.line 10
	ld i2,#0x0
	call &__ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi_78
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_69+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_69+36
	ld [d0,40],r14
	ld i0,d0
	add i0,#0x2c
	call &__ZN6MAUtil19BluetoothDiscovererC1Ev_71
	ld r14,#0xffffffff
	ld [d0,64],r14
LBE3_69:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUID
//****************************************

.func __ZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUID_69, 3, int
.line 16
	push rt,d4
	sub sp,#0x58
	ld fr,sp
	add fr,#0x74
	ld d1,i0
	ld d0,i1
	ld d3,i2
LBB4_69:
.line 17
	ld r14,[i0,64]
	ld r0,#0x0
	jc ge,r14,r0,&L16_69
.line 18
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
.line 19
	ld r1,#0x0
	ld [i0,64],r1
.line 20
	add i0,#0x2c
	ld i3,d1
	add i3,#0x28
	call &__ZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerE_71
.line 35
	ld r0,r14
LBB6_69:
.line 21
	ld r1,#0x0
	jc lt,r14,r1,&L17_69
LBE6_69:
.line 36
	ld r14,r0
	add sp,#0x58
	pop rt,d4
	ret
L17_69:
.line 26
	ld d4,fr
	add d4,#0xffffffa4
.line 28
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
	ld i1,&LC1_69
	call &_sprintf_37
	ld d0,d4
	add d0,r14
LBB11_69:
.line 30
	ld d2,#0x0
L12_69:
.line 31
	ld r14,d2
	sll r14,#0x2
	add r14,d3
	ld r14,[r14]
	ld [sp],r14
	ld i0,d0
	ld i1,&LC2_69
	call &_sprintf_37
	add d0,r14
.line 30
	add d2,#0x1
	ld r14,#0x3
	jc le,d2,r14,&L12_69
LBE11_69:
.line 33
	ld i0,d1
	ld i1,d4
	call &__ZN6MAUtil10Connection7connectEPKc_78
	ld r0,r14
LBE10_69:
.line 36
	ld r14,r0
	add sp,#0x58
	pop rt,d4
	ret
L16_69:
.line 17
	ld i0,&LC0_69
	ld i1,&_ZZN6MAUtil19BluetoothConnection7connectERK8MABtAddrRK6MAUUIDE12__FUNCTION___69
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection5closeEv
//****************************************

.func __ZN6MAUtil19BluetoothConnection5closeEv_69, 1, void
.line 38
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB14_69:
.line 39
	ld r14,#0xffffffff
	ld [i0,64],r14
.line 40
	add i0,#0x2c
	call &__ZN6MAUtil19BluetoothDiscoverer6cancelEv_71
.line 41
	ld i0,d0
	call &__ZN6MAUtil10Connection5closeEv_78
LBE14_69:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnectionD0Ev
//****************************************

.func __ZN6MAUtil19BluetoothConnectionD0Ev_69, 1, void
.line 12
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB15_69:
.line 12
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_69+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_69+36
	ld [i0,40],r14
.line 13
	call &__ZN6MAUtil19BluetoothConnection5closeEv_69
	ld i0,d0
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE15_69:
.line 14
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnectionD1Ev
//****************************************

.func __ZN6MAUtil19BluetoothConnectionD1Ev_69, 1, void
.line 12
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB16_69:
.line 12
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_69+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil19BluetoothConnectionE_69+36
	ld [i0,40],r14
.line 13
	call &__ZN6MAUtil19BluetoothConnection5closeEv_69
	ld i0,d0
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE16_69:
.line 14
	pop rt,d0
	ret

//****************************************
// Function: __ZThn40_N6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE
//****************************************

.func __ZThn40_N6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE_69, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.h'
.line 37
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 37
	add i0,#0xffffffd8
	call &__ZN6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE_69
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE
//****************************************

.func __ZN6MAUtil19BluetoothConnection12btNewServiceERKNS_9BtServiceE_69, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.cpp'
.line 44
	push rt,d1
	sub sp,#0x5c
	ld fr,sp
	add fr,#0x6c
	ld d1,i0
LBB18_69:
.line 45
	ld r14,[i0,64]
	ld r0,#0x0
	jc le,r14,r0,&L37_69
L32_69:
.line 57
	add sp,#0x5c
	pop rt,d1
	ret
L37_69:
.line 47
	ld r14,[i1]
	jc le,r14,r0,&L38_69
.line 48
	ld [i0,64],r14
.line 51
	ld r0,i0
	add r0,#0x38
.line 52
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
	ld i1,&LC4_69
	call &_sprintf_37
.line 54
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil10Connection7connectEPKc_78
	ld i2,r14
.line 55
	ld r14,#0x0
	jc ge,i2,r14,&L32_69
.line 56
	ld i0,[d1,12]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d1
	call d0
	jp &L32_69
L38_69:
.line 47
	ld i0,&LC3_69
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x2f
	call &_bfeHandler_28

//****************************************
// Function: __ZThn40_N6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi
//****************************************

.func __ZThn40_N6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi_69, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.h'
.line 37
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 37
	add i0,#0xffffffd8
	call &__ZN6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi_69
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi
//****************************************

.func __ZN6MAUtil19BluetoothConnection26btServiceDiscoveryFinishedEi_69, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothConnection.cpp'
.line 59
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
	ld i2,i1
LBB22_69:
.line 60
	ld r14,[i0,64]
	ld r1,#0x0
	jc le,r14,r1,&L43_69
LBE22_69:
.line 65
	pop rt,d0
	ret
L43_69:
.line 61
	jc lt,i1,r1,&L42_69
.line 62
	ld i2,#0xffffffef
L42_69:
.line 63
	ld i0,[r0,12]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,r0
	call d0
LBE23_69:
.line 65
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD1Ev
//****************************************

.func __ZN6MAUtil10RefCountedD1Ev_70, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB2_70:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_70+8
	ld [i0],r14
LBE2_70:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD0Ev
//****************************************

.func __ZN6MAUtil10RefCountedD0Ev_70, 1, void
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB3_70:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_70+8
	ld [i0],r14
LBE3_70:
	call &__ZdlPv_55
	pop rt,fr
	ret

//****************************************
// Function: __Z7tstrlenIcEiPKT_
//****************************************

.func __Z7tstrlenIcEiPKT__70, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 429
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_70:
.line 429
	call &_strlen_34
LBE4_70:
	pop rt,fr
	ret

//****************************************
// Function: __Z7tstrcmpIcEiPKT_S2_
//****************************************

.func __Z7tstrcmpIcEiPKT_S2__70, 2, int
.line 430
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_70:
.line 430
	syscall 6
LBE5_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEC1ERKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcEC1ERKS1__70, 2, void
.line 111
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB7_70:
.line 112
	ld i1,[i1]
	ld [i0],i1
.line 113
	ld i0,i1
	call &__ZN6MAUtil10RefCounted6addRefEv_77
LBE7_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE5c_strEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE5c_strEv_70, 1, int
.line 116
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB8_70:
.line 117
	ld r14,[i0]
LBE8_70:
	ld r14,[r14,16]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEaSERKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcEaSERKS1__70, 2, int
.line 120
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
LBB9_70:
.line 121
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 122
	ld d1,[d1]
	ld [d0],d1
.line 123
	ld i0,d1
	call &__ZN6MAUtil10RefCounted6addRefEv_77
LBE9_70:
.line 124
	ld r14,d0
	pop rt,d1
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEixEi
//****************************************

.func __ZNK6MAUtil11BasicStringIcEixEi_70, 2, int
.line 359
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB10_70:
.line 360
	ld r14,[i0]
LBE10_70:
	ld r14,[r14,16]
	add r14,i1
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEltERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEltERKS1__70, 2, int
.line 142
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i1
LBB11_70:
.line 143
	ld d2,#0x0
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d0,r14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d0
	ld i1,r14
	call &__Z7tstrcmpIcEiPKT_S2__70
	jc lt,r14,d2,&L19_70
LBE11_70:
	ld r14,d2
	pop rt,d2
	ret
L19_70:
	ld d2,#0x1
LBE12_70:
	ld r14,d2
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcED1Ev
//****************************************

.func __ZN6MAUtil11BasicStringIcED1Ev_70, 1, void
.line 375
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB17_70:
.line 376
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
LBE17_70:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE6lengthEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE6lengthEv_70, 1, int
.line 367
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB18_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r14,[i0]
	add r14,#0x8
LBE19_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 368
	ld r14,[r14]
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEeqERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEeqERKS1__70, 2, int
.line 127
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld d2,i1
LBB20_70:
.line 128
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d0,r14
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
.line 129
	ld r0,#0x0
.line 128
	jc eq,d0,r14,&L36_70
L32_70:
.line 134
	ld r14,r0
	pop rt,d2
	ret
L36_70:
.line 131
	ld i0,[d1]
	ld i1,[d2]
.line 132
	ld r0,#0x1
.line 131
	jc eq,i0,i1,&L32_70
.line 134
	ld d0,#0x0
	ld i0,[i0,16]
	ld i1,[i1,16]
	call &__Z7tstrcmpIcEiPKT_S2__70
	jc ne,r14,d0,&L35_70
	ld d0,#0x1
L35_70:
	ld r0,d0
LBE21_70:
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEneERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEneERKS1__70, 2, int
.line 137
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB22_70:
.line 138
	call &__ZNK6MAUtil11BasicStringIcEeqERKS1__70
	xor r14,#0x1
LBE22_70:
	and r14,#0xff
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE4findERKS1_j
//****************************************

.func __ZNK6MAUtil11BasicStringIcE4findERKS1_j_70, 3, int
.line 239
	push rt,d6
	ld fr,sp
	add fr,#0x24
	ld d0,i0
	ld d2,i1
	ld d1,i2
LBB23_70:
.line 240
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d3,r14
	add r14,d1
LBB26_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d6,[d0]
LBB27_70:
	ld d4,[d6,8]
LBE27_70:
	jc gtu,r14,d4,&L39_70
LBB28_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 241
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
.line 242
	ld r14,d1
.line 241
	ld r0,#0x0
	jc eq,d3,r0,&L38_70
.line 243
	ld d0,[d6,16]
	add d1,d0
.line 244
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d5,r14
Ltext7_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	add d0,d4
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	sub d0,d3
	add d0,#0x1
Ltext8_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 246
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r3,d3
	add r3,d5
L43_70:
.line 255
	jc eq,d1,d0,&L39_70
	ld.b r1,[d5]
L51_70:
.line 249
	ld.b r4,[d1]
	xb r0,r4
	xb r14,r1
	add d1,#0x1
	jc eq,r0,r14,&L56_70
LBE31_70:
.line 255
	jc ne,d1,d0,&L51_70
L39_70:
.line 259
	ld r14,#0xffffffff
L38_70:
	pop rt,d6
	ret
L56_70:
.line 251
	ld r2,d1
.line 252
	ld r1,d5
	add r1,#0x1
L55_70:
.line 254
	jc eq,r1,r3,&L54_70
	ld.b r14,[r2]
	xb r0,r14
	ld.b r4,[r1]
	xb r14,r4
	add r1,#0x1
	add r2,#0x1
	jc ne,r0,r14,&L43_70
	jp &L55_70
L54_70:
.line 255
	ld r14,d1
	ld d6,[d6,16]
	sub r14,d6
	add r14,#0xffffffff
LBE39_70:
.line 259
	pop rt,d6
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE4sizeEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE4sizeEv_70, 1, int
.line 363
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB58_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r14,[i0]
	add r14,#0x8
LBE59_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 364
	ld r14,[r14]
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE8capacityEv
//****************************************

.func __ZNK6MAUtil11BasicStringIcE8capacityEv_70, 1, int
.line 371
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB60_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 320
	ld r14,[i0]
	add r14,#0x8
LBE61_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 372
	ld r14,[r14,4]
	add r14,#0xffffffff
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE7pointerEv
//****************************************

.func __ZN6MAUtil11BasicStringIcE7pointerEv_70, 1, int
.line 418
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB62_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 382
	ld r14,[i0]
	add r14,#0x8
LBE63_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 419
	ld r14,[r14,8]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcED0Ev
//****************************************

.func __ZN6MAUtil10StringDataIcED0Ev_70, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB488_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_70+8
	ld [i0],r14
LBE490_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L649_70
LBE492_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret
L649_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE495_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcED1Ev
//****************************************

.func __ZN6MAUtil10StringDataIcED1Ev_70, 1, void
.line 94
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB496_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_70+8
	ld [i0],r14
LBE498_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,16]
	ld r14,#0x0
	jc ne,i0,r14,&L663_70
LBE500_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	pop rt,fr
	ret
L663_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE503_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.h'
.line 94
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcEC1ERKS1_
//****************************************

.func __ZN6MAUtil10StringDataIcEC1ERKS1__70, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 59
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d3,i1
LBB512_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x8
	ld d1,[i1,8]
	add d1,#0x1
LBB514_70:
.line 109
	ld i0,d1
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld [d0,4],d1
.line 113
	ld r14,#0x0
	ld [d0],r14
LBE514_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 60
	ld i0,d2
	ld i1,#0x1
	call &__ZN6MAUtil10RefCountedC2Ei_77
	ld r14,&__ZTVN6MAUtil10StringDataIcEE_70+8
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
LBE512_70:
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEixEi
//****************************************

.func __ZN6MAUtil11BasicStringIcEixEi_70, 2, int
.line 162
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i1
LBB515_70:
.line 165
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_77
	ld r0,#0x1
	jc gt,r14,r0,&L685_70
	ld i0,[d0]
LBE517_70:
.line 172
	ld r14,[i0,16]
	add r14,d2
	pop rt,d2
	ret
L685_70:
.line 166
	ld i0,#0x14
	call &__Znwm_56
	ld d1,r14
	ld i0,r14
	ld i1,[d0]
	call &__ZN6MAUtil10StringDataIcEC1ERKS1__70
.line 167
	ld r14,#0x0
	jc eq,d1,r14,&L686_70
.line 168
	ld i0,[d0]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 169
	ld i0,d1
	ld [d0],d1
LBE521_70:
.line 172
	ld r14,[i0,16]
	add r14,d2
	pop rt,d2
	ret
L686_70:
.line 167
	ld i0,&LC0_70
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0xa7
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10StringDataIcEC1Ei
//****************************************

.func __ZN6MAUtil10StringDataIcEC1Ei_70, 2, void
.line 50
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d2,i1
LBB529_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d1,i0
	add d1,#0x8
	ld d0,i1
	add d0,#0x1
LBB531_70:
.line 109
	ld i0,d0
	call &__Znam_57
	ld [d1,8],r14
.line 111
	ld [d1,4],d0
.line 113
	ld r0,#0x0
	ld [d1],r0
LBE531_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 51
	ld i0,d3
	ld i1,#0x1
	call &__ZN6MAUtil10RefCountedC2Ei_77
	ld r1,&__ZTVN6MAUtil10StringDataIcEE_70+8
	ld [d3],r1
LBB532_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 288
	ld r14,[d1,4]
	jc lt,r14,d2,&L710_70
	ld r14,[d1]
L692_70:
.line 274
	ld r0,d2
	jc le,r14,d2,&L707_70
L702_70:
.line 275
	ld r14,[d1,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L702_70
L707_70:
.line 278
	ld [d1],d2
LBE534_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 53
	ld d3,[d3,16]
	add d2,d3
	ld r14,#0x0
	ld.b [d2],r14
LBE529_70:
	pop rt,d3
	ret
L710_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	call &__Znam_57
	ld d0,r14
LBB546_70:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L705_70
L711_70:
.line 294
	ld r0,r1
	add r0,d0
	ld r14,[d1,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L711_70
L705_70:
.line 297
	ld [d1,4],d2
.line 298
	ld i0,[d1,8]
	ld r0,#0x0
	jc ne,i0,r0,&L712_70
.line 300
	ld [d1,8],d0
	jp &L692_70
L712_70:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L692_70

//****************************************
// Function: __ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv
//****************************************

.func __ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_70, 0, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 69
	push rt,d2
	ld fr,sp
	add fr,#0x14
LBB547_70:
.line 71
	ld d1,[zr,_ZZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEvE2ed_70]
	ld d2,d1
	ld r14,#0x0
	jc ne,d1,r14,&L714_70
.line 72
	ld i0,#0x14
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10StringDataIcEC1Ei_70
	ld d1,d0
	ld [zr,_ZZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEvE2ed_70],d0
.line 73
	jc eq,d0,d2,&L717_70
L714_70:
.line 75
	ld i0,d1
	call &__ZN6MAUtil10RefCounted6addRefEv_77
LBE548_70:
.line 76
	ld r14,[zr,_ZZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEvE2ed_70]
	pop rt,d2
	ret
L717_70:
.line 73
	ld i0,&LC0_70
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x49
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE5clearEv
//****************************************

.func __ZN6MAUtil11BasicStringIcE5clearEv_70, 1, void
.line 400
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB551_70:
.line 401
	ld i0,[i0]
	ld r14,#0x0
	jc ne,i0,r14,&L720_70
.line 404
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_70
	ld [d0],r14
LBE551_70:
	pop rt,d0
	ret
L720_70:
.line 402
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 404
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_70
	ld [d0],r14
LBE552_70:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEC1Ev
//****************************************

.func __ZN6MAUtil11BasicStringIcEC1Ev_70, 1, void
.line 79
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB553_70:
.line 80
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_70
	ld [d0],r14
LBE553_70:
	pop rt,d0
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcE6substrEii
//****************************************

.func __ZNK6MAUtil11BasicStringIcE6substrEii_70, 4, int
.line 336
	push rt,d5
	ld fr,sp
	add fr,#0x20
	ld d5,i0
	ld d4,i1
	ld d2,i2
	ld d3,i3
LBB555_70:
.line 337
	ld r0,#0x0
	jc lt,i2,r0,&L726_70
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d1,r14
	jc ge,r14,d2,&L724_70
L726_70:
	ld i0,&LC1_70
.line 340
	ld i1,&_ZZNK6MAUtil11BasicStringIcE6substrEiiE12__FUNCTION___70
	call &_panicFunction_28
L724_70:
.line 338
	ld r14,#0xffffffff
	jc eq,d3,r14,&L735_70
L727_70:
.line 340
	ld r0,#0x0
	jc lt,d3,r0,&L730_70
	ld d0,d2
	add d0,d3
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	jc le,d0,d1,&L728_70
L730_70:
	ld i0,&LC2_70
	ld i1,&_ZZNK6MAUtil11BasicStringIcE6substrEiiE12__FUNCTION___70
	call &_panicFunction_28
L735_70:
.line 339
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d3,d1
	sub d3,d2
	jp &L727_70
L728_70:
.line 342
	ld i0,d5
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
.line 348
	ld r14,#0x0
	jc le,d3,r14,&L723_70
.line 349
	ld i0,[d5]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 350
	ld i0,#0x14
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d3
	call &__ZN6MAUtil10StringDataIcEC1Ei_70
	ld [d5],d0
LBB557_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 382
	ld r14,[d4]
	add r14,#0x8
LBE557_70:
	ld i0,[d0,16]
	ld i1,[r14,8]
	add i1,d2
	ld i2,d3
	syscall 5
Ltext145_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 352
	ld i0,d5
	ld i1,d3
	call &__ZN6MAUtil11BasicStringIcEixEi_70
	ld r0,#0x0
	ld.b [r14],r0
L723_70:
.line 355
	ld r14,d5
	pop rt,d5
	ret

//****************************************
// Function: __ZN6MAUtil10StringDataIcEC1EPKci
//****************************************

.func __ZN6MAUtil10StringDataIcEC1EPKci_70, 3, void
.line 32
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
	ld d2,i2
LBB576_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d1,i0
	add d1,#0x8
	ld d0,i2
	add d0,#0x1
LBB578_70:
.line 109
	ld i0,d0
	call &__Znam_57
	ld [d1,8],r14
.line 111
	ld [d1,4],d0
.line 113
	ld r0,#0x0
	ld [d1],r0
LBE578_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 33
	ld i0,d3
	ld i1,#0x1
	call &__ZN6MAUtil10RefCountedC2Ei_77
	ld r1,&__ZTVN6MAUtil10StringDataIcEE_70+8
	ld [d3],r1
LBB579_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 288
	ld r14,[d1,4]
	jc lt,r14,d2,&L781_70
	ld r14,[d1]
L763_70:
.line 274
	ld r0,d2
	jc le,r14,d2,&L778_70
L773_70:
.line 275
	ld r14,[d1,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L773_70
L778_70:
.line 278
	ld [d1],d2
LBE581_70:
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
LBE576_70:
	pop rt,d4
	ret
L781_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d2
	call &__Znam_57
	ld d0,r14
LBB593_70:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L776_70
L782_70:
.line 294
	ld r0,r1
	add r0,d0
	ld r14,[d1,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L782_70
L776_70:
.line 297
	ld [d1,4],d2
.line 298
	ld i0,[d1,8]
	ld r0,#0x0
	jc ne,i0,r0,&L783_70
.line 300
	ld [d1,8],d0
	jp &L763_70
L783_70:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L763_70

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE15allocStringDataEPKci
//****************************************

.func __ZN6MAUtil11BasicStringIcE15allocStringDataEPKci_70, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 88
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d1,i1
	ld d2,i2
LBB594_70:
.line 89
	ld r0,#0x0
	jc lt,i2,r0,&L791_70
.line 93
	ld r14,#0x0
	jc eq,i1,r14,&L787_70
	ld.b r0,[i1]
	xb r14,r0
	ld r0,#0x0
	jc eq,r14,r0,&L787_70
	jc ne,i2,r0,&L786_70
L787_70:
.line 94
	call &__ZN6MAUtil12getEmptyDataIcEEPNS_10StringDataIT_EEv_70
	ld [d3],r14
L784_70:
.line 97
	pop rt,d3
	ret
L786_70:
.line 96
	ld i0,#0x14
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d1
	ld i2,d2
	call &__ZN6MAUtil10StringDataIcEC1EPKci_70
	ld [d3],d0
.line 97
	ld r14,#0x0
	jc ne,d0,r14,&L784_70
	ld i0,&LC0_70
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x61
	call &_bfeHandler_28
L791_70:
.line 90
	ld i0,r0
	ld i1,&LC3_70
	syscall 3

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEC1EPKc
//****************************************

.func __ZN6MAUtil11BasicStringIcEC1EPKc_70, 2, void
.line 106
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB600_70:
.line 107
	ld r14,#0x0
	jc eq,i1,r14,&L800_70
.line 108
	ld i0,i1
	call &__Z7tstrlenIcEiPKT__70
	ld i0,d1
	ld i1,d0
	ld i2,r14
	call &__ZN6MAUtil11BasicStringIcE15allocStringDataEPKci_70
LBE600_70:
	pop rt,d1
	ret
L800_70:
.line 107
	ld i0,i1
	ld i1,&LC5_70
	syscall 3

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6appendEPKci
//****************************************

.func __ZN6MAUtil11BasicStringIcE6appendEPKci_70, 3, void
.line 200
	push rt,d7
	ld fr,sp
	add fr,#0x28
	ld d1,i0
	ld d7,i1
	ld d6,i2
LBB638_70:
.line 202
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d4,r14
.line 204
	ld d2,r14
	add d2,d6
LBB640_70:
.line 205
	ld i0,[d1]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_77
	ld r0,#0x1
	jc gt,r14,r0,&L908_70
LBB641_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 286
	ld r0,[d1]
	ld d0,r0
	add d0,#0x8
	ld d3,d2
	add d3,#0x1
LBB642_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d3,&L909_70
L876_70:
.line 382
	ld i0,[r0,16]
	add i0,d4
	ld i1,d7
	ld i2,d6
	syscall 5
Ltext173_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 214
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_70
	add r14,d2
	ld r0,#0x0
	ld.b [r14],r0
LBB644_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d0,[d1]
	add d0,#0x8
LBB645_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d2,&L910_70
L905_70:
	ld r14,[d0]
L887_70:
.line 274
	ld r0,d2
	jc le,r14,d2,&L904_70
L897_70:
.line 275
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 274
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L897_70
L904_70:
.line 278
	ld [d0],d2
LBE646_70:
	pop rt,d7
	ret
L909_70:
.line 291
	ld i0,d3
	call &__Znam_57
	ld d5,r14
LBB657_70:
.line 293
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L900_70
L911_70:
.line 294
	ld r14,r1
	add r14,d5
	ld r0,[d0,8]
	add r0,r1
	ld.b r0,[r0]
	ld.b [r14],r0
.line 293
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L911_70
L900_70:
.line 297
	ld [d0,4],d3
.line 298
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L912_70
.line 300
	ld [d0,8],d5
	ld r0,[d1]
L915_70:
.line 382
	ld i0,[r0,16]
	add i0,d4
	ld i1,d7
	ld i2,d6
	syscall 5
Ltext175_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 214
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_70
	add r14,d2
	ld r0,#0x0
	ld.b [r14],r0
LBB658_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d0,[d1]
	add d0,#0x8
LBB659_70:
.line 288
	ld r14,[d0,4]
	jc ge,r14,d2,&L905_70
L910_70:
.line 291
	ld i0,d2
	call &__Znam_57
	ld d1,r14
LBB664_70:
.line 293
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L902_70
L913_70:
.line 294
	ld r0,r1
	add r0,d1
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 293
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L913_70
L902_70:
.line 297
	ld [d0,4],d2
.line 298
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L914_70
.line 300
	ld [d0,8],d1
	jp &L887_70
L908_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 206
	ld i0,#0x14
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d2
	call &__ZN6MAUtil10StringDataIcEC1Ei_70
LBB667_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 382
	ld r14,[d1]
	add r14,#0x8
LBE667_70:
	ld i0,[d0,16]
	ld i1,[r14,8]
	ld i2,d4
	syscall 5
Ltext179_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 208
	ld i0,[d1]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 209
	ld r0,d0
	ld [d1],d0
	jp &L876_70
L914_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r14,[d0]
.line 300
	ld [d0,8],d1
	jp &L887_70
L912_70:
.line 298
	call &__ZdaPv_54
.line 300
	ld [d0,8],d5
	ld r0,[d1]
	jp &L915_70

//****************************************
// Function: __ZN6MAUtil11BasicStringIcEpLERKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcEpLERKS1__70, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 219
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d1,i1
LBB681_70:
.line 220
	ld i0,i1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d2,r14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld i0,d0
	ld i1,d2
	ld i2,r14
	call &__ZN6MAUtil11BasicStringIcE6appendEPKci_70
LBE681_70:
.line 221
	ld r14,d0
	pop rt,d2
	ret

//****************************************
// Function: __ZNK6MAUtil11BasicStringIcEplERKS1_
//****************************************

.func __ZNK6MAUtil11BasicStringIcEplERKS1__70, 3, int
.line 177
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i2
LBB682_70:
.line 193
	call &__ZN6MAUtil11BasicStringIcEC1ERKS1__70
.line 194
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEpLERKS1__70
LBE683_70:
.line 195
	ld r14,d1
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE7reserveEi
//****************************************

.func __ZN6MAUtil11BasicStringIcE7reserveEi_70, 2, void
.line 385
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d2,i0
	ld d1,i1
LBB684_70:
.line 386
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_77
	ld r0,#0x1
	jc le,r14,r0,&L921_70
LBB687_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 320
	ld r14,[d2]
	add r14,#0x8
LBB689_70:
	ld r14,[r14,4]
LBE689_70:
	jc gt,r14,d1,&L962_70
Ltext183_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 389
	ld i0,#0x14
	call &__Znwm_56
	ld d4,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10StringDataIcEC1Ei_70
LBB690_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d0,d4
	add d0,#0x8
LBB691_70:
.line 258
	ld r14,[d2]
	add r14,#0x8
LBB692_70:
	ld d1,[r14]
LBE692_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L963_70
L959_70:
	ld r14,[d0]
L927_70:
.line 274
	ld r0,d1
	jc le,r14,d1,&L956_70
L937_70:
.line 275
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 274
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L937_70
L956_70:
.line 278
	ld [d0],d1
LBE694_70:
.line 258
	ld r14,[d2]
	add r14,#0x8
LBE699_70:
.line 382
	ld i0,[d0,8]
	ld i1,[r14,8]
	ld i2,[r14]
	add i2,#0x1
	syscall 5
Ltext185_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 392
	ld i0,[d2]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 393
	ld [d2],d4
LBE687_70:
.line 396
	pop rt,d4
	ret
L921_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 286
	ld r0,[d2]
	ld d0,r0
	add d0,#0x8
	add d1,#0x1
LBB704_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L964_70
LBE705_70:
.line 355
	ld r14,[r0,16]
	ld r1,[r0,8]
	add r14,r1
LBE707_70:
.line 259
	ld r0,#0x0
	ld.b [r14],r0
L969_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 396
	pop rt,d4
	ret
L962_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 320
	ld d1,r14
Ltext189_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 389
	ld i0,#0x14
	call &__Znwm_56
	ld d4,r14
	ld i0,r14
	ld i1,d1
	call &__ZN6MAUtil10StringDataIcEC1Ei_70
LBB712_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d0,d4
	add d0,#0x8
LBB713_70:
.line 258
	ld r14,[d2]
	add r14,#0x8
LBB714_70:
	ld d1,[r14]
LBE714_70:
.line 288
	ld r14,[d0,4]
	jc ge,r14,d1,&L959_70
L963_70:
.line 291
	ld i0,d1
	call &__Znam_57
	ld d3,r14
LBB720_70:
.line 293
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L954_70
L965_70:
.line 294
	ld r0,r1
	add r0,d3
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 293
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L965_70
L954_70:
.line 297
	ld [d0,4],d1
.line 298
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L966_70
.line 300
	ld [d0,8],d3
	jp &L927_70
L964_70:
.line 291
	ld i0,d1
	call &__Znam_57
	ld d3,r14
LBB724_70:
.line 293
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L958_70
L967_70:
.line 294
	ld r14,r1
	add r14,d3
	ld r0,[d0,8]
	add r0,r1
	ld.b r0,[r0]
	ld.b [r14],r0
.line 293
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L967_70
L958_70:
.line 297
	ld [d0,4],d1
.line 298
	ld i0,[d0,8]
	ld r14,#0x0
	jc ne,i0,r14,&L968_70
.line 300
	ld [d0,8],d3
	ld r0,[d2]
L970_70:
.line 355
	ld r14,[r0,16]
	ld r1,[r0,8]
	add r14,r1
LBE726_70:
.line 259
	ld r0,#0x0
	ld.b [r14],r0
	jp &L969_70
L966_70:
.line 298
	call &__ZdaPv_54
	ld r14,[d0]
.line 300
	ld [d0,8],d3
	jp &L927_70
L968_70:
.line 298
	call &__ZdaPv_54
.line 300
	ld [d0,8],d3
	ld r0,[d2]
	jp &L970_70

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6resizeEi
//****************************************

.func __ZN6MAUtil11BasicStringIcE6resizeEi_70, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 379
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d1,i1
LBB737_70:
.line 380
	call &__ZN6MAUtil11BasicStringIcE7reserveEi_70
LBB738_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 265
	ld d0,[d3]
	add d0,#0x8
LBB739_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L992_70
	ld r14,[d0]
L973_70:
.line 274
	ld r0,d1
	jc le,r14,d1,&L989_70
L983_70:
.line 275
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 274
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L983_70
L989_70:
.line 278
	ld [d0],d1
LBE740_70:
.line 355
	ld r14,[d3]
	add r14,#0x8
LBB746_70:
	ld r14,[r14,8]
	add d1,r14
LBE746_70:
	ld r14,#0x0
	ld.b [d1],r14
LBE737_70:
	pop rt,d3
	ret
L992_70:
.line 291
	ld i0,d1
	call &__Znam_57
	ld d2,r14
LBB754_70:
.line 293
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L987_70
L993_70:
.line 294
	ld r0,r1
	add r0,d2
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 293
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L993_70
L987_70:
.line 297
	ld [d0,4],d1
.line 298
	ld i0,[d0,8]
	ld r0,#0x0
	jc ne,i0,r0,&L994_70
.line 300
	ld [d0,8],d2
	jp &L973_70
L994_70:
.line 298
	call &__ZdaPv_54
	ld r14,[d0]
.line 300
	ld [d0,8],d2
	jp &L973_70

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6insertEiRKS1_
//****************************************

.func __ZN6MAUtil11BasicStringIcE6insertEiRKS1__70, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 286
	push rt,d5
	ld fr,sp
	add fr,#0x20
	ld d4,i0
	ld d2,i1
	ld d5,i2
LBB765_70:
.line 287
	ld i0,i2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d3,r14
.line 288
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d0,r14
	add d0,d3
.line 289
	ld i0,d4
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcE6resizeEi_70
.line 290
	ld r2,d2
	add r2,d3
LBB767_70:
.line 291
	add d0,#0xffffffff
	jc lt,d0,r2,&L1025_70
L1030_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d4]
	add r14,#0x8
LBB769_70:
	ld r14,[r14,8]
	ld r1,r14
	add r1,d0
LBE769_70:
	ld r0,d0
	sub r0,d3
LBB771_70:
	add r14,r0
LBE771_70:
	ld.b r14,[r14]
	ld.b [r1],r14
Ltext199_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 291
	add d0,#0xffffffff
	jc ge,d0,r2,&L1030_70
L1025_70:
.line 294
	ld d1,#0x0
	jc le,d3,d1,&L1027_70
L1031_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d4]
	add r14,#0x8
	ld d0,d2
	add d2,#0x1
LBB774_70:
	ld r14,[r14,8]
	add d0,r14
LBE774_70:
	ld i0,d5
	ld i1,d1
	call &__ZNK6MAUtil11BasicStringIcEixEi_70
	ld.b r14,[r14]
	ld.b [d0],r14
Ltext201_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 294
	add d1,#0x1
	jc gt,d3,d1,&L1031_70
L1027_70:
	pop rt,d5
	ret

//****************************************
// Function: __ZN6MAUtil11BasicStringIcE6removeEii
//****************************************

.func __ZN6MAUtil11BasicStringIcE6removeEii_70, 3, void
.line 313
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d1,i1
	ld d4,i2
LBB777_70:
.line 314
	ld i0,[i0]
	call &__ZN6MAUtil10RefCounted11getRefCountEv_77
	ld r0,#0x1
	jc le,r14,r0,&L1035_70
LBB780_70:
.line 315
	ld r1,#0x0
	jc lt,d1,r1,&L1038_70
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld d2,r14
	jc gt,r14,d1,&L1036_70
L1038_70:
	ld i0,&LC6_70
.line 316
	ld i1,&_ZZN6MAUtil11BasicStringIcE6removeEiiE12__FUNCTION___70
	call &_panicFunction_28
L1035_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 217
	ld d0,[d3]
	add d0,#0x8
LBB782_70:
.line 222
	ld i1,d1
.line 223
	ld r1,d1
	add r1,d4
.line 227
	ld r2,[d0]
	jc le,r2,r1,&L1078_70
L1089_70:
.line 225
	ld r14,[d0,8]
	ld r0,i1
	add r0,r14
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 226
	add i1,#0x1
.line 227
	add r1,#0x1
	ld r2,[d0]
	jc gt,r2,r1,&L1089_70
L1078_70:
.line 265
	ld d1,r2
	sub d1,d4
LBB785_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L1090_70
L1053_70:
.line 274
	ld r0,d1
	jc le,r2,d1,&L1082_70
L1063_70:
.line 275
	ld r14,[d0,8]
	add r14,r0
	ld r1,#0x0
	ld.b [r14],r1
.line 274
	add r0,#0x1
	ld r14,[d0]
	jc gt,r14,r0,&L1063_70
L1082_70:
.line 278
	ld [d0],d1
LBE786_70:
.line 286
	ld i0,[d3]
	ld d0,i0
	add d0,#0x8
.line 258
	ld d1,[d0]
	add d1,#0x1
LBB792_70:
.line 288
	ld r14,[d0,4]
	jc lt,r14,d1,&L1091_70
L1048_70:
.line 355
	ld r14,[i0,16]
	ld r0,[i0,8]
	add r14,r0
LBE795_70:
.line 259
	ld r1,#0x0
	ld.b [r14],r1
LBE778_70:
	pop rt,d4
	ret
L1036_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 316
	ld r14,#0x0
	jc le,d4,r14,&L1041_70
	ld d0,d1
	add d0,d4
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	jc le,d0,d2,&L1039_70
L1041_70:
	ld i0,&LC7_70
	ld i1,&_ZZN6MAUtil11BasicStringIcE6removeEiiE12__FUNCTION___70
	call &_panicFunction_28
L1090_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d1
	call &__Znam_57
	ld d2,r14
LBB809_70:
.line 293
	ld r1,#0x0
	ld r2,[d0]
	jc le,r2,r1,&L1080_70
L1092_70:
.line 294
	ld r0,r1
	add r0,d2
	ld r14,[d0,8]
	add r14,r1
	ld.b r14,[r14]
	ld.b [r0],r14
.line 293
	add r1,#0x1
	ld r2,[d0]
	jc gt,r2,r1,&L1092_70
L1080_70:
.line 297
	ld [d0,4],d1
.line 298
	ld i0,[d0,8]
	ld r1,#0x0
	jc ne,i0,r1,&L1093_70
.line 300
	ld [d0,8],d2
	jp &L1053_70
L1091_70:
.line 291
	ld i0,d1
	call &__Znam_57
	ld d2,r14
LBB813_70:
.line 293
	ld r1,#0x0
	ld r14,[d0]
	jc le,r14,r1,&L1084_70
L1094_70:
.line 294
	ld r14,r1
	add r14,d2
	ld r0,[d0,8]
	add r0,r1
	ld.b r0,[r0]
	ld.b [r14],r0
.line 293
	add r1,#0x1
	ld r14,[d0]
	jc gt,r14,r1,&L1094_70
L1084_70:
.line 297
	ld [d0,4],d1
.line 298
	ld i0,[d0,8]
	ld r14,#0x0
	jc ne,i0,r14,&L1095_70
.line 300
	ld [d0,8],d2
	ld i0,[d3]
L1096_70:
.line 355
	ld r14,[i0,16]
	ld r0,[i0,8]
	add r14,r0
LBE815_70:
.line 259
	ld r1,#0x0
	ld.b [r14],r1
LBE797_70:
	pop rt,d4
	ret
L1095_70:
.line 298
	call &__ZdaPv_54
.line 300
	ld [d0,8],d2
	ld i0,[d3]
	jp &L1096_70
L1093_70:
.line 298
	call &__ZdaPv_54
	ld r2,[d0]
.line 300
	ld [d0,8],d2
	jp &L1053_70
L1039_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 317
	ld i0,d3
	call &__ZNK6MAUtil11BasicStringIcE4sizeEv_70
	ld d2,r14
	sub d2,d4
.line 318
	ld i0,#0x14
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	ld i1,d2
	call &__ZN6MAUtil10StringDataIcEC1Ei_70
.line 319
	ld r0,#0x0
	jc le,d1,r0,&L1042_70
LBB832_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 382
	ld r14,[d3]
	add r14,#0x8
LBE832_70:
	ld i0,[d0,16]
	ld i1,[r14,8]
	ld i2,d1
	syscall 5
L1042_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\String.cpp'
.line 322
	jc lt,d1,d2,&L1097_70
L1045_70:
.line 326
	ld i0,[d3]
	call &__ZN6MAUtil10RefCounted7releaseEv_77
.line 327
	ld i0,d0
	ld [d3],d0
	jp &L1048_70
L1097_70:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 382
	ld r14,[d3]
	add r14,#0x8
LBE833_70:
	ld i1,[r14,8]
	add i1,d1
	ld i0,[d0,16]
	add i0,d1
	add i1,d4
	ld i2,d2
	sub i2,d1
	syscall 5
	jp &L1045_70

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscovererC1Ev
//****************************************

.func __ZN6MAUtil19BluetoothDiscovererC1Ev_71, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 23
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_71:
.line 23
	ld r14,&__ZTVN6MAUtil19BluetoothDiscovererE_71+8
	ld [i0],r14
	ld r14,#0x0
	ld [i0,4],r14
	ld [i0,8],r14
LBE3_71:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEb
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEb_71, 3, int
.line 27
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i2
LBB4_71:
.line 28
	ld r0,#0x0
	ld i0,&LC0_71
	jc eq,i1,r0,&L13_71
.line 29
	ld r14,[d0,4]
	ld r0,#0x0
	jc ne,r14,r0,&L10_71
	ld d1,[d0,8]
	jc eq,d1,r14,&L8_71
L10_71:
	ld i0,&LC1_71
L13_71:
	ld i1,&_ZZN6MAUtil19BluetoothDiscoverer20startDeviceDiscoveryEPNS_32BluetoothDeviceDiscoveryListenerEbE12__FUNCTION___71
	call &_panicFunction_28
L8_71:
.line 31
	ld [d0,4],i1
.line 32
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE_62
LBB6_71:
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1881
	ld i0,#0x15
	ld i1,d2
	and i1,#0xff
	ld i2,d1
	ld i3,d1
	syscall 96
	ld r0,r14
	ld r1,r15
LBE7_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 34
	jc le,d1,r14,&L12_71
.line 35
	ld [d0,4],d1
L12_71:
.line 37
	ld r14,r0
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerE
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerE_71, 4, int
.line 41
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d2,i1
	ld d3,i2
LBB8_71:
.line 42
	ld r0,#0x0
	ld i0,&LC0_71
	jc eq,i3,r0,&L23_71
.line 43
	ld r14,[d0,4]
	ld r0,#0x0
	jc ne,r14,r0,&L20_71
	ld d1,[d0,8]
	jc eq,d1,r14,&L18_71
L20_71:
	ld i0,&LC1_71
L23_71:
	ld i1,&_ZZN6MAUtil19BluetoothDiscoverer21startServiceDiscoveryERK8MABtAddrRK6MAUUIDPNS_33BluetoothServiceDiscoveryListenerEE12__FUNCTION___71
	call &_panicFunction_28
L18_71:
.line 45
	ld [d0,8],i3
.line 46
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment20setBluetoothListenerEPNS_17BluetoothListenerE_62
LBB10_71:
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1923
	ld i0,#0x17
	ld i1,d2
	ld i2,d3
	ld i3,d1
	syscall 96
	ld r0,r14
	ld r1,r15
LBE11_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 48
	jc le,d1,r14,&L22_71
.line 49
	ld [d0,8],d1
L22_71:
.line 51
	ld r14,r0
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer6cancelEv
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer6cancelEv_71, 1, int
.line 53
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_71:
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1959
	ld i0,#0x1a
	ld i1,#0x0
	ld i2,i1
	ld i3,i1
	syscall 96
	ld r0,r14
	ld r1,r15
LBE14_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 55
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer8handleDDEi
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer8handleDDEi_71, 2, void
.line 123
	push rt,d5
	sub sp,#0x124
	ld fr,sp
	add fr,#0x144
	ld d3,i0
	ld d4,i1
LBB15_71:
.line 128
	ld r14,fr
	add r14,#0xfffffecc
	ld [fr,-52],r14
.line 129
	ld r14,#0x100
	ld [fr,-48],r14
	ld d5,fr
	add d5,#0xffffffcc
L27_71:
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1903
	ld i0,#0x16
	ld i1,d5
	ld i2,#0x0
	ld i3,i2
	syscall 96
	ld r0,r14
	ld r1,r15
LBE19_71:
	ld d2,r14
LBB20_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 133
	ld r14,#0x0
	jc eq,r0,r14,&L28_71
LBB21_71:
.line 134
	jc lt,r0,r14,&L40_71
LBB22_71:
.line 143
	ld d1,fr
	add d1,#0xfffffec0
LBB23_71:
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
LBE23_71:
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
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 146
	ld i0,[d3,4]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d1
	call d0
LBB24_71:
.line 143
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE25_71:
.line 148
	ld r14,#0x0
	jc gt,d2,r14,&L27_71
L28_71:
.line 150
	ld r14,#0x0
	jc eq,d4,r14,&L26_71
L39_71:
.line 151
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	call &__ZN6MAUtil11Environment23removeBluetoothListenerEv_62
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
L26_71:
.line 156
	add sp,#0x124
	pop rt,d5
	ret
L40_71:
.line 136
	jc lt,d4,r14,&L39_71
.line 137
	ld d4,r0
	jp &L28_71

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer8handleSDEi
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer8handleSDEi_71, 2, void
.line 67
	push rt,d7
	sub sp,#0x140
	ld fr,sp
	add fr,#0x168
	ld d5,i0
	ld d6,i1
LBB33_71:
.line 72
	ld d7,fr
	add d7,#0xfffffeb8
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
LBB37_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d1,fr
	add d1,#0xfffffebc
LBB38_71:
.line 109
	ld i0,#0x40
	call &__Znam_57
	ld [fr,-316],r14
.line 111
	ld r0,#0x4
	ld [fr,-320],r0
.line 113
	ld r0,#0x0
	ld [d1],r0
LBE38_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 75
	ld r0,fr
	add r0,#0xfffffec8
	ld [fr,-52],r0
.line 76
	ld r0,#0x100
	ld [fr,-48],r0
Ltext11_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 382
	ld [fr,-44],r14
	ld d4,fr
	add d4,#0xfffffe98
L45_71:
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1934
	ld i0,#0x18
	ld i1,d4
	ld i2,#0x0
	ld i3,i2
	syscall 96
	ld r0,r14
LBE41_71:
	ld d2,r14
Ltext13_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 82
	ld r14,#0x0
	jc eq,r0,r14,&L46_71
.line 83
	jc lt,r0,r14,&L129_71
LBB42_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 320
	ld r0,[d1,4]
LBE43_71:
	ld r14,[d4,4]
	jc le,r14,r0,&L108_71
L132_71:
.line 288
	ld r14,#0x0
	jc lt,r0,r14,&L130_71
	ld r14,[d1]
L56_71:
.line 274
	ld d0,#0x0
	jc le,r14,d0,&L112_71
	ld d2,fr
	add d2,#0xfffffea4
L66_71:
.line 275
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
.line 274
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L66_71
L112_71:
.line 278
	ld r14,#0x0
	ld [d1],r14
LBE46_71:
.line 320
	ld r0,[d1,4]
LBE53_71:
	ld d2,r0
	add d2,r0
LBB54_71:
.line 288
	jc lt,r0,d2,&L131_71
	ld r14,[d1,8]
LBE55_71:
.line 382
	ld [fr,-44],r14
L138_71:
.line 320
	ld r14,[d4,4]
	jc gt,r14,r0,&L132_71
L108_71:
.line 265
	ld d3,[d4,4]
LBB57_71:
.line 288
	jc lt,r0,d3,&L133_71
	ld r14,[d1]
L80_71:
.line 274
	ld d0,d3
	jc le,r14,d3,&L118_71
	ld d2,fr
	add d2,#0xfffffea4
L90_71:
.line 275
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
.line 274
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L90_71
L118_71:
.line 278
	ld [d1],d3
LBE58_71:
.sourcefile '\mb\MoSyncReleasePackage\include\maapi.h'
.line 1944
	ld i0,#0x19
	ld i1,fr
	add i1,#0xffffffc8
	ld i2,#0x0
	ld i3,i2
	syscall 96
	ld r0,r14
LBE64_71:
	ld d2,r14
Ltext16_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 96
	ld r14,#0x0
	jc eq,r0,r14,&L46_71
.line 97
	jc lt,r0,r14,&L129_71
.line 103
	ld r0,[fr,-56]
	ld [fr,-332],r0
.line 104
	ld r14,[fr,-360]
	ld r0,#0x0
	jc le,r14,r0,&L134_71
.line 107
	ld d0,fr
	add d0,#0xfffffea0
	ld i0,d0
	ld i1,[fr,-52]
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
L127_71:
	ld i0,d7
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 110
	ld i0,[d5,8]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,fr
	add i1,#0xfffffeb4
	call d0
LBE39_71:
.line 113
	ld r14,#0x0
	jc gt,d2,r14,&L45_71
L46_71:
.line 115
	ld r0,#0x0
	jc eq,d6,r0,&L98_71
L122_71:
.line 116
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	call &__ZN6MAUtil11Environment23removeBluetoothListenerEv_62
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
L98_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[fr,-316]
	ld r0,#0x0
	jc ne,i0,r0,&L135_71
LBE70_71:
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE68_71:
	add sp,#0x140
	pop rt,d7
	ret
L131_71:
.line 291
	ld i0,d2
	sll i0,#0x4
	call &__Znam_57
	ld d3,r14
LBB77_71:
.line 293
	ld d0,#0x0
	ld r14,[d1]
	jc le,r14,d0,&L114_71
L136_71:
.line 294
	ld i1,d0
	sll i1,#0x4
	ld i0,i1
	add i0,d3
	ld r0,[d1,8]
	add i1,r0
	ld i2,#0x10
	syscall 5
.line 293
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L136_71
L114_71:
.line 297
	ld [d1,4],d2
.line 298
	ld i0,[d1,8]
	ld r14,#0x0
	jc ne,i0,r14,&L137_71
L76_71:
.line 300
	ld r14,d3
	ld [d1,8],d3
	ld r0,[d1,4]
LBE76_71:
.line 382
	ld [fr,-44],r14
	jp &L138_71
L130_71:
.line 291
	ld i0,r14
	call &__Znam_57
	ld d2,r14
LBB84_71:
.line 293
	ld d0,#0x0
	ld r14,[d1]
	jc le,r14,d0,&L110_71
L139_71:
.line 294
	ld i1,d0
	sll i1,#0x4
	ld i0,i1
	add i0,d2
	ld r0,[d1,8]
	add i1,r0
	ld i2,#0x10
	syscall 5
.line 293
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L139_71
L110_71:
.line 297
	ld r0,#0x0
	ld [d1,4],r0
.line 298
	ld i0,[d1,8]
	jc ne,i0,r0,&L140_71
.line 300
	ld [d1,8],d2
	jp &L56_71
L133_71:
.line 291
	ld i0,d3
	sll i0,#0x4
	call &__Znam_57
	ld d2,r14
LBB91_71:
.line 293
	ld d0,#0x0
	ld r14,[d1]
	jc le,r14,d0,&L116_71
L141_71:
.line 294
	ld i1,d0
	sll i1,#0x4
	ld i0,i1
	add i0,d2
	ld r0,[d1,8]
	add i1,r0
	ld i2,#0x10
	syscall 5
.line 293
	add d0,#0x1
	ld r14,[d1]
	jc gt,r14,d0,&L141_71
L116_71:
.line 297
	ld [d1,4],d3
.line 298
	ld i0,[d1,8]
	ld r0,#0x0
	jc ne,i0,r0,&L142_71
.line 300
	ld [d1,8],d2
	jp &L80_71
L134_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 105
	ld d0,fr
	add d0,#0xfffffea0
	ld i0,d0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	jp &L127_71
L135_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE95_71:
	ld i0,d7
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBE93_71:
	add sp,#0x140
	pop rt,d7
	ret
L129_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 99
	jc lt,d6,r14,&L122_71
.line 100
	ld d6,r0
	jp &L46_71
L140_71:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d2
	jp &L56_71
L137_71:
.line 298
	call &__ZdaPv_54
	jp &L76_71
L142_71:
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d2
	jp &L80_71

//****************************************
// Function: __ZN6MAUtil19BluetoothDiscoverer14bluetoothEventEi
//****************************************

.func __ZN6MAUtil19BluetoothDiscoverer14bluetoothEventEi_71, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\BluetoothDiscovery.cpp'
.line 57
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB114_71:
.line 58
	ld r0,[i0,4]
	ld r1,#0x0
	jc ne,r0,r1,&L147_71
.line 60
	ld r14,[i0,8]
	jc eq,r14,r0,&L143_71
.line 61
	call &__ZN6MAUtil19BluetoothDiscoverer8handleSDEi_71
L143_71:
.line 63
	pop rt,fr
	ret
L147_71:
.line 59
	call &__ZN6MAUtil19BluetoothDiscoverer8handleDDEi_71
LBE115_71:
.line 63
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_72, 2, void
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

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_72, 2, void
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

.func __ZN6MAUtil9CharInput6enableEv_72, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 45
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB2_72:
.line 46
	call &_CharInput_Reset_80
.line 47
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_62
LBE2_72:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput7disableEv
//****************************************

.func __ZN6MAUtil9CharInput7disableEv_72, 1, void
.line 50
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB3_72:
.line 51
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_62
.line 52
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	add i1,#0x4
	call &__ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE_62
LBE3_72:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput13keyPressEventEii
//****************************************

.func __ZN6MAUtil9CharInput13keyPressEventEii_72, 3, void
.line 69
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_72:
.line 70
	ld i0,i1
	call &_CharInput_Pressed_80
LBE4_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput15keyReleaseEventEii
//****************************************

.func __ZN6MAUtil9CharInput15keyReleaseEventEii_72, 3, void
.line 73
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_72:
.line 74
	ld i0,i1
	call &_CharInput_Released_80
LBE5_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput9charEventEj
//****************************************

.func __ZN6MAUtil9CharInput9charEventEj_72, 2, void
.line 77
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB6_72:
.line 78
	ld i0,i1
	call &_CharInput_Char_80
LBE6_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZThn4_N6MAUtil9CharInput13runTimerEventEv
//****************************************

.func __ZThn4_N6MAUtil9CharInput13runTimerEventEv_72, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.h'
.line 178
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 178
	add i0,#0xfffffffc
	call &__ZN6MAUtil9CharInput13runTimerEventEv_72
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput13runTimerEventEv
//****************************************

.func __ZN6MAUtil9CharInput13runTimerEventEv_72, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 81
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB7_72:
.line 82
	ld d0,[i0,12]
	call d0
LBE7_72:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput10startTimerEPFvvEi
//****************************************

.func __ZN6MAUtil9CharInput10startTimerEPFvvEi_72, 2, void
.line 85
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB8_72:
.line 86
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
	ld i1,r0
	add i1,#0x4
	ld r14,#0x0
	jc ne,r0,r14,&L12_72
	ld i1,r0
L12_72:
	ld i2,d0
	ld i3,#0x1
	call &__ZN6MAUtil11Environment8addTimerEPNS_13TimerListenerEii_62
.line 87
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
	ld [r14,12],d1
LBE8_72:
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput9stopTimerEv
//****************************************

.func __ZN6MAUtil9CharInput9stopTimerEv_72, 0, void
.line 90
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB9_72:
.line 91
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
	ld i1,r0
	add i1,#0x4
	ld r14,#0x0
	jc ne,r0,r14,&L16_72
	ld i1,r0
L16_72:
	call &__ZN6MAUtil11Environment11removeTimerEPNS_13TimerListenerE_62
LBE9_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput15forceDeploymentEv
//****************************************

.func __ZN6MAUtil9CharInput15forceDeploymentEv_72, 1, void
.line 110
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB10_72:
.line 111
	call &_CharInput_ForceDeployment_80
LBE10_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput7setModeENS0_8CharModeE
//****************************************

.func __ZN6MAUtil9CharInput7setModeENS0_8CharModeE_72, 2, void
.line 114
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB11_72:
.line 115
	ld i0,i1
	call &_CharInput_setMode_80
LBE11_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK6MAUtil9CharInput7getModeEv
//****************************************

.func __ZNK6MAUtil9CharInput7getModeEv_72, 1, int
.line 118
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_72:
.line 119
	call &_CharInput_getMode_80
LBE12_72:
.line 120
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput9setQwertyEb
//****************************************

.func __ZN6MAUtil9CharInput9setQwertyEb_72, 2, void
.line 122
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB13_72:
.line 123
	ld i0,i1
	and i0,#0xff
	call &_CharInput_setQwerty_80
LBE13_72:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput19isCharInputListenerEPNS_17CharInputListenerE
//****************************************

.func __ZN6MAUtil9CharInput19isCharInputListenerEPNS_17CharInputListenerE_72, 2, int
.line 55
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB15_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 108
	ld r1,i0
	add r1,#0x10
LBB17_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	add i0,#0x14
LBB21_72:
	ld r15,[i0,8]
LBE21_72:
.line 334
	ld r14,[i0]
	sll r14,#0x3
	add r14,r15
LBE23_72:
	jc eq,r14,r15,&L33_72
L36_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 110
	ld r14,[r15]
	jc eq,r14,i1,&L35_72
.line 109
	add r15,#0x8
LBB24_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,r1
	add r0,#0x4
LBB25_72:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE25_72:
	jc ne,r14,r15,&L36_72
L33_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 111
	ld r14,#0x0
LBE18_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 57
	pop fr,fr
	ret
L35_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 111
	ld r14,#0x1
LBE30_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 57
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil9CharInputC1Ev
//****************************************

.func __ZN6MAUtil9CharInputC1Ev_72, 1, void
.line 24
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB31_72:
.line 26
	ld r0,&__ZTVN6MAUtil9CharInputE_72+8
	ld [i0],r0
	ld r14,&__ZTVN6MAUtil9CharInputE_72+48
	ld [i0,4],r14
	ld r0,#0x0
	ld.b [i0,8],r0
LBB32_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 72
	ld r14,i0
	add r14,#0x10
LBB33_72:
.line 74
	ld.b [r14],r0
	ld.b [r14,1],r0
	ld.b [r14,2],r0
LBB34_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 104
	ld d0,i0
	add d0,#0x14
LBB35_72:
.line 109
	ld i0,#0x20
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r0,#0x0
	ld [d0],r0
LBE35_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 27
	ld d0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
	jc ne,d0,r0,&L43_72
.line 30
	ld i0,&__ZN6MAUtil9CharInput24characterChangedCallbackEcPv_72
	ld i1,d0
	call &_CharInput_RegisterCharacterChangedCallback_80
.line 31
	ld i0,&__ZN6MAUtil9CharInput25characterDeployedCallbackEcPv_72
	ld i1,d0
	call &_CharInput_RegisterCharacterDeployedCallback_80
.line 32
	ld i0,&__ZN6MAUtil9CharInput10startTimerEPFvvEi_72
	ld i1,&__ZN6MAUtil9CharInput9stopTimerEv_72
	call &_CharInput_RegisterTimerCallback_80
.line 34
	ld [zr,__ZN6MAUtil9CharInput18charInputSingletonE_72],d1
LBE31_72:
	pop rt,d1
	ret
L43_72:
.line 28
	ld i0,&LC0_72
	ld i1,&_ZZN6MAUtil9CharInputC1EvE12__FUNCTION___72
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil9CharInput12getCharInputEv
//****************************************

.func __ZN6MAUtil9CharInput12getCharInputEv_72, 0, int
.line 37
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB37_72:
.line 38
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
.line 41
	ld d0,r14
.line 38
	ld r0,#0x0
	jc eq,r14,r0,&L47_72
LBE37_72:
.line 43
	ld r14,d0
	pop rt,d0
	ret
L47_72:
.line 39
	ld i0,#0x20
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN6MAUtil9CharInputC1Ev_72
LBE38_72:
.line 43
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInput25characterDeployedCallbackEcPv
//****************************************

.func __ZN6MAUtil9CharInput25characterDeployedCallbackEcPv_72, 2, void
.line 102
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d2,i0
LBB45_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
LBB48_72:
.line 116
	ld r0,#0x1
	ld.b [r14,16],r0
LBE49_72:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld r1,r14
	add r1,#0x14
LBB54_72:
	ld [i1],r1
LBB55_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[r1]
LBE56_72:
	ld [fr,-48],r0
Ltext21_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r2,#0x0
	ld [fr,-44],r2
.line 63
	jc le,r0,r2,&L92_72
LBB57_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[r1,8]
LBE58_72:
	ld r14,[r14,4]
	jc ne,r14,r2,&L92_72
	ld r2,r14
L85_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r2
	add r14,#0x1
	ld r2,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L92_72
LBB61_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r3,[r1,8]
	add r14,r3
LBE62_72:
	ld r14,[r14,4]
	ld r3,#0x0
	jc eq,r14,r3,&L85_72
L92_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L150_72:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L97_72
	ld r14,#0x1
L97_72:
	ld r2,#0x0
	jc eq,r14,r2,&L151_72
LBB65_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB68_72:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE68_72:
	ld i0,[i0]
LBE66_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 50
	ld r14,[i0]
	ld d0,[r14,4]
	ld i1,d2
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L100_72:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L150_72
LBB71_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB72_72:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE72_72:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L100_72
	jp &L150_72
L151_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
	ld d4,r0
	add d4,#0x10
LBB74_72:
.line 116
	ld r3,#0x0
	ld.b [d4],r3
LBB76_72:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r1,r2
	jc eq,r14,r2,&L55_72
LBB77_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d1,r0
	add d1,#0x14
LBB79_72:
	ld d3,[d1]
LBE79_72:
.line 327
	ld d0,[d1,8]
LBE82_72:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE84_72:
	jc eq,r14,d0,&L139_72
	ld d2,d1
	jp &L117_72
L112_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	add d0,#0x8
LBB85_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE86_72:
	jc eq,r14,d0,&L139_72
L117_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r2,#0x0
	jc gt,r14,r2,&L112_72
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r2,&L152_72
L115_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB88_72:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE88_72:
	ld r3,[r14]
	ld [d0],r3
	ld r14,[r14,4]
	ld [d0,4],r14
Ltext35_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	add d0,#0x8
LBB89_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE90_72:
	jc ne,r14,d0,&L117_72
L139_72:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L153_72
	ld r14,[d2]
L119_72:
.line 274
	ld r0,d3
	jc le,r14,d3,&L143_72
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc4
L129_72:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L129_72
L143_72:
.line 278
	ld [d2],d3
LBE93_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L55_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 108
	add sp,#0x20
	pop rt,d4
	ret
L152_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L115_72
L153_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB112_72:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L146_72
	ld i0,[d2,8]
L123_72:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L123_72
L141_72:
.line 297
	ld [d2,4],d3
.line 298
	ld r3,#0x0
	jc ne,i0,r3,&L154_72
.line 300
	ld [d2,8],d0
	jp &L119_72
L154_72:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L119_72
L146_72:
	ld i0,[d2,8]
	jp &L141_72

//****************************************
// Function: __ZN6MAUtil9CharInput24characterChangedCallbackEcPv
//****************************************

.func __ZN6MAUtil9CharInput24characterChangedCallbackEcPv_72, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 94
	push rt,d4
	sub sp,#0x20
	ld fr,sp
	add fr,#0x3c
	ld d2,i0
LBB113_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld r14,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
LBB116_72:
.line 116
	ld r0,#0x1
	ld.b [r14,16],r0
LBE117_72:
.line 62
	ld i1,fr
	add i1,#0xffffffcc
	ld r1,r14
	add r1,#0x14
LBB122_72:
	ld [i1],r1
LBB123_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[r1]
LBE124_72:
	ld [fr,-48],r0
Ltext44_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r2,#0x0
	ld [fr,-44],r2
.line 63
	jc le,r0,r2,&L192_72
LBB125_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[r1,8]
LBE126_72:
	ld r14,[r14,4]
	jc ne,r14,r2,&L192_72
	ld r2,r14
L185_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r2
	add r14,#0x1
	ld r2,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L192_72
LBB129_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r3,[r1,8]
	add r14,r3
LBE130_72:
	ld r14,[r14,4]
	ld r3,#0x0
	jc eq,r14,r3,&L185_72
L192_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd8
	ld i0,d1
	ld i2,#0xc
	syscall 5
L250_72:
.line 60
	ld r14,#0x0
	ld i0,[fr,-32]
	ld r1,[fr,-36]
	jc ge,i0,r1,&L197_72
	ld r14,#0x1
L197_72:
	ld r2,#0x0
	jc eq,r14,r2,&L251_72
LBB133_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB136_72:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE136_72:
	ld i0,[i0]
LBE134_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 50
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d2
	call d0
	ld r1,[d1,8]
	ld r2,[d1,4]
L200_72:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L250_72
LBB139_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB140_72:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE140_72:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L200_72
	jp &L250_72
L251_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld r0,[zr,__ZN6MAUtil9CharInput18charInputSingletonE_72]
	ld d4,r0
	add d4,#0x10
LBB142_72:
.line 116
	ld r3,#0x0
	ld.b [d4],r3
LBB144_72:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r1,r2
	jc eq,r14,r2,&L155_72
LBB145_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d1,r0
	add d1,#0x14
LBB147_72:
	ld d3,[d1]
LBE147_72:
.line 327
	ld d0,[d1,8]
LBE150_72:
.line 334
	ld i0,d3
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d2,d4
	add d2,#0x4
LBE152_72:
	jc eq,r14,d0,&L239_72
	ld d2,d1
	jp &L217_72
L212_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	add d0,#0x8
LBB153_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE154_72:
	jc eq,r14,d0,&L239_72
L217_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r2,#0x0
	jc gt,r14,r2,&L212_72
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r2,&L252_72
L215_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d3,#0xffffffff
LBB156_72:
	ld i0,d3
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE156_72:
	ld r3,[r14]
	ld [d0],r3
	ld r14,[r14,4]
	ld [d0,4],r14
Ltext58_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 120
	add d0,#0x8
LBB157_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r0,[d1,8]
	add r14,r0
LBE158_72:
	jc ne,r14,d0,&L217_72
L239_72:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d3,&L253_72
	ld r14,[d2]
L219_72:
.line 274
	ld r0,d3
	jc le,r14,d3,&L243_72
	ld i0,[d2,8]
	ld r1,fr
	add r1,#0xffffffc4
L229_72:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-60],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L229_72
L243_72:
.line 278
	ld [d2],d3
LBE161_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L155_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 100
	add sp,#0x20
	pop rt,d4
	ret
L252_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L215_72
L253_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	call &__Znam_57
	ld d0,r14
LBB180_72:
.line 293
	ld r1,#0x0
	ld r14,[d2]
	jc le,r14,r1,&L246_72
	ld i0,[d2,8]
L223_72:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d2]
	jc gt,r14,r1,&L223_72
L241_72:
.line 297
	ld [d2,4],d3
.line 298
	ld r3,#0x0
	jc ne,i0,r3,&L254_72
.line 300
	ld [d2,8],d0
	jp &L219_72
L254_72:
.line 298
	call &__ZdaPv_54
	ld r14,[d2]
.line 300
	ld [d2,8],d0
	jp &L219_72
L246_72:
	ld i0,[d2,8]
	jp &L241_72

//****************************************
// Function: __ZN6MAUtil9CharInput23removeCharInputListenerEPNS_17CharInputListenerE
//****************************************

.func __ZN6MAUtil9CharInput23removeCharInputListenerEPNS_17CharInputListenerE_72, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 64
	push rt,d4
	sub sp,#0x8
	ld fr,sp
	add fr,#0x24
	ld d3,i0
LBB181_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 92
	ld d1,i0
	add d1,#0x10
LBB183_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d2,i0
	add d2,#0x14
LBB187_72:
	ld d0,[d2,8]
LBE187_72:
.line 334
	ld r14,[d2]
	sll r14,#0x3
	add r14,d0
LBE189_72:
	jc eq,r14,d0,&L283_72
L298_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d0]
	jc eq,i0,i1,&L297_72
.line 93
	add d0,#0x8
LBB190_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d1
	add r0,#0x4
LBB191_72:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE191_72:
	jc ne,r14,d0,&L298_72
L283_72:
.line 258
	ld r0,[d2]
LBE195_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,#0x0
	jc ne,r0,r14,&L255_72
	ld.b r14,[d3,8]
	and r14,#0xff
	jc eq,r14,r0,&L255_72
Ltext70_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 66
	ld i0,d3
	call &__ZN6MAUtil9CharInput7disableEv_72
L255_72:
.line 67
	add sp,#0x8
	pop rt,d4
	ret
L297_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 95
	ld.b r0,[d1]
	and r0,#0xff
	ld r1,#0x0
	jc ne,r0,r1,&L299_72
.line 99
	ld.b r14,[d1,2]
	and r14,#0xff
	jc eq,r14,r0,&L264_72
.line 100
	call &__ZdlPv_55
L264_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	add d1,#0x4
	ld r14,d0
LBB202_72:
.line 334
	ld r1,[d1]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d1,8]
	add r0,i0
LBE205_72:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d0,&L290_72
L268_72:
.line 198
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L268_72
	ld r1,[d1]
L290_72:
.line 265
	ld d0,r1
	add d0,#0xffffffff
LBB207_72:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d0,&L300_72
L270_72:
.line 274
	ld r0,d0
	jc le,r1,d0,&L294_72
	ld r1,fr
	add r1,#0xffffffdc
L280_72:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-36],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r2,[r1,4]
	ld [r14,4],r2
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L280_72
L294_72:
.line 278
	ld [d1],d0
	jp &L283_72
L299_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 96
	ld [d0,4],r1
.line 97
	ld r2,#0x1
	ld.b [d1,1],r2
	jp &L283_72
L300_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d0
	sll i0,#0x3
	call &__Znam_57
	ld d4,r14
LBB222_72:
.line 293
	ld r2,#0x0
	ld r1,[d1]
	jc le,r1,r2,&L295_72
	ld i0,[d1,8]
L274_72:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d4
	add r14,i0
	ld r1,[r14]
	ld [r0],r1
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d1]
	jc gt,r1,r2,&L274_72
L292_72:
.line 297
	ld [d1,4],d0
.line 298
	ld r2,#0x0
	jc ne,i0,r2,&L301_72
.line 300
	ld i0,d4
	ld [d1,8],d4
	jp &L270_72
L301_72:
.line 298
	call &__ZdaPv_54
	ld r1,[d1]
.line 300
	ld i0,d4
	ld [d1,8],d4
	jp &L270_72
L295_72:
	ld i0,[d1,8]
	jp &L292_72

//****************************************
// Function: __ZN6MAUtil9CharInput20addCharInputListenerEPNS_17CharInputListenerE
//****************************************

.func __ZN6MAUtil9CharInput20addCharInputListenerEPNS_17CharInputListenerE_72, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 59
	push rt,d5
	sub sp,#0x8
	ld fr,sp
	add fr,#0x28
	ld d3,i0
LBB223_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 81
	ld r1,i0
	add r1,#0x10
LBB225_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d2,i0
	add d2,#0x14
LBB229_72:
	ld r0,[d2,8]
LBE229_72:
.line 334
	ld r14,[d2]
	sll r14,#0x3
	add r14,r0
LBE231_72:
	jc eq,r14,r0,&L340_72
L310_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 83
	ld r14,[r0]
	jc eq,r14,i1,&L346_72
.line 82
	add r0,#0x8
LBB232_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld d0,r1
	add d0,#0x4
LBB233_72:
	ld r14,[d0]
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE233_72:
	jc ne,r14,r0,&L310_72
L335_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 88
	ld d5,fr
	add d5,#0xffffffd8
	ld r14,#0x1
	ld [fr,-36],r14
	ld [fr,-40],i1
LBB234_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d1,[d0,4]
	ld r14,d1
	add r14,#0xffffffff
	ld r0,[d0]
	jc lt,r0,r14,&L342_72
.line 162
	ld r1,#0x0
	jc eq,d1,r1,&L312_72
LBB236_72:
.line 286
	ld d4,d1
	add d4,d1
LBB237_72:
.line 288
	jc lt,d1,d4,&L347_72
L342_72:
	ld i0,[d0,8]
L311_72:
.line 167
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,[d5]
	ld [r14],r2
	ld d5,[d5,4]
	ld [r14,4],d5
	add r0,#0x1
	ld [d0],r0
L309_72:
.line 258
	ld r14,[d2]
LBE242_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r0,#0x0
	jc le,r14,r0,&L302_72
	ld.b r14,[d3,8]
	and r14,#0xff
	jc eq,r14,r0,&L348_72
L302_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 62
	add sp,#0x8
	pop rt,d5
	ret
L346_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 84
	ld r1,#0x1
	ld [r0,4],r1
	jp &L309_72
L348_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 61
	ld i0,d3
	call &__ZN6MAUtil9CharInput6enableEv_72
LBE243_72:
.line 62
	add sp,#0x8
	pop rt,d5
	ret
L340_72:
	ld d0,r1
	add d0,#0x4
	jp &L335_72
L347_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d4
	sll i0,#0x3
	call &__Znam_57
	ld d1,r14
LBB257_72:
.line 293
	ld r1,#0x0
	ld r0,[d0]
	jc le,r0,r1,&L343_72
	ld i0,[d0,8]
L318_72:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L318_72
L337_72:
.line 297
	ld [d0,4],d4
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L349_72
.line 300
	ld i0,d1
L345_72:
	ld [d0,8],i0
	jp &L311_72
L312_72:
.line 291
	ld i0,#0x20
	call &__Znam_57
	ld d4,r14
LBB261_72:
.line 293
	ld r1,d1
	ld r0,[d0]
	jc le,r0,d1,&L344_72
	ld i0,[d0,8]
L327_72:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d4
	add r14,i0
	ld r2,[r14]
	ld [r0],r2
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r0,[d0]
	jc gt,r0,r1,&L327_72
L339_72:
.line 297
	ld r14,#0x4
	ld [d0,4],r14
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L350_72
.line 300
	ld i0,d4
L351_72:
	ld [d0,8],i0
	jp &L311_72
L350_72:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d4
	jp &L351_72
L349_72:
.line 298
	call &__ZdaPv_54
	ld r0,[d0]
.line 300
	ld i0,d1
	jp &L345_72
L344_72:
	ld i0,[d0,8]
	jp &L339_72
L343_72:
	ld i0,[d0,8]
	jp &L337_72

//****************************************
// Function: __ZN6MAUtil9CharInputD1Ev
//****************************************

.func __ZN6MAUtil9CharInputD1Ev_72, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB265_72:
.line 129
	ld r14,&__ZTVN6MAUtil9CharInputE_72+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil9CharInputE_72+48
	ld [i0,4],r14
LBB266_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,28]
	ld r14,#0x0
	jc ne,i0,r14,&L364_72
LBE269_72:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBE265_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	pop rt,d0
	ret
L364_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE274_72:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBE270_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil9CharInputD0Ev
//****************************************

.func __ZN6MAUtil9CharInputD0Ev_72, 1, void
.line 129
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB275_72:
.line 129
	ld r14,&__ZTVN6MAUtil9CharInputE_72+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil9CharInputE_72+48
	ld [i0,4],r14
LBB276_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld i0,[i0,28]
	ld r14,#0x0
	jc ne,i0,r14,&L377_72
LBE279_72:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBE275_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret
L377_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE284_72:
	ld i0,d0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBE280_72:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInput.cpp'
.line 129
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil4RectC1Ev
//****************************************

.func __ZN6MAUtil4RectC1Ev_73, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Geometry.cpp'
.line 21
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_73:
.line 21
	ld r14,&__ZTVN6MAUtil4RectE_73+8
	ld [i0],r14
	ld r14,#0x0
	ld [i0,4],r14
	ld [i0,8],r14
	ld [i0,12],r14
	ld [i0,16],r14
LBE3_73:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil4RectC1Eiiii
//****************************************

.func __ZN6MAUtil4RectC1Eiiii_73, 5, void
.line 24
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB5_73:
.line 24
	ld r14,&__ZTVN6MAUtil4RectE_73+8
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
LBE5_73:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil4Rect3setEiiii
//****************************************

.func __ZN6MAUtil4Rect3setEiiii_73, 5, void
.line 32
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_73:
.line 33
	ld [i0,4],i1
.line 34
	ld [i0,8],i2
.line 35
	ld [i0,12],i3
.line 36
	ld r14,[fr]
	ld [i0,16],r14
LBE6_73:
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil4Rect8containsEii
//****************************************

.func __ZNK6MAUtil4Rect8containsEii_73, 3, int
.line 70
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB8_73:
.line 71
	ld r14,[i0,4]
	ld r0,#0x0
	jc gt,r14,i1,&L7_73
.line 72
	ld r15,[i0,8]
	jc gt,r15,i2,&L7_73
.line 73
	ld r0,[i0,12]
	add r14,r0
	ld r0,#0x0
	jc lt,r14,i1,&L7_73
.line 74
	ld r14,[i0,16]
	add r14,r15
	jc lt,r14,i2,&L7_73
.line 75
	ld r0,#0x1
L7_73:
.line 76
	ld r14,r0
	pop fr,fr
	ret

//****************************************
// Function: __ZNK6MAUtil4Rect8containsERKNS_5PointE
//****************************************

.func __ZNK6MAUtil4Rect8containsERKNS_5PointE_73, 2, int
.line 45
	push rt,fr
	ld fr,sp
	add fr,#0x8
	ld r14,i1
LBB9_73:
.line 46
	ld i1,[i1]
	ld i2,[r14,4]
	call &__ZNK6MAUtil4Rect8containsEii_73
LBE9_73:
.line 47
	and r14,#0xff
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil13THashFunctionIiEEmRKT_
//****************************************

.func __ZN6MAUtil13THashFunctionIiEEmRKT__74, 1, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\HashMap.cpp'
.line 28
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB3_74:
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
LBE4_74:
.line 37
	xor r14,r0
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_75, 2, void
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

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_75, 2, void
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

.func __ZThn148_N6MAUtil6Moblet13keyPressEventEii_75, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6Moblet13keyPressEventEii_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet13keyPressEventEii
//****************************************

.func __ZN6MAUtil6Moblet13keyPressEventEii_75, 3, void
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

.func __ZThn148_N6MAUtil6Moblet15keyReleaseEventEii_75, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6Moblet15keyReleaseEventEii_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet15keyReleaseEventEii
//****************************************

.func __ZN6MAUtil6Moblet15keyReleaseEventEii_75, 3, void
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

.func __ZThn152_N6MAUtil6Moblet17pointerPressEventE9MAPoint2d_75, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet17pointerPressEventE9MAPoint2d_75, 3, void
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

.func __ZThn152_N6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_75, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet16pointerMoveEventE9MAPoint2d_75, 3, void
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

.func __ZThn152_N6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_75, 3, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d
//****************************************

.func __ZN6MAUtil6Moblet19pointerReleaseEventE9MAPoint2d_75, 3, void
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

.func __ZThn160_N6MAUtil6Moblet11customEventERK7MAEvent_75, 2, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff60
	call &__ZN6MAUtil6Moblet11customEventERK7MAEvent_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet11customEventERK7MAEvent
//****************************************

.func __ZN6MAUtil6Moblet11customEventERK7MAEvent_75, 2, void
.line 84
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 84
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil6MobletC2Ev
//****************************************

.func __ZN6MAUtil6MobletC2Ev_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 23
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d0,i0
LBB2_75:
.line 23
	call &__ZN6MAUtil11EnvironmentC2Ev_62
LBB3_75:
	ld i1,d0
	add i1,#0x94
LBE3_75:
	ld d1,d0
	add d1,#0x98
LBE4_75:
	ld d2,d0
	add d2,#0x9c
LBE5_75:
	ld d3,d0
	add d3,#0xa0
LBE6_75:
	ld r14,&__ZTVN6MAUtil6MobletE_75+8
	ld [d0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+60
	ld [i1],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+96
	ld [d1],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+124
	ld [d2],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+136
	ld [d3],r14
	ld r14,#0x1
	ld.b [d0,164],r14
.line 26
	ld i0,d0
	call &__ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_62
.line 27
	ld i0,d0
	ld i1,d1
	call &__ZN6MAUtil11Environment18addPointerListenerEPNS_15PointerListenerE_62
.line 28
	ld i0,d0
	ld i1,d2
	call &__ZN6MAUtil11Environment16addCloseListenerEPNS_13CloseListenerE_62
.line 29
	ld i0,d0
	ld i1,d3
	call &__ZN6MAUtil11Environment22addCustomEventListenerEPNS_19CustomEventListenerE_62
LBE2_75:
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet5closeEv
//****************************************

.func __ZN6MAUtil6Moblet5closeEv_75, 0, void
.line 144
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_75:
.line 145
	ld i0,#0x0
	syscall 2

//****************************************
// Function: __ZThn156_N6MAUtil6Moblet10closeEventEv
//****************************************

.func __ZThn156_N6MAUtil6Moblet10closeEventEv_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff64
	call &__ZN6MAUtil6Moblet10closeEventEv_75

//****************************************
// Function: __ZN6MAUtil6Moblet10closeEventEv
//****************************************

.func __ZN6MAUtil6Moblet10closeEventEv_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 140
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB13_75:
.line 141
	call &__ZN6MAUtil6Moblet5closeEv_75

//****************************************
// Function: __ZN6MAUtil6Moblet15timeToNextTimerEv
//****************************************

.func __ZN6MAUtil6Moblet15timeToNextTimerEv_75, 1, int
.line 37
	push rt,d2
	sub sp,#0x18
	ld fr,sp
	add fr,#0x2c
	ld d0,i0
LBB14_75:
.line 38
	syscall 86
	ld d2,r14
.line 39
	ld d1,#0xffffffff
LBB16_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld i1,fr
	add i1,#0xffffffd4
	add d0,#0x58
LBB20_75:
	ld [i1],d0
LBB21_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d0]
LBE22_75:
	ld [fr,-40],r0
Ltext8_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-36],r1
.line 63
	jc le,r0,r1,&L40_75
LBB23_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d0,8]
LBE24_75:
	ld r14,[r14,4]
	jc ne,r14,r1,&L40_75
	ld r1,r14
L33_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L40_75
LBB27_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d0,8]
	add r14,r2
LBE28_75:
	ld r14,[r14,4]
	ld r2,#0x0
	jc eq,r14,r2,&L33_75
L40_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d0,fr
	add d0,#0xffffffe0
	ld i0,d0
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-28]
L63_75:
.line 60
	ld r14,#0x0
	ld r0,[fr,-24]
	jc ge,r0,r3,&L45_75
	ld r14,#0x1
L45_75:
	ld r1,#0x0
	jc eq,r14,r1,&L65_75
LBB31_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d0]
LBB36_75:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE36_75:
	ld r14,[r0]
LBE34_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[r14,16]
	sub r14,d2
Ltext15_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 42
	ld r0,#0x0
	jc lt,r14,r0,&L66_75
L48_75:
.line 44
	ld r1,#0xffffffff
	jc eq,d1,r1,&L62_75
.line 47
	jc gt,d1,r14,&L62_75
L43_75:
	ld r1,[d0,8]
	ld r2,[d0,4]
L52_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d0,8],r0
.line 55
	jc eq,r0,r2,&L63_75
LBB39_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d0]
LBB40_75:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE40_75:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L52_75
	jp &L63_75
L62_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 47
	ld d1,r14
	jp &L43_75
L66_75:
.line 43
	ld r14,r0
	jp &L48_75
L65_75:
.line 51
	ld r14,d1
	add sp,#0x18
	pop rt,d2
	ret

//****************************************
// Function: __ZN6MAUtil6Moblet16runPendingTimersEv
//****************************************

.func __ZN6MAUtil6Moblet16runPendingTimersEv_75, 1, void
.line 53
	push rt,d6
	sub sp,#0x28
	ld fr,sp
	add fr,#0x4c
	ld d0,i0
LBB43_75:
.line 54
	syscall 86
	ld d5,r14
LBB45_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 115
	ld d4,d0
	add d4,#0x54
LBB46_75:
.line 116
	ld r0,#0x1
	ld.b [d4],r0
LBE47_75:
.line 62
	ld i1,fr
	add i1,#0xffffffc4
	ld d3,d0
	add d3,#0x58
LBB52_75:
	ld [i1],d3
LBB53_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r0,[d3]
LBE54_75:
	ld [fr,-56],r0
Ltext21_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 62
	ld r1,#0x0
	ld [fr,-52],r1
.line 63
	jc le,r0,r1,&L104_75
LBB55_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d3,8]
LBE56_75:
	ld r14,[r14,4]
	jc ne,r14,r1,&L104_75
	ld r1,r14
L97_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 54
	ld r14,r1
	add r14,#0x1
	ld r1,r14
	ld [i1,8],r14
.line 55
	jc eq,r14,r0,&L104_75
LBB59_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	sll r14,#0x3
	ld r2,[d3,8]
	add r14,r2
LBE60_75:
	ld r14,[r14,4]
	ld r3,#0x0
	jc eq,r14,r3,&L97_75
L104_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 77
	ld d1,fr
	add d1,#0xffffffd0
	ld i0,d1
	ld i2,#0xc
	syscall 5
	ld r3,[fr,-44]
L219_75:
.line 60
	ld r14,#0x0
	ld i0,[fr,-40]
	jc ge,i0,r3,&L109_75
	ld r14,#0x1
L109_75:
	ld r1,#0x0
	jc eq,r14,r1,&L220_75
LBB63_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB66_75:
	sll i0,#0x3
	ld r14,[r14,8]
	add i0,r14
LBE66_75:
	ld i0,[i0]
LBE64_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[i0,16]
	jc le,r14,d5,&L221_75
L107_75:
	ld r1,[d1,8]
	ld r2,[d1,4]
L158_75:
.line 54
	ld r0,r1
	add r0,#0x1
	ld r1,r0
	ld [d1,8],r0
.line 55
	jc eq,r0,r2,&L219_75
LBB69_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB70_75:
	sll r0,#0x3
	ld r14,[r14,8]
	add r0,r14
LBE70_75:
	ld r14,[r0,4]
	ld r0,#0x0
	jc eq,r14,r0,&L158_75
	jp &L219_75
L221_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld i0,[i0]
	ld r14,[i0]
	ld d0,[r14]
	call d0
LBB71_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r0,[d1]
	ld r2,[fr,-40]
LBB74_75:
	ld r14,r2
	sll r14,#0x3
	ld r1,[r0,8]
	add r14,r1
LBE74_75:
	ld r14,[r14]
LBE72_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r0,[r14,12]
	ld r3,#0x0
	jc le,r0,r3,&L115_75
	add r0,#0xffffffff
	ld [r14,12],r0
LBB75_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r2,[fr,-40]
LBB78_75:
	ld r14,r2
	sll r14,#0x3
	add r1,r14
LBE78_75:
	ld r1,[r1]
LBE76_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r14,[r1,12]
	jc ne,r14,r3,&L115_75
LBB79_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 327
	ld d0,[d3,8]
LBE84_75:
.line 334
	ld r14,[d3]
	sll r14,#0x3
	add r14,d0
LBE86_75:
	jc eq,r14,d0,&L115_75
L223_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 94
	ld i0,[d0]
	jc eq,i0,r1,&L222_75
.line 93
	add d0,#0x8
LBB87_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r0,d4
	add r0,#0x4
LBB88_75:
	ld r14,[r0]
	sll r14,#0x3
	ld r0,[r0,8]
	add r14,r0
LBE88_75:
	jc ne,r14,d0,&L223_75
L115_75:
.line 355
	ld r14,[d1]
LBB92_75:
	sll r2,#0x3
	ld r14,[r14,8]
	add r2,r14
LBE92_75:
	ld r14,[r2]
LBE90_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r0,[r14,16]
	ld r1,[r14,8]
	add r0,r1
	ld [r14,16],r0
	ld r3,[fr,-44]
	jp &L107_75
L220_75:
.line 116
	ld r2,#0x0
	ld.b [d4],r2
LBB96_75:
.line 117
	ld.b r14,[d4,1]
	and r14,#0xff
	ld r3,r1
	jc eq,r14,r1,&L67_75
LBB97_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d2,[d3]
LBE99_75:
.line 327
	ld d0,[d3,8]
LBE102_75:
.line 334
	ld i0,d2
	sll i0,#0x3
	ld r14,d0
	add r14,i0
	ld d1,d4
	add d1,#0x4
LBE104_75:
	jc eq,r14,d0,&L204_75
L225_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 121
	ld r14,[d0,4]
	ld r0,#0x0
	jc le,r14,r0,&L224_75
L170_75:
.line 120
	add d0,#0x8
LBB105_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 334
	ld r14,[d1]
	sll r14,#0x3
	ld r2,[d1,8]
	add r14,r2
LBE106_75:
	jc ne,r14,d0,&L225_75
L204_75:
.line 288
	ld r14,[d1,4]
	jc lt,r14,d2,&L226_75
	ld r14,[d1]
L177_75:
.line 274
	ld r0,d2
	jc le,r14,d2,&L208_75
	ld i0,[d1,8]
	ld r1,fr
	add r1,#0xffffffb4
L187_75:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-76],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 274
	add r0,#0x1
	ld r14,[d1]
	jc gt,r14,r0,&L187_75
L208_75:
.line 278
	ld [d1],d2
LBE109_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 128
	ld r14,#0x0
	ld.b [d4,1],r14
L67_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 71
	add sp,#0x28
	pop rt,d6
	ret
L224_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 122
	ld.b r14,[d4,2]
	and r14,#0xff
	jc ne,r14,r0,&L227_75
L173_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	add d2,#0xffffffff
LBB123_75:
	ld i0,d2
	sll i0,#0x3
	ld r14,[d1,8]
	add r14,i0
LBE123_75:
	ld r1,[r14]
	ld [d0],r1
	ld r14,[r14,4]
	ld [d0,4],r14
	jp &L170_75
L222_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 95
	ld.b r0,[d4]
	and r0,#0xff
	ld r14,#0x0
	jc eq,r0,r14,&L131_75
.line 96
	ld [d0,4],r14
.line 97
	ld r0,#0x1
	ld.b [d4,1],r0
	ld r2,[fr,-40]
L229_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 355
	ld r14,[d1]
LBB132_75:
	sll r2,#0x3
	ld r14,[r14,8]
	add r2,r14
LBE132_75:
	ld r14,[r2]
LBE130_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 51
	ld r0,[r14,16]
	ld r1,[r14,8]
	add r0,r1
	ld [r14,16],r0
	ld r3,[fr,-44]
	jp &L107_75
L227_75:
.line 123
	ld i0,[d0]
	call &__ZdlPv_55
	jp &L173_75
L131_75:
.line 99
	ld.b r14,[d4,2]
	and r14,#0xff
	jc eq,r14,r0,&L133_75
.line 100
	call &__ZdlPv_55
L133_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 190
	ld d2,d4
	add d2,#0x4
	ld r14,d0
LBB145_75:
.line 334
	ld r1,[d2]
	ld r0,r1
	sll r0,#0x3
	ld i0,[d2,8]
	add r0,i0
LBE148_75:
.line 199
	add r0,#0xfffffff8
	jc eq,r0,d0,&L198_75
L137_75:
.line 198
	ld r1,[r14,8]
	ld [r14],r1
	ld r2,[r14,12]
	ld [r14,4],r2
.line 199
	add r14,#0x8
	jc ne,r0,r14,&L137_75
	ld r1,[d2]
L198_75:
.line 265
	ld d0,r1
	add d0,#0xffffffff
LBB150_75:
.line 288
	ld r14,[d2,4]
	jc lt,r14,d0,&L228_75
L139_75:
.line 274
	ld r0,d0
	jc le,r1,d0,&L202_75
	ld r1,fr
	add r1,#0xffffffbc
L149_75:
.line 275
	ld r14,r0
	sll r14,#0x3
	add r14,i0
	ld r2,#0x0
	ld [fr,-68],r2
	ld [r1,4],r2
	ld [r14],r2
	ld r3,[r1,4]
	ld [r14,4],r3
.line 274
	add r0,#0x1
	ld r14,[d2]
	jc gt,r14,r0,&L149_75
L202_75:
.line 278
	ld [d2],d0
	ld r2,[fr,-40]
	jp &L229_75
L228_75:
.line 291
	ld i0,d0
	sll i0,#0x3
	call &__Znam_57
	ld d6,r14
LBB159_75:
.line 293
	ld r2,#0x0
	ld r1,[d2]
	jc le,r1,r2,&L209_75
	ld i0,[d2,8]
L143_75:
.line 294
	ld r14,r2
	sll r14,#0x3
	ld r0,r14
	add r0,d6
	add r14,i0
	ld r3,[r14]
	ld [r0],r3
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r2,#0x1
	ld r1,[d2]
	jc gt,r1,r2,&L143_75
L200_75:
.line 297
	ld [d2,4],d0
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L230_75
.line 300
	ld i0,d6
	ld [d2,8],d6
	jp &L139_75
L226_75:
.line 291
	call &__Znam_57
	ld d0,r14
LBB171_75:
.line 293
	ld r1,#0x0
	ld r14,[d1]
	jc le,r14,r1,&L212_75
	ld i0,[d1,8]
L181_75:
.line 294
	ld r14,r1
	sll r14,#0x3
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r3,[r14]
	ld [r0],r3
	ld r14,[r14,4]
	ld [r0,4],r14
.line 293
	add r1,#0x1
	ld r14,[d1]
	jc gt,r14,r1,&L181_75
L206_75:
.line 297
	ld [d1,4],d2
.line 298
	ld r0,#0x0
	jc ne,i0,r0,&L231_75
.line 300
	ld [d1,8],d0
	jp &L177_75
L231_75:
.line 298
	call &__ZdaPv_54
	ld r14,[d1]
.line 300
	ld [d1,8],d0
	jp &L177_75
L230_75:
.line 298
	call &__ZdaPv_54
	ld r1,[d2]
.line 300
	ld i0,d6
	ld [d2,8],d6
	jp &L139_75
L209_75:
	ld i0,[d2,8]
	jp &L200_75
L212_75:
	ld i0,[d1,8]
	jp &L206_75

//****************************************
// Function: __ZN6MAUtil6Moblet3runEPS0_
//****************************************

.func __ZN6MAUtil6Moblet3runEPS0__75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 73
	push rt,d2
	sub sp,#0x10
	ld fr,sp
	add fr,#0x24
	ld d1,i0
LBB186_75:
.line 134
	ld.b r14,[i0,164]
	and r14,#0xff
	ld d2,fr
	add d2,#0xffffffdc
	ld r0,#0x0
	jc eq,r14,r0,&L265_75
L264_75:
.line 116
	ld i0,d2
	syscall 82
	ld r0,#0x0
	jc eq,r14,r0,&L266_75
L252_75:
.line 77
	ld r14,[fr,-36]
	case r14,#0x1,#0x16,#L251_75,#L250_75
.data
	.align 4
L251_75:
	.word L238_75
	.word L241_75
	.word L242_75
	.word L247_75
	.word L248_75
	.word L250_75
	.word L250_75
	.word L244_75
	.word L246_75
	.word L245_75
	.word L250_75
	.word L250_75
	.word L240_75
	.word L239_75
	.word L250_75
	.word L250_75
	.word L250_75
	.word L250_75
	.word L250_75
	.word L250_75
	.word L250_75
	.word L243_75
	.word L249_75


.code
L249_75:
.line 113
	ld i0,d1
	ld i1,[fr,-32]
	ld i2,[fr,-28]
	call &__ZN6MAUtil11Environment20fireTextBoxListenersEii_62
.line 116
	ld i0,d2
	syscall 82
	ld r0,#0x0
	jc ne,r14,r0,&L252_75
L266_75:
.line 120
	ld i0,d1
	call &__ZN6MAUtil6Moblet16runPendingTimersEv_75
.line 126
	ld i0,d1
	call &__ZN6MAUtil11Environment16runIdleListenersEv_62
LBB190_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld d0,[d1,72]
LBE194_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\ListenerSet.h'
.line 132
	ld r14,#0x0
	jc eq,d0,r14,&L267_75
L233_75:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 134
	ld.b r14,[d1,164]
	and r14,#0xff
L268_75:
	ld r0,#0x0
	jc ne,r14,r0,&L264_75
L265_75:
	add sp,#0x10
	pop rt,d2
	ret
L243_75:
.line 95
	ld i0,d1
	ld i1,[fr,-32]
	call &__ZN6MAUtil11Environment13fireCharEventEj_62
	jp &L264_75
L250_75:
.line 116
	ld i0,d1
	ld i1,d2
	call &__ZN6MAUtil11Environment24fireCustomEventListenersERK7MAEvent_62
	jp &L264_75
L239_75:
.line 83
	ld i0,d1
	call &__ZN6MAUtil11Environment20fireFocusGainedEventEv_62
	jp &L264_75
L240_75:
.line 86
	ld i0,d1
	call &__ZN6MAUtil11Environment18fireFocusLostEventEv_62
	jp &L264_75
L245_75:
.line 101
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment20firePointerMoveEventE9MAPoint2d_62
	jp &L264_75
L246_75:
.line 104
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment23firePointerReleaseEventE9MAPoint2d_62
	jp &L264_75
L244_75:
.line 98
	ld r14,[fr,-32]
	ld r15,[fr,-28]
	ld i0,d1
	ld i1,r14
	ld i2,r15
	call &__ZN6MAUtil11Environment21firePointerPressEventE9MAPoint2d_62
	jp &L264_75
L248_75:
.line 110
	ld i0,d1
	ld i1,[fr,-32]
	call &__ZN6MAUtil11Environment18fireBluetoothEventEi_62
	jp &L264_75
L247_75:
.line 107
	ld i0,d1
	ld i1,fr
	add i1,#0xffffffe0
	call &__ZN6MAUtil11Environment13fireConnEventERK15MAConnEventData_62
	jp &L264_75
L242_75:
.line 92
	ld i0,d1
	ld i1,[fr,-32]
	ld i2,[fr,-28]
	call &__ZN6MAUtil11Environment19fireKeyReleaseEventEii_62
	jp &L264_75
L241_75:
.line 89
	ld i0,d1
	ld i1,[fr,-32]
	ld i2,[fr,-28]
	call &__ZN6MAUtil11Environment17fireKeyPressEventEii_62
	jp &L264_75
L238_75:
.line 79
	ld i0,d1
	call &__ZN6MAUtil11Environment14fireCloseEventEv_62
.line 80
	call &__ZN6MAUtil6Moblet5closeEv_75
L267_75:
.line 130
	ld i0,d1
	call &__ZN6MAUtil6Moblet15timeToNextTimerEv_75
	ld i0,r14
.line 133
	jc eq,r14,d0,&L233_75
.line 134
	syscall 83
LBE200_75:
	ld.b r14,[d1,164]
	and r14,#0xff
	jp &L268_75

//****************************************
// Function: __ZThn152_N6MAUtil6MobletD1Ev
//****************************************

.func __ZThn152_N6MAUtil6MobletD1Ev_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6MobletD1Ev_75
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6MobletD1Ev
//****************************************

.func __ZThn148_N6MAUtil6MobletD1Ev_75, 1, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6MobletD1Ev_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6MobletD1Ev
//****************************************

.func __ZN6MAUtil6MobletD1Ev_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 147
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB201_75:
.line 147
	ld r14,&__ZTVN6MAUtil6MobletE_75+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+60
	ld [i0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+96
	ld [i0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+124
	ld [i0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+136
	ld [i0,160],r14
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_62
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_62
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_62
LBE201_75:
	pop rt,d0
	ret

//****************************************
// Function: __ZThn152_N6MAUtil6MobletD0Ev
//****************************************

.func __ZThn152_N6MAUtil6MobletD0Ev_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.h'
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff68
	call &__ZN6MAUtil6MobletD0Ev_75
	pop rt,fr
	ret

//****************************************
// Function: __ZThn148_N6MAUtil6MobletD0Ev
//****************************************

.func __ZThn148_N6MAUtil6MobletD0Ev_75, 1, void
.line 49
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 49
	add i0,#0xffffff6c
	call &__ZN6MAUtil6MobletD0Ev_75
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil6MobletD0Ev
//****************************************

.func __ZN6MAUtil6MobletD0Ev_75, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Moblet.cpp'
.line 147
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB202_75:
.line 147
	ld r14,&__ZTVN6MAUtil6MobletE_75+8
	ld [i0],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+60
	ld [i0,148],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+96
	ld [i0,152],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+124
	ld [i0,156],r14
	ld r14,&__ZTVN6MAUtil6MobletE_75+136
	ld [i0,160],r14
	add i0,#0x98
	call &__ZN6MAUtil15PointerListenerD2Ev_62
	ld i0,d0
	add i0,#0x94
	call &__ZN6MAUtil11KeyListenerD2Ev_62
	ld i0,d0
	call &__ZN6MAUtil11EnvironmentD2Ev_62
LBE202_75:
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil15PlaceholderPool3putEi
//****************************************

.func __ZN6MAUtil15PlaceholderPool3putEi_76, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 35
	push rt,d2
	sub sp,#0x4
	ld fr,sp
	add fr,#0x18
	ld [fr,-24],i0
LBB2_76:
.line 36
	syscall 59
LBB3_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 161
	ld d0,[zr,_sPool_76+4]
	ld r14,d0
	add r14,#0xffffffff
	ld r0,[zr,_sPool_76]
	jc lt,r0,r14,&L2_76
.line 162
	ld r1,#0x0
	jc eq,d0,r1,&L3_76
LBB5_76:
.line 286
	ld d2,&_sPool_76
	ld d1,d0
	add d1,d0
LBB6_76:
.line 288
	jc lt,d0,d1,&L29_76
L2_76:
.line 167
	ld r14,r0
	sll r14,#0x2
	ld r1,[zr,_sPool_76+8]
	add r14,r1
	ld r1,[fr,-24]
	ld [r14],r1
	add r0,#0x1
	ld [zr,_sPool_76],r0
LBE4_76:
	add sp,#0x4
	pop rt,d2
	ret
L3_76:
.line 286
	ld d2,&_sPool_76
LBB12_76:
.line 291
	ld i0,#0x10
	call &__Znam_57
	ld d1,r14
LBB14_76:
.line 293
	ld r1,d0
	ld r0,[zr,_sPool_76]
	jc le,r0,d0,&L27_76
	ld i0,[zr,_sPool_76+8]
L18_76:
.line 294
	ld r14,r1
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r1,#0x1
	ld r0,[zr,_sPool_76]
	jc gt,r0,r1,&L18_76
L25_76:
.line 297
	ld r1,#0x4
	ld [d2,4],r1
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L30_76
.line 300
	ld [d2,8],d1
L32_76:
.line 167
	ld r14,r0
	sll r14,#0x2
	ld r1,[zr,_sPool_76+8]
	add r14,r1
	ld r1,[fr,-24]
	ld [r14],r1
	add r0,#0x1
	ld [zr,_sPool_76],r0
LBE10_76:
	add sp,#0x4
	pop rt,d2
	ret
L29_76:
.line 291
	ld i0,d1
	sll i0,#0x2
	call &__Znam_57
	ld d0,r14
LBB21_76:
.line 293
	ld r1,#0x0
	ld r0,[zr,_sPool_76]
	jc le,r0,r1,&L26_76
	ld i0,[zr,_sPool_76+8]
L9_76:
.line 294
	ld r14,r1
	sll r14,#0x2
	ld r0,r14
	add r0,d0
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r1,#0x1
	ld r0,[zr,_sPool_76]
	jc gt,r0,r1,&L9_76
L23_76:
.line 297
	ld [d2,4],d1
.line 298
	ld r14,#0x0
	jc ne,i0,r14,&L31_76
.line 300
	ld [d2,8],d0
L33_76:
.line 167
	ld r14,r0
	sll r14,#0x2
	ld r1,[zr,_sPool_76+8]
	add r14,r1
	ld r1,[fr,-24]
	ld [r14],r1
	add r0,#0x1
	ld [zr,_sPool_76],r0
LBE17_76:
	add sp,#0x4
	pop rt,d2
	ret
L27_76:
	ld i0,[zr,_sPool_76+8]
	jp &L25_76
L30_76:
.line 298
	call &__ZdaPv_54
	ld r0,[zr,_sPool_76]
.line 300
	ld [d2,8],d1
	jp &L32_76
L31_76:
.line 298
	call &__ZdaPv_54
	ld r0,[zr,_sPool_76]
.line 300
	ld [d2,8],d0
	jp &L33_76
L26_76:
	ld i0,[zr,_sPool_76+8]
	jp &L23_76

//****************************************
// Function: __ZN6MAUtil15PlaceholderPool5allocEv
//****************************************

.func __ZN6MAUtil15PlaceholderPool5allocEv_76, 0, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 26
	push rt,d3
	ld fr,sp
	add fr,#0x18
LBB31_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 258
	ld r2,[zr,_sPool_76]
LBE34_76:
	ld r1,#0x0
	jc eq,r2,r1,&L65_76
	ld r14,r2
	add r14,#0xffffffff
LBB35_76:
.line 355
	sll r14,#0x2
	ld i0,[zr,_sPool_76+8]
	add r14,i0
LBE36_76:
	ld d2,[r14]
LBB37_76:
.line 190
	ld r0,r14
LBB40_76:
.line 334
	ld r1,r2
	sll r1,#0x2
	add r1,i0
LBE43_76:
.line 199
	add r1,#0xfffffffc
	jc eq,r1,r14,&L59_76
L42_76:
.line 198
	ld r14,[r0,4]
	ld [r0],r14
.line 199
	add r0,#0x4
	jc ne,r1,r0,&L42_76
	ld r2,[zr,_sPool_76]
L59_76:
.line 265
	ld d0,r2
	add d0,#0xffffffff
LBB45_76:
.line 286
	ld d3,&_sPool_76
LBB48_76:
.line 288
	ld r14,[zr,_sPool_76+4]
	jc lt,r14,d0,&L66_76
L44_76:
.line 274
	ld r0,d0
	jc le,r2,d0,&L63_76
	ld i0,[zr,_sPool_76+8]
L54_76:
.line 275
	ld r14,r0
	sll r14,#0x2
	add r14,i0
	ld r1,#0x0
	ld [r14],r1
.line 274
	add r0,#0x1
	ld r14,[zr,_sPool_76]
	jc gt,r14,r0,&L54_76
L63_76:
.line 278
	ld [zr,_sPool_76],d0
LBE46_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 32
	ld r14,d2
LBE32_76:
.line 33
	pop rt,d3
	ret
L66_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 291
	ld i0,d0
	sll i0,#0x2
	call &__Znam_57
	ld d1,r14
LBB64_76:
.line 293
	ld r1,#0x0
	ld r2,[zr,_sPool_76]
	jc le,r2,r1,&L64_76
	ld i0,[zr,_sPool_76+8]
L48_76:
.line 294
	ld r14,r1
	sll r14,#0x2
	ld r0,r14
	add r0,d1
	add r14,i0
	ld r14,[r14]
	ld [r0],r14
.line 293
	add r1,#0x1
	ld r2,[zr,_sPool_76]
	jc gt,r2,r1,&L48_76
L61_76:
.line 297
	ld [d3,4],d0
.line 298
	ld r1,#0x0
	jc ne,i0,r1,&L67_76
.line 300
	ld [d3,8],d1
	jp &L44_76
L65_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 28
	syscall 58
LBE52_76:
.line 33
	pop rt,d3
	ret
L67_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 298
	call &__ZdaPv_54
	ld r2,[zr,_sPool_76]
.line 300
	ld [d3,8],d1
	jp &L44_76
L64_76:
	ld i0,[zr,_sPool_76+8]
	jp &L61_76

//****************************************
// Function: __Z41__static_initialization_and_destruction_0ii
//****************************************

.func __Z41__static_initialization_and_destruction_0ii_76, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 38
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB78_76:
.line 24
	ld r14,#0xffff
	jc eq,i1,r14,&L78_76
L68_76:
.line 38
	pop rt,d0
	ret
L78_76:
.line 24
	ld r14,#0x1
	jc eq,i0,r14,&L79_76
LBE79_76:
	ld r14,#0x0
	jc ne,i0,r14,&L68_76
LBB80_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 136
	ld r14,[zr,_sPool_76+8]
	jc eq,r14,i0,&L68_76
	ld i0,r14
	call &__ZdaPv_54
LBE81_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 38
	pop rt,d0
	ret
L79_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Vector.h'
.line 109
	ld d0,&_sPool_76
	ld i0,#0x10
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r14,#0x0
	ld [zr,_sPool_76],r14
LBE83_76:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\PlaceholderPool.cpp'
.line 38
	pop rt,d0
	ret

//****************************************
// Function: __GLOBAL__I__ZN6MAUtil15PlaceholderPool5allocEv
//****************************************

.func __GLOBAL__I__ZN6MAUtil15PlaceholderPool5allocEv_76, 0, void
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 39
	ld i0,#0x1
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_76
	pop rt,fr
	ret

//****************************************
// Function: __GLOBAL__D__ZN6MAUtil15PlaceholderPool5allocEv
//****************************************

.func __GLOBAL__D__ZN6MAUtil15PlaceholderPool5allocEv_76, 0, void
.line 40
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 40
	ld i0,#0x0
	ld i1,#0xffff
	call &__Z41__static_initialization_and_destruction_0ii_76
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD1Ev
//****************************************

.func __ZN6MAUtil10RefCountedD1Ev_77, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.h'
.line 39
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB2_77:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_77+8
	ld [i0],r14
LBE2_77:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedD0Ev
//****************************************

.func __ZN6MAUtil10RefCountedD0Ev_77, 1, void
.line 39
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB3_77:
.line 39
	ld r14,&__ZTVN6MAUtil10RefCountedE_77+8
	ld [i0],r14
LBE3_77:
	call &__ZdlPv_55
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCountedC2Ei
//****************************************

.func __ZN6MAUtil10RefCountedC2Ei_77, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\RefCounted.cpp'
.line 22
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB4_77:
.line 22
	ld r14,&__ZTVN6MAUtil10RefCountedE_77+8
	ld [i0],r14
	ld [i0,4],i1
LBE4_77:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCounted6addRefEv
//****************************************

.func __ZN6MAUtil10RefCounted6addRefEv_77, 1, void
.line 24
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB6_77:
.line 25
	ld r14,[i0,4]
	add r14,#0x1
	ld [i0,4],r14
LBE6_77:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil10RefCounted7releaseEv
//****************************************

.func __ZN6MAUtil10RefCounted7releaseEv_77, 1, void
.line 28
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB7_77:
.line 29
	ld r0,[i0,4]
	add r0,#0xffffffff
	ld [i0,4],r0
.line 30
	ld r1,#0x0
	jc ne,r0,r1,&L12_77
.line 31
	jc eq,i0,r0,&L12_77
	ld r14,[i0]
	ld d0,[r14,4]
	call d0
L12_77:
.line 33
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10RefCounted11getRefCountEv
//****************************************

.func __ZN6MAUtil10RefCounted11getRefCountEv_77, 1, int
.line 35
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 37
	ld r14,[i0,4]
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil18ConnectionListener15connectFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener15connectFinishedEPNS_10ConnectionEi_78, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\Connection.cpp'
.line 24
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_78:
.line 25
	ld i0,&LC0_78
	ld i1,&_ZZN6MAUtil18ConnectionListener15connectFinishedEPNS_10ConnectionEiE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil18ConnectionListener16connRecvFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener16connRecvFinishedEPNS_10ConnectionEi_78, 3, void
.line 27
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB3_78:
.line 28
	ld i0,&LC1_78
	ld i1,&_ZZN6MAUtil18ConnectionListener16connRecvFinishedEPNS_10ConnectionEiE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil18ConnectionListener17connWriteFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener17connWriteFinishedEPNS_10ConnectionEi_78, 3, void
.line 30
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_78:
.line 31
	ld i0,&LC2_78
	ld i1,&_ZZN6MAUtil18ConnectionListener17connWriteFinishedEPNS_10ConnectionEiE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil18ConnectionListener16connReadFinishedEPNS_10ConnectionEi
//****************************************

.func __ZN6MAUtil18ConnectionListener16connReadFinishedEPNS_10ConnectionEi_78, 3, void
.line 33
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB5_78:
.line 34
	ld i0,&LC3_78
	ld i1,&_ZZN6MAUtil18ConnectionListener16connReadFinishedEPNS_10ConnectionEiE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi
//****************************************

.func __ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi_78, 3, void
.line 40
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB6_78:
.line 41
	ld r14,&__ZTVN6MAUtil10ConnectionE_78+8
	ld [i0],r14
	ld [i0,8],i2
	ld [i0,12],i1
	ld r14,#0x0
	ld [i0,16],r14
.line 42
	jc eq,i1,r14,&L11_78
.line 43
	ld r14,#0x0
	jc ne,i2,r14,&L12_78
LBE6_78:
.line 45
	pop rt,d0
	ret
L12_78:
.line 44
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,[d0,8]
	ld i2,d0
	call &__ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_62
LBE7_78:
.line 45
	pop rt,d0
	ret
L11_78:
.line 42
	ld i0,&LC4_78
	ld i1,&_ZZN6MAUtil10ConnectionC1EPNS_18ConnectionListenerEiE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil10Connection7connectEPKc
//****************************************

.func __ZN6MAUtil10Connection7connectEPKc_78, 2, int
.line 55
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
	ld i0,i1
LBB13_78:
.line 56
	ld r14,[d0,8]
	ld r0,#0x0
	jc gt,r14,r0,&L26_78
.line 57
	syscall 68
	ld [d0,8],r14
.line 59
	ld r0,r14
.line 58
	ld r1,#0x0
	jc lt,r14,r1,&L22_78
.line 60
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,[d0,8]
	ld i2,d0
	call &__ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_62
.line 61
	ld r0,#0x1
L22_78:
.line 62
	ld r14,r0
	pop rt,d0
	ret
L26_78:
.line 56
	ld i0,&LC5_78
	ld i1,&_ZZN6MAUtil10Connection7connectEPKcE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil10Connection5closeEv
//****************************************

.func __ZN6MAUtil10Connection5closeEv_78, 1, void
.line 64
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB15_78:
.line 65
	ld i0,[i0,8]
	ld r14,#0x0
	jc le,i0,r14,&L27_78
.line 66
	syscall 69
.line 67
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,[d0,8]
	call &__ZN6MAUtil11Environment18removeConnListenerEi_62
.line 68
	ld r14,#0x0
	ld [d0,8],r14
L27_78:
.line 70
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10ConnectionD0Ev
//****************************************

.func __ZN6MAUtil10ConnectionD0Ev_78, 1, void
.line 47
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB16_78:
.line 47
	ld r14,&__ZTVN6MAUtil10ConnectionE_78+8
	ld [i0],r14
.line 48
	call &__ZN6MAUtil10Connection5closeEv_78
LBE16_78:
.line 49
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil10ConnectionD1Ev
//****************************************

.func __ZN6MAUtil10ConnectionD1Ev_78, 1, void
.line 47
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB17_78:
.line 47
	ld r14,&__ZTVN6MAUtil10ConnectionE_78+8
	ld [i0],r14
.line 48
	call &__ZN6MAUtil10Connection5closeEv_78
LBE17_78:
.line 49
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10ConnectionD2Ev
//****************************************

.func __ZN6MAUtil10ConnectionD2Ev_78, 1, void
.line 47
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB18_78:
.line 47
	ld r14,&__ZTVN6MAUtil10ConnectionE_78+8
	ld [i0],r14
.line 48
	call &__ZN6MAUtil10Connection5closeEv_78
LBE18_78:
.line 49
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10Connection5writeEPKvi
//****************************************

.func __ZN6MAUtil10Connection5writeEPKvi_78, 3, void
.line 72
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB19_78:
.line 73
	ld i0,[i0,8]
	syscall 71
LBE19_78:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10Connection4recvEPvi
//****************************************

.func __ZN6MAUtil10Connection4recvEPvi_78, 3, void
.line 79
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB21_78:
.line 80
	ld i0,[i0,8]
	syscall 70
LBE21_78:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil10Connection9connEventERK15MAConnEventData
//****************************************

.func __ZN6MAUtil10Connection9connEventERK15MAConnEventData_78, 2, void
.line 113
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r0,i0
	ld r1,i1
LBB31_78:
.line 115
	ld r14,[i1]
	ld r2,[i0,8]
	jc ne,r14,r2,&L80_78
.line 116
	ld r14,[i1,4]
	ld r3,#0x2
	jc eq,r14,r3,&L76_78
	jc gt,r14,r3,&L77_78
	ld r2,#0x1
	jc eq,r14,r2,&L66_78
L61_78:
.line 142
	pop rt,d0
	ret
L77_78:
.line 116
	ld r3,#0x5
	jc ne,r14,r3,&L61_78
.line 118
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14]
.line 139
	ld i1,r0
	ld i2,[r1,8]
L79_78:
	call d0
L85_78:
.line 142
	pop rt,d0
	ret
L66_78:
.line 121
	ld r2,[i0,16]
	ld r14,#0x0
	jc le,r2,r14,&L67_78
.line 122
	ld r14,[i1,8]
	ld r3,#0x0
	jc lt,r14,r3,&L81_78
.line 127
	sub r2,r14
	ld r14,r2
	ld [r0,16],r2
.line 128
	ld r2,#0x0
	jc lt,r14,r2,&L82_78
.line 129
	ld r3,#0x0
	jc eq,r14,r3,&L83_78
.line 132
	ld r2,[i0,36]
	ld r14,r2
	and r14,#0x1
	ld r3,#0x0
	jc ne,r14,r3,&L84_78
	ld d0,[i0,32]
L74_78:
	sra r2,#0x1
	ld i0,r0
	add i0,r2
	ld i1,[r1,8]
	call d0
LBE33_78:
.line 142
	pop rt,d0
	ret
L76_78:
.line 139
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,r0
	ld i2,[r1,8]
	jp &L79_78
L84_78:
.line 132
	ld r14,r2
	sra r14,#0x1
	add r14,i0
	ld r14,[r14]
	ld r3,[i0,32]
	add r14,r3
	ld d0,[r14]
	jp &L74_78
L83_78:
.line 130
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,12]
	ld i1,r0
	ld i2,#0x1
.line 139
	call d0
	jp &L85_78
L67_78:
.line 135
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,4]
.line 139
	ld i1,r0
	ld i2,[r1,8]
	jp &L79_78
L81_78:
.line 123
	ld [i0,16],r3
.line 124
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,12]
.line 139
	ld i1,r0
	ld i2,[r1,8]
	jp &L79_78
L80_78:
.line 115
	ld i0,&LC9_78
	ld i1,&_ZZN6MAUtil10Connection9connEventERK15MAConnEventDataE12__FUNCTION___78
	call &_panicFunction_28
L82_78:
.line 128
	ld i0,&LC10_78
	call &_FileNameFromPath_28
	ld i0,#0x6
	ld i1,r14
	ld i2,#0x80
	call &_bfeHandler_28

//****************************************
// Function: __ZN6MAUtil10Connection11setListenerEPNS_18ConnectionListenerE
//****************************************

.func __ZN6MAUtil10Connection11setListenerEPNS_18ConnectionListenerE_78, 2, void
.line 144
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB35_78:
.line 145
	ld [i0,12],i1
LBE35_78:
	pop fr,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE
//****************************************

.func __ZN6MAUtil14HttpConnectionC1EPNS_22HttpConnectionListenerE_78, 2, void
.line 154
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB38_78:
.line 154
	ld i2,#0x0
	call &__ZN6MAUtil10ConnectionC2EPNS_18ConnectionListenerEi_78
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [d0],r14
LBE38_78:
	pop rt,d0
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection6createEPKci
//****************************************

.func __ZN6MAUtil14HttpConnection6createEPKci_78, 3, int
.line 157
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
	ld i0,i1
	ld i1,i2
LBB39_78:
.line 158
	ld r14,[d0,8]
	ld r0,#0x0
	jc gt,r14,r0,&L94_78
.line 159
	syscall 75
	ld [d0,8],r14
.line 161
	ld r0,r14
.line 160
	ld r1,#0x0
	jc lt,r14,r1,&L90_78
.line 162
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,[d0,8]
	ld i2,d0
	call &__ZN6MAUtil11Environment15setConnListenerEiPNS_12ConnListenerE_62
.line 163
	ld r0,#0x1
L90_78:
.line 164
	ld r14,r0
	pop rt,d0
	ret
L94_78:
.line 158
	ld i0,&LC5_78
	ld i1,&_ZZN6MAUtil14HttpConnection6createEPKciE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2_
//****************************************

.func __ZN6MAUtil14HttpConnection16setRequestHeaderEPKcS2__78, 3, void
.line 166
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB41_78:
.line 167
	ld i0,[i0,8]
	syscall 76
LBE41_78:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection17getResponseHeaderEPKcPNS_11BasicStringIcEE
//****************************************

.func __ZN6MAUtil14HttpConnection17getResponseHeaderEPKcPNS_11BasicStringIcEE_78, 3, int
.line 170
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d3,i1
	ld d1,i2
LBB42_78:
.line 171
	ld i0,i2
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_70
	ld i0,[d2,8]
	ld i1,d3
	ld i2,r14
	ld i3,#0x0
	syscall 77
	ld i1,r14
.line 172
	ld r0,#0x0
	jc lt,i1,r0,&L96_78
.line 174
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE6resizeEi_70
.line 175
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcE7pointerEv_70
	ld d0,r14
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE8capacityEv_70
	ld i0,[d2,8]
	ld i1,d3
	ld i2,d0
	ld i3,r14
	add i3,#0x1
	syscall 77
L96_78:
.line 176
	pop rt,d3
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection6finishEv
//****************************************

.func __ZN6MAUtil14HttpConnection6finishEv_78, 1, void
.line 178
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB44_78:
.line 179
	ld i0,[i0,8]
	syscall 78
LBE44_78:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnection9connEventERK15MAConnEventData
//****************************************

.func __ZN6MAUtil14HttpConnection9connEventERK15MAConnEventData_78, 2, void
.line 182
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld r1,i0
	ld r0,i1
LBB45_78:
.line 183
	ld r14,[i1]
	ld r2,[i0,8]
	jc ne,r14,r2,&L104_78
.line 184
	ld r14,[i1,4]
	ld r2,#0xb
	jc eq,r14,r2,&L105_78
.line 187
	call &__ZN6MAUtil10Connection9connEventERK15MAConnEventData_78
LBE45_78:
.line 188
	pop rt,d0
	ret
L105_78:
.line 185
	ld i0,[i0,12]
	ld r14,[i0]
	ld d0,[r14,16]
	ld i1,r1
	ld i2,[r0,8]
	call d0
LBE46_78:
.line 188
	pop rt,d0
	ret
L104_78:
.line 183
	ld i0,&LC9_78
	ld i1,&_ZZN6MAUtil14HttpConnection9connEventERK15MAConnEventDataE12__FUNCTION___78
	call &_panicFunction_28

//****************************************
// Function: __ZN6MAUtil14HttpConnectionD1Ev
//****************************************

.func __ZN6MAUtil14HttpConnectionD1Ev_78, 1, void
.line 189
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB48_78:
.line 189
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r14
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE48_78:
	pop rt,fr
	ret

//****************************************
// Function: __ZN6MAUtil14HttpConnectionD0Ev
//****************************************

.func __ZN6MAUtil14HttpConnectionD0Ev_78, 1, void
.line 189
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB49_78:
.line 189
	ld r14,&__ZTVN6MAUtil14HttpConnectionE_78+8
	ld [i0],r14
	call &__ZN6MAUtil10ConnectionD2Ev_78
LBE49_78:
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: _CharInput_Reset
//****************************************

.func _CharInput_Reset_80, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUtil\CharInputC.c'
.line 49
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 50
	ld r14,#0x0
	ld [zr,_sCurrentCharMapIndex_80],r14
.line 51
	ld [zr,_sCurrentCharMapListIndex_80],r14
.line 52
	ld [zr,_sCurrentMode_80],r14
.line 53
	ld [zr,_sCurrentCharMode_80],r14
	pop fr,fr
	ret

//****************************************
// Function: _getChar
//****************************************

.func _getChar_80, 1, int
.line 93
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 95
	ld r0,#0x1
	jc eq,i0,r0,&L5_80
	jc le,i0,r0,&L12_80
	ld r0,#0x2
	jc eq,i0,r0,&L6_80
L7_80:
.line 106
	ld r14,#0x0
.line 109
	xb r14,r14
	pop fr,fr
	ret
L5_80:
.line 100
	ld r14,[zr,_sCurrentCharMapIndex_80]
	sll r14,#0x2
	ld r14,[r14,_charMapUpperCase_80]
	ld r0,[zr,_sCurrentCharMapListIndex_80]
	add r14,r0
L9_80:
.line 103
	ld.b r14,[r14]
L13_80:
.line 109
	xb r14,r14
	pop fr,fr
	ret
L6_80:
.line 103
	ld r14,[zr,_sCurrentCharMapIndex_80]
	add r14,&_numMap_80
	ld.b r14,[r14]
	jp &L13_80
L12_80:
.line 95
	ld r14,#0x0
	jc ne,i0,r14,&L7_80
.line 97
	ld r14,[zr,_sCurrentCharMapIndex_80]
	sll r14,#0x2
	ld r14,[r14,_charMapLowerCase_80]
.line 100
	ld r0,[zr,_sCurrentCharMapListIndex_80]
	add r14,r0
	jp &L9_80

//****************************************
// Function: _CharInput_ShortPress
//****************************************

.func _CharInput_ShortPress_80, 0, void
.line 126
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 127
	ld d0,[zr,_sStopTimerCallback_80]
	ld r0,#0x0
	jc ne,d0,r0,&L27_80
L24_80:
.line 130
	ld r14,[zr,_sCurrentMode_80]
	ld r0,#0x0
	jc eq,r14,r0,&L23_80
.line 132
	ld d0,[zr,_sCharacterDeployedCallback_80]
	jc ne,d0,r0,&L28_80
.line 134
	ld r14,#0x0
	ld [zr,_sCurrentMode_80],r14
L23_80:
.line 135
	pop rt,d0
	ret
L27_80:
.line 128
	call d0
	jp &L24_80
L28_80:
.line 133
	ld i0,[zr,_sCurrentCharMode_80]
	call &_getChar_80
	ld i0,r14
	ld i1,[zr,_sCharacterDeployedUserData_80]
	call d0
.line 134
	ld r14,#0x0
	ld [zr,_sCurrentMode_80],r14
	jp &L23_80

//****************************************
// Function: _CharInput_LongPress
//****************************************

.func _CharInput_LongPress_80, 0, void
.line 137
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 138
	ld d0,[zr,_sStopTimerCallback_80]
	ld r0,#0x0
	jc ne,d0,r0,&L33_80
L30_80:
.line 141
	ld r14,[zr,_sCurrentMode_80]
	ld r0,#0x0
	jc eq,r14,r0,&L29_80
.line 143
	ld d0,[zr,_sCharacterDeployedCallback_80]
	jc ne,d0,r0,&L34_80
.line 145
	ld r14,#0x0
	ld [zr,_sCurrentMode_80],r14
L29_80:
.line 146
	pop rt,d0
	ret
L33_80:
.line 139
	call d0
	jp &L30_80
L34_80:
.line 144
	ld i0,#0x2
	call &_getChar_80
	ld i0,r14
	ld i1,[zr,_sCharacterDeployedUserData_80]
	call d0
.line 145
	ld r14,#0x0
	ld [zr,_sCurrentMode_80],r14
	jp &L29_80

//****************************************
// Function: _CharInput_setMode
//****************************************

.func _CharInput_setMode_80, 1, void
.line 148
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 149
	ld [zr,_sCurrentCharMode_80],i0
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_getMode
//****************************************

.func _CharInput_getMode_80, 0, int
.line 152
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 154
	ld r14,[zr,_sCurrentCharMode_80]
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_Pressed
//****************************************

.func _CharInput_Pressed_80, 1, void
.line 156
	push rt,d1
	ld fr,sp
	add fr,#0x10
.line 158
	ld r14,[zr,_sQwerty_80]
	ld r0,#0x0
	jc ne,r14,r0,&L37_80
.line 161
	ld r0,[zr,_sCurrentCharMapIndex_80]
.line 162
	case i0,#0x2a,#0xf,#L52_80,#L37_80
.data
	.align 4
L52_80:
	.word L50_80
	.word L37_80
	.word L37_80
	.word L37_80
	.word L37_80
	.word L37_80
	.word L40_80
	.word L49_80
	.word L49_80
	.word L49_80
	.word L49_80
	.word L49_80
	.word L49_80
	.word L49_80
	.word L49_80
	.word L49_80


.code
L49_80:
.line 175
	ld d0,i0
	add d0,#0xffffffcf
L39_80:
.line 185
	ld i0,[zr,_sCurrentCharMode_80]
	ld r1,#0x2
	jc eq,i0,r1,&L61_80
L66_80:
	ld r14,[zr,_sCurrentMode_80]
	ld r1,#0x1
	jc eq,r14,r1,&L63_80
L56_80:
.line 196
	ld r0,#0x0
	ld [zr,_sCurrentCharMapListIndex_80],r0
.line 197
	ld [zr,_sCurrentCharMapIndex_80],d0
L55_80:
.line 200
	ld d0,[zr,_sCharacterChangedCallback_80]
	ld r1,#0x0
	jc ne,d0,r1,&L64_80
L58_80:
.line 203
	ld r14,#0x1
	ld [zr,_sCurrentMode_80],r14
.line 205
	ld d0,[zr,_sStopTimerCallback_80]
	ld r0,#0x0
	jc ne,d0,r0,&L65_80
L59_80:
.line 207
	ld d0,[zr,_sStartTimerCallback_80]
	ld r1,#0x0
	jc eq,d0,r1,&L37_80
.line 208
	ld i0,&_CharInput_LongPress_80
	ld i1,#0x1f4
	call d0
L37_80:
.line 209
	pop rt,d1
	ret
L50_80:
.line 178
	ld d0,#0x9
.line 185
	ld i0,[zr,_sCurrentCharMode_80]
	ld r1,#0x2
	jc ne,i0,r1,&L66_80
L61_80:
	ld r14,[zr,_sCurrentMode_80]
.line 191
	ld r1,#0x1
	jc ne,r14,r1,&L56_80
	jp &L62_80
L40_80:
.line 164
	ld d0,#0xa
	jp &L39_80
L65_80:
.line 206
	call d0
	jp &L59_80
L64_80:
.line 201
	ld i0,[zr,_sCurrentCharMode_80]
	call &_getChar_80
	ld i0,r14
	ld i1,[zr,_sCharacterChangedUserData_80]
	call d0
	jp &L58_80
L63_80:
.line 185
	jc eq,d0,r0,&L67_80
L62_80:
.line 192
	ld d1,[zr,_sCharacterDeployedCallback_80]
	ld r14,#0x0
	jc eq,d1,r14,&L56_80
.line 193
	call &_getChar_80
	ld i0,r14
	ld i1,[zr,_sCharacterDeployedUserData_80]
	call d1
	jp &L56_80
L67_80:
.line 186
	ld r14,[zr,_sCurrentCharMapListIndex_80]
	add r14,r1
	ld [zr,_sCurrentCharMapListIndex_80],r14
.line 187
	call &_getChar_80
	xb r14,r14
	ld r0,#0x0
	jc ne,r14,r0,&L55_80
.line 188
	ld [zr,_sCurrentCharMapListIndex_80],r14
	jp &L55_80

//****************************************
// Function: _CharInput_Char
//****************************************

.func _CharInput_Char_80, 1, void
.line 211
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
.line 212
	ld r14,[zr,_sQwerty_80]
	ld r0,#0x0
	jc eq,r14,r0,&L68_80
.line 215
	ld r14,[zr,_sCurrentCharMode_80]
	ld r0,#0x2
	jc eq,r14,r0,&L79_80
L70_80:
.line 220
	ld r14,#0x1f
	jc gtu,d1,r14,&L72_80
.line 222
	ld r14,d1
	add r14,#0xfffffff7
	ld r0,#0x1
	jc gtu,r14,r0,&L68_80
L72_80:
.line 231
	ld r14,#0xff
	jc leu,d1,r14,&L80_80
L68_80:
.line 236
	pop rt,d1
	ret
L79_80:
.line 217
	ld r14,i0
	add r14,#0xffffffd0
	ld r0,#0x9
	jc leu,r14,r0,&L70_80
.line 236
	pop rt,d1
	ret
L80_80:
.line 234
	ld i0,d1
	ld i1,[zr,_sCharacterChangedUserData_80]
	ld d0,[zr,_sCharacterChangedCallback_80]
	call d0
.line 235
	ld i0,d1
	ld i1,[zr,_sCharacterDeployedUserData_80]
	ld d0,[zr,_sCharacterDeployedCallback_80]
	call d0
.line 236
	pop rt,d1
	ret

//****************************************
// Function: _CharInput_Released
//****************************************

.func _CharInput_Released_80, 1, void
.line 238
	push rt,d0
	ld fr,sp
	add fr,#0xc
.line 239
	ld r14,[zr,_sQwerty_80]
	ld r0,#0x0
	jc ne,r14,r0,&L81_80
.line 242
	ld d0,[zr,_sStopTimerCallback_80]
	jc eq,d0,r14,&L83_80
.line 243
	call d0
L83_80:
.line 244
	ld d0,[zr,_sStartTimerCallback_80]
	ld r14,#0x0
	jc ne,d0,r14,&L85_80
L81_80:
.line 246
	pop rt,d0
	ret
L85_80:
.line 245
	ld i0,&_CharInput_ShortPress_80
	ld i1,#0x1f4
	call d0
.line 246
	pop rt,d0
	ret

//****************************************
// Function: _CharInput_RegisterTimerCallback
//****************************************

.func _CharInput_RegisterTimerCallback_80, 2, void
.line 248
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 249
	ld [zr,_sStartTimerCallback_80],i0
.line 250
	ld [zr,_sStopTimerCallback_80],i1
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_RegisterCharacterChangedCallback
//****************************************

.func _CharInput_RegisterCharacterChangedCallback_80, 2, void
.line 253
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 254
	ld [zr,_sCharacterChangedUserData_80],i1
.line 255
	ld [zr,_sCharacterChangedCallback_80],i0
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_RegisterCharacterDeployedCallback
//****************************************

.func _CharInput_RegisterCharacterDeployedCallback_80, 2, void
.line 258
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 259
	ld [zr,_sCharacterDeployedUserData_80],i1
.line 260
	ld [zr,_sCharacterDeployedCallback_80],i0
	pop fr,fr
	ret

//****************************************
// Function: _CharInput_ForceDeployment
//****************************************

.func _CharInput_ForceDeployment_80, 0, void
.line 271
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 272
	call &_CharInput_ShortPress_80
	pop rt,fr
	ret

//****************************************
// Function: _CharInput_setQwerty
//****************************************

.func _CharInput_setQwerty_80, 1, void
.line 275
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
.line 276
	ld r14,[zr,_sQwerty_80]
	ld r0,#0x0
	jc ne,r14,r0,&L93_80
	jc eq,i0,r14,&L93_80
	ld d1,[zr,_sStopTimerCallback_80]
	jc ne,d1,r0,&L94_80
L93_80:
.line 278
	ld [zr,_sQwerty_80],d0
	pop rt,d1
	ret
L94_80:
.line 277
	call d1
.line 278
	ld [zr,_sQwerty_80],d0
	pop rt,d1
	ret

//****************************************
// Function: __ZN6MAUtil11KeyListener13keyPressEventEi
//****************************************

.func __ZN6MAUtil11KeyListener13keyPressEventEi_83, 2, void
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Environment.h'
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

.func __ZN6MAUtil11KeyListener15keyReleaseEventEi_83, 2, void
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

.func __ZN4MAUI7EditBox10deactivateEv_83, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 107
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB2_83:
.line 108
	ld.b r14,[i0,169]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L8_83
.line 109
	ld.b r14,[i0,168]
	and r14,#0xff
	jc ne,r14,r0,&L14_83
L10_83:
.line 114
	ld r14,#0x0
	ld.b [d1,176],r14
.line 115
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	call &__ZN6MAUtil9CharInput15forceDeploymentEv_72
.line 117
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld d0,d1
	add d0,#0x9c
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil9CharInput19isCharInputListenerEPNS_17CharInputListenerE_72
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L15_83
L12_83:
.line 119
	ld r14,#0x0
	ld.b [d1,169],r14
.line 120
	ld r14,[d1]
	ld d0,[r14,48]
	ld i0,d1
	ld i1,#0x0
	call d0
L8_83:
.line 121
	pop rt,d1
	ret
L14_83:
.line 110
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld d0,d1
	add d0,#0xa0
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment13isKeyListenerEPNS_11KeyListenerE_62
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L10_83
.line 111
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment17removeKeyListenerEPNS_11KeyListenerE_62
	jp &L10_83
L15_83:
.line 118
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil9CharInput23removeCharInputListenerEPNS_17CharInputListenerE_72
	jp &L12_83

//****************************************
// Function: __ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_83, 2, void
.line 136
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
LBB5_83:
.line 140
	call &__ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE_88
.line 141
	ld d1,d0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,[d0,164]
	jc gt,r0,r14,&L20_83
.line 142
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
LBE5_83:
	pop rt,d1
	ret
L20_83:
.line 141
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld [d0,164],r14
.line 142
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
LBE6_83:
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI7EditBox10setCaptionERKN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN4MAUI7EditBox10setCaptionERKN6MAUtil11BasicStringIcEE_83, 2, void
.line 132
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB7_83:
.line 133
	call &__ZN4MAUI7EditBox7setTextERKN6MAUtil11BasicStringIcEE_83
LBE7_83:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK4MAUI7EditBox7getTextEv
//****************************************

.func __ZNK4MAUI7EditBox7getTextEv_83, 1, int
.line 145
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB8_83:
.line 146
	ld.b r14,[i0,205]
	and r14,#0xff
	ld r15,i0
	add r15,#0xd0
	ld r0,#0x0
	jc ne,r14,r0,&L24_83
	add r15,#0xffffffa8
L24_83:
.line 147
	ld r14,r15
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox12setInputModeENS0_9InputModeE
//****************************************

.func __ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_83, 2, void
.line 167
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB10_83:
.line 168
	ld r14,#0x1
	jc eq,i1,r14,&L34_83
.line 170
	ld r14,#0x0
	jc eq,i1,r14,&L35_83
.line 173
	ld r14,#0x2
	jc eq,i1,r14,&L36_83
L29_83:
.line 176
	ld [d1,188],d0
LBE10_83:
	pop rt,d1
	ret
L35_83:
.line 171
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	ld i1,#0x2
	call &__ZN6MAUtil9CharInput7setModeENS0_8CharModeE_72
L37_83:
.line 176
	ld [d1,188],d0
LBE11_83:
	pop rt,d1
	ret
L34_83:
.line 169
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	ld i1,#0x0
.line 171
	call &__ZN6MAUtil9CharInput7setModeENS0_8CharModeE_72
	jp &L37_83
L36_83:
.line 174
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	ld i1,#0x1
	call &__ZN6MAUtil9CharInput9setQwertyEb_72
	jp &L29_83

//****************************************
// Function: __ZN4MAUI7EditBox8activateEv
//****************************************

.func __ZN4MAUI7EditBox8activateEv_83, 1, void
.line 95
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB13_83:
.line 96
	ld.b r0,[i0,169]
	and r0,#0xff
	ld r14,#0x0
	jc ne,r0,r14,&L38_83
.line 97
	ld.b r14,[i0,168]
	and r14,#0xff
	jc eq,r14,r0,&L40_83
.line 98
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d1
	add i1,#0xa0
	call &__ZN6MAUtil11Environment14addKeyListenerEPNS_11KeyListenerE_62
L40_83:
.line 100
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	ld i1,d1
	add i1,#0x9c
	call &__ZN6MAUtil9CharInput20addCharInputListenerEPNS_17CharInputListenerE_72
.line 101
	ld r14,#0x1
	ld.b [d1,169],r14
.line 102
	ld i0,d1
	ld i1,[d1,188]
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_83
.line 103
	ld r14,[d1]
	ld d0,[r14,48]
	ld i0,d1
	ld i1,#0x1
	call d0
L38_83:
.line 105
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI7EditBox11setSelectedEb
//****************************************

.func __ZN4MAUI7EditBox11setSelectedEb_83, 2, void
.line 83
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i1
LBB14_83:
.line 84
	ld.b r0,[i0,169]
	ld r14,r0
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L42_83
	ld r14,i1
	and r14,#0xff
	ld r1,#0x1
	jc eq,r14,r1,&L45_83
L42_83:
.line 87
	ld r14,r0
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L43_83
	ld r14,d1
	and r14,#0xff
	jc eq,r14,r0,&L46_83
L43_83:
.line 90
	ld i0,d0
	ld i1,d1
	call &__ZN4MAUI6Widget11setSelectedEb_93
LBE14_83:
	pop rt,d1
	ret
L46_83:
.line 88
	ld i0,d0
	call &__ZN4MAUI7EditBox10deactivateEv_83
.line 90
	ld i0,d0
	ld i1,d1
	call &__ZN4MAUI6Widget11setSelectedEb_93
LBE15_83:
	pop rt,d1
	ret
L45_83:
.line 85
	call &__ZN4MAUI7EditBox8activateEv_83
	jp &L43_83

//****************************************
// Function: __ZN4MAUI7EditBox10drawWidgetEv
//****************************************

.func __ZN4MAUI7EditBox10drawWidgetEv_83, 1, void
.line 211
	push rt,d4
	sub sp,#0x2c
	ld fr,sp
	add fr,#0x48
	ld d0,i0
LBB20_83:
.line 212
	ld r14,[i0,128]
	ld r0,#0x0
	jc ne,r14,r0,&L64_83
L54_83:
.line 268
	add sp,#0x2c
	pop rt,d4
	ret
L64_83:
.line 216
	ld d4,r0
.line 217
	ld d3,r0
LBB24_83:
.line 219
	ld d2,fr
	add d2,#0xffffffd0
	ld r14,i0
	add r14,#0x50
LBB25_83:
	ld r0,&__ZTVN6MAUtil4RectE_73+8
	ld [d2],r0
	ld r0,[r14,12]
	ld [fr,-36],r0
	ld r14,[r14,16]
	ld [fr,-32],r14
LBE25_83:
.line 220
	ld [fr,-44],d4
.line 221
	ld [fr,-40],d4
.line 222
	ld i1,fr
	add i1,#0xffffffd4
	ld i2,fr
	add i2,#0xffffffd8
	call &__ZN4MAUI5Label12getTextStartEPiS1__88
.line 223
	ld.b r14,[d0,134]
	and r14,#0xff
	jc eq,r14,d4,&L65_83
.line 227
	ld r0,#0x0
	ld [fr,-44],r0
.line 231
	ld d1,d0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i1,[d0,128]
	ld i2,[d0,164]
	ld [sp],d2
	ld i0,fr
	add i0,#0xffffffbc
	ld i3,r14
	call &__ZNK4MAUI4Font20calculateRectOfIndexEiPKcRKN6MAUtil4RectE_85
.line 233
	ld.b r14,[d0,134]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L59_83
L66_83:
.line 235
	ld r0,[fr,-40]
	ld r14,[fr,-60]
	add r0,r14
	ld r14,[fr,-52]
	add r0,r14
	ld r14,r0
	add r14,#0x2
	ld r1,[d0,96]
	jc le,r14,r1,&L60_83
.line 236
	ld d4,r1
	sub d4,r0
	add d4,#0xfffffffe
L60_83:
.line 241
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d0,128]
	ld i3,[fr,-40]
	add i3,d4
	ld [sp],d2
	ld i1,r14
	ld i2,[fr,-44]
	call &__ZN4MAUI4Font17drawBoundedStringEPKciiRKN6MAUtil4RectE_85
L61_83:
.line 257
	ld i0,[d0,172]
	syscall 32
LBB26_83:
.line 258
	ld.b r14,[d0,61]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L54_83
LBB27_83:
.line 261
	ld r14,[fr,-64]
	add d3,r14
	ld r0,[fr,-44]
	add d3,r0
.line 262
	ld r14,[fr,-60]
	add d4,r14
	ld r0,[fr,-40]
	add d4,r0
.line 266
	ld i0,d3
	ld i1,d4
	ld i2,d3
	ld i3,[fr,-52]
	add i3,d4
	call &_Gfx_line_67
	jp &L54_83
L65_83:
.line 224
	ld r14,#0xffff
	ld [fr,-32],r14
.line 225
	ld [fr,-36],r14
.line 231
	ld d1,d0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i1,[d0,128]
	ld i2,[d0,164]
	ld [sp],d2
	ld i0,fr
	add i0,#0xffffffbc
	ld i3,r14
	call &__ZNK4MAUI4Font20calculateRectOfIndexEiPKcRKN6MAUtil4RectE_85
.line 233
	ld.b r14,[d0,134]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L66_83
L59_83:
.line 245
	ld r0,[fr,-44]
	ld r14,[fr,-64]
	add r0,r14
	ld r14,[fr,-56]
	add r0,r14
	ld r14,r0
	add r14,#0x2
	ld r1,[d0,92]
	jc le,r14,r1,&L62_83
.line 246
	ld d3,r1
	sub d3,r0
	add d3,#0xfffffffe
L62_83:
.line 252
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d0,128]
	ld i1,r14
	ld i2,[fr,-44]
	add i2,d3
	ld i3,[fr,-40]
	call &__ZN4MAUI4Font10drawStringEPKcii_85
	jp &L61_83

//****************************************
// Function: __ZThn160_N4MAUI7EditBox15keyReleaseEventEii
//****************************************

.func __ZThn160_N4MAUI7EditBox15keyReleaseEventEii_83, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBox15keyReleaseEventEii_83
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox15keyReleaseEventEii
//****************************************

.func __ZN4MAUI7EditBox15keyReleaseEventEii_83, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 299
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 299
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox10setEnabledEb
//****************************************

.func __ZN4MAUI7EditBox10setEnabledEb_83, 2, void
.line 436
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
	ld d0,i1
LBB28_83:
.line 437
	call &__ZN4MAUI6Widget10setEnabledEb_93
.line 438
	and d0,#0xff
	ld r14,#0x0
	jc eq,d0,r14,&L71_83
LBE28_83:
.line 440
	pop rt,d1
	ret
L71_83:
.line 439
	ld i0,d1
	call &__ZN4MAUI7EditBox10deactivateEv_83
LBE29_83:
.line 440
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI7EditBox18fireCharacterAddedEc
//****************************************

.func __ZN4MAUI7EditBox18fireCharacterAddedEc_83, 2, void
.line 471
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
LBB30_83:
.line 472
	ld d2,#0x0
LBB33_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld d1,i0
	add d1,#0xc0
LBB34_83:
	ld r14,[d1]
LBE34_83:
	jc le,r14,d2,&L80_83
L82_83:
.line 355
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE36_83:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,16]
	ld i1,d3
	ld i2,d4
	call d0
Ltext6_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 472
	add d2,#0x1
LBB37_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld r14,[d1]
LBE38_83:
	jc gt,r14,d2,&L82_83
L80_83:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox20fireCharacterChangedEc
//****************************************

.func __ZN4MAUI7EditBox20fireCharacterChangedEc_83, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 465
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
LBB39_83:
.line 466
	ld d2,#0x0
LBB42_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld d1,i0
	add d1,#0xc0
LBB43_83:
	ld r14,[d1]
LBE43_83:
	jc le,r14,d2,&L91_83
L93_83:
.line 355
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE45_83:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,12]
	ld i1,d3
	ld i2,d4
	call d0
Ltext10_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 466
	add d2,#0x1
LBB46_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld r14,[d1]
LBE47_83:
	jc gt,r14,d2,&L93_83
L91_83:
	pop rt,d4
	ret

//****************************************
// Function: __ZThn156_N4MAUI7EditBox16characterChangedEc
//****************************************

.func __ZThn156_N4MAUI7EditBox16characterChangedEc_83, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff64
	call &__ZN4MAUI7EditBox16characterChangedEc_83
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox16characterChangedEc
//****************************************

.func __ZN4MAUI7EditBox16characterChangedEc_83, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 304
	push rt,d4
	sub sp,#0xc
	ld fr,sp
	add fr,#0x28
	ld d0,i0
	ld d2,i1
LBB48_83:
.line 307
	ld.b r0,[i0,176]
	ld r14,r0
	and r14,#0xff
	ld d1,i0
	add d1,#0x78
	ld r1,#0x0
	jc eq,r14,r1,&L104_83
.line 317
	ld r14,r0
	and r14,#0xff
	ld r1,#0x0
	jc eq,r14,r1,&L105_83
L103_83:
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
L99_83:
.line 323
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEixEi_70
	ld.b [r14],d2
L98_83:
.line 325
	ld r0,#0x1
	ld.b [d0,176],r0
.line 326
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 328
	ld i0,d0
	ld i1,d2
	call &__ZN4MAUI7EditBox20fireCharacterChangedEc_83
.line 331
	ld r1,#0x1
	ld.b [d0,116],r1
LBE49_83:
	add sp,#0xc
	pop rt,d4
	ret
L104_83:
.line 307
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,[d0,184]
	jc lt,r14,r0,&L106_83
	ld.b r0,[d0,176]
.line 317
	ld r14,r0
	and r14,#0xff
	ld r1,#0x0
	jc ne,r14,r1,&L103_83
L105_83:
.line 318
	ld r14,[d0,164]
	ld [zr,__ZN4MAUI12currentIndexE_83],r14
.line 319
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	add r14,#0xffffffff
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
	jc ge,r14,i1,&L99_83
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	add r14,#0xffffffff
	ld [zr,__ZN4MAUI12currentIndexE_83],r14
	ld i1,r14
	jp &L99_83
L106_83:
.line 310
	ld d4,fr
	add d4,#0xffffffe0
	xb r14,d2
	ld [sp],r14
	ld i0,d4
	ld i1,&LC1_83
	call &_sprintf_37
.line 311
	ld r1,[d0,164]
	ld [zr,__ZN4MAUI12currentIndexE_83],r1
.line 313
	ld d3,fr
	add d3,#0xffffffdc
	ld i0,d3
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d1
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
	ld i2,d3
	call &__ZN6MAUtil11BasicStringIcE6insertEiRKS1__70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
.line 314
	ld.b r14,[d0,205]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L98_83
.line 315
	ld i0,d3
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	add i0,#0xd0
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
	ld i2,d3
	call &__ZN6MAUtil11BasicStringIcE6insertEiRKS1__70
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	jp &L98_83

//****************************************
// Function: __ZN4MAUI7EditBox20fireCharacterDeletedEc
//****************************************

.func __ZN4MAUI7EditBox20fireCharacterDeletedEc_83, 2, void
.line 459
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
	ld d4,i1
LBB55_83:
.line 460
	ld d2,#0x0
LBB58_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld d1,i0
	add d1,#0xc0
LBB59_83:
	ld r14,[d1]
LBE59_83:
	jc le,r14,d2,&L115_83
L117_83:
.line 355
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE61_83:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,d3
	ld i2,d4
	call d0
Ltext15_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 460
	add d2,#0x1
LBB62_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld r14,[d1]
LBE63_83:
	jc gt,r14,d2,&L117_83
L115_83:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox15fireCursorMovedEi
//****************************************

.func __ZN4MAUI7EditBox15fireCursorMovedEi_83, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 453
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d2,i0
	ld d4,i1
LBB64_83:
.line 454
	ld d3,#0x0
LBB67_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld d1,i0
	add d1,#0xc0
LBB68_83:
	ld r14,[d1]
LBE68_83:
	jc le,r14,d3,&L126_83
L128_83:
.line 355
	ld r14,d3
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE70_83:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14,4]
	ld i1,d2
	ld i2,[d2,164]
	ld i3,d4
	call d0
Ltext19_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 454
	add d3,#0x1
LBB71_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld r14,[d1]
LBE72_83:
	jc gt,r14,d3,&L128_83
L126_83:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox20moveCursorHorizontalEib
//****************************************

.func __ZN4MAUI7EditBox20moveCursorHorizontalEib_83, 3, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 357
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d2,i0
	ld d0,i1
	ld d3,i2
LBB73_83:
.line 359
	ld d1,[i0,164]
	add d1,i1
	ld r0,#0x0
	jc lt,d1,r0,&L131_83
	add i0,#0x78
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	jc le,d1,r14,&L130_83
L131_83:
.line 360
	ld r14,d3
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L134_83
.line 362
	ld r14,#0x0
L129_83:
.line 371
	pop rt,d3
	ret
L130_83:
.line 365
	ld i1,[d2,164]
.line 366
	add d0,i1
	ld [d2,164],d0
.line 367
	ld r14,d3
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L135_83
.line 370
	ld r14,#0x1
L136_83:
.line 371
	pop rt,d3
	ret
L134_83:
.line 361
	ld i0,d2
	ld i1,[d2,164]
	call &__ZN4MAUI7EditBox15fireCursorMovedEi_83
.line 362
	ld r14,#0x0
	jp &L129_83
L135_83:
.line 368
	ld i0,d2
	call &__ZN4MAUI7EditBox15fireCursorMovedEi_83
.line 370
	ld r14,#0x1
	jp &L136_83

//****************************************
// Function: __ZN4MAUI7EditBox15fireTextChangedEv
//****************************************

.func __ZN4MAUI7EditBox15fireTextChangedEv_83, 1, void
.line 446
	push rt,d4
	ld fr,sp
	add fr,#0x1c
	ld d3,i0
LBB79_83:
.line 447
	ld d2,#0x0
LBB82_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld d1,i0
	add d1,#0xc0
LBB83_83:
	ld r14,[d1]
LBE83_83:
	jc le,r14,d2,&L145_83
	ld d4,i0
	add d4,#0x78
L143_83:
.line 355
	ld r14,d2
	sll r14,#0x2
	ld r0,[d1,8]
	add r14,r0
LBE85_83:
	ld i0,[r14]
	ld r14,[i0]
	ld d0,[r14]
	ld i1,d3
	ld i2,d4
	call d0
Ltext23_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 447
	add d2,#0x1
LBB86_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 258
	ld r14,[d1]
LBE87_83:
	jc gt,r14,d2,&L143_83
L145_83:
	pop rt,d4
	ret

//****************************************
// Function: __ZN4MAUI7EditBox15deleteCharacterEi
//****************************************

.func __ZN4MAUI7EditBox15deleteCharacterEi_83, 2, int
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 373
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
	ld d0,i1
LBB88_83:
.line 380
	ld r0,#0x0
	jc lt,i1,r0,&L148_83
	ld d2,i0
	add d2,#0x78
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	jc gt,r14,d0,&L147_83
L148_83:
	ld r14,#0x0
LBE89_83:
.line 405
	pop rt,d3
	ret
L147_83:
.line 381
	ld i0,d2
	ld i1,d0
	call &__ZN6MAUtil11BasicStringIcEixEi_70
	ld.b d3,[r14]
.line 383
	ld.b r14,[d1,205]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L149_83
.line 384
	ld i0,d1
	add i0,#0xd0
	ld i1,d0
	ld i2,#0x1
	call &__ZN6MAUtil11BasicStringIcE6removeEii_70
L149_83:
.line 387
	ld i0,d2
	ld i1,d0
	ld i2,#0x1
	call &__ZN6MAUtil11BasicStringIcE6removeEii_70
.line 397
	ld i0,d1
	ld i1,d3
	call &__ZN4MAUI7EditBox20fireCharacterDeletedEc_83
.line 398
	ld i0,d1
	call &__ZN4MAUI7EditBox15fireTextChangedEv_83
.line 399
	ld i0,d1
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 402
	ld r14,#0x1
	ld.b [d1,116],r14
.line 404
	ld r14,#0x1
LBE91_83:
.line 405
	pop rt,d3
	ret

//****************************************
// Function: __ZN4MAUI7EditBox23deletePreviousCharacterEv
//****************************************

.func __ZN4MAUI7EditBox23deletePreviousCharacterEv_83, 1, int
.line 411
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
LBB92_83:
.line 426
	ld d2,[i0,164]
	add d2,#0xffffffff
.line 427
	ld i1,d2
	call &__ZN4MAUI7EditBox15deleteCharacterEi_83
.line 428
	ld d0,r14
	and d0,#0xff
	ld r14,d0
	ld r0,#0x0
	jc ne,d0,r0,&L154_83
LBE93_83:
.line 434
	pop rt,d2
	ret
L154_83:
.line 429
	ld [d1,164],d2
.line 431
	ld d2,d1
	add d2,#0x78
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,[d1,164]
	jc gt,r0,r14,&L155_83
.line 433
	ld r14,d0
L156_83:
.line 434
	pop rt,d2
	ret
L155_83:
.line 431
	ld i0,d2
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld [d1,164],r14
.line 433
	ld r14,d0
	jp &L156_83

//****************************************
// Function: __ZThn160_N4MAUI7EditBox13keyPressEventEii
//****************************************

.func __ZThn160_N4MAUI7EditBox13keyPressEventEii_83, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBox13keyPressEventEii_83
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox13keyPressEventEii
//****************************************

.func __ZN4MAUI7EditBox13keyPressEventEii_83, 3, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 270
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB98_83:
.line 271
	ld r0,#0x23
	jc eq,i1,r0,&L165_83
	jc le,i1,r0,&L170_83
	ld r0,#0x113
	jc eq,i1,r0,&L162_83
	ld r14,#0x114
	jc eq,i1,r14,&L171_83
L158_83:
.line 297
	pop rt,d1
	ret
L170_83:
.line 271
	ld r14,#0xc
	jc ne,i1,r14,&L158_83
.line 284
	ld r14,#0x0
	ld.b [i0,176],r14
.line 285
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	call &__ZN6MAUtil9CharInput15forceDeploymentEv_72
.line 286
	ld i0,d1
	call &__ZN4MAUI7EditBox23deletePreviousCharacterEv_83
LBE99_83:
.line 297
	pop rt,d1
	ret
L165_83:
.line 289
	ld.b r14,[i0,204]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L159_83
	ld r14,[i0,188]
	ld r0,#0x1
	jc eq,r14,r0,&L172_83
L159_83:
.line 295
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	call &__ZN6MAUtil9CharInput15forceDeploymentEv_72
.line 296
	ld i0,d1
	call &__ZN4MAUI6Widget14requestRepaintEv_93
LBE100_83:
.line 297
	pop rt,d1
	ret
L162_83:
.line 276
	ld i1,#0x1
	ld i2,i1
L169_83:
	call &__ZN4MAUI7EditBox20moveCursorHorizontalEib_83
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L159_83
LBE101_83:
.line 297
	pop rt,d1
	ret
L171_83:
.line 273
	ld i1,#0xffffffff
	ld i2,#0x1
	jp &L169_83
L172_83:
.line 290
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld d0,r14
	call &__ZN6MAUtil9CharInput12getCharInputEv_72
	ld i0,r14
	call &__ZNK6MAUtil9CharInput7getModeEv_72
	add r14,#0x1
	ld i0,d0
	ld i1,r14
	and i1,#0x1
	call &__ZN6MAUtil9CharInput7setModeENS0_8CharModeE_72
	jp &L159_83

//****************************************
// Function: __ZThn156_N4MAUI7EditBox17characterDeployedEc
//****************************************

.func __ZThn156_N4MAUI7EditBox17characterDeployedEc_83, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff64
	call &__ZN4MAUI7EditBox17characterDeployedEc_83
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBox17characterDeployedEc
//****************************************

.func __ZN4MAUI7EditBox17characterDeployedEc_83, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 334
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d0,i0
	ld d2,i1
LBB104_83:
.line 338
	ld r0,#0x0
	ld.b [i0,176],r0
.line 339
	ld d1,i0
	add d1,#0x78
	ld i0,d1
	call &__ZNK6MAUtil11BasicStringIcE6lengthEv_70
	ld r0,[d0,184]
	add r0,#0x1
	jc ge,r14,r0,&L175_83
.line 341
	ld r14,[d0,164]
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
	jc eq,r14,i1,&L181_83
L177_83:
.line 346
	ld.b r14,[d0,205]
	and r14,#0xff
	ld r0,#0x0
.line 350
	ld i0,d1
.line 346
	jc eq,r14,r0,&L180_83
.line 347
	ld i0,d1
	call &__ZN6MAUtil11BasicStringIcEixEi_70
	ld r0,#0x2a
	ld.b [r14],r0
.line 348
	ld i0,d0
	add i0,#0xd0
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
L180_83:
.line 350
	call &__ZN6MAUtil11BasicStringIcEixEi_70
	ld.b [r14],d2
.line 352
	ld i0,d0
	call &__ZN4MAUI7EditBox15fireTextChangedEv_83
.line 353
	ld i0,d0
	ld i1,d2
	call &__ZN4MAUI7EditBox18fireCharacterAddedEc_83
.line 354
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
L175_83:
.line 355
	pop rt,d2
	ret
L181_83:
.line 343
	ld i0,d0
	ld i1,#0x1
	ld i2,#0x0
	call &__ZN4MAUI7EditBox20moveCursorHorizontalEib_83
	ld i1,[zr,__ZN4MAUI12currentIndexE_83]
	jp &L177_83

//****************************************
// Function: __ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE
//****************************************

.func __ZN4MAUI7EditBoxC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontEbbiNS0_9InputModeE_83, 13, void
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
LBB115_83:
.line 63
	ld r14,[fr]
	ld [sp],r14
	ld r14,[fr,4]
	ld [sp,4],r14
	ld [sp,8],d2
	ld [sp,12],d1
	ld [sp,16],d4
	call &__ZN4MAUI5LabelC2EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88
	ld r14,&__ZTVN4MAUI7EditBoxE_83+8
	ld [d3],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_83+128
	ld [d3,156],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_83+144
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
LBB116_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 104
	ld d0,d3
	add d0,#0xc0
LBB117_83:
.line 109
	ld i0,#0x10
	call &__Znam_57
	ld [d0,8],r14
.line 111
	ld r14,#0x4
	ld [d0,4],r14
.line 113
	ld r14,#0x0
	ld [d0],r14
LBE117_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,#0x1
	ld.b [d3,204],r14
	ld r14,#0x0
	ld.b [d3,205],r14
	ld i0,d3
	add i0,#0xd0
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
.line 64
	ld i0,d3
	ld i1,d1
	call &__ZN4MAUI6Widget18setBackgroundColorEi_93
.line 65
	ld i0,d3
	ld i1,#0x1
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
.line 67
	ld i0,d3
	ld.b i1,[fr,24]
	call &__ZN4MAUI5Label12setMultiLineEb_88
.line 69
	ld i0,d3
	ld i1,d2
	call &__ZN4MAUI7EditBox10setCaptionERKN6MAUtil11BasicStringIcEE_83
.line 71
	ld r14,#0x0
	jc eq,d4,r14,&L198_83
.line 74
	ld [d3,128],d4
L197_83:
.line 78
	ld i0,d3
	add i0,#0x78
	ld i1,d5
	call &__ZN6MAUtil11BasicStringIcE7reserveEi_70
.line 80
	ld i0,d3
	ld i1,d6
	call &__ZN4MAUI7EditBox12setInputModeENS0_9InputModeE_83
LBE115_83:
	add sp,#0x14
	pop rt,d6
	ret
L198_83:
.line 72
	call &__ZN4MAUI6Engine12getSingletonEv_84
	ld i0,r14
	call &__ZN4MAUI6Engine14getDefaultFontEv_84
	ld [d3,128],r14
	jp &L197_83

//****************************************
// Function: __ZThn160_N4MAUI7EditBoxD1Ev
//****************************************

.func __ZThn160_N4MAUI7EditBoxD1Ev_83, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBoxD1Ev_83
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBoxD1Ev
//****************************************

.func __ZN4MAUI7EditBoxD1Ev_83, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 494
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB149_83:
.line 494
	ld r14,&__ZTVN4MAUI7EditBoxE_83+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_83+128
	ld [i0,156],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_83+144
	ld [i0,160],r14
	add i0,#0xd0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBB150_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 136
	ld i0,[d0,200]
	ld r14,#0x0
	jc ne,i0,r14,&L255_83
LBE151_83:
	ld i0,d0
	add i0,#0xa0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBB152_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,&__ZTVN4MAUI5LabelE_88+8
	ld [d0],r14
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN4MAUI6WidgetD2Ev_93
LBE153_83:
.line 494
	pop rt,d0
	ret
L255_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
LBE156_83:
	ld i0,d0
	add i0,#0xa0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBB157_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,&__ZTVN4MAUI5LabelE_88+8
	ld [d0],r14
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN4MAUI6WidgetD2Ev_93
LBE158_83:
.line 494
	pop rt,d0
	ret

//****************************************
// Function: __ZThn160_N4MAUI7EditBoxD0Ev
//****************************************

.func __ZThn160_N4MAUI7EditBoxD0Ev_83, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.h'
.line 66
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 66
	add i0,#0xffffff60
	call &__ZN4MAUI7EditBoxD0Ev_83
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI7EditBoxD0Ev
//****************************************

.func __ZN4MAUI7EditBoxD0Ev_83, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 494
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB159_83:
.line 494
	ld r14,&__ZTVN4MAUI7EditBoxE_83+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_83+128
	ld [i0,156],r14
	ld r14,&__ZTVN4MAUI7EditBoxE_83+144
	ld [i0,160],r14
	add i0,#0xd0
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
LBB160_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 136
	ld i0,[d0,200]
	ld r14,#0x0
	jc ne,i0,r14,&L270_83
L263_83:
	ld i0,d0
	add i0,#0xa0
	call &__ZN6MAUtil11KeyListenerD2Ev_62
LBB162_83:
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\EditBox.cpp'
.line 63
	ld r14,&__ZTVN4MAUI5LabelE_88+8
	ld [d0],r14
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcED1Ev_70
	ld i0,d0
	call &__ZN4MAUI6WidgetD2Ev_93
LBE163_83:
.line 494
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret
L270_83:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Vector.h'
.line 136
	call &__ZdaPv_54
	jp &L263_83

//****************************************
// Function: __ZN4MAUI6EngineC1Ev
//****************************************

.func __ZN4MAUI6EngineC1Ev_84, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.cpp'
.line 34
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB6_84:
.line 34
	ld d0,i0
	add d0,#0x4
LBE7_84:
	ld r0,&__ZTVN4MAUI6EngineE_84+8
	ld [i0],r0
	ld r14,&__ZTVN4MAUI6EngineE_84+36
	ld [d0],r14
LBB8_84:
.sourcefile '\mb\MoSyncReleasePackage\include\MAUtil\Geometry.h'
.line 39
	ld r14,i0
	add r14,#0xc
LBB9_84:
	ld r0,#0x0
	ld [r14,4],r0
	ld [r14],r0
LBE9_84:
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
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_84],i0
.line 41
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld i0,r14
	ld i1,d0
	call &__ZN6MAUtil11Environment16addFocusListenerEPNS_13FocusListenerE_62
LBE6_84:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI6Engine7setMainEPNS_6WidgetE
//****************************************

.func __ZN4MAUI6Engine7setMainEPNS_6WidgetE_84, 2, void
.line 44
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d0,i1
LBB10_84:
.line 45
	ld i0,i1
	call &__ZNK4MAUI6Widget11getPositionEv_93
	ld d2,r14
	ld i0,d0
	call &__ZNK4MAUI6Widget11getPositionEv_93
	ld r0,[d0]
	ld d1,[r0,24]
	ld i0,d0
	ld i1,[d2]
	ld i2,[r14,4]
	call d1
.line 46
	ld [d3,20],d0
LBE10_84:
	pop rt,d3
	ret

//****************************************
// Function: __ZN4MAUI6EngineD1Ev
//****************************************

.func __ZN4MAUI6EngineD1Ev_84, 1, void
.line 50
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB13_84:
.line 50
	ld r14,&__ZTVN4MAUI6EngineE_84+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI6EngineE_84+36
	ld [i0,4],r14
.line 51
	ld i0,[i0,20]
	ld r14,#0x0
	jc ne,i0,r14,&L28_84
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_84],r14
LBE13_84:
.line 54
	pop rt,d0
	ret
L28_84:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_84],r14
LBE14_84:
.line 54
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI6EngineD0Ev
//****************************************

.func __ZN4MAUI6EngineD0Ev_84, 1, void
.line 50
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB15_84:
.line 50
	ld r14,&__ZTVN4MAUI6EngineE_84+8
	ld [i0],r14
	ld r14,&__ZTVN4MAUI6EngineE_84+36
	ld [i0,4],r14
.line 51
	ld i0,[i0,20]
	ld r14,#0x0
	jc ne,i0,r14,&L36_84
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_84],r14
LBE15_84:
.line 54
	ld i0,d1
	call &__ZdlPv_55
	pop rt,d1
	ret
L36_84:
.line 52
	ld r14,[i0]
	ld d0,[r14,84]
	call d0
.line 53
	ld r14,#0x0
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_84],r14
LBE16_84:
.line 54
	ld i0,d1
	call &__ZdlPv_55
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI6Engine14setDefaultSkinEPNS_10WidgetSkinE
//****************************************

.func __ZN4MAUI6Engine14setDefaultSkinEPNS_10WidgetSkinE_84, 2, void
.line 56
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB17_84:
.line 57
	ld [i0,28],i1
LBE17_84:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine14setDefaultFontEPNS_4FontE
//****************************************

.func __ZN4MAUI6Engine14setDefaultFontEPNS_4FontE_84, 2, void
.line 60
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB18_84:
.line 61
	ld [i0,24],i1
LBE18_84:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine14getDefaultSkinEv
//****************************************

.func __ZN4MAUI6Engine14getDefaultSkinEv_84, 1, int
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

.func __ZN4MAUI6Engine14getDefaultFontEv_84, 1, int
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

.func __ZThn4_N4MAUI6Engine9focusLostEv_84, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.h'
.line 41
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 41
	add i0,#0xfffffffc
	call &__ZN4MAUI6Engine9focusLostEv_84
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine9focusLostEv
//****************************************

.func __ZN4MAUI6Engine9focusLostEv_84, 1, void
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

.func __ZN4MAUI6Engine15requestUIUpdateEv_84, 1, void
.line 178
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB19_84:
.line 179
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld r0,[r14]
	ld d0,[r0]
	ld i0,r14
	ld i1,d1
	call d0
LBE19_84:
	pop rt,d1
	ret

//****************************************
// Function: __ZThn4_N4MAUI6Engine11focusGainedEv
//****************************************

.func __ZThn4_N4MAUI6Engine11focusGainedEv_84, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.h'
.line 41
	push rt,fr
	ld fr,sp
	add fr,#0x8
.line 41
	add i0,#0xfffffffc
	call &__ZN4MAUI6Engine11focusGainedEv_84
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine11focusGainedEv
//****************************************

.func __ZN4MAUI6Engine11focusGainedEv_84, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Engine.cpp'
.line 174
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB20_84:
.line 175
	call &__ZN4MAUI6Engine15requestUIUpdateEv_84
LBE20_84:
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI6Engine7repaintEv
//****************************************

.func __ZN4MAUI6Engine7repaintEv_84, 1, void
.line 182
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d1,i0
LBB21_84:
.line 184
	ld r14,[i0,20]
	ld r0,#0x0
	jc ne,r14,r0,&L49_84
LBE22_84:
.line 212
	pop rt,d3
	ret
L49_84:
.line 188
	call &_Gfx_clearClipRect_67
.line 189
	call &_Gfx_clearMatrix_67
.line 192
	syscall 46
	ld d3,r14
	sra d3,#0x10
.line 193
	syscall 46
	xh d2,r14
.line 195
	ld i0,#0x0
	ld i1,i0
	ld i2,d3
	ld i3,d2
	call &_Gfx_pushClipRect_67
.line 196
	ld i0,[d1,20]
	ld r14,[i0]
	ld d0,[r14,12]
	call d0
.line 197
	ld i0,[d1,20]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,#0x0
	call d0
.line 198
	call &_Gfx_popClipRect_67
.line 200
	ld r14,[d1,8]
	ld r0,#0x0
	jc ne,r14,r0,&L50_84
.line 211
	syscall 44
L51_84:
.line 212
	pop rt,d3
	ret
L50_84:
.line 201
	call &_Gfx_clearClipRect_67
.line 202
	call &_Gfx_clearMatrix_67
.line 203
	ld i0,#0x0
	ld i1,i0
	ld i2,d3
	ld i3,d2
	call &_Gfx_pushClipRect_67
.line 205
	ld i0,[d1,8]
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 206
	ld i0,[d1,12]
	ld i1,[d1,16]
	call &_Gfx_translate_67
.line 207
	ld i0,[d1,8]
	ld r14,[i0]
	ld d0,[r14,12]
	call d0
.line 208
	ld i0,[d1,8]
	ld r14,[i0]
	ld d0,[r14,8]
	ld i1,#0x0
	call d0
.line 211
	syscall 44
	jp &L51_84

//****************************************
// Function: __ZN4MAUI6Engine4idleEv
//****************************************

.func __ZN4MAUI6Engine4idleEv_84, 1, void
.line 214
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d1,i0
LBB27_84:
.line 216
	call &__ZN4MAUI6Engine7repaintEv_84
.line 217
	call &__ZN6MAUtil11Environment14getEnvironmentEv_62
	ld r0,[r14]
	ld d0,[r0,4]
	ld i0,r14
	ld i1,d1
	call d0
LBE27_84:
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI6Engine12getSingletonEv
//****************************************

.func __ZN4MAUI6Engine12getSingletonEv_84, 0, int
.line 220
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB28_84:
.line 221
	ld d0,[zr,__ZN4MAUI6Engine12singletonPtrE_84]
	ld r14,#0x0
	jc eq,d0,r14,&L55_84
LBE28_84:
.line 224
	ld r14,d0
	pop rt,d0
	ret
L55_84:
.line 222
	ld i0,#0x24
	call &__Znwm_56
	ld d0,r14
	ld i0,r14
	call &__ZN4MAUI6EngineC1Ev_84
	ld [zr,__ZN4MAUI6Engine12singletonPtrE_84],d0
LBE29_84:
.line 224
	ld r14,d0
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI12readMoreDataEv
//****************************************

.func __ZN4MAUI12readMoreDataEv_85, 0, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Font.cpp'
.line 58
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_85:
.line 59
	ld r14,#0x0
	ld [zr,__ZN4MAUI7gBufPosE_85],r14
.line 60
	ld i3,#0x400
.line 61
	ld i2,[zr,__ZN4MAUI8gFilePosE_85]
	ld r14,i2
	add r14,i3
	ld r0,[zr,__ZN4MAUI9gFileSizeE_85]
	jc leu,r14,r0,&L2_85
.line 62
	ld i3,r0
	sub i3,i2
L2_85:
.line 65
	ld i0,[zr,__ZN4MAUI5gFileE_85]
	ld i1,[zr,__ZN4MAUI5gDataE_85]
	syscall 61
LBE3_85:
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI8readByteEv
//****************************************

.func __ZN4MAUI8readByteEv_85, 0, int
.line 68
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB4_85:
.line 70
	ld r1,[zr,__ZN4MAUI7gBufPosE_85]
	ld r14,#0x3ff
	jc gtu,r1,r14,&L6_85
.line 71
	ld r14,[zr,__ZN4MAUI5gDataE_85]
	add r14,r1
	ld.b r14,[r14]
.line 72
	ld r0,[zr,__ZN4MAUI8gFilePosE_85]
	add r0,#0x1
	ld [zr,__ZN4MAUI8gFilePosE_85],r0
.line 73
	add r1,#0x1
	ld [zr,__ZN4MAUI7gBufPosE_85],r1
LBE5_85:
.line 75
	and r14,#0xff
	pop rt,fr
	ret
L6_85:
.line 70
	call &__ZN4MAUI12readMoreDataEv_85
	ld r1,[zr,__ZN4MAUI7gBufPosE_85]
.line 71
	ld r14,[zr,__ZN4MAUI5gDataE_85]
	add r14,r1
	ld.b r14,[r14]
.line 72
	ld r0,[zr,__ZN4MAUI8gFilePosE_85]
	add r0,#0x1
	ld [zr,__ZN4MAUI8gFilePosE_85],r0
.line 73
	add r1,#0x1
	ld [zr,__ZN4MAUI7gBufPosE_85],r1
LBE7_85:
.line 75
	and r14,#0xff
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI9readShortEv
//****************************************

.func __ZN4MAUI9readShortEv_85, 0, int
.line 77
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB8_85:
.line 78
	ld d0,#0x0
.line 79
	ld r2,[zr,__ZN4MAUI7gBufPosE_85]
	ld r14,r2
	add r14,#0x1
	ld r0,#0x3ff
	jc gtu,r14,r0,&L15_85
L8_85:
.line 87
	ld r1,#0x0
	ld r3,[zr,__ZN4MAUI5gDataE_85]
L12_85:
.line 89
	ld r14,r3
	add r14,r2
	add r14,r1
.line 90
	ld.b r14,[r14]
	and r14,#0xff
	ld r0,r1
	sll r0,#0x3
	sll r14,r0
	or r14,d0
	ld d0,r14
LBE12_85:
.line 87
	add r1,#0x1
	ld r14,#0x1
	jc le,r1,r14,&L12_85
LBE10_85:
.line 92
	ld r14,[zr,__ZN4MAUI8gFilePosE_85]
	add r14,#0x2
	ld [zr,__ZN4MAUI8gFilePosE_85],r14
.line 93
	add r2,#0x2
	ld [zr,__ZN4MAUI7gBufPosE_85],r2
LBE9_85:
.line 95
	ld r14,d0
	and r14,#0xffff
	pop rt,d0
	ret
L15_85:
.line 79
	call &__ZN4MAUI12readMoreDataEv_85
	ld r2,[zr,__ZN4MAUI7gBufPosE_85]
	jp &L8_85

//****************************************
// Function: __ZN4MAUI7readIntEv
//****************************************

.func __ZN4MAUI7readIntEv_85, 0, int
.line 97
	push rt,d0
	ld fr,sp
	add fr,#0xc
LBB15_85:
.line 98
	ld d0,#0x0
.line 99
	ld r2,[zr,__ZN4MAUI7gBufPosE_85]
	ld r14,r2
	add r14,#0x3
	ld r0,#0x3ff
	jc gtu,r14,r0,&L24_85
L17_85:
.line 100
	ld r1,#0x0
	ld r3,[zr,__ZN4MAUI5gDataE_85]
L21_85:
.line 102
	ld r14,r3
	add r14,r2
	add r14,r1
.line 103
	ld.b r14,[r14]
	and r14,#0xff
	ld r0,r1
	sll r0,#0x3
	sll r14,r0
	or d0,r14
LBE19_85:
.line 100
	add r1,#0x1
	ld r14,#0x3
	jc le,r1,r14,&L21_85
LBE17_85:
.line 105
	ld r14,[zr,__ZN4MAUI8gFilePosE_85]
	add r14,#0x4
	ld [zr,__ZN4MAUI8gFilePosE_85],r14
.line 106
	add r2,#0x4
	ld [zr,__ZN4MAUI7gBufPosE_85],r2
LBE16_85:
.line 108
	ld r14,d0
	pop rt,d0
	ret
L24_85:
.line 99
	call &__ZN4MAUI12readMoreDataEv_85
	ld r2,[zr,__ZN4MAUI7gBufPosE_85]
	jp &L17_85

//****************************************
// Function: __ZN4MAUI9readCharsEPci
//****************************************

.func __ZN4MAUI9readCharsEPci_85, 2, int
.line 110
	push rt,d3
	ld fr,sp
	add fr,#0x18
	ld d3,i0
	ld d2,i1
LBB22_85:
.line 111
	ld d1,#0x0
	jc le,d2,d1,&L32_85
L35_85:
.line 113
	ld d0,d1
	add d0,d3
	call &__ZN4MAUI8readByteEv_85
	ld.b [d0],r14
.line 114
	xb r14,r14
	ld r0,#0x0
	jc eq,r14,r0,&L34_85
.line 111
	add d1,#0x1
	jc gt,d2,d1,&L35_85
L32_85:
.line 118
	ld i1,d2
LBE23_85:
.line 119
	ld r14,i1
	pop rt,d3
	ret
L34_85:
.line 115
	ld i1,d1
	add i1,#0x1
LBE27_85:
.line 119
	ld r14,i1
	pop rt,d3
	ret

//****************************************
// Function: __ZN4MAUI9skipBytesEi
//****************************************

.func __ZN4MAUI9skipBytesEi_85, 1, void
.line 121
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB28_85:
.line 122
	ld r14,[zr,__ZN4MAUI8gFilePosE_85]
	add r14,i0
	ld [zr,__ZN4MAUI8gFilePosE_85],r14
.line 123
	ld r14,[zr,__ZN4MAUI7gBufPosE_85]
	add i0,r14
	ld [zr,__ZN4MAUI7gBufPosE_85],i0
LBE28_85:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI4Font11setResourceEi
//****************************************

.func __ZN4MAUI4Font11setResourceEi_85, 2, void
.line 275
	push rt,d6
	sub sp,#0x4
	ld fr,sp
	add fr,#0x28
	ld d2,i0
	ld d1,i1
LBB34_85:
.line 277
	ld r0,#0x0
	jc ne,i1,r0,&L51_85
.line 278
	ld [d2],i1
L50_85:
.line 305
	add sp,#0x4
	pop rt,d6
	ret
L51_85:
.line 46
	ld i0,#0x400
	call &__Znam_57
	ld i0,r14
	ld [zr,__ZN4MAUI5gDataE_85],r14
.line 47
	ld r1,#0x0
	ld i1,&LC0_85
	jc eq,r14,r1,&L98_85
.line 48
	ld [zr,__ZN4MAUI5gFileE_85],d1
.line 49
	ld i0,d1
	syscall 60
	ld [zr,__ZN4MAUI9gFileSizeE_85],r14
.line 50
	ld r14,#0x0
	ld [zr,__ZN4MAUI8gFilePosE_85],r14
	ld [zr,__ZN4MAUI7gBufPosE_85],r14
.line 51
	call &__ZN4MAUI12readMoreDataEv_85
LBE39_85:
.line 284
	call &__ZN4MAUI7readIntEv_85
	ld d0,r14
.line 285
	call &__ZN4MAUI7readIntEv_85
	ld d5,r14
.line 287
	ld i0,[d2,4]
	ld r0,#0x0
	jc ne,i0,r0,&L102_85
L54_85:
.line 290
	ld i0,#0x101a
	call &__Znwm_56
	ld d3,r14
	ld [d2,4],r14
LBB40_85:
.line 126
	ld d4,d0
	add d4,#0x8
LBB41_85:
.line 130
	ld i0,fr
	add i0,#0xffffffd8
	ld i1,#0x4
	call &__ZN4MAUI9readCharsEPci_85
.line 131
	ld.b r1,[fr,-40]
	xb r14,r1
	ld r0,#0x42
	jc eq,r14,r0,&L103_85
L57_85:
.line 292
	ld i0,#0x0
	ld i1,&LC2_85
L98_85:
.line 303
	syscall 3
L103_85:
.line 131
	ld.b r1,[fr,-39]
	xb r14,r1
	ld r0,#0x4d
	jc ne,r14,r0,&L57_85
	ld.b r1,[fr,-38]
	xb r14,r1
	ld r0,#0x46
	jc ne,r14,r0,&L57_85
	ld.b r1,[fr,-37]
	xb r14,r1
	ld r0,#0x0
	jc le,r14,r0,&L57_85
	ld r1,#0x2
	jc gt,r14,r1,&L57_85
LBB46_85:
.line 137
	ld r0,#0x0
L62_85:
.line 138
	ld r14,r0
	sll r14,#0x4
	add r14,d3
	ld r1,#0xffffffff
	ld.h [r14,10],r1
.line 137
	add r0,#0x1
	ld r14,#0xfe
	jc le,r0,r14,&L62_85
L100_85:
.line 233
	ld r14,[zr,__ZN4MAUI8gFilePosE_85]
	jc eq,r14,d4,&L90_85
LBB47_85:
.line 143
	call &__ZN4MAUI8readByteEv_85
	ld d0,r14
.line 144
	call &__ZN4MAUI7readIntEv_85
	ld d6,r14
LBB49_85:
.line 145
	and d0,#0xff
	ld r0,#0x2
	jc eq,d0,r0,&L67_85
	jc gt,d0,r0,&L74_85
	ld r1,#0x1
	jc eq,d0,r1,&L66_85
L73_85:
.line 232
	ld i0,d6
	add i0,#0xfffffffc
L99_85:
	call &__ZN4MAUI9skipBytesEi_85
	jp &L100_85
L102_85:
.line 288
	call &__ZdlPv_55
	jp &L54_85
L66_85:
.line 148
	ld d0,[zr,__ZN4MAUI8gFilePosE_85]
.line 149
	ld i0,#0xe
	call &__ZN4MAUI9skipBytesEi_85
.line 150
	ld i0,d3
	add i0,#0x100a
	ld i1,#0x10
	call &__ZN4MAUI9readCharsEPci_85
.line 151
	add r14,d3
	ld r0,#0x0
	ld.b [r14,4105],r0
.line 152
	add d6,d0
	ld r1,[zr,__ZN4MAUI8gFilePosE_85]
	sub d6,r1
LBE58_85:
.line 232
	ld i0,d6
	add i0,#0xfffffffc
	jp &L99_85
L74_85:
.line 145
	ld r14,#0x4
	jc ne,d0,r14,&L73_85
LBB59_85:
.line 207
	add d6,#0xfffffffc
	divu d6,#0x12
.line 223
	add d6,#0xffffffff
	ld r14,#0xffffffff
	jc eq,d6,r14,&L100_85
L72_85:
.line 210
	call &__ZN4MAUI9readShortEv_85
.line 211
	ld d0,r14
	and d0,#0xffff
	ld r0,#0x100
	jc gtu,d0,r0,&L104_85
.line 215
	sll d0,#0x4
	add d0,d3
	add d0,#0xa
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 216
	add d0,#0x2
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 217
	add d0,#0x2
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 218
	add d0,#0x2
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 219
	add d0,#0x2
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 220
	add d0,#0x2
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 221
	add d0,#0x2
	call &__ZN4MAUI9readShortEv_85
	ld.h [d0],r14
.line 222
	add d0,#0x2
	call &__ZN4MAUI8readByteEv_85
	and r14,#0xff
	ld.h [d0],r14
.line 223
	ld i0,#0x1
	call &__ZN4MAUI9skipBytesEi_85
LBE62_85:
	add d6,#0xffffffff
	ld r1,#0xffffffff
	jc ne,d6,r1,&L72_85
	jp &L100_85
L90_85:
.line 238
	ld d0,#0x0
	jp &L80_85
L78_85:
	add d0,#0x1
	ld r1,#0xfe
	jc gt,d0,r1,&L105_85
L80_85:
.line 239
	ld i0,d0
	sll i0,#0x4
	add i0,d3
	add i0,#0xa
	ld.h r14,[i0]
	and r14,#0xffff
	ld r0,#0xffff
	jc ne,r14,r0,&L78_85
.line 240
	ld i1,d3
	add i1,#0x20a
	ld i2,#0x10
	syscall 5
	jp &L78_85
L105_85:
.line 55
	ld i0,[zr,__ZN4MAUI5gDataE_85]
	ld r14,#0x0
	jc eq,i0,r14,&L83_85
	call &__ZdaPv_54
L83_85:
.line 297
	call &__ZN6MAUtil15PlaceholderPool5allocEv_76
	ld [d2],r14
.line 299
	ld i0,r14
	ld i1,d1
	ld i2,d4
	ld i3,d5
	syscall 54
	ld r0,#0x1
	jc eq,r14,r0,&L50_85
.line 300
	ld r1,#0xffffffff
	jc eq,r14,r1,&L106_85
.line 302
	ld r0,#0xfffffffe
	jc ne,r14,r0,&L50_85
.line 303
	ld i0,#0x0
	ld i1,&LC4_85
	syscall 3
L67_85:
.line 174
	call &__ZN4MAUI9readShortEv_85
	ld.h [d3],r14
.line 175
	call &__ZN4MAUI9readShortEv_85
	ld.h [d3,2],r14
.line 176
	call &__ZN4MAUI9readShortEv_85
	ld.h [d3,4],r14
.line 177
	call &__ZN4MAUI9readShortEv_85
	ld.h [d3,6],r14
.line 178
	call &__ZN4MAUI9readShortEv_85
	ld.h [d3,8],r14
.line 179
	ld i0,#0x1
.line 232
	call &__ZN4MAUI9skipBytesEi_85
	jp &L100_85
L104_85:
.line 212
	ld i0,#0x1
	ld i1,&LC1_85
LBE75_85:
.line 303
	syscall 3
L106_85:
.line 301
	ld i0,#0x0
	ld i1,&LC3_85
.line 303
	syscall 3

//****************************************
// Function: __ZN4MAUI4FontC1Ei
//****************************************

.func __ZN4MAUI4FontC1Ei_85, 2, void
.line 247
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB76_85:
.line 247
	ld r0,#0x0
	ld [i0],r0
	ld [i0,4],r0
	ld [i0,8],r0
.line 248
	call &__ZN4MAUI4Font11setResourceEi_85
LBE76_85:
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI4Font10drawStringEPKcii
//****************************************

.func __ZN4MAUI4Font10drawStringEPKcii_85, 4, void
.line 335
	push rt,d5
	sub sp,#0x18
	ld fr,sp
	add fr,#0x38
	ld d3,i0
	ld d5,i2
LBB78_85:
.line 336
	ld r14,[i0]
	ld r0,#0x0
	jc eq,r14,r0,&L110_85
.line 337
	ld d2,i1
.line 338
	ld [fr,-48],r0
	ld [fr,-44],r0
	ld [fr,-40],r0
	ld [fr,-36],r0
.line 339
	ld d0,i2
	ld d1,i3
.line 341
	ld d4,[i0,4]
	add d4,#0xa
.line 363
	ld.b r0,[i1]
	and r0,#0xff
	ld r1,#0x0
	jc eq,r0,r1,&L110_85
L115_85:
.line 343
	ld r14,#0xa
	jc ne,r0,r14,&L114_85
.line 345
	ld d0,d5
.line 346
	ld r14,[d3,4]
	ld.h r14,[r14]
	and r14,#0xffff
	ld r0,[d3,8]
	add r14,r0
	add d1,r14
L117_85:
.line 363
	add d2,#0x1
LBE81_85:
	ld.b r0,[d2]
	and r0,#0xff
	ld r14,#0x0
	jc ne,r0,r14,&L115_85
L110_85:
.line 365
	add sp,#0x18
	pop rt,d5
	ret
L114_85:
.line 351
	sll r0,#0x4
	add r0,d4
	ld.h r14,[r0]
	and r14,#0xffff
	ld [fr,-48],r14
.line 352
	ld.h r14,[r0,2]
	and r14,#0xffff
	ld [fr,-44],r14
.line 353
	ld.h r14,[r0,4]
	and r14,#0xffff
	ld [fr,-40],r14
.line 354
	ld.h r14,[r0,6]
	and r14,#0xffff
	ld [fr,-36],r14
.line 357
	ld.h r1,[r0,8]
	xh r14,r1
	add r14,d0
	ld [fr,-56],r14
	ld.h r0,[r0,10]
	xh r14,r0
	add r14,d1
	ld [fr,-52],r14
.line 360
	ld i0,[d3]
	ld i1,fr
	add i1,#0xffffffd0
	ld i2,fr
	add i2,#0xffffffc8
	ld i3,#0x0
	call &_Gfx_drawImageRegion_67
.line 362
	ld.b r14,[d2]
	and r14,#0xff
	sll r14,#0x4
	add r14,d4
	ld.h r14,[r14,12]
	xh r14,r14
	add d0,r14
	jp &L117_85

//****************************************
// Function: __ZNK4MAUI4Font14calcLineBreaksEPKciiRKN6MAUtil4RectE
//****************************************

.func __ZNK4MAUI4Font14calcLineBreaksEPKciiRKN6MAUtil4RectE_85, 5, void
.line 370
	push fr,fr
	ld fr,sp
	add fr,#0x4
	ld r5,[fr]
LBB86_85:
.line 371
	ld r3,#0x0
.line 372
	ld r0,r3
.line 373
	ld r4,#0xffffffff
.line 374
	ld r1,i2
	ld r2,i3
.line 375
	ld r6,[i0,4]
	ld i3,r6
	add i3,#0xa
.line 403
	ld.b r14,[i1]
	and r14,#0xff
	ld r7,r3
	jc eq,r14,r3,&L129_85
	ld r15,i1
	jp &L127_85
L121_85:
.line 381
	ld r7,#0xa
	jc eq,r14,r7,&L131_85
L122_85:
.line 391
	ld.b r14,[r15]
	and r14,#0xff
	sll r14,#0x4
	add r14,i3
	ld.h r14,[r14,12]
	xh r14,r14
	add r1,r14
.line 392
	ld r14,[r5,4]
	ld r7,[r5,12]
	add r14,r7
	jc ge,r14,r1,&L124_85
.line 393
	ld r14,#0xffffffff
	jc eq,r4,r14,&L132_85
.line 396
	ld r14,r3
	add r14,r3
	ld r0,r4
	add r0,#0x1
	ld.h [r14,__ZN4MAUI10lineBreaksE_85],r0
	add r3,#0x1
.line 398
	ld r4,#0xffffffff
	ld r15,r0
	add r15,i1
L126_85:
.line 400
	ld.b r14,[r15]
	and r14,#0xff
	sll r14,#0x4
	add r14,i3
	ld.h r14,[r14,12]
	xh r14,r14
	ld r1,r14
	add r1,i2
L124_85:
.line 403
	add r0,#0x1
	ld r15,r0
	add r15,i1
	ld.b r14,[r15]
	and r14,#0xff
	ld r7,#0x0
	jc eq,r14,r7,&L129_85
L127_85:
.line 379
	ld.b r14,[r15]
	and r14,#0xff
	ld r7,#0x20
	jc ne,r14,r7,&L121_85
.line 380
	ld r4,r0
	jp &L122_85
L131_85:
.line 383
	ld r1,i2
.line 384
	ld.h r14,[r6]
	and r14,#0xffff
	ld r7,[i0,8]
	add r14,r7
	add r2,r14
.line 385
	ld r14,r3
	add r14,r3
	ld.h [r14,__ZN4MAUI10lineBreaksE_85],r0
	add r3,#0x1
.line 403
	add r0,#0x1
	ld r15,r0
	add r15,i1
	ld.b r14,[r15]
	and r14,#0xff
	ld r7,#0x0
	jc ne,r14,r7,&L127_85
L129_85:
.line 405
	ld [zr,__ZN4MAUI13numLineBreaksE_85],r3
.line 406
	add r3,r3
	ld r14,#0xffffffff
	ld.h [r3,__ZN4MAUI10lineBreaksE_85],r14
LBE87_85:
	pop fr,fr
	ret
L132_85:
.line 394
	ld r14,r3
	add r14,r3
	ld.h [r14,__ZN4MAUI10lineBreaksE_85],r0
	add r3,#0x1
	jp &L126_85

//****************************************
// Function: __ZN4MAUI4Font17drawBoundedStringEPKciiRKN6MAUtil4RectE
//****************************************

.func __ZN4MAUI4Font17drawBoundedStringEPKciiRKN6MAUtil4RectE_85, 5, void
.line 409
	push rt,d7
	sub sp,#0x20
	ld fr,sp
	add fr,#0x48
	ld d3,i0
	ld d6,i1
	ld [fr,-68],i2
	ld d2,i3
LBB90_85:
.line 410
	ld d4,#0x0
.line 411
	ld d5,d4
.line 412
	ld r14,[i0]
	jc ne,r14,d4,&L142_85
L133_85:
.line 443
	add sp,#0x20
	pop rt,d7
	ret
L142_85:
.line 414
	ld r0,[fr]
	ld [sp],r0
	call &__ZNK4MAUI4Font14calcLineBreaksEPKciiRKN6MAUtil4RectE_85
.line 415
	ld [fr,-56],d4
	ld [fr,-52],d4
	ld [fr,-48],d4
	ld [fr,-44],d4
.line 416
	ld d0,[fr,-68]
	ld d1,d2
.line 417
	ld d7,[d3,4]
	add d7,#0xa
.line 441
	ld.b r14,[d6]
	and r14,#0xff
	ld r1,d4
	jc eq,r14,d4,&L133_85
	ld d2,d6
L139_85:
.line 419
	ld r14,d5
	add r14,d5
	ld.h r14,[r14,__ZN4MAUI10lineBreaksE_85]
	xh r14,r14
	jc ne,r14,d4,&L137_85
.line 420
	add d5,#0x1
.line 421
	ld d0,[fr,-68]
.line 422
	ld r14,[d3,4]
	ld.h r14,[r14]
	and r14,#0xffff
	ld r0,[d3,8]
	add r14,r0
	add d1,r14
.line 423
	ld.b r14,[d2]
	and r14,#0xff
	ld r1,#0xa
	jc eq,r14,r1,&L141_85
L137_85:
.line 429
	ld.b r0,[d2]
	and r0,#0xff
	sll r0,#0x4
	add r0,d7
	ld.h r14,[r0]
	and r14,#0xffff
	ld [fr,-56],r14
.line 430
	ld.h r14,[r0,2]
	and r14,#0xffff
	ld [fr,-52],r14
.line 431
	ld.h r14,[r0,4]
	and r14,#0xffff
	ld [fr,-48],r14
.line 432
	ld.h r14,[r0,6]
	and r14,#0xffff
	ld [fr,-44],r14
.line 435
	ld.h r1,[r0,8]
	xh r14,r1
	add r14,d0
	ld [fr,-64],r14
	ld.h r0,[r0,10]
	xh r14,r0
	add r14,d1
	ld [fr,-60],r14
.line 438
	ld i0,[d3]
	ld i1,fr
	add i1,#0xffffffc8
	ld i2,fr
	add i2,#0xffffffc0
	ld i3,#0x0
	call &_Gfx_drawImageRegion_67
.line 440
	ld.b r14,[d2]
	and r14,#0xff
	sll r14,#0x4
	add r14,d7
	ld.h r14,[r14,12]
	xh r14,r14
	add d0,r14
L141_85:
.line 441
	add d4,#0x1
LBE95_85:
	ld d2,d4
	add d2,d6
	ld.b r14,[d2]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L139_85
LBE93_85:
.line 443
	add sp,#0x20
	pop rt,d7
	ret

//****************************************
// Function: __ZNK4MAUI4Font19getStringDimensionsEPKci
//****************************************

.func __ZNK4MAUI4Font19getStringDimensionsEPKci_85, 3, int
.line 445
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB96_85:
.line 446
	ld r15,i2
	ld r5,#0x0
	jc eq,i2,r5,&L143_85
.line 447
	ld r0,r5
	ld r1,r5
.line 448
	ld r4,r5
	ld r3,[i0,4]
	ld.h r2,[r3]
	and r2,#0xffff
.line 449
	ld r14,[i0]
	ld r15,r5
	jc eq,r14,r5,&L143_85
.line 450
	ld r5,r3
	add r5,#0xa
.line 474
	ld.b r14,[i1]
	and r14,#0xff
	jc eq,r14,r0,&L147_85
L150_85:
.line 454
	ld r6,#0xa
	jc eq,r14,r6,&L152_85
.line 464
	sll r14,#0x4
	add r14,r5
	ld.h r14,[r14,12]
	xh r14,r14
	add r14,r0
	ld r0,r14
.line 466
	jc ge,r4,r14,&L149_85
.line 470
	ld r4,r14
L149_85:
.line 473
	add i1,#0x1
.line 474
	add r15,#0x1
	ld.b r14,[i1]
	and r14,#0xff
	ld r6,#0x0
	jc eq,r14,r6,&L147_85
	jc ne,r15,i2,&L150_85
L147_85:
.line 477
	ld r15,r4
	sll r15,#0x10
	and r2,#0xffff
	or r15,r2
L143_85:
.line 478
	ld r14,r15
	pop fr,fr
	ret
L152_85:
.line 456
	ld r0,#0x0
.line 457
	ld.h r14,[r3]
	and r14,#0xffff
	ld r6,[i0,8]
	add r14,r6
	add r1,r14
.line 458
	add r2,r14
	jp &L149_85

//****************************************
// Function: __ZNK4MAUI4Font26getBoundedStringDimensionsEPKcRKN6MAUtil4RectEi
//****************************************

.func __ZNK4MAUI4Font26getBoundedStringDimensionsEPKcRKN6MAUtil4RectEi_85, 4, int
.line 482
	push rt,d4
	sub sp,#0x4
	ld fr,sp
	add fr,#0x20
	ld d1,i0
	ld d4,i1
	ld r0,i2
	ld d0,i3
LBB100_85:
.line 483
	ld r1,i3
	ld r2,#0x0
	jc eq,i3,r2,&L153_85
.line 484
	ld d2,r2
.line 485
	ld d3,r2
.line 486
	ld r14,[i0]
	ld r1,r2
	jc ne,r14,r2,&L165_85
L153_85:
.line 523
	ld r14,r1
	add sp,#0x4
	pop rt,d4
	ret
L165_85:
.line 487
	ld i2,[i2,4]
	ld i3,[r0,8]
	ld [sp],r0
	call &__ZNK4MAUI4Font14calcLineBreaksEPKciiRKN6MAUtil4RectE_85
.line 489
	ld r0,d2
	ld r1,d2
.line 490
	ld r4,d2
.line 491
	ld r5,d2
.line 492
	ld r3,[d1,4]
	ld r6,r3
	add r6,#0xa
.line 493
	ld i1,d4
.line 520
	ld.b r2,[d4]
	and r2,#0xff
	jc eq,r2,d2,&L157_85
L163_85:
.line 495
	ld r14,d3
	add r14,d3
	ld.h r14,[r14,__ZN4MAUI10lineBreaksE_85]
	xh r14,r14
	jc eq,r14,d2,&L159_85
	ld r14,#0xa
	jc eq,r2,r14,&L159_85
.line 503
	sll r2,#0x4
	add r2,r6
	ld.h r2,[r2,12]
	xh r2,r2
	add r2,r0
	ld r0,r2
.line 506
	ld.h r14,[r3]
	and r14,#0xffff
	add r14,r1
	jc le,r14,r4,&L161_85
.line 509
	ld r4,r14
L161_85:
.line 512
	jc ge,r5,r0,&L162_85
.line 515
	ld r5,r2
L162_85:
.line 519
	add i1,#0x1
.line 520
	add d2,#0x1
	ld.b r2,[i1]
	and r2,#0xff
	ld r14,#0x0
	jc eq,r2,r14,&L157_85
	jc ne,d2,d0,&L163_85
L157_85:
.line 522
	ld r1,r5
	sll r1,#0x10
	and r4,#0xffff
	or r1,r4
LBE103_85:
.line 523
	ld r14,r1
	add sp,#0x4
	pop rt,d4
	ret
L159_85:
.line 496
	add d3,#0x1
.line 497
	ld r0,#0x0
.line 498
	ld.h r14,[r3]
	and r14,#0xffff
	ld r2,[d1,8]
	add r14,r2
	add r1,r14
	jp &L162_85

//****************************************
// Function: __ZNK4MAUI4Font12getLineBreakEiPKcRKN6MAUtil4RectE
//****************************************

.func __ZNK4MAUI4Font12getLineBreakEiPKcRKN6MAUtil4RectE_85, 4, int
.line 525
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
	ld d0,i1
LBB106_85:
.line 526
	ld r14,[i3,4]
	ld r0,[i3,8]
	ld [sp],i3
	ld i1,i2
	ld i2,r14
	ld i3,r0
	call &__ZNK4MAUI4Font14calcLineBreaksEPKciiRKN6MAUtil4RectE_85
.line 527
	ld r14,#0x0
	jc lt,d0,r14,&L168_85
	ld r14,[zr,__ZN4MAUI13numLineBreaksE_85]
	jc lt,d0,r14,&L167_85
L168_85:
	ld r14,#0xffffffff
LBE106_85:
.line 529
	add sp,#0x4
	pop rt,d0
	ret
L167_85:
.line 528
	add d0,d0
	ld.h d0,[d0,__ZN4MAUI10lineBreaksE_85]
	xh r14,d0
LBE107_85:
.line 529
	add sp,#0x4
	pop rt,d0
	ret

//****************************************
// Function: __ZNK4MAUI4Font13calculateLineEiPKcRKN6MAUtil4RectE
//****************************************

.func __ZNK4MAUI4Font13calculateLineEiPKcRKN6MAUtil4RectE_85, 4, int
.line 531
	push rt,d0
	sub sp,#0x4
	ld fr,sp
	add fr,#0x10
	ld d0,i1
LBB108_85:
.line 532
	ld r14,[i3,4]
	ld r0,[i3,8]
	ld [sp],i3
	ld i1,i2
	ld i2,r14
	ld i3,r0
	call &__ZNK4MAUI4Font14calcLineBreaksEPKciiRKN6MAUtil4RectE_85
.line 534
	ld r0,#0x0
.line 535
	ld r1,[zr,__ZN4MAUI13numLineBreaksE_85]
	jc le,r1,r0,&L170_85
L179_85:
.line 536
	ld r14,r0
	add r14,r0
	ld.h r14,[r14,__ZN4MAUI10lineBreaksE_85]
	xh r14,r14
	jc ge,r14,d0,&L170_85
.line 535
	add r0,#0x1
	jc gt,r1,r0,&L179_85
L170_85:
.line 541
	ld r14,r0
	add sp,#0x4
	pop rt,d0
	ret

//****************************************
// Function: __ZNK4MAUI4Font20calculateRectOfIndexEiPKcRKN6MAUtil4RectE
//****************************************

.func __ZNK4MAUI4Font20calculateRectOfIndexEiPKcRKN6MAUtil4RectE_85, 5, int
.line 543
	push rt,d6
	sub sp,#0x4
	ld fr,sp
	add fr,#0x28
	ld d6,i0
	ld d3,i1
	ld d5,i2
	ld d4,i3
	ld d0,[fr]
LBB110_85:
.line 544
	ld i0,i1
	ld i1,i2
	ld i2,i3
	ld i3,d0
	call &__ZNK4MAUI4Font13calculateLineEiPKcRKN6MAUtil4RectE_85
	ld d2,r14
.line 545
	ld r0,#0x0
.line 546
	jc le,r14,r0,&L181_85
.line 547
	ld i0,d3
	ld i1,r14
	add i1,#0xffffffff
	ld i2,d4
	ld i3,d0
	call &__ZNK4MAUI4Font12getLineBreakEiPKcRKN6MAUtil4RectE_85
	ld r0,r14
L181_85:
.line 549
	ld d0,#0x0
.line 550
	ld r14,[d3,4]
	ld.h r14,[r14]
	and r14,#0xffff
	ld d1,r14
	mul d1,d2
.line 551
	ld i0,d3
	ld i1,d4
	add i1,r0
	ld i2,d5
	sub i2,r0
	call &__ZNK4MAUI4Font19getStringDimensionsEPKci_85
.line 552
	ld d2,r14
	sra d2,#0x10
	add d2,d0
	ld d0,d2
.line 553
	ld i0,d3
	ld i1,d4
	add i1,d5
	ld i2,#0x1
	call &__ZNK4MAUI4Font19getStringDimensionsEPKci_85
.line 554
	ld r0,[d3,4]
	ld.h r0,[r0]
	and r0,#0xffff
	ld [sp],r0
	ld i0,d6
	ld i1,d2
	ld i2,d1
	ld i3,r14
	sra i3,#0x10
	call &__ZN6MAUtil4RectC1Eiiii_73
LBE111_85:
.line 556
	ld r14,d6
	add sp,#0x4
	pop rt,d6
	ret

//****************************************
// Function: __ZNK4MAUI4Font10getCharsetEv
//****************************************

.func __ZNK4MAUI4Font10getCharsetEv_85, 1, int
.line 558
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 560
	ld r14,[i0,4]
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI5Image10drawWidgetEv
//****************************************

.func __ZN4MAUI5Image10drawWidgetEv_86, 1, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Image.cpp'
.line 34
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB2_86:
.line 35
	ld r1,[i0,116]
	ld r14,#0x0
	jc ne,r1,r14,&L4_86
LBE2_86:
.line 38
	pop rt,fr
	ret
L4_86:
.line 36
	ld i1,[i0,92]
	sra i1,#0x1
	ld r0,[i0,124]
	sra r0,#0x1
	ld i2,[i0,96]
	sra i2,#0x1
	ld r14,[i0,128]
	sra r14,#0x1
	ld i0,r1
	sub i1,r0
	sub i2,r14
	call &_Gfx_drawImage_67
LBE3_86:
.line 38
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI5Image11setResourceEi
//****************************************

.func __ZN4MAUI5Image11setResourceEi_86, 2, void
.line 40
	push rt,d2
	ld fr,sp
	add fr,#0x14
	ld d1,i0
	ld i0,i1
LBB4_86:
.line 41
	ld [d1,116],i1
.line 42
	ld r0,#0x0
	jc ne,i1,r0,&L9_86
L5_86:
.line 48
	pop rt,d2
	ret
L9_86:
.line 43
	syscall 50
.line 44
	ld i1,r14
	sra i1,#0x10
	ld [d1,124],i1
.line 45
	xh d2,r14
	ld [d1,128],d2
.line 46
	ld.b r14,[d1,120]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L10_86
L7_86:
.line 47
	ld.b r14,[d1,121]
	and r14,#0xff
	ld r0,#0x0
	jc eq,r14,r0,&L5_86
	ld r14,[d1]
	ld d0,[r14,32]
	ld i0,d1
	ld i1,d2
	call d0
LBE7_86:
.line 48
	pop rt,d2
	ret
L10_86:
.line 46
	ld r14,[d1]
	ld d0,[r14,28]
	ld i0,d1
	call d0
	jp &L7_86

//****************************************
// Function: __ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi
//****************************************

.func __ZN4MAUI5ImageC1EiiiiPNS_6WidgetEbbi_86, 9, void
.line 24
	push rt,d1
	sub sp,#0x8
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d1,[fr,16]
LBB10_86:
.line 28
	ld r14,[fr]
	ld [sp],r14
	ld r14,[fr,4]
	ld [sp,4],r14
	call &__ZN4MAUI6WidgetC2EiiiiPS0__93
	ld r14,&__ZTVN4MAUI5ImageE_86+8
	ld [d0],r14
	ld [d0,116],d1
	ld.b r14,[fr,8]
	ld.b [d0,120],r14
	ld.b r14,[fr,12]
	ld.b [d0,121],r14
.line 29
	ld i0,d0
	ld i1,#0x0
	call &__ZN4MAUI6Widget17setDrawBackgroundEb_93
.line 30
	ld i0,d0
	ld i1,d1
	call &__ZN4MAUI5Image11setResourceEi_86
LBE10_86:
	add sp,#0x8
	pop rt,d1
	ret

//****************************************
// Function: __ZNK4MAUI5Image11getResourceEv
//****************************************

.func __ZNK4MAUI5Image11getResourceEv_86, 1, int
.line 50
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 52
	ld r14,[i0,116]
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI5ImageD1Ev
//****************************************

.func __ZN4MAUI5ImageD1Ev_86, 1, void
.line 52
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB12_86:
.line 52
	ld r14,&__ZTVN4MAUI5ImageE_86+8
	ld [i0],r14
	call &__ZN4MAUI6WidgetD2Ev_93
LBE12_86:
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI5ImageD0Ev
//****************************************

.func __ZN4MAUI5ImageD0Ev_86, 1, void
.line 52
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB13_86:
.line 52
	ld r14,&__ZTVN4MAUI5ImageE_86+8
	ld [i0],r14
	call &__ZN4MAUI6WidgetD2Ev_93
LBE13_86:
	ld i0,d0
	call &__ZdlPv_55
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE
//****************************************

.func __ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE_88, 2, void
.sourcefile 'c:\mb\mosync-trunk\libs\MAUI\Label.cpp'
.line 282
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB4_88:
.line 283
	add i0,#0x78
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
.line 284
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 286
	ld r14,#0x1
	ld.b [d0,116],r14
LBE4_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5LabelC2EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE
//****************************************

.func __ZN4MAUI5LabelC2EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88, 9, void
.line 101
	push rt,d1
	sub sp,#0x8
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d1,[fr,16]
LBB5_88:
.line 111
	ld r14,[fr]
	ld [sp],r14
	ld r14,[fr,4]
	ld [sp,4],r14
	call &__ZN4MAUI6WidgetC2EiiiiPS0__93
	ld r14,&__ZTVN4MAUI5LabelE_88+8
	ld [d0],r14
	ld r14,#0x1
	ld.b [d0,116],r14
	ld i0,d0
	add i0,#0x78
	ld i1,&LC0_88
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld r14,#0x0
	ld.b [d0,132],r14
	ld.b [d0,133],r14
	ld.b [d0,134],r14
	ld r14,#0x0
	ld [d0,136],r14
	ld [d0,140],r14
.line 112
	jc eq,d1,r14,&L12_88
.line 116
	ld [d0,128],d1
L10_88:
.line 119
	ld i0,d0
	ld i1,[fr,8]
	call &__ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE_88
.line 120
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 121
	ld i0,d0
	ld i1,[fr,12]
	call &__ZN4MAUI6Widget18setBackgroundColorEi_93
LBE5_88:
	add sp,#0x8
	pop rt,d1
	ret
L12_88:
	ld [d0,128],d1
LBB6_88:
.line 114
	call &__ZN4MAUI6Engine12getSingletonEv_84
	ld i0,r14
	call &__ZN4MAUI6Engine14getDefaultFontEv_84
	ld [d0,128],r14
	jp &L10_88

//****************************************
// Function: __ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE
//****************************************

.func __ZN4MAUI5LabelC1EiiiiPNS_6WidgetERKN6MAUtil11BasicStringIcEEiPNS_4FontE_88, 9, void
.line 101
	push rt,d1
	sub sp,#0x8
	ld fr,sp
	add fr,#0x18
	ld d0,i0
	ld d1,[fr,16]
LBB7_88:
.line 111
	ld r14,[fr]
	ld [sp],r14
	ld r14,[fr,4]
	ld [sp,4],r14
	call &__ZN4MAUI6WidgetC2EiiiiPS0__93
	ld r14,&__ZTVN4MAUI5LabelE_88+8
	ld [d0],r14
	ld r14,#0x1
	ld.b [d0,116],r14
	ld i0,d0
	add i0,#0x78
	ld i1,&LC0_88
	call &__ZN6MAUtil11BasicStringIcEC1EPKc_70
	ld i0,d0
	add i0,#0x7c
	call &__ZN6MAUtil11BasicStringIcEC1Ev_70
	ld r14,#0x0
	ld.b [d0,132],r14
	ld.b [d0,133],r14
	ld.b [d0,134],r14
	ld r14,#0x0
	ld [d0,136],r14
	ld [d0,140],r14
.line 112
	jc eq,d1,r14,&L16_88
.line 116
	ld [d0,128],d1
L15_88:
.line 119
	ld i0,d0
	ld i1,[fr,8]
	call &__ZN4MAUI5Label10setCaptionERKN6MAUtil11BasicStringIcEE_88
.line 120
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 121
	ld i0,d0
	ld i1,[fr,12]
	call &__ZN4MAUI6Widget18setBackgroundColorEi_93
LBE7_88:
	add sp,#0x8
	pop rt,d1
	ret
L16_88:
	ld [d0,128],d1
LBB8_88:
.line 114
	call &__ZN4MAUI6Engine12getSingletonEv_84
	ld i0,r14
	call &__ZN4MAUI6Engine14getDefaultFontEv_84
	ld [d0,128],r14
	jp &L15_88

//****************************************
// Function: __ZN4MAUI5Label12setMultiLineEb
//****************************************

.func __ZN4MAUI5Label12setMultiLineEb_88, 2, void
.line 150
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB9_88:
.line 152
	ld r14,#0x1
	ld.b [i0,116],r14
.line 153
	ld.b [i0,134],i1
LBE9_88:
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI5Label14setPaddingLeftEi
//****************************************

.func __ZN4MAUI5Label14setPaddingLeftEi_88, 2, void
.line 160
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB10_88:
.line 161
	call &__ZN4MAUI6Widget14setPaddingLeftEi_93
.line 163
	ld r14,#0x1
	ld.b [d0,116],r14
LBE10_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label13setPaddingTopEi
//****************************************

.func __ZN4MAUI5Label13setPaddingTopEi_88, 2, void
.line 166
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB11_88:
.line 167
	call &__ZN4MAUI6Widget13setPaddingTopEi_93
.line 169
	ld r14,#0x1
	ld.b [d0,116],r14
LBE11_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label15setPaddingRightEi
//****************************************

.func __ZN4MAUI5Label15setPaddingRightEi_88, 2, void
.line 172
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB12_88:
.line 173
	call &__ZN4MAUI6Widget15setPaddingRightEi_93
.line 175
	ld r14,#0x1
	ld.b [d0,116],r14
LBE12_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label16setPaddingBottomEi
//****************************************

.func __ZN4MAUI5Label16setPaddingBottomEi_88, 2, void
.line 178
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB13_88:
.line 179
	call &__ZN4MAUI6Widget16setPaddingBottomEi_93
.line 181
	ld r14,#0x1
	ld.b [d0,116],r14
LBE13_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label6resizeEii
//****************************************

.func __ZN4MAUI5Label6resizeEii_88, 3, void
.line 184
	push rt,d1
	ld fr,sp
	add fr,#0x10
	ld d0,i0
	ld d1,i2
LBB14_88:
.line 185
	call &__ZN4MAUI6Widget8setWidthEi_93
.line 186
	ld i0,d0
	ld i1,d1
	call &__ZN4MAUI6Widget9setHeightEi_93
LBE14_88:
	pop rt,d1
	ret

//****************************************
// Function: __ZN4MAUI5Label11calcStrSizeEv
//****************************************

.func __ZN4MAUI5Label11calcStrSizeEv_88, 1, void
.line 125
	push rt,d5
	sub sp,#0x2c
	ld fr,sp
	add fr,#0x4c
	ld d2,i0
LBB15_88:
.line 126
	ld r0,#0x0
	ld.b [i0,116],r0
.line 127
	ld d3,fr
	add d3,#0xffffffcc
	ld i3,[i0,92]
	ld r4,[i0,96]
	ld [sp],r4
	ld i0,d3
	ld i1,#0x0
	ld i2,i1
	call &__ZN6MAUtil4RectC1Eiiii_73
.line 128
	ld d0,[d2,128]
	ld r14,#0x0
.line 129
	ld i0,d0
.line 128
	jc eq,d0,r14,&L44_88
.line 131
	ld.b r14,[d2,132]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L46_88
.line 134
	ld.b d1,[d2,134]
	and d1,#0xff
	jc eq,d1,r14,&L29_88
.line 135
	ld i0,d2
	add i0,#0x78
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d2,128]
	ld i1,r14
	ld i2,d3
	ld i3,#0xffffffff
	call &__ZNK4MAUI4Font26getBoundedStringDimensionsEPKcRKN6MAUtil4RectEi_85
.line 138
	ld i0,r14
L44_88:
	ld [d2,144],i0
.line 143
	ld i1,i0
	sra i1,#0x10
	ld [d2,148],i1
.line 144
	xh r14,i0
	ld [d2,152],r14
.line 146
	ld.b r14,[d2,132]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L47_88
L39_88:
.line 147
	ld.b r14,[d2,133]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L48_88
LBE16_88:
.line 148
	add sp,#0x2c
	pop rt,d5
	ret
L48_88:
.line 147
	ld i2,[d2,152]
	ld r4,[d2,104]
	add i2,r4
	ld i0,d2
	ld i1,[d2,32]
	ld r14,[d2,108]
	add i2,r14
	call &__ZN4MAUI5Label6resizeEii_88
LBE18_88:
.line 148
	add sp,#0x2c
	pop rt,d5
	ret
L47_88:
.line 146
	ld r4,[d2,100]
	add i1,r4
	ld i0,d2
	ld r14,[d2,112]
	add i1,r14
	ld i2,[d2,36]
	call &__ZN4MAUI5Label6resizeEii_88
	jp &L39_88
L46_88:
.line 132
	ld i0,d2
	add i0,#0x78
L45_88:
.line 138
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d2,128]
	ld i1,r14
	ld i2,#0xffffffff
	call &__ZNK4MAUI4Font19getStringDimensionsEPKci_85
	ld i0,r14
	jp &L44_88
L29_88:
.line 35
	ld d3,d2
	add d3,#0x7c
	ld d4,d2
	add d4,#0x78
LBB22_88:
.line 127
	ld r4,&__ZTVN6MAUtil4RectE_73+8
	ld [fr,-72],r4
	ld r14,[fr,-48]
	ld [fr,-68],r14
	ld r0,[fr,-44]
	ld [fr,-64],r0
	ld r4,[fr,-40]
	ld [fr,-60],r4
	ld r14,[fr,-36]
	ld [fr,-56],r14
LBE23_88:
.line 36
	ld i0,d3
	call &__ZN6MAUtil11BasicStringIcE5clearEv_70
.line 37
	ld i0,d0
	call &__ZNK4MAUI4Font10getCharsetEv_85
	ld d0,r14
.line 38
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
.line 39
	ld r3,[fr,-60]
.line 40
	ld r1,[fr,-68]
.line 41
	ld r2,d1
.line 55
	ld.b r0,[r14]
	and r0,#0xff
	jc eq,r0,d1,&L42_88
L38_88:
.line 43
	sll r0,#0x4
	add r0,d0
LBB28_88:
.line 44
	ld.h r0,[r0,22]
	xh r0,r0
	add r0,r1
	jc gt,r0,r3,&L49_88
.line 52
	add r2,#0x1
LBE28_88:
.line 54
	ld r1,r0
.line 55
	add r14,#0x1
LBE27_88:
	ld.b r0,[r14]
	and r0,#0xff
	ld r4,#0x0
	jc ne,r0,r4,&L38_88
L42_88:
.line 57
	ld i0,d3
	ld i1,d4
	call &__ZN6MAUtil11BasicStringIcEaSERKS1__70
LBE25_88:
.line 138
	ld i0,d3
	jp &L45_88
L49_88:
.line 45
	ld d5,#0x3
.line 46
	ld r0,#0x2
	jc gt,r2,r0,&L35_88
	ld d5,r2
L35_88:
.line 47
	ld d1,r2
	sub d1,d5
	ld i0,d3
	ld i1,d1
	call &__ZN6MAUtil11BasicStringIcE6resizeEi_70
.line 48
	ld i0,d3
	ld i1,#0x0
	call &__ZN6MAUtil11BasicStringIcEixEi_70
	ld d0,r14
	ld i0,d4
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,d0
	ld i1,r14
	ld i2,d1
	syscall 5
.line 49
	ld i0,d3
	ld i1,&LC1_88
	ld i2,d5
	call &__ZN6MAUtil11BasicStringIcE6appendEPKci_70
LBE35_88:
.line 138
	ld i0,d3
	jp &L45_88

//****************************************
// Function: __ZN4MAUI5Label12getTextStartEPiS1_
//****************************************

.func __ZN4MAUI5Label12getTextStartEPiS1__88, 3, void
.line 189
	push fr,fr
	ld fr,sp
	add fr,#0x4
LBB36_88:
.line 191
	ld.b r14,[i0,132]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L51_88
.line 192
	ld r14,[i0,136]
	ld r0,#0x1
	jc eq,r14,r0,&L54_88
	jc le,r14,r0,&L66_88
	ld r0,#0x2
	jc eq,r14,r0,&L55_88
L51_88:
.line 199
	ld.b r14,[i0,133]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L50_88
.line 200
	ld r14,[i0,140]
	ld r0,#0x1
	jc eq,r14,r0,&L60_88
	jc le,r14,r0,&L67_88
	ld r0,#0x2
	jc eq,r14,r0,&L61_88
L50_88:
.line 206
	pop fr,fr
	ret
L54_88:
.line 194
	ld r0,[i0,92]
	ld r14,r0
	srl r14,#0x1f
	add r0,r14
	sra r0,#0x1
	ld r14,[i0,148]
	ld r1,r14
	srl r1,#0x1f
	add r14,r1
	sra r14,#0x1
	sub r0,r14
	ld [i1],r0
	jp &L51_88
L60_88:
.line 202
	ld r0,[i0,96]
	ld r14,r0
	srl r14,#0x1f
	add r0,r14
	sra r0,#0x1
	ld r14,[i0,152]
	ld r1,r14
	srl r1,#0x1f
	add r14,r1
	sra r14,#0x1
	sub r0,r14
	ld [i2],r0
LBE37_88:
.line 206
	pop fr,fr
	ret
L55_88:
.line 195
	ld r14,[i0,92]
	ld r0,[i0,148]
	sub r14,r0
	ld [i1],r14
	jp &L51_88
L61_88:
.line 203
	ld r14,[i0,96]
	ld i0,[i0,152]
	sub r14,i0
L64_88:
	ld [i2],r14
LBE38_88:
.line 206
	pop fr,fr
	ret
L67_88:
.line 200
	ld r0,#0x0
	jc eq,r14,r0,&L64_88
LBE39_88:
.line 206
	pop fr,fr
	ret
L66_88:
.line 192
	ld r0,#0x0
	jc ne,r14,r0,&L51_88
.line 195
	ld [i1],r14
	jp &L51_88

//****************************************
// Function: __ZN4MAUI5Label6updateEv
//****************************************

.func __ZN4MAUI5Label6updateEv_88, 1, void
.line 208
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB41_88:
.line 209
	call &__ZN4MAUI6Widget6updateEv_93
.line 210
	ld.b r14,[d0,116]
	and r14,#0xff
	ld r0,#0x0
	jc ne,r14,r0,&L70_88
LBE41_88:
.line 213
	pop rt,d0
	ret
L70_88:
.line 211
	ld i0,d0
	call &__ZN4MAUI5Label11calcStrSizeEv_88
LBE42_88:
.line 213
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label10drawWidgetEv
//****************************************

.func __ZN4MAUI5Label10drawWidgetEv_88, 1, void
.line 215
	push rt,d2
	sub sp,#0x20
	ld fr,sp
	add fr,#0x34
	ld d0,i0
LBB43_88:
.line 216
	add i0,#0x78
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld d2,r14
.line 219
	ld r14,#0x0
	ld [fr,-44],r14
	ld [fr,-48],r14
.line 222
	ld i0,d0
	ld i1,fr
	add i1,#0xffffffd4
	ld i2,fr
	add i2,#0xffffffd0
	call &__ZN4MAUI5Label12getTextStartEPiS1__88
.line 224
	ld d1,fr
	add d1,#0xffffffd8
	ld i3,[d0,92]
	ld r14,[d0,96]
	ld [sp],r14
	ld i0,d1
	ld i1,#0x0
	ld i2,i1
	call &__ZN6MAUtil4RectC1Eiiii_73
.line 225
	ld i0,[d0,128]
	ld r14,#0x0
	jc eq,i0,r14,&L71_88
.line 226
	ld.b r0,[d0,134]
	and r0,#0xff
	jc ne,r0,r14,&L78_88
.line 230
	ld.b r14,[d0,132]
	and r14,#0xff
.line 231
	ld i1,d2
.line 230
	jc eq,r14,r0,&L79_88
L77_88:
.line 233
	ld i2,[fr,-44]
	ld i3,[fr,-48]
	call &__ZN4MAUI4Font10drawStringEPKcii_85
L71_88:
.line 236
	add sp,#0x20
	pop rt,d2
	ret
L78_88:
.line 227
	ld [sp],d1
	ld i1,d2
	ld i2,[fr,-44]
	ld i3,[fr,-48]
	call &__ZN4MAUI4Font17drawBoundedStringEPKciiRKN6MAUtil4RectE_85
LBE46_88:
.line 236
	add sp,#0x20
	pop rt,d2
	ret
L79_88:
.line 233
	ld i0,d0
	add i0,#0x7c
	call &__ZNK6MAUtil11BasicStringIcE5c_strEv_70
	ld i0,[d0,128]
	ld i1,r14
	jp &L77_88

//****************************************
// Function: __ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE
//****************************************

.func __ZN4MAUI5Label22setHorizontalAlignmentENS0_19HorizontalAlignmentE_88, 2, void
.line 238
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB49_88:
.line 239
	ld [i0,136],i1
.line 240
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 242
	ld r14,#0x1
	ld.b [d0,116],r14
LBE49_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE
//****************************************

.func __ZN4MAUI5Label20setVerticalAlignmentENS0_17VerticalAlignmentE_88, 2, void
.line 249
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB50_88:
.line 250
	ld [i0,140],i1
.line 251
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 253
	ld r14,#0x1
	ld.b [d0,116],r14
LBE50_88:
	pop rt,d0
	ret

//****************************************
// Function: __ZN4MAUI5Label12setAutoSizeXEb
//****************************************

.func __ZN4MAUI5Label12setAutoSizeXEb_88, 2, void
.line 260
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB51_88:
.line 261
	ld.b [i0,132],i1
.line 263
	ld r0,#0x1
	ld.b [i0,116],r0
.line 264
	call &__ZN4MAUI6Widget14requestRepaintEv_93
LBE51_88:
	pop rt,fr
	ret

//****************************************
// Function: __ZN4MAUI5Label12setAutoSizeYEb
//****************************************

.func __ZN4MAUI5Label12setAutoSizeYEb_88, 2, void
.line 267
	push rt,fr
	ld fr,sp
	add fr,#0x8
LBB52_88:
.line 268
	ld.b [i0,133],i1
.line 270
	ld r0,#0x1
	ld.b [i0,116],r0
.line 271
	call &__ZN4MAUI6Widget14requestRepaintEv_93
LBE52_88:
	pop rt,fr
	ret

//****************************************
// Function: __ZNK4MAUI5Label10getCaptionEv
//****************************************

.func __ZNK4MAUI5Label10getCaptionEv_88, 1, int
.line 289
	push fr,fr
	ld fr,sp
	add fr,#0x4
.line 291
	ld r14,i0
	add r14,#0x78
	pop fr,fr
	ret

//****************************************
// Function: __ZN4MAUI5Label7setFontEPNS_4FontE
//****************************************

.func __ZN4MAUI5Label7setFontEPNS_4FontE_88, 2, void
.line 293
	push rt,d0
	ld fr,sp
	add fr,#0xc
	ld d0,i0
LBB53_88:
.line 294
	ld r14,#0x0
	jc eq,i1,r14,&L90_88
.line 295
	ld [i0,128],i1
L91_88:
.line 298
	ld i0,d0
	call &__ZN4MAUI6Widget14requestRepaintEv_93
.line 300
	ld r14,#0x1
	ld.b [d0,116],r14
LBE53_88:
	pop rt,d0
	ret
L90_88:
.line 297
	call &__ZN4MAUI6Engine12getSingletonEv_84
	ld i0,r14
	call &__ZN4MAUI6Engine14getDefaultFontEv_84
	ld [d0,128],r14
	jp &L91_88

//****************************************
// Function: __ZN4MAUI5Label12setParameterERKN6MAUtil11BasicStringIcEES5_

.line 308
	push rt,d6
	sub sp,#0x20