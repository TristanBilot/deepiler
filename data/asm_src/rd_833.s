	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_833.cc"
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
	.mask 	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -104
	.cfi_def_cfa_offset 104
	sdc1	$f20, 96($sp)           # 8-byte Folded Spill
	sw	$ra, 92($sp)            # 4-byte Folded Spill
	sw	$fp, 88($sp)            # 4-byte Folded Spill
	.cfi_offset 52, -8
	.cfi_offset 53, -4
	.cfi_offset 31, -12
	.cfi_offset 30, -16
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sw	$zero, 84($fp)
	ldc1	$f12, 56($fp)
	jal	fmax
	ldc1	$f14, 72($fp)
	sdc1	$f0, 40($fp)
	jal	atan
	ldc1	$f12, 72($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 72($fp)
	jal	fmin
	mov.d	$f14, $f12
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 64($fp)
	jal	asin
	ldc1	$f12, 40($fp)
	mov.d	$f20, $f0
	jal	asin
	ldc1	$f12, 56($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 32($fp)
	jal	log
	ldc1	$f12, 24($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 40($fp)
	jal	fmin
	mov.d	$f14, $f12
	add.d	$f0, $f20, $f0
	sdc1	$f0, 64($fp)
	ldc1	$f12, 32($fp)
	jal	_ZSt6islessdd
	ldc1	$f14, 64($fp)
	beqz	$2, $BB0_3
	nop
# %bb.1:
	j	$BB0_2
	nop
$BB0_2:
	ldc1	$f12, 56($fp)
	jal	fmin
	ldc1	$f14, 24($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 64($fp)
	jal	fmin
	ldc1	$f14, 16($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 48($fp)
	jal	atan
	ldc1	$f12, 32($fp)
	j	$BB0_4
	sdc1	$f0, 48($fp)
$BB0_3:
	ldc1	$f12, 72($fp)
	jal	atan2
	ldc1	$f14, 48($fp)
	sdc1	$f0, 64($fp)
	ldc1	$f12, 24($fp)
	jal	fdim
	ldc1	$f14, 32($fp)
	mov.d	$f20, $f0
	jal	sqrt
	ldc1	$f12, 16($fp)
	add.d	$f0, $f20, $f0
	j	$BB0_4
	sdc1	$f0, 24($fp)
$BB0_4:
	ldc1	$f12, 56($fp)
	jal	_ZSt14isgreaterequaldd
	ldc1	$f14, 32($fp)
	beqz	$2, $BB0_7
	nop
# %bb.5:
	j	$BB0_6
	nop
$BB0_6:
	jal	asin
	ldc1	$f12, 32($fp)
	sdc1	$f0, 64($fp)
	jal	floor
	ldc1	$f12, 16($fp)
	sdc1	$f0, 72($fp)
	ldc1	$f12, 16($fp)
	jal	fmax
	ldc1	$f14, 56($fp)
	j	$BB0_8
	sdc1	$f0, 64($fp)
$BB0_7:
	ldc1	$f12, 48($fp)
	jal	fmax
	mov.d	$f14, $f12
	sdc1	$f0, 64($fp)
	jal	sin
	ldc1	$f12, 32($fp)
	sdc1	$f0, 64($fp)
	ldc1	$f12, 64($fp)
	jal	pow
	ldc1	$f14, 56($fp)
	mov.d	$f20, $f0
	jal	exp
	ldc1	$f12, 48($fp)
	sub.d	$f0, $f20, $f0
	j	$BB0_8
	sdc1	$f0, 32($fp)
$BB0_8:
	lw	$2, 84($fp)
	move	$sp, $fp
	lw	$fp, 88($sp)            # 4-byte Folded Reload
	lw	$ra, 92($sp)            # 4-byte Folded Reload
	ldc1	$f20, 96($sp)           # 8-byte Folded Reload
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
	.section	.text._ZSt14isgreaterequaldd,"axG",@progbits,_ZSt14isgreaterequaldd,comdat
	.weak	_ZSt14isgreaterequaldd  # -- Begin function _ZSt14isgreaterequaldd
	.p2align	2
	.type	_ZSt14isgreaterequaldd,@function
	.set	nomicromips
	.set	nomips16
	.ent	_ZSt14isgreaterequaldd
_ZSt14isgreaterequaldd:                 # @_ZSt14isgreaterequaldd
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
	c.ult.d	$f0, $f2
	bc1t	$BB2_2
	addiu	$2, $zero, 0
# %bb.1:
	addiu	$2, $zero, 1
$BB2_2:
	move	$sp, $fp
	lw	$fp, 20($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	_ZSt14isgreaterequaldd
$func_end2:
	.size	_ZSt14isgreaterequaldd, ($func_end2)-_ZSt14isgreaterequaldd
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.text
