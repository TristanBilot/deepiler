	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_309.cc"
	.text
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,96,$ra
	.mask 	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -96
	.cfi_def_cfa_offset 96
	sdc1	$f20, 88($sp)           # 8-byte Folded Spill
	sw	$ra, 84($sp)            # 4-byte Folded Spill
	sw	$fp, 80($sp)            # 4-byte Folded Spill
	.cfi_offset 52, -8
	.cfi_offset 53, -4
	.cfi_offset 31, -12
	.cfi_offset 30, -16
	move	$fp, $sp
	.cfi_def_cfa_register 30
	jal	exp
	ldc1	$f12, 56($fp)
	sdc1	$f0, 32($fp)
	jal	asin
	ldc1	$f12, 32($fp)
	sdc1	$f0, 32($fp)
	ldc1	$f12, 32($fp)
	jal	fmin
	ldc1	$f14, 16($fp)
	sdc1	$f0, 72($fp)
	ldc1	$f12, 56($fp)
	jal	fmax
	ldc1	$f14, 64($fp)
	mov.d	$f20, $f0
	jal	exp
	ldc1	$f12, 16($fp)
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	jal	acos
	ldc1	$f12, 56($fp)
	mov.d	$f20, $f0
	jal	log10
	ldc1	$f12, 40($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 16($fp)
	ldc1	$f12, 64($fp)
	jal	fdim
	ldc1	$f14, 72($fp)
	sdc1	$f0, 32($fp)
	jal	asin
	ldc1	$f12, 40($fp)
	mov.d	$f20, $f0
	jal	tan
	ldc1	$f12, 56($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 48($fp)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 80($sp)            # 4-byte Folded Reload
	lw	$ra, 84($sp)            # 4-byte Folded Reload
	ldc1	$f20, 88($sp)           # 8-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 96
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, ($func_end0)-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.text
