	.file	"rd_1161.cc"
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
	movsd	-56(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movq	%xmm0, %rbx
	movsd	-64(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmax@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	call	cos@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	floor@PLT
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
.L5:
	movsd	-40(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt6islessdd
	testb	%al, %al
	je	.L4
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movsd	%xmm0, -88(%rbp)
	movsd	-64(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	-56(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	atan2@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	atan@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-48(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	jmp	.L5
.L4:
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movsd	%xmm0, -88(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	mulsd	-88(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
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
