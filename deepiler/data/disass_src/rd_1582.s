	.file	"rd_1582.cc"
	.text
	.section	.text._ZSt14isgreaterequaldd,"axG",@progbits,_ZSt14isgreaterequaldd,comdat
	.weak	_ZSt14isgreaterequaldd
	.type	_ZSt14isgreaterequaldd, @function
_ZSt14isgreaterequaldd:
.LFB125:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	ucomisd	-16(%rbp), %xmm0
	setb	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	testl	%eax, %eax
	setne	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE125:
	.size	_ZSt14isgreaterequaldd, .-_ZSt14isgreaterequaldd
	.section	.text._ZSt11islessequaldd,"axG",@progbits,_ZSt11islessequaldd,comdat
	.weak	_ZSt11islessequaldd
	.type	_ZSt11islessequaldd, @function
_ZSt11islessequaldd:
.LFB133:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	ucomisd	-8(%rbp), %xmm0
	setb	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	testl	%eax, %eax
	setne	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE133:
	.size	_ZSt11islessequaldd, .-_ZSt11islessequaldd
	.text
	.globl	main
	.type	main, @function
main:
.LFB246:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movsd	%xmm0, -56(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	log@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
.L7:
	movsd	-24(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt14isgreaterequaldd
	testb	%al, %al
	je	.L6
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movsd	%xmm0, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L7
.L6:
	movsd	-8(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt11islessequaldd
	testb	%al, %al
	je	.L8
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	jmp	.L9
.L8:
	movsd	-40(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
.L9:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE246:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
