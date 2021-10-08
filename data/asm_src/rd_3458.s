	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_3458.cc"
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
	.mask 	0xc0000000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -80
	.cfi_def_cfa_offset 80
	sdc1	$f20, 72($sp)           # 8-byte Folded Spill
	sw	$ra, 68($sp)            # 4-byte Folded Spill
	sw	$fp, 64($sp)            # 4-byte Folded Spill
	.cfi_offset 52, -8
	.cfi_offset 53, -4
	.cfi_offset 31, -12
	.cfi_offset 30, -16
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sw	$zero, 60($fp)
	ldc1	$f12, 16($fp)
	jal	fdim
	ldc1	$f14, 48($fp)
	mov.d	$f20, $f0
	jal	sqrt
	ldc1	$f12, 32($fp)
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	jal	cos
	ldc1	$f12, 24($fp)
	mov.d	$f20, $f0
	jal	cos
	ldc1	$f12, 48($fp)
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 48($fp)
	ldc1	$f12, 32($fp)
	jal	pow
	ldc1	$f14, 16($fp)
	sdc1	$f0, 48($fp)
	ldc1	$f12, 40($fp)
	jal	_ZSt13islessgreaterdd
	ldc1	$f14, 32($fp)
	beqz	$2, $BB0_3
	nop
# %bb.1:
	j	$BB0_2
	nop
$BB0_2:
	jal	asin
	ldc1	$f12, 16($fp)
	sdc1	$f0, 24($fp)
	jal	sqrt
	ldc1	$f12, 40($fp)
	sdc1	$f0, 40($fp)
	jal	log10
	ldc1	$f12, 48($fp)
	j	$BB0_4
	sdc1	$f0, 48($fp)
$BB0_3:
	jal	floor
	ldc1	$f12, 24($fp)
	mov.d	$f20, $f0
	jal	tan
	ldc1	$f12, 32($fp)
	mul.d	$f0, $f20, $f0
	sdc1	$f0, 32($fp)
	ldc1	$f12, 40($fp)
	jal	fmin
	mov.d	$f14, $f12
	mov.d	$f20, $f0
	jal	sqrt
	ldc1	$f12, 24($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	ldc1	$f12, 40($fp)
	jal	fdim
	mov.d	$f14, $f12
	mov.d	$f20, $f0
	jal	sqrt
	ldc1	$f12, 32($fp)
	add.d	$f0, $f20, $f0
	j	$BB0_4
	sdc1	$f0, 48($fp)
$BB0_4:
	ldc1	$f12, 48($fp)
	jal	_ZSt11islessequaldd
	ldc1	$f14, 24($fp)
	beqz	$2, $BB0_7
	nop
# %bb.5:
	j	$BB0_6
	nop
$BB0_6:
	ldc1	$f12, 48($fp)
	jal	pow
	ldc1	$f14, 32($fp)
	sdc1	$f0, 40($fp)
	ldc1	$f12, 24($fp)
	jal	atan2
	ldc1	$f14, 40($fp)
	mov.d	$f20, $f0
	jal	tan
	ldc1	$f12, 24($fp)
	div.d	$f0, $f20, $f0
	j	$BB0_8
	sdc1	$f0, 24($fp)
$BB0_7:
	jal	sqrt
	ldc1	$f12, 40($fp)
	sdc1	$f0, 40($fp)
	jal	tan
	ldc1	$f12, 16($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 32($fp)
	jal	fmax
	ldc1	$f14, 40($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 32($fp)
	jal	sin
	ldc1	$f12, 24($fp)
	mov.d	$f20, $f0
	jal	ceil
	ldc1	$f12, 32($fp)
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 40($fp)
	jal	tan
	ldc1	$f12, 48($fp)
	j	$BB0_8
	sdc1	$f0, 32($fp)
$BB0_8:
	lw	$2, 60($fp)
	move	$sp, $fp
	lw	$fp, 64($sp)            # 4-byte Folded Reload
	lw	$ra, 68($sp)            # 4-byte Folded Reload
	ldc1	$f20, 72($sp)           # 8-byte Folded Reload
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
