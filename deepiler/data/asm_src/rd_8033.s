	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_8033.cc"
	.text
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,80,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -80
	.cfi_def_cfa_offset 80
	sw	$ra, 76($sp)            # 4-byte Folded Spill
	sw	$fp, 72($sp)            # 4-byte Folded Spill
	.cfi_offset 31, -4
	.cfi_offset 30, -8
	move	$fp, $sp
	.cfi_def_cfa_register 30
	ldc1	$f12, 64($fp)
	jal	fmax
	ldc1	$f14, 16($fp)
	sdc1	$f0, 48($fp)
	jal	ceil
	ldc1	$f12, 32($fp)
	sdc1	$f0, 56($fp)
	jal	acos
	ldc1	$f12, 24($fp)
	sdc1	$f0, 32($fp)
	ldc1	$f12, 24($fp)
	jal	fmin
	ldc1	$f14, 40($fp)
	sdc1	$f0, 32($fp)
	jal	atan
	ldc1	$f12, 16($fp)
	sdc1	$f0, 48($fp)
	jal	atan
	ldc1	$f12, 16($fp)
	sdc1	$f0, 16($fp)
	jal	tan
	ldc1	$f12, 48($fp)
	sdc1	$f0, 40($fp)
	ldc1	$f12, 24($fp)
	jal	pow
	ldc1	$f14, 56($fp)
	sdc1	$f0, 64($fp)
	ldc1	$f12, 16($fp)
	jal	pow
	ldc1	$f14, 24($fp)
	sdc1	$f0, 16($fp)
	ldc1	$f12, 40($fp)
	jal	pow
	ldc1	$f14, 48($fp)
	sdc1	$f0, 24($fp)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 72($sp)            # 4-byte Folded Reload
	lw	$ra, 76($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 80
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
