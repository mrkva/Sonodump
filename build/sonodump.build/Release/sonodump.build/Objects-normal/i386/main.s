	.section __DWARF,__debug_frame,regular,debug
Lsection__debug_frame:
	.section __DWARF,__debug_info,regular,debug
Lsection__debug_info:
	.section __DWARF,__debug_abbrev,regular,debug
Lsection__debug_abbrev:
	.section __DWARF,__debug_aranges,regular,debug
Lsection__debug_aranges:
	.section __DWARF,__debug_macinfo,regular,debug
Lsection__debug_macinfo:
	.section __DWARF,__debug_line,regular,debug
Lsection__debug_line:
	.section __DWARF,__debug_loc,regular,debug
Lsection__debug_loc:
	.section __DWARF,__debug_pubnames,regular,debug
Lsection__debug_pubnames:
	.section __DWARF,__debug_pubtypes,regular,debug
Lsection__debug_pubtypes:
	.section __DWARF,__debug_inlined,regular,debug
Lsection__debug_inlined:
	.section __DWARF,__debug_str,regular,debug
Lsection__debug_str:
	.section __DWARF,__debug_ranges,regular,debug
Lsection__debug_ranges:
	.section __DWARF,__debug_abbrev,regular,debug
Ldebug_abbrev0:
	.section __DWARF,__debug_info,regular,debug
Ldebug_info0:
	.section __DWARF,__debug_line,regular,debug
Ldebug_line0:
	.text
Ltext0:
_ThroughputCallback:
LFB30:
	.file 1 "/Users/Jonas/Documents/Projekty/SonTCPdump/sonodump/main.c"
	.loc 1 25 0
LVL0:
	pushl	%ebp
LCFI0:
	movl	%esp, %ebp
LCFI1:
	pushl	%esi
LCFI2:
	pushl	%ebx
LCFI3:
	movl	12(%ebp), %ebx
	movl	16(%ebp), %edx
	.loc 1 32 0
	movl	L_data$non_lazy_ptr, %esi
	movl	(%esi), %eax
	testl	%eax, %eax
	je	L2
LVL1:
	xorl	%ecx, %ecx
	.loc 1 39 0
	movsd	LC1, %xmm1
	jmp	L4
L2:
	.loc 1 32 0
	movl	%ebx, %eax
	.loc 1 34 0
	xorl	%ecx, %ecx
	jmp	L5
LVL2:
L6:
	movl	%ecx, -8(%eax)
	.loc 1 35 0
	movl	%ecx, -4(%eax)
LVL3:
L5:
	.loc 1 33 0
	decl	%edx
	addl	$8, %eax
	cmpl	$-1, %edx
	jne	L6
	jmp	L7
L8:
	.loc 1 39 0
	leal	(%esi,%ecx,8), %eax
	cvtsi2sd	-8(%eax), %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -8(%ebx,%ecx,8)
	.loc 1 40 0
	cvtsi2sd	-4(%eax), %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -4(%ebx,%ecx,8)
LVL4:
L4:
	.loc 1 38 0
	decl	%edx
	incl	%ecx
	cmpl	$-1, %edx
	jne	L8
L7:
	.loc 1 45 0
	xorl	%eax, %eax
	popl	%ebx
LVL5:
	popl	%esi
	leave
	ret
LFE30:
	.cstring
LC2:
	.ascii "PortAudio started\0"
LC4:
	.ascii "Welcome to Sonodump\0"
	.align 2
LC5:
	.ascii "Please define an interface,\12which you want to listen to: sonodump <interface>\0"
	.align 2
LC6:
	.ascii "List of the interfaces can be found using ipconfig command.\12Usually, en0 is LAN (cable) interface, and en1 is wireless.\0"
LC7:
	.ascii "Opening device %s\12\0"
LC8:
	.ascii "Test finished.\0"
	.align 2
LC9:
	.ascii "An error occured while using the portaudio stream\12\0"
LC10:
	.ascii "Error number: %d\12\0"
LC11:
	.ascii "Error message: %s\12\0"
	.text
.globl _main
	.private_extern _main
_main:
LFB32:
	.loc 1 77 0
LVL6:
	pushl	%ebp
LCFI4:
	movl	%esp, %ebp
LCFI5:
	pushl	%edi
LCFI6:
	pushl	%esi
LCFI7:
	pushl	%ebx
LCFI8:
	subl	$332, %esp
LCFI9:
	movl	12(%ebp), %edi
	.loc 1 77 0
	movl	L___stack_chk_guard$non_lazy_ptr, %eax
	movl	(%eax), %edx
	movl	%edx, -28(%ebp)
	xorl	%edx, %edx
	.loc 1 79 0
	movl	$0, -288(%ebp)
LVL7:
	.loc 1 82 0
	leal	-284(%ebp), %ebx
	movl	$256, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	_memset
	.loc 1 88 0
	movl	$LC2, (%esp)
	call	_puts
	.loc 1 93 0
	call	_Pa_Initialize
	movl	%eax, %esi
LVL8:
	.loc 1 94 0
	testl	%eax, %eax
	jne	L12
LVL9:
	.loc 1 97 0
	movl	$0, 32(%esp)
	movl	$_ThroughputCallback, 28(%esp)
	movl	$128, 24(%esp)
	movl	$0, 16(%esp)
	movl	$1086690560, 20(%esp)
	movl	$1, 12(%esp)
	movl	$2, 8(%esp)
	movl	$2, 4(%esp)
	leal	-292(%ebp), %eax
LVL10:
	movl	%eax, (%esp)
	call	_Pa_OpenDefaultStream
	movl	%eax, %esi
	.loc 1 104 0
	testl	%eax, %eax
	jne	L12
LVL11:
	.loc 1 106 0
	movl	-292(%ebp), %eax
LVL12:
	movl	%eax, (%esp)
	call	_Pa_StartStream
	movl	%eax, %esi
	.loc 1 107 0
	testl	%eax, %eax
	jne	L12
LVL13:
	.loc 1 109 0
	movl	$LC4, (%esp)
	call	_puts
LVL14:
	.loc 1 111 0
	cmpl	$2, 8(%ebp)
	je	L16
LVL15:
	.loc 1 112 0
	movl	$LC5, (%esp)
	call	_puts
	.loc 1 113 0
	movl	$LC6, (%esp)
	call	_puts
	.loc 1 114 0
	movl	$1, (%esp)
	call	_exit
L16:
	.loc 1 117 0
	movl	4(%edi), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	.loc 1 119 0
	movl	%ebx, 16(%esp)
	movl	$512, 12(%esp)
	movl	$1, 8(%esp)
	movl	$2048, 4(%esp)
	movl	4(%edi), %eax
	movl	%eax, (%esp)
	call	_pcap_open_live
	.loc 1 121 0
	leal	-288(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	$_processPacket, 8(%esp)
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
LVL16:
	call	_pcap_loop
LVL17:
	.loc 1 123 0
	call	_Pa_Terminate
	.loc 1 124 0
	movl	$LC8, (%esp)
	call	_puts
	jmp	L18
LVL18:
L12:
	.loc 1 128 0
	call	_Pa_Terminate
LVL19:
	.loc 1 129 0
	movl	L___stderrp$non_lazy_ptr, %ebx
	movl	(%ebx), %eax
	movl	%eax, 12(%esp)
	movl	$50, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC9, (%esp)
	call	_fwrite$UNIX2003
	.loc 1 130 0
	movl	%esi, 8(%esp)
	movl	$LC10, 4(%esp)
	movl	(%ebx), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 131 0
	movl	%esi, (%esp)
	call	_Pa_GetErrorText
	movl	%eax, 8(%esp)
	movl	$LC11, 4(%esp)
	movl	(%ebx), %eax
	movl	%eax, (%esp)
	call	_fprintf
LVL20:
L18:
	.loc 1 135 0
	movl	%esi, %eax
	movl	L___stack_chk_guard$non_lazy_ptr, %ecx
	movl	-28(%ebp), %edx
	xorl	(%ecx), %edx
	je	L20
	call	___stack_chk_fail
L20:
	addl	$332, %esp
	popl	%ebx
	popl	%esi
LVL21:
	popl	%edi
LVL22:
	leave
	ret
LFE32:
.globl _processPacket
	.private_extern _processPacket
_processPacket:
LFB31:
	.loc 1 48 0
LVL23:
	pushl	%ebp
LCFI10:
	movl	%esp, %ebp
LCFI11:
	pushl	%edi
LCFI12:
	pushl	%esi
LCFI13:
	pushl	%ebx
LCFI14:
	subl	$28, %esp
LCFI15:
	movl	16(%ebp), %edi
	.loc 1 57 0
	movl	L_ptr$non_lazy_ptr, %esi
	movl	L_data$non_lazy_ptr, %eax
	movl	%eax, (%esi)
	xorl	%eax, %eax
	jmp	L22
LVL24:
L23:
	.loc 1 60 0
	movzbl	-1(%ebx,%edi), %eax
	movl	%eax, (%esp)
	call	_putchar
	.loc 1 61 0
	movl	(%esi), %edx
	movzbl	-1(%ebx,%edi), %eax
	movl	%eax, (%edx)
	.loc 1 62 0
	addl	$4, (%esi)
	movl	%ebx, %eax
LVL25:
L22:
	leal	1(%eax), %ebx
	.loc 1 59 0
	movl	12(%ebp), %edx
	cmpl	%eax, 12(%edx)
	ja	L23
LVL26:
	.loc 1 75 0
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
LVL27:
	leave
	ret
LFE31:
	.private_extern _data
.comm _data,200192,5
	.private_extern _ptr
.comm _ptr,4,2
	.literal8
	.align 3
LC1:
	.long	3539053052
	.long	1062232653
	.section __DWARF,__debug_frame,regular,debug
Lframe0:
	.set L$set$0,LECIE0-LSCIE0
	.long L$set$0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x8
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0x88
	.byte	0x1
	.align 2
LECIE0:
LSFDE0:
	.set L$set$1,LEFDE0-LASFDE0
	.long L$set$1
LASFDE0:
	.set L$set$2,Lframe0-Lsection__debug_frame
	.long L$set$2
	.long	LFB30
	.set L$set$3,LFE30-LFB30
	.long L$set$3
	.byte	0x4
	.set L$set$4,LCFI0-LFB30
	.long L$set$4
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$5,LCFI1-LCFI0
	.long L$set$5
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$6,LCFI3-LCFI1
	.long L$set$6
	.byte	0x83
	.byte	0x4
	.byte	0x86
	.byte	0x3
	.align 2
LEFDE0:
LSFDE2:
	.set L$set$7,LEFDE2-LASFDE2
	.long L$set$7
LASFDE2:
	.set L$set$8,Lframe0-Lsection__debug_frame
	.long L$set$8
	.long	LFB32
	.set L$set$9,LFE32-LFB32
	.long L$set$9
	.byte	0x4
	.set L$set$10,LCFI4-LFB32
	.long L$set$10
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$11,LCFI5-LCFI4
	.long L$set$11
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$12,LCFI9-LCFI5
	.long L$set$12
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE2:
LSFDE4:
	.set L$set$13,LEFDE4-LASFDE4
	.long L$set$13
LASFDE4:
	.set L$set$14,Lframe0-Lsection__debug_frame
	.long L$set$14
	.long	LFB31
	.set L$set$15,LFE31-LFB31
	.long L$set$15
	.byte	0x4
	.set L$set$16,LCFI10-LFB31
	.long L$set$16
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$17,LCFI11-LCFI10
	.long L$set$17
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$18,LCFI15-LCFI11
	.long L$set$18
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE4:
	.text
Letext0:
	.section __DWARF,__debug_loc,regular,debug
Ldebug_loc0:
LLST0:
	.set L$set$19,LFB30-Ltext0
	.long L$set$19
	.set L$set$20,LCFI0-Ltext0
	.long L$set$20
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$21,LCFI0-Ltext0
	.long L$set$21
	.set L$set$22,LCFI1-Ltext0
	.long L$set$22
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$23,LCFI1-Ltext0
	.long L$set$23
	.set L$set$24,LFE30-Ltext0
	.long L$set$24
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST1:
	.set L$set$25,LVL0-Ltext0
	.long L$set$25
	.set L$set$26,LVL1-Ltext0
	.long L$set$26
	.word	0x2
	.byte	0x91
	.byte	0x4
	.set L$set$27,LVL1-Ltext0
	.long L$set$27
	.set L$set$28,LVL5-Ltext0
	.long L$set$28
	.word	0x2
	.byte	0x53
	.byte	0xf0
	.set L$set$29,LVL5-Ltext0
	.long L$set$29
	.set L$set$30,LFE30-Ltext0
	.long L$set$30
	.word	0x3
	.byte	0x75
	.byte	0xc
	.byte	0xf0
	.long	0x0
	.long	0x0
LLST2:
	.set L$set$31,LVL0-Ltext0
	.long L$set$31
	.set L$set$32,LVL1-Ltext0
	.long L$set$32
	.word	0x2
	.byte	0x91
	.byte	0x8
	.set L$set$33,LVL1-Ltext0
	.long L$set$33
	.set L$set$34,LVL2-Ltext0
	.long L$set$34
	.word	0x2
	.byte	0x52
	.byte	0xf0
	.set L$set$35,LVL2-Ltext0
	.long L$set$35
	.set L$set$36,LFE30-Ltext0
	.long L$set$36
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST3:
	.set L$set$37,LFB32-Ltext0
	.long L$set$37
	.set L$set$38,LCFI4-Ltext0
	.long L$set$38
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$39,LCFI4-Ltext0
	.long L$set$39
	.set L$set$40,LCFI5-Ltext0
	.long L$set$40
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$41,LCFI5-Ltext0
	.long L$set$41
	.set L$set$42,LFE32-Ltext0
	.long L$set$42
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST4:
	.set L$set$43,LVL6-Ltext0
	.long L$set$43
	.set L$set$44,LVL15-Ltext0
	.long L$set$44
	.word	0x2
	.byte	0x91
	.byte	0x0
	.set L$set$45,LVL15-Ltext0
	.long L$set$45
	.set L$set$46,LVL18-Ltext0
	.long L$set$46
	.word	0x3
	.byte	0x75
	.byte	0x8
	.byte	0xf0
	.set L$set$47,LVL18-Ltext0
	.long L$set$47
	.set L$set$48,LFE32-Ltext0
	.long L$set$48
	.word	0x2
	.byte	0x91
	.byte	0x0
	.long	0x0
	.long	0x0
LLST5:
	.set L$set$49,LVL6-Ltext0
	.long L$set$49
	.set L$set$50,LVL9-Ltext0
	.long L$set$50
	.word	0x2
	.byte	0x91
	.byte	0x4
	.set L$set$51,LVL9-Ltext0
	.long L$set$51
	.set L$set$52,LVL22-Ltext0
	.long L$set$52
	.word	0x2
	.byte	0x57
	.byte	0xf0
	.set L$set$53,LVL22-Ltext0
	.long L$set$53
	.set L$set$54,LFE32-Ltext0
	.long L$set$54
	.word	0x3
	.byte	0x75
	.byte	0xc
	.byte	0xf0
	.long	0x0
	.long	0x0
LLST6:
	.set L$set$55,LVL16-Ltext0
	.long L$set$55
	.set L$set$56,LVL17-Ltext0
	.long L$set$56
	.word	0x2
	.byte	0x50
	.byte	0xf0
	.long	0x0
	.long	0x0
LLST7:
	.set L$set$57,LVL8-Ltext0
	.long L$set$57
	.set L$set$58,LVL9-Ltext0
	.long L$set$58
	.word	0x1
	.byte	0x56
	.set L$set$59,LVL9-Ltext0
	.long L$set$59
	.set L$set$60,LVL10-Ltext0
	.long L$set$60
	.word	0x2
	.byte	0x50
	.byte	0xf0
	.set L$set$61,LVL10-Ltext0
	.long L$set$61
	.set L$set$62,LVL11-Ltext0
	.long L$set$62
	.word	0x1
	.byte	0x56
	.set L$set$63,LVL11-Ltext0
	.long L$set$63
	.set L$set$64,LVL12-Ltext0
	.long L$set$64
	.word	0x2
	.byte	0x50
	.byte	0xf0
	.set L$set$65,LVL12-Ltext0
	.long L$set$65
	.set L$set$66,LVL13-Ltext0
	.long L$set$66
	.word	0x1
	.byte	0x56
	.set L$set$67,LVL13-Ltext0
	.long L$set$67
	.set L$set$68,LVL14-Ltext0
	.long L$set$68
	.word	0x2
	.byte	0x50
	.byte	0xf0
	.set L$set$69,LVL14-Ltext0
	.long L$set$69
	.set L$set$70,LVL18-Ltext0
	.long L$set$70
	.word	0x1
	.byte	0x56
	.set L$set$71,LVL18-Ltext0
	.long L$set$71
	.set L$set$72,LVL19-Ltext0
	.long L$set$72
	.word	0x2
	.byte	0x50
	.byte	0xf0
	.set L$set$73,LVL19-Ltext0
	.long L$set$73
	.set L$set$74,LVL21-Ltext0
	.long L$set$74
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST8:
	.set L$set$75,LFB31-Ltext0
	.long L$set$75
	.set L$set$76,LCFI10-Ltext0
	.long L$set$76
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$77,LCFI10-Ltext0
	.long L$set$77
	.set L$set$78,LCFI11-Ltext0
	.long L$set$78
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$79,LCFI11-Ltext0
	.long L$set$79
	.set L$set$80,LFE31-Ltext0
	.long L$set$80
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST9:
	.set L$set$81,LVL23-Ltext0
	.long L$set$81
	.set L$set$82,LVL24-Ltext0
	.long L$set$82
	.word	0x2
	.byte	0x91
	.byte	0x4
	.set L$set$83,LVL24-Ltext0
	.long L$set$83
	.set L$set$84,LVL25-Ltext0
	.long L$set$84
	.word	0x2
	.byte	0x75
	.byte	0xc
	.set L$set$85,LVL25-Ltext0
	.long L$set$85
	.set L$set$86,LVL26-Ltext0
	.long L$set$86
	.word	0x2
	.byte	0x91
	.byte	0x4
	.set L$set$87,LVL26-Ltext0
	.long L$set$87
	.set L$set$88,LFE31-Ltext0
	.long L$set$88
	.word	0x3
	.byte	0x75
	.byte	0xc
	.byte	0xf0
	.long	0x0
	.long	0x0
LLST10:
	.set L$set$89,LVL23-Ltext0
	.long L$set$89
	.set L$set$90,LVL24-Ltext0
	.long L$set$90
	.word	0x2
	.byte	0x91
	.byte	0x8
	.set L$set$91,LVL24-Ltext0
	.long L$set$91
	.set L$set$92,LVL27-Ltext0
	.long L$set$92
	.word	0x2
	.byte	0x57
	.byte	0xf0
	.set L$set$93,LVL27-Ltext0
	.long L$set$93
	.set L$set$94,LFE31-Ltext0
	.long L$set$94
	.word	0x3
	.byte	0x75
	.byte	0x10
	.byte	0xf0
	.long	0x0
	.long	0x0
	.file 2 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/i386/_types.h"
	.file 3 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/sys/_types.h"
	.file 4 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/sys/types.h"
	.file 5 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/sys/_structs.h"
	.file 6 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/pcap/bpf.h"
	.file 7 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/stdio.h"
	.file 8 "/Developer/SDKs/MacOSX10.6.sdk/usr/include/pcap/pcap.h"
	.file 9 "/Users/Jonas/Documents/Projekty/SonTCPdump/sonodump/include/portaudio.h"
	.section __DWARF,__debug_info,regular,debug
	.long	0xb2c
	.word	0x2
	.set L$set$95,Ldebug_abbrev0-Lsection__debug_abbrev
	.long L$set$95
	.byte	0x4
	.byte	0x1
	.ascii "GNU C 4.2.1 (Apple Inc. build 5666) (dot 3)\0"
	.byte	0x1
	.ascii "/Users/Jonas/Documents/Projekty/SonTCPdump/sonodump/main.c\0"
	.byte	0x1
	.long	Ltext0
	.long	Letext0
	.set L$set$96,Ldebug_line0-Lsection__debug_line
	.long L$set$96
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.byte	0x3
	.ascii "__int32_t\0"
	.byte	0x2
	.byte	0x2c
	.long	0xd5
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.byte	0x3
	.ascii "__int64_t\0"
	.byte	0x2
	.byte	0x2e
	.long	0xfd
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.byte	0x3
	.ascii "__darwin_time_t\0"
	.byte	0x2
	.byte	0x76
	.long	0x128
	.byte	0x5
	.byte	0x4
	.byte	0x3
	.ascii "__darwin_off_t\0"
	.byte	0x3
	.byte	0x6e
	.long	0xec
	.byte	0x3
	.ascii "__darwin_suseconds_t\0"
	.byte	0x3
	.byte	0x84
	.long	0xc4
	.byte	0x3
	.ascii "u_char\0"
	.byte	0x4
	.byte	0x54
	.long	0x90
	.byte	0x3
	.ascii "u_int\0"
	.byte	0x4
	.byte	0x56
	.long	0xdc
	.byte	0x6
	.byte	0x4
	.long	0x137
	.byte	0x7
	.ascii "timeval\0"
	.byte	0x8
	.byte	0x5
	.byte	0x65
	.long	0x1f4
	.byte	0x8
	.ascii "tv_sec\0"
	.byte	0x5
	.byte	0x66
	.long	0x154
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x8
	.ascii "tv_usec\0"
	.byte	0x5
	.byte	0x67
	.long	0x183
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "bpf_u_int32\0"
	.byte	0x6
	.byte	0x44
	.long	0x1ad
	.byte	0x3
	.ascii "fpos_t\0"
	.byte	0x7
	.byte	0x57
	.long	0x16d
	.byte	0x7
	.ascii "__sbuf\0"
	.byte	0x8
	.byte	0x7
	.byte	0x62
	.long	0x245
	.byte	0x8
	.ascii "_base\0"
	.byte	0x7
	.byte	0x63
	.long	0x245
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x8
	.ascii "_size\0"
	.byte	0x7
	.byte	0x64
	.long	0xd5
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x90
	.byte	0x7
	.ascii "__sFILE\0"
	.byte	0x58
	.byte	0x7
	.byte	0x84
	.long	0x399
	.byte	0x8
	.ascii "_p\0"
	.byte	0x7
	.byte	0x85
	.long	0x245
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x8
	.ascii "_r\0"
	.byte	0x7
	.byte	0x86
	.long	0xd5
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x8
	.ascii "_w\0"
	.byte	0x7
	.byte	0x87
	.long	0xd5
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x8
	.ascii "_flags\0"
	.byte	0x7
	.byte	0x88
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x8
	.ascii "_file\0"
	.byte	0x7
	.byte	0x89
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.byte	0xe
	.byte	0x8
	.ascii "_bf\0"
	.byte	0x7
	.byte	0x8a
	.long	0x215
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x8
	.ascii "_lbfsize\0"
	.byte	0x7
	.byte	0x8b
	.long	0xd5
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x8
	.ascii "_cookie\0"
	.byte	0x7
	.byte	0x8e
	.long	0x16b
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x8
	.ascii "_close\0"
	.byte	0x7
	.byte	0x8f
	.long	0x3a9
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x8
	.ascii "_read\0"
	.byte	0x7
	.byte	0x90
	.long	0x3c9
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x8
	.ascii "_seek\0"
	.byte	0x7
	.byte	0x91
	.long	0x3e9
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x8
	.ascii "_write\0"
	.byte	0x7
	.byte	0x92
	.long	0x414
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0x8
	.ascii "_ub\0"
	.byte	0x7
	.byte	0x95
	.long	0x215
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x8
	.ascii "_extra\0"
	.byte	0x7
	.byte	0x96
	.long	0x425
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x8
	.ascii "_ur\0"
	.byte	0x7
	.byte	0x97
	.long	0xd5
	.byte	0x2
	.byte	0x23
	.byte	0x3c
	.byte	0x8
	.ascii "_ubuf\0"
	.byte	0x7
	.byte	0x9a
	.long	0x42b
	.byte	0x2
	.byte	0x23
	.byte	0x40
	.byte	0x8
	.ascii "_nbuf\0"
	.byte	0x7
	.byte	0x9b
	.long	0x43b
	.byte	0x2
	.byte	0x23
	.byte	0x43
	.byte	0x8
	.ascii "_lb\0"
	.byte	0x7
	.byte	0x9e
	.long	0x215
	.byte	0x2
	.byte	0x23
	.byte	0x44
	.byte	0x8
	.ascii "_blksize\0"
	.byte	0x7
	.byte	0xa1
	.long	0xd5
	.byte	0x2
	.byte	0x23
	.byte	0x4c
	.byte	0x8
	.ascii "_offset\0"
	.byte	0x7
	.byte	0xa2
	.long	0x207
	.byte	0x2
	.byte	0x23
	.byte	0x50
	.byte	0x0
	.byte	0x9
	.byte	0x1
	.long	0xd5
	.long	0x3a9
	.byte	0xa
	.long	0x16b
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x399
	.byte	0x9
	.byte	0x1
	.long	0xd5
	.long	0x3c9
	.byte	0xa
	.long	0x16b
	.byte	0xa
	.long	0x1ba
	.byte	0xa
	.long	0xd5
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x3af
	.byte	0x9
	.byte	0x1
	.long	0x207
	.long	0x3e9
	.byte	0xa
	.long	0x16b
	.byte	0xa
	.long	0x207
	.byte	0xa
	.long	0xd5
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x3cf
	.byte	0x9
	.byte	0x1
	.long	0xd5
	.long	0x409
	.byte	0xa
	.long	0x16b
	.byte	0xa
	.long	0x409
	.byte	0xa
	.long	0xd5
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x40f
	.byte	0xb
	.long	0x137
	.byte	0x6
	.byte	0x4
	.long	0x3ef
	.byte	0xc
	.ascii "__sFILEX\0"
	.byte	0x1
	.byte	0x6
	.byte	0x4
	.long	0x41a
	.byte	0xd
	.long	0x90
	.long	0x43b
	.byte	0xe
	.long	0x134
	.byte	0x2
	.byte	0x0
	.byte	0xd
	.long	0x90
	.long	0x44b
	.byte	0xe
	.long	0x134
	.byte	0x0
	.byte	0x0
	.byte	0x3
	.ascii "FILE\0"
	.byte	0x7
	.byte	0xa3
	.long	0x24b
	.byte	0x3
	.ascii "pcap_t\0"
	.byte	0x8
	.byte	0x4a
	.long	0x465
	.byte	0xc
	.ascii "pcap\0"
	.byte	0x1
	.byte	0xf
	.set L$set$97,LASF0-Lsection__debug_str
	.long L$set$97
	.byte	0x10
	.byte	0x8
	.byte	0x9a
	.long	0x4a5
	.byte	0x8
	.ascii "ts\0"
	.byte	0x8
	.byte	0x9b
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x8
	.ascii "caplen\0"
	.byte	0x8
	.byte	0x9c
	.long	0x1f4
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x8
	.ascii "len\0"
	.byte	0x8
	.byte	0x9d
	.long	0x1f4
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x19f
	.byte	0x6
	.byte	0x4
	.long	0x4b1
	.byte	0x10
	.set L$set$98,LASF0-Lsection__debug_str
	.long L$set$98
	.long	0x46c
	.byte	0x6
	.byte	0x4
	.long	0x4c0
	.byte	0xb
	.long	0x19f
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.byte	0x3
	.ascii "PaError\0"
	.byte	0x9
	.byte	0x45
	.long	0xd5
	.byte	0x11
	.ascii "PaErrorCode\0"
	.byte	0x4
	.byte	0x9
	.byte	0x47
	.long	0x7ea
	.byte	0x12
	.ascii "paNoError\0"
	.byte	0x0
	.byte	0x12
	.ascii "paNotInitialized\0"
	.byte	0xf0,0xb1,0x7f
	.byte	0x12
	.ascii "paUnanticipatedHostError\0"
	.byte	0xf1,0xb1,0x7f
	.byte	0x12
	.ascii "paInvalidChannelCount\0"
	.byte	0xf2,0xb1,0x7f
	.byte	0x12
	.ascii "paInvalidSampleRate\0"
	.byte	0xf3,0xb1,0x7f
	.byte	0x12
	.ascii "paInvalidDevice\0"
	.byte	0xf4,0xb1,0x7f
	.byte	0x12
	.ascii "paInvalidFlag\0"
	.byte	0xf5,0xb1,0x7f
	.byte	0x12
	.ascii "paSampleFormatNotSupported\0"
	.byte	0xf6,0xb1,0x7f
	.byte	0x12
	.ascii "paBadIODeviceCombination\0"
	.byte	0xf7,0xb1,0x7f
	.byte	0x12
	.ascii "paInsufficientMemory\0"
	.byte	0xf8,0xb1,0x7f
	.byte	0x12
	.ascii "paBufferTooBig\0"
	.byte	0xf9,0xb1,0x7f
	.byte	0x12
	.ascii "paBufferTooSmall\0"
	.byte	0xfa,0xb1,0x7f
	.byte	0x12
	.ascii "paNullCallback\0"
	.byte	0xfb,0xb1,0x7f
	.byte	0x12
	.ascii "paBadStreamPtr\0"
	.byte	0xfc,0xb1,0x7f
	.byte	0x12
	.ascii "paTimedOut\0"
	.byte	0xfd,0xb1,0x7f
	.byte	0x12
	.ascii "paInternalError\0"
	.byte	0xfe,0xb1,0x7f
	.byte	0x12
	.ascii "paDeviceUnavailable\0"
	.byte	0xff,0xb1,0x7f
	.byte	0x12
	.ascii "paIncompatibleHostApiSpecificStreamInfo\0"
	.byte	0x80,0xb2,0x7f
	.byte	0x12
	.ascii "paStreamIsStopped\0"
	.byte	0x81,0xb2,0x7f
	.byte	0x12
	.ascii "paStreamIsNotStopped\0"
	.byte	0x82,0xb2,0x7f
	.byte	0x12
	.ascii "paInputOverflowed\0"
	.byte	0x83,0xb2,0x7f
	.byte	0x12
	.ascii "paOutputUnderflowed\0"
	.byte	0x84,0xb2,0x7f
	.byte	0x12
	.ascii "paHostApiNotFound\0"
	.byte	0x85,0xb2,0x7f
	.byte	0x12
	.ascii "paInvalidHostApi\0"
	.byte	0x86,0xb2,0x7f
	.byte	0x12
	.ascii "paCanNotReadFromACallbackStream\0"
	.byte	0x87,0xb2,0x7f
	.byte	0x12
	.ascii "paCanNotWriteToACallbackStream\0"
	.byte	0x88,0xb2,0x7f
	.byte	0x12
	.ascii "paCanNotReadFromAnOutputOnlyStream\0"
	.byte	0x89,0xb2,0x7f
	.byte	0x12
	.ascii "paCanNotWriteToAnInputOnlyStream\0"
	.byte	0x8a,0xb2,0x7f
	.byte	0x12
	.ascii "paIncompatibleStreamHostApi\0"
	.byte	0x8b,0xb2,0x7f
	.byte	0x12
	.ascii "paBadBufferPtr\0"
	.byte	0x8c,0xb2,0x7f
	.byte	0x0
	.byte	0x13
	.ascii "PaTime\0"
	.byte	0x9
	.word	0x196
	.long	0x4ce
	.byte	0x14
	.ascii "PaStream\0"
	.byte	0x9
	.word	0x243
	.byte	0x15
	.set L$set$99,LASF1-Lsection__debug_str
	.long L$set$99
	.byte	0x18
	.byte	0x9
	.word	0x27f
	.long	0x868
	.byte	0x16
	.ascii "inputBufferAdcTime\0"
	.byte	0x9
	.word	0x280
	.long	0x7ea
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x16
	.ascii "currentTime\0"
	.byte	0x9
	.word	0x281
	.long	0x7ea
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x16
	.ascii "outputBufferDacTime\0"
	.byte	0x9
	.word	0x282
	.long	0x7ea
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x17
	.set L$set$100,LASF1-Lsection__debug_str
	.long L$set$100
	.byte	0x9
	.word	0x283
	.long	0x806
	.byte	0x13
	.ascii "PaStreamCallbackFlags\0"
	.byte	0x9
	.word	0x28c
	.long	0x13f
	.byte	0x6
	.byte	0x4
	.long	0x898
	.byte	0x18
	.byte	0x6
	.byte	0x4
	.long	0x89f
	.byte	0xb
	.long	0x868
	.byte	0x19
	.set L$set$101,LASF3-Lsection__debug_str
	.long L$set$101
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.long	0xd5
	.long	LFB30
	.long	LFE30
	.set L$set$102,LLST0-Lsection__debug_loc
	.long L$set$102
	.byte	0x1
	.long	0x969
	.byte	0x1a
	.ascii "inputBuffer\0"
	.byte	0x1
	.byte	0x15
	.long	0x892
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1b
	.ascii "outputBuffer\0"
	.byte	0x1
	.byte	0x15
	.long	0x16b
	.set L$set$103,LLST1-Lsection__debug_loc
	.long L$set$103
	.byte	0x1b
	.ascii "framesPerBuffer\0"
	.byte	0x1
	.byte	0x16
	.long	0x13f
	.set L$set$104,LLST2-Lsection__debug_loc
	.long L$set$104
	.byte	0x1a
	.ascii "timeInfo\0"
	.byte	0x1
	.byte	0x17
	.long	0x899
	.byte	0x2
	.byte	0x91
	.byte	0xc
	.byte	0x1a
	.ascii "statusFlags\0"
	.byte	0x1
	.byte	0x18
	.long	0x874
	.byte	0x2
	.byte	0x91
	.byte	0x10
	.byte	0x1a
	.ascii "userData\0"
	.byte	0x1
	.byte	0x19
	.long	0x16b
	.byte	0x2
	.byte	0x91
	.byte	0x14
	.byte	0x1c
	.set L$set$105,LASF2-Lsection__debug_str
	.long L$set$105
	.byte	0x1
	.byte	0x19
	.long	0x892
	.byte	0x2
	.byte	0x91
	.byte	0x18
	.byte	0x1d
	.ascii "out\0"
	.byte	0x1
	.byte	0x1d
	.long	0x969
	.byte	0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0x1e
	.long	0xd5
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x4c5
	.byte	0x1e
	.byte	0x1
	.set L$set$106,LASF4-Lsection__debug_str
	.long L$set$106
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.long	0xd5
	.long	LFB32
	.long	LFE32
	.set L$set$107,LLST3-Lsection__debug_loc
	.long L$set$107
	.byte	0x1
	.long	0xa11
	.byte	0x1b
	.ascii "argc\0"
	.byte	0x1
	.byte	0x4d
	.long	0xd5
	.set L$set$108,LLST4-Lsection__debug_loc
	.long L$set$108
	.byte	0x1b
	.ascii "argv\0"
	.byte	0x1
	.byte	0x4d
	.long	0xa11
	.set L$set$109,LLST5-Lsection__debug_loc
	.long L$set$109
	.byte	0x1f
	.ascii "count\0"
	.byte	0x1
	.byte	0x4f
	.long	0xd5
	.byte	0x3
	.byte	0x75
	.byte	0xe0,0x7d
	.byte	0x20
	.ascii "descr\0"
	.byte	0x1
	.byte	0x50
	.long	0xa17
	.set L$set$110,LLST6-Lsection__debug_loc
	.long L$set$110
	.byte	0x1f
	.ascii "errbuf\0"
	.byte	0x1
	.byte	0x51
	.long	0xa1d
	.byte	0x3
	.byte	0x91
	.byte	0xdc,0x7d
	.byte	0x1f
	.ascii "stream\0"
	.byte	0x1
	.byte	0x56
	.long	0xa2d
	.byte	0x4
	.byte	0x75
	.byte	0xdc,0x7d
	.byte	0xf0
	.byte	0x20
	.ascii "err\0"
	.byte	0x1
	.byte	0x57
	.long	0x4d8
	.set L$set$111,LLST7-Lsection__debug_loc
	.long L$set$111
	.byte	0x21
	.ascii "error\0"
	.byte	0x1
	.byte	0x7f
	.long	L12
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x1ba
	.byte	0x6
	.byte	0x4
	.long	0x457
	.byte	0xd
	.long	0x137
	.long	0xa2d
	.byte	0xe
	.long	0x134
	.byte	0xff
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0x7f9
	.byte	0x22
	.byte	0x1
	.set L$set$112,LASF5-Lsection__debug_str
	.long L$set$112
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.long	LFB31
	.long	LFE31
	.set L$set$113,LLST8-Lsection__debug_loc
	.long L$set$113
	.byte	0x1
	.long	0xaa6
	.byte	0x1a
	.ascii "arg\0"
	.byte	0x1
	.byte	0x30
	.long	0x4a5
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1b
	.ascii "pkthdr\0"
	.byte	0x1
	.byte	0x30
	.long	0x4ab
	.set L$set$114,LLST9-Lsection__debug_loc
	.long L$set$114
	.byte	0x1b
	.ascii "packet\0"
	.byte	0x1
	.byte	0x30
	.long	0x4ba
	.set L$set$115,LLST10-Lsection__debug_loc
	.long L$set$115
	.byte	0x1c
	.set L$set$116,LASF2-Lsection__debug_str
	.long L$set$116
	.byte	0x1
	.byte	0x30
	.long	0x892
	.byte	0x2
	.byte	0x91
	.byte	0xc
	.byte	0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0x33
	.long	0xd5
	.byte	0x1d
	.ascii "counter\0"
	.byte	0x1
	.byte	0x33
	.long	0xaa6
	.byte	0x0
	.byte	0x6
	.byte	0x4
	.long	0xd5
	.byte	0xd
	.long	0xd5
	.long	0xab7
	.byte	0x23
	.byte	0x0
	.byte	0x24
	.ascii "__CFConstantStringClassReference\0"
	.long	0xaac
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x25
	.ascii "__stderrp\0"
	.byte	0x7
	.byte	0xa9
	.long	0xaf3
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.byte	0x4
	.long	0x44b
	.byte	0xd
	.long	0xd5
	.long	0xb0a
	.byte	0x26
	.long	0x134
	.word	0xc37f
	.byte	0x0
	.byte	0x27
	.ascii "data\0"
	.byte	0x1
	.byte	0x12
	.long	0xaf9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_data
	.byte	0x27
	.ascii "ptr\0"
	.byte	0x1
	.byte	0x13
	.long	0xaa6
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_ptr
	.byte	0x0
	.section __DWARF,__debug_abbrev,regular,debug
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0xe1,0x7f
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0x0
	.byte	0x0
	.byte	0x2
	.byte	0x24
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x0
	.byte	0x0
	.byte	0x3
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x4
	.byte	0x24
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x5
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x6
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x7
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x9
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xa
	.byte	0x5
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xb
	.byte	0x26
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xc
	.byte	0x13
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xe
	.byte	0x21
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0xf
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x10
	.byte	0x26
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x11
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x12
	.byte	0x28
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x1c
	.byte	0xd
	.byte	0x0
	.byte	0x0
	.byte	0x13
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x14
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x0
	.byte	0x0
	.byte	0x15
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x16
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x17
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x18
	.byte	0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x19
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0xe1,0x7f
	.byte	0xc
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1a
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x1b
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0x0
	.byte	0x0
	.byte	0x1c
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x1d
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1e
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0xe1,0x7f
	.byte	0xc
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1f
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x20
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x6
	.byte	0x0
	.byte	0x0
	.byte	0x21
	.byte	0xa
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x22
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0xe1,0x7f
	.byte	0xc
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x23
	.byte	0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x24
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x34
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x25
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x26
	.byte	0x21
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0x0
	.byte	0x0
	.byte	0x27
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section __DWARF,__debug_pubnames,regular,debug
	.long	0x3a
	.word	0x2
	.set L$set$117,Ldebug_info0-Lsection__debug_info
	.long L$set$117
	.long	0xb30
	.long	0x96f
	.ascii "main\0"
	.long	0xa33
	.ascii "processPacket\0"
	.long	0xb0a
	.ascii "data\0"
	.long	0xb1d
	.ascii "ptr\0"
	.long	0x0
	.section __DWARF,__debug_pubtypes,regular,debug
	.long	0x151
	.word	0x2
	.set L$set$118,Ldebug_info0-Lsection__debug_info
	.long L$set$118
	.long	0xb30
	.long	0xc4
	.ascii "__int32_t\0"
	.long	0xec
	.ascii "__int64_t\0"
	.long	0x154
	.ascii "__darwin_time_t\0"
	.long	0x16d
	.ascii "__darwin_off_t\0"
	.long	0x183
	.ascii "__darwin_suseconds_t\0"
	.long	0x19f
	.ascii "u_char\0"
	.long	0x1ad
	.ascii "u_int\0"
	.long	0x1c0
	.ascii "timeval\0"
	.long	0x1f4
	.ascii "bpf_u_int32\0"
	.long	0x207
	.ascii "fpos_t\0"
	.long	0x215
	.ascii "__sbuf\0"
	.long	0x24b
	.ascii "__sFILE\0"
	.long	0x44b
	.ascii "FILE\0"
	.long	0x46c
	.ascii "pcap_pkthdr\0"
	.long	0x4d8
	.ascii "PaError\0"
	.long	0x4e7
	.ascii "PaErrorCode\0"
	.long	0x7ea
	.ascii "PaTime\0"
	.long	0x806
	.ascii "PaStreamCallbackTimeInfo\0"
	.long	0x868
	.ascii "PaStreamCallbackTimeInfo\0"
	.long	0x874
	.ascii "PaStreamCallbackFlags\0"
	.long	0x0
	.section __DWARF,__debug_aranges,regular,debug
	.long	0x1c
	.word	0x2
	.set L$set$119,Ldebug_info0-Lsection__debug_info
	.long L$set$119
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	Ltext0
	.set L$set$120,Letext0-Ltext0
	.long L$set$120
	.long	0x0
	.long	0x0
	.section __DWARF,__debug_str,regular,debug
LASF0:
	.ascii "pcap_pkthdr\0"
LASF1:
	.ascii "PaStreamCallbackTimeInfo\0"
LASF2:
	.ascii "packetData\0"
LASF3:
	.ascii "ThroughputCallback\0"
LASF5:
	.ascii "processPacket\0"
LASF4:
	.ascii "main\0"
	.data
	.align 2
L_ptr$non_lazy_ptr:
	.long	_ptr
	.section __IMPORT,__pointers,non_lazy_symbol_pointers
L___stack_chk_guard$non_lazy_ptr:
	.indirect_symbol ___stack_chk_guard
	.long	0
L___stderrp$non_lazy_ptr:
	.indirect_symbol ___stderrp
	.long	0
	.data
	.align 2
L_data$non_lazy_ptr:
	.long	_data
	.subsections_via_symbols
