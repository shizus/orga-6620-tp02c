#include <mips/regdef.h>

	.text
	.globl	sumar
	.ent sumar
sumar:
	add v0, a0, a1
	add v0, v0, a2
	add v0, v0, a3
	lw t0, 16(sp)
	add v0, v0, t0


	lw t1 , 20(sp)
	sw v0, 0(t1)
	jr  ra

.end sumar

