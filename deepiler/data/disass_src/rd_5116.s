	.file	"rd_5116.cc"
	.text
	.section	.text._ZSt6islessdd,"axG",@progbits,_ZSt6islessdd,comdat
	.weak	_ZSt6islessdd
	.type	_ZSt6islessdd, @function
_ZSt6islessdd:
.LFB129:
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
	setbe	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	testl	%eax, %eax
	setne	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE129:
	.size	_ZSt6islessdd, .-_ZSt6islessdd
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
	subq	$80, %rsp
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -72(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt11islessequaldd
	testb	%al, %al
	je	.L6
	movsd	-32(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movsd	%xmm0, -72(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movsd	%xmm0, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movsd	%xmm0, -72(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	jmp	.L9
.L6:
	movsd	-24(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movsd	%xmm0, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
.L9:
	movsd	-8(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt6islessdd
	testb	%al, %al
	je	.L8
	movsd	-56(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movsd	%xmm0, -72(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L9
.L8:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE246:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
