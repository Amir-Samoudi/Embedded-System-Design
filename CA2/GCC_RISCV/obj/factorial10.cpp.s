	.file	"factorial10.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._Z33m_mode_external_interrupt_handlerv,"ax",@progbits
	.align	2
	.globl	_Z33m_mode_external_interrupt_handlerv
	.type	_Z33m_mode_external_interrupt_handlerv, @function
_Z33m_mode_external_interrupt_handlerv:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	sw	a4,40(sp)
	sw	a5,36(sp)
	.cfi_offset 8, -4
	.cfi_offset 14, -8
	.cfi_offset 15, -12
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	li	a5,268435456
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	sw	a5,-32(s0)
	li	a5,1048576
	addi	a5,a5,4
	sw	a5,-36(s0)
	li	a5,1
	sw	a5,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	j	.L2
.L3:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	mul	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L2:
	lw	a4,-24(s0)
	lw	a5,-32(s0)
	bleu	a4,a5,.L3
	lw	a5,-36(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	li	a5,268435456
	addi	a5,a5,4
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	lw	a4,40(sp)
	.cfi_restore 14
	lw	a5,36(sp)
	.cfi_restore 15
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	mret
	.cfi_endproc
.LFE1:
	.size	_Z33m_mode_external_interrupt_handlerv, .-_Z33m_mode_external_interrupt_handlerv
	.section	.text.main,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	li	a5,8
 #APP
# 23 "factorial10.cpp" 1
	csrs mstatus, a5
# 0 "" 2
 #NO_APP
	li	a5,4096
	addi	a5,a5,-2048
 #APP
# 24 "factorial10.cpp" 1
	csrs mie, a5
# 0 "" 2
 #NO_APP
	lui	a5,%hi(_Z33m_mode_external_interrupt_handlerv)
	addi	a5,a5,%lo(_Z33m_mode_external_interrupt_handlerv)
	sw	a5,-20(s0)
	lw	a5,-20(s0)
 #APP
# 28 "factorial10.cpp" 1
	csrw mtvec, a5
# 0 "" 2
 #NO_APP
.L5:
	nop
	j	.L5
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e-dirty) 13.2.0"
