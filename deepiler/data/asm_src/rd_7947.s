	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_7947.cc"
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
	.mask 	0xc0000000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -88
	.cfi_def_cfa_offset 88
	sdc1	$f22, 80($sp)           # 8-byte Folded Spill
	sdc1	$f20, 72($sp)           # 8-byte Folded Spill
	sw	$ra, 68($sp)            # 4-byte Folded Spill
	sw	$fp, 64($sp)            # 4-byte Folded Spill
	.cfi_offset 54, -8
	.cfi_offset 55, -4
	.cfi_offset 52, -16
	.cfi_offset 53, -12
	.cfi_offset 31, -20
	.cfi_offset 30, -24
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sw	$zero, 60($fp)
	ldc1	$f20, 40($fp)
	jal	floor
	mov.d	$f12, $f20
	mov.d	$f22, $f0
	jal	atan
	mov.d	$f12, $f20
	mul.d	$f0, $f22, $f0
	sdc1	$f0, 48($fp)
	ldc1	$f12, 48($fp)
	jal	fdim
	ldc1	$f14, 16($fp)
	sdc1	$f0, 24($fp)
	jal	ceil
	ldc1	$f12, 16($fp)
	sdc1	$f0, 48($fp)
	jal	ceil
	ldc1	$f12, 32($fp)
	sdc1	$f0, 48($fp)
	ldc1	$f12, 32($fp)
	jal	_ZSt14isgreaterequaldd
	ldc1	$f14, 40($fp)
	beqz	$2, $BB0_3
	nop
# %bb.1:
	j	$BB0_2
	nop
$BB0_2:
	ldc1	$f12, 24($fp)
	jal	atan2
	ldc1	$f14, 40($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 32($fp)
	jal	atan2
	ldc1	$f14, 16($fp)
	add.d	$f0, $f20, $f0
	sdc1	$f0, 48($fp)
	jal	floor
	ldc1	$f12, 24($fp)
	mov.d	$f20, $f0
	jal	log
	ldc1	$f12, 40($fp)
	add.d	$f0, $f20, $f0
	j	$BB0_4
	sdc1	$f0, 40($fp)
$BB0_3:
	jal	log
	ldc1	$f12, 16($fp)
	sdc1	$f0, 24($fp)
	jal	asin
	ldc1	$f12, 32($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 24($fp)
	jal	atan2
	ldc1	$f14, 48($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 40($fp)
	ldc1	$f12, 48($fp)
	jal	fmin
	ldc1	$f14, 24($fp)
	sdc1	$f0, 24($fp)
	jal	floor
	ldc1	$f12, 24($fp)
	sdc1	$f0, 48($fp)
	jal	log10
	ldc1	$f12, 40($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 24($fp)
	jal	fmax
	ldc1	$f14, 40($fp)
	mul.d	$f0, $f20, $f0
	j	$BB0_4
	sdc1	$f0, 16($fp)
$BB0_4:
	ldc1	$f12, 32($fp)
	jal	_ZSt11islessequaldd
	ldc1	$f14, 24($fp)
	beqz	$2, $BB0_7
	nop
# %bb.5:
	j	$BB0_6
	nop
$BB0_6:
	ldc1	$f12, 40($fp)
	ldc1	$f20, 32($fp)
	jal	fmin
	mov.d	$f14, $f20
	mov.d	$f22, $f0
	jal	log10
	mov.d	$f12, $f20
	sub.d	$f0, $f22, $f0
	sdc1	$f0, 32($fp)
	jal	log
	ldc1	$f12, 24($fp)
	sdc1	$f0, 16($fp)
	ldc1	$f12, 24($fp)
	jal	fmin
	ldc1	$f14, 32($fp)
	mov.d	$f20, $f0
	jal	sin
	ldc1	$f12, 48($fp)
	div.d	$f0, $f20, $f0
	j	$BB0_7
	sdc1	$f0, 32($fp)
$BB0_7:
	lw	$2, 60($fp)
	move	$sp, $fp
	lw	$fp, 64($sp)            # 4-byte Folded Reload
	lw	$ra, 68($sp)            # 4-byte Folded Reload
	ldc1	$f20, 72($sp)           # 8-byte Folded Reload
	ldc1	$f22, 80($sp)           # 8-byte Folded Reload
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
	.end	_ZSt14isgreaterequaldd
$func_end1:
	.size	_ZSt14isgreaterequaldd, ($func_end1)-_ZSt14isgreaterequaldd
	.cfi_endproc
                                        # -- End function
	.section	.text._ZSt11islessequaldd,"axG",@progbits,_ZSt11islessequaldd,comdat
	.weak	_ZSt11islessequaldd     # -- Begin function _ZSt11islessequaldd
	.p2align	2
	.type	_ZSt11islessequaldd,@function
	.set	nomicromips
	.set	nomips16
	.ent	_ZSt11islessequaldd
_ZSt11islessequaldd:                    # @_ZSt11islessequaldd
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
	c.ole.d	$f0, $f2
	bc1f	$BB2_2
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
	.end	_ZSt11islessequaldd
$func_end2:
	.size	_ZSt11islessequaldd, ($func_end2)-_ZSt11islessequaldd
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.text
