	.file	"rd_8676.cc"
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
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-72(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movq	%xmm0, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movq	%xmm0, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	-64(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movsd	-72(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
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
