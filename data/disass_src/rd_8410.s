	.file	"rd_8410.cc"
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
	movsd	-24(%rbp), %xmm2
	movsd	%xmm2, -88(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movapd	%xmm0, %xmm1
	movsd	-88(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-64(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movq	%xmm0, %rbx
	movsd	-40(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	acos@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-80(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movq	%xmm0, %rbx
	movsd	-80(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
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
