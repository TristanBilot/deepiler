	.file	"rd_8537.cc"
	.text
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
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movsd	-40(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	acos@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-64(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movsd	-64(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	log@PLT
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
.L5:
	movsd	-64(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt11islessequaldd
	testb	%al, %al
	je	.L4
	movq	-72(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-72(%rbp), %xmm0
	movq	-72(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movq	%xmm0, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	jmp	.L5
.L4:
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE246:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
