	.file	"rd_4464.cc"
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
	call	pow@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-56(%rbp), %xmm1
	movsd	-64(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-64(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movq	%xmm0, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
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
