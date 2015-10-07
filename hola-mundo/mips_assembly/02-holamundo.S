# 02-holamundo.S - ver 02-holamundo.c.
#
# $Date: 2008/04/21 17:24:06 $

#include <mips/regdef.h>

	.text
	.align	2

	.globl	mystrlen
	.ent	mystrlen
mystrlen:
	.frame	$fp, 16, ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 16
	.cprestore 0
	sw	$fp, 4(sp)
	move	$fp, sp

	# Use v0 for the result.
	#
	li	v0, 0
mystrlen_loop:
	lb	t0, 0(a0)
	beqz	t0, mystrlen_return
	addiu	a0, a0, 1
	addiu	v0, v0, 1
	j	mystrlen_loop

mystrlen_return:
	# Destruimos el frame.
	#
	lw	$fp, 4(sp)
	addu	sp, sp, 16

	# Retorno.
	#
	j	ra
	.end	mystrlen
