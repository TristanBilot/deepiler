	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"rd_336.cc"
	.text
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,112,$ra
	.mask 	0xc0000000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -112
	.cfi_def_cfa_offset 112
	sdc1	$f22, 104($sp)          # 8-byte Folded Spill
	sdc1	$f20, 96($sp)           # 8-byte Folded Spill
	sw	$ra, 92($sp)            # 4-byte Folded Spill
	sw	$fp, 88($sp)            # 4-byte Folded Spill
	.cfi_offset 54, -8
	.cfi_offset 55, -4
	.cfi_offset 52, -16
	.cfi_offset 53, -12
	.cfi_offset 31, -20
	.cfi_offset 30, -24
	move	$fp, $sp
	.cfi_def_cfa_register 30
	sw	$zero, 84($fp)
	ldc1	$f12, 16($fp)
	jal	pow
	ldc1	$f14, 32($fp)
	sdc1	$f0, 72($fp)
	jal	acos
	ldc1	$f12, 72($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 48($fp)
	jal	fdim
	ldc1	$f14, 72($fp)
	div.d	$f0, $f20, $f0
	sdc1	$f0, 16($fp)
	jal	log10
	ldc1	$f12, 56($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 56($fp)
	jal	fmin
	mov.d	$f14, $f12
	sub.d	$f0, $f20, $f0
	sdc1	$f0, 32($fp)
	ldc1	$f12, 32($fp)
	jal	fdim
	ldc1	$f14, 64($fp)
	sdc1	$f0, 64($fp)
	ldc1	$f12, 48($fp)
	jal	fdim
	ldc1	$f14, 24($fp)
	j	$BB0_1
	sdc1	$f0, 24($fp)
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
	ldc1	$f12, 72($fp)
	jal	fmin
	ldc1	$f14, 32($fp)
	sdc1	$f0, 24($fp)
	jal	sqrt
	ldc1	$f12, 64($fp)
	sdc1	$f0, 24($fp)
	ldc1	$f12, 64($fp)
	jal	pow
	ldc1	$f14, 72($fp)
	mov.d	$f20, $f0
	ldc1	$f12, 40($fp)
	jal	pow
	ldc1	$f14, 32($fp)
	add.d	$f0, $f20, $f0
	sdc1	$f0, 24($fp)
	ldc1	$f12, 48($fp)
	jal	fmax
	ldc1	$f14, 32($fp)
	j	$BB0_1
	sdc1	$f0, 32($fp)
$BB0_4:
	ldc1	$f12, 72($fp)
	jal	_ZSt6islessdd
	ldc1	$f14, 16($fp)
	beqz	$2, $BB0_7
	nop
# %bb.5:
	j	$BB0_6
	nop
$BB0_6:
	jal	tan
	ldc1	$f12, 72($fp)
	sdc1	$f0, 72($fp)
	jal	log
	ldc1	$f12, 40($fp)
	sdc1	$f0, 32($fp)
	ldc1	$f20, 24($fp)
	ldc1	$f14, 16($fp)
	jal	fmax
	mov.d	$f12, $f20
	mov.d	$f22, $f0
	jal	sqrt
	mov.d	$f12, $f20
	sub.d	$f0, $f22, $f0
	j	$BB0_7
	sdc1	$f0, 56($fp)
$BB0_7:
	lw	$2, 84($fp)
	move	$sp, $fp
	lw	$fp, 88($sp)            # 4-byte Folded Reload
	lw	$ra, 92($sp)            # 4-byte Folded Reload
	ldc1	$f20, 96($sp)           # 8-byte Folded Reload
	ldc1	$f22, 104($sp)          # 8-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 112
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
	.end	_ZSt6islessdd
$func_end2:
	.size	_ZSt6islessdd, ($func_end2)-_ZSt6islessdd
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.text