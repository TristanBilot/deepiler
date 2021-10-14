	.file	"rd_7384.cc"
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
	subq	$72, %rsp
	.cfi_offset 3, -24
	movsd	-40(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movsd	%xmm0, -72(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	acos@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movq	%xmm0, %rbx
	movsd	-32(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt14isgreaterequaldd
	testb	%al, %al
	je	.L4
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	log@PLT
	movsd	%xmm0, -72(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	jmp	.L5
.L4:
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movsd	%xmm0, -72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rbx
	movsd	-24(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
.L5:
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movq	%xmm0, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
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
