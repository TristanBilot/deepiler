	.file	"rd_3986.cc"
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
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movq	%xmm0, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	-56(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	-80(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
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
