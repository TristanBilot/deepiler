	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_5788.cc"
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
	.mask 	0xc0000000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -104
	.cfi_def_cfa_offset 104
	sdc1	$f22, 96($sp)           # 8-byte Folded Spill
	sdc1	$f20, 88($sp)           # 8-byte Folded Spill
	sw	$ra, 84($sp)            # 4-byte Folded Spill
	sw	$fp, 80($sp)            # 4-byte Folded Spill
	.cfi_offset 54, -8
	.cfi_offset 55, -4
	.cfi_offset 52, -16
	.cfi_offset 53, -12
	.cfi_offset 31, -20
	.cfi_offset 30, -24
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sw	$zero, 76($fp)
	jal	exp
	ldc1	$f12, 24($fp)
	sdc1	$f0, 24($fp)
	ldc1	$f12, 32($fp)
	jal	pow
	ldc1	$f14, 40($fp)
	mov.d	$f20, $f0
	jal	atan
	ldc1	$f12, 48($fp)
	add.d	$f0, $f20, $f0
	sdc1	$f0, 64($fp)
	jal	acos
	ldc1	$f12, 24($fp)
	mov.d	$f20, $f0
	jal	sqrt
	ldc1	$f12, 32($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 40($fp)
	jal	log
	ldc1	$f12, 24($fp)
	sdc1	$f0, 64($fp)
	ldc1	$f12, 40($fp)
	jal	pow
	ldc1	$f14, 56($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 56($fp)
	jal	pow
	ldc1	$f14, 32($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 48($fp)
	ldc1	$f20, 64($fp)
	mov.d	$f12, $f20
	jal	fmax
	mov.d	$f14, $f20
	mov.d	$f22, $f0
	ldc1	$f14, 24($fp)
	jal	atan2
	mov.d	$f12, $f20
	div.d	$f0, $f22, $f0
	j	$BB0_1
	sdc1	$f0, 48($fp)
$BB0_1:                                 # =>This Inner Loop Header: Depth=1
	ldc1	$f12, 24($fp)
	jal	_ZSt6islessdd
	ldc1	$f14, 64($fp)
	beqz	$2, $BB0_4
	nop
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	j	$BB0_3
	nop
$BB0_3:                                 #   in Loop: Header=BB0_1 Depth=1
	jal	floor
	ldc1	$f12, 24($fp)
	sdc1	$f0, 40($fp)
	ldc1	$f12, 24($fp)
	jal	fdim
	ldc1	$f14, 32($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 16($fp)
	jal	fmax
	ldc1	$f14, 40($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 40($fp)
	jal	acos
	ldc1	$f12, 64($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 24($fp)
	jal	atan2
	mov.d	$f14, $f12
	div.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	ldc1	$f12, 40($fp)
	jal	fdim
	ldc1	$f14, 64($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 32($fp)
	jal	fmin
	ldc1	$f14, 24($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 40($fp)
	ldc1	$f12, 32($fp)
	jal	fdim
	ldc1	$f14, 56($fp)
	j	$BB0_1
	sdc1	$f0, 40($fp)
$BB0_4:
	lw	$2, 76($fp)
	move	$sp, $fp
	lw	$fp, 80($sp)            # 4-byte Folded Reload
	lw	$ra, 84($sp)            # 4-byte Folded Reload
	ldc1	$f20, 88($sp)           # 8-byte Folded Reload
	ldc1	$f22, 96($sp)           # 8-byte Folded Reload
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
	.section	.text._ZSt6islessdd,"axG",@progbits,_ZSt6islessdd,comdat
	.weak	_ZSt6islessdd           # -- Begin function _ZSt6islessdd
	.p2align	2
	.type	_ZSt6islessdd,@function
	.set	nomicromips
	.set	nomips16
	.ent	_ZSt6islessdd
_ZSt6islessdd:                          # @_ZSt6islessdd
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
	c.olt.d	$f0, $f2
	bc1f	$BB1_2
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
	.end	_ZSt6islessdd
$func_end1:
	.size	_ZSt6islessdd, ($func_end1)-_ZSt6islessdd
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.text