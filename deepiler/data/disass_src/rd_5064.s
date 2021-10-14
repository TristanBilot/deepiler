	.file	"rd_5064.cc"
	.text
	.section	.text._ZSt13islessgreaterdd,"axG",@progbits,_ZSt13islessgreaterdd,comdat
	.weak	_ZSt13islessgreaterdd
	.type	_ZSt13islessgreaterdd, @function
_ZSt13islessgreaterdd:
.LFB137:
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
	sete	%al
	xorl	$1, %eax
	movzbl	%al, %eax
	testl	%eax, %eax
	setne	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE137:
	.size	_ZSt13islessgreaterdd, .-_ZSt13islessgreaterdd
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
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-48(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fdim@PLT
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %xmm0
	call	floor@PLT
	movq	%xmm0, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	log@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	exp@PLT
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	call	asin@PLT
	movq	%xmm0, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
.L5:
	movsd	-56(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	_ZSt13islessgreaterdd
	testb	%al, %al
	je	.L4
	movsd	-40(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -72(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movq	%xmm0, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	tan@PLT
	movapd	%xmm0, %xmm1
	movq	%rbx, %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
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
