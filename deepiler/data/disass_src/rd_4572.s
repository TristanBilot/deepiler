	.file	"rd_4572.cc"
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
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movsd	%xmm0, -56(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	acos@PLT
	movsd	%xmm0, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movsd	%xmm0, -56(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movsd	%xmm0, -56(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movsd	%xmm0, -56(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE246:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits