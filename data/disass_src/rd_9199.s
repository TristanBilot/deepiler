	.file	"rd_9199.cc"
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
	subq	$80, %rsp
	movsd	-24(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
.L5:
	movsd	-16(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt14isgreaterequaldd
	testb	%al, %al
	je	.L4
	movsd	-40(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	log@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	jmp	.L5
.L4:
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movsd	%xmm0, -72(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-64(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movq	%xmm0, %rax
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE246:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits