	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_4043.cc"
	.text
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,104,$ra
	.mask 	0xc0000000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -104
	.cfi_def_cfa_offset 104
	sdc1	$f24, 96($sp)           # 8-byte Folded Spill
	sdc1	$f22, 88($sp)           # 8-byte Folded Spill
	sdc1	$f20, 80($sp)           # 8-byte Folded Spill
	sw	$ra, 76($sp)            # 4-byte Folded Spill
	sw	$fp, 72($sp)            # 4-byte Folded Spill
	.cfi_offset 56, -8
	.cfi_offset 57, -4
	.cfi_offset 54, -16
	.cfi_offset 55, -12
	.cfi_offset 52, -24
	.cfi_offset 53, -20
	.cfi_offset 31, -28
	.cfi_offset 30, -32
	move	$fp, $sp
	.cfi_def_cfa_register 30
	jal	asin
	ldc1	$f12, 24($fp)
	sdc1	$f0, 24($fp)
	jal	log
	ldc1	$f12, 48($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 64($fp)
	jal	pow
	ldc1	$f14, 40($fp)
	add.d	$f0, $f20, $f0
	sdc1	$f0, 16($fp)
	jal	ceil
	ldc1	$f12, 32($fp)
	sdc1	$f0, 32($fp)
	ldc1	$f12, 16($fp)
	jal	fmax
	ldc1	$f14, 32($fp)
	sdc1	$f0, 48($fp)
	jal	floor
	ldc1	$f12, 48($fp)
	sdc1	$f0, 40($fp)
	jal	tan
	ldc1	$f12, 24($fp)
	sdc1	$f0, 48($fp)
	ldc1	$f20, 64($fp)
	jal	floor
	mov.d	$f12, $f20
	mov.d	$f22, $f0
	ldc1	$f14, 48($fp)
	jal	atan2
	mov.d	$f12, $f20
	add.d	$f0, $f22, $f0
	sdc1	$f0, 40($fp)
	ldc1	$f12, 16($fp)
	jal	fmin
	ldc1	$f14, 64($fp)
	mov.d	$f20, $f0
	jal	cos
	ldc1	$f12, 56($fp)
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	ldc1	$f12, 56($fp)
	jal	fmin
	ldc1	$f14, 64($fp)
	mov.d	$f20, $f0
	jal	log
	ldc1	$f12, 16($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 64($fp)
	ldc1	$f20, 24($fp)
	ldc1	$f22, 64($fp)
	mov.d	$f12, $f20
	jal	fmin
	mov.d	$f14, $f22
	mov.d	$f24, $f0
	mov.d	$f12, $f20
	jal	fmax
	mov.d	$f14, $f22
	sub.d	$f0, $f24, $f0
	sdc1	$f0, 64($fp)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 72($sp)            # 4-byte Folded Reload
	lw	$ra, 76($sp)            # 4-byte Folded Reload
	ldc1	$f20, 80($sp)           # 8-byte Folded Reload
	ldc1	$f22, 88($sp)           # 8-byte Folded Reload
	ldc1	$f24, 96($sp)           # 8-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 104
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
