	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_5461.cc"
	.text
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,88,$ra
	.mask 	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -88
	.cfi_def_cfa_offset 88
	sdc1	$f20, 80($sp)           # 8-byte Folded Spill
	sw	$ra, 76($sp)            # 4-byte Folded Spill
	sw	$fp, 72($sp)            # 4-byte Folded Spill
	.cfi_offset 52, -8
	.cfi_offset 53, -4
	.cfi_offset 31, -12
	.cfi_offset 30, -16
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sw	$zero, 68($fp)
	jal	atan
	ldc1	$f12, 32($fp)
	mov.d	$f20, $f0
	jal	tan
	ldc1	$f12, 48($fp)
	add.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	jal	exp
	ldc1	$f12, 32($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 48($fp)
	jal	fmin
	ldc1	$f14, 16($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 48($fp)
	ldc1	$f12, 32($fp)
	jal	atan2
	ldc1	$f14, 16($fp)
	mov.d	$f20, $f0
	jal	tan
	ldc1	$f12, 24($fp)
	add.d	$f0, $f20, $f0
	sdc1	$f0, 40($fp)
	jal	floor
	ldc1	$f12, 40($fp)
	sdc1	$f0, 16($fp)
	jal	acos
	ldc1	$f12, 32($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 32($fp)
	jal	atan2
	ldc1	$f14, 24($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 32($fp)
	jal	acos
	ldc1	$f12, 40($fp)
	mov.d	$f20, $f0
	jal	sqrt
	ldc1	$f12, 16($fp)
	sub.d	$f0, $f20, $f0
	j	$BB0_1
	sdc1	$f0, 56($fp)
$BB0_1:                                 # =>This Inner Loop Header: Depth=1
	ldc1	$f12, 16($fp)
	jal	_ZSt13islessgreaterdd
	ldc1	$f14, 40($fp)
	beqz	$2, $BB0_4
	nop
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	j	$BB0_3
	nop
$BB0_3:                                 #   in Loop: Header=BB0_1 Depth=1
	jal	atan
	ldc1	$f12, 56($fp)
	sdc1	$f0, 40($fp)
	ldc1	$f12, 48($fp)
	jal	atan2
	ldc1	$f14, 40($fp)
	sdc1	$f0, 32($fp)
	ldc1	$f12, 48($fp)
	jal	pow
	ldc1	$f14, 32($fp)
	sdc1	$f0, 16($fp)
	jal	sqrt
	ldc1	$f12, 56($fp)
	sdc1	$f0, 32($fp)
	ldc1	$f12, 56($fp)
	jal	pow
	ldc1	$f14, 24($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 48($fp)
	jal	fmax
	ldc1	$f14, 40($fp)
	sub.d	$f0, $f20, $f0
	j	$BB0_1
	sdc1	$f0, 24($fp)
$BB0_4:
	lw	$2, 68($fp)
	move	$sp, $fp
	lw	$fp, 72($sp)            # 4-byte Folded Reload
	lw	$ra, 76($sp)            # 4-byte Folded Reload
	ldc1	$f20, 80($sp)           # 8-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 88
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, ($func_end0)-main
	.cfi_endproc
                                        # -- End function
	.section	.text._ZSt13islessgreaterdd,"axG",@progbits,_ZSt13islessgreaterdd,comdat
	.weak	_ZSt13islessgreaterdd   # -- Begin function _ZSt13islessgreaterdd
	.p2align	2
	.type	_ZSt13islessgreaterdd,@function
	.set	nomicromips
	.set	nomips16
	.ent	_ZSt13islessgreaterdd
_ZSt13islessgreaterdd:                  # @_ZSt13islessgreaterdd
	.cfi_startproc
	.frame	$fp,24,$ra
	.mask 	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -24
	.cfi_def_cfa_offset 24
	sw	$fp, 20($sp)            # 4-byte Folded Spill
	.cfi_offset 30, -4
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sdc1	$f12, 8($fp)
	sdc1	$f14, 0($fp)
	ldc1	$f0, 8($fp)
	ldc1	$f2, 0($fp)
	c.ueq.d	$f0, $f2
	bc1t	$BB1_2
	addiu	$2, $zero, 0
# %bb.1:
	addiu	$2, $zero, 1
$BB1_2:
	move	$sp, $fp
	lw	$fp, 20($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	_ZSt13islessgreaterdd
$func_end1:
	.size	_ZSt13islessgreaterdd, ($func_end1)-_ZSt13islessgreaterdd
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.text
