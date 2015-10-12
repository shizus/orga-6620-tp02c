	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Usage:\n"
	.ascii	"\ttp0 -h\n"
	.ascii	"\ttp0 -V\n"
	.ascii	"\ttp0 < in_file > out_file\n"
	.ascii	"Options:\n"
	.ascii	"\t-V, --version\tPrint version and quit.\n"
	.ascii	"\t-h, --help\tPrint this information.\n"
	.ascii	"Examples:\n"
	.ascii	"\ttp0 < in.txt > out.txt\n"
	.ascii	"\tcat in.txt | tp0 > out.txt\n\000"
	.align	2
$LC1:
	.ascii	"tp0 v0.1\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$a0,56($fp)
	lw	$a1,60($fp)
	la	$t9,procesarArgumentos
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	sw	$v0,32($fp)
	li	$v0,2			# 0x2
	lw	$v1,32($fp)
	beq	$v1,$v0,$L20
	lw	$v1,32($fp)
	sltu	$v0,$v1,3
	beq	$v0,$zero,$L25
	li	$v0,1			# 0x1
	lw	$v1,32($fp)
	beq	$v1,$v0,$L19
	b	$L23
$L25:
	li	$v0,3			# 0x3
	lw	$v1,32($fp)
	beq	$v1,$v0,$L21
	b	$L23
$L19:
	la	$a0,$LC0
	la	$t9,printf
	jal	$ra,$t9
	b	$L18
$L20:
	la	$a0,$LC1
	la	$t9,printf
	jal	$ra,$t9
	b	$L18
$L21:
	la	$t9,multiplicarMatriz
	jal	$ra,$t9
	b	$L18
$L23:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L17
$L18:
	sw	$zero,28($fp)
$L17:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC2:
	.ascii	"%dx%d \000"
	.align	2
$LC3:
	.ascii	"%g \000"
	.align	2
$LC4:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	imprimirMatriz
	.ent	imprimirMatriz
imprimirMatriz:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	la	$a0,$LC2
	lw	$a1,52($fp)
	lw	$a2,56($fp)
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,24($fp)
$L27:
	lw	$v0,24($fp)
	lw	$v1,52($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L30
	b	$L28
$L30:
	sw	$zero,28($fp)
$L31:
	lw	$v0,28($fp)
	lw	$v1,56($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L34
	b	$L29
$L34:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,48($fp)
	addu	$a0,$v1,$v0
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$v0,$v1,$v0
	la	$a0,$LC3
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L31
$L29:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L27
$L28:
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	imprimirMatriz
	.size	imprimirMatriz, .-imprimirMatriz
	.rdata
	.align	2
$LC5:
	.ascii	"%s\n\000"
	.align	2
$LC6:
	.ascii	"Tamano de buffer superado para la dimension.\000"
	.text
	.align	2
	.globl	leerDimension
	.ent	leerDimension
leerDimension:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	li	$a0,4			# 0x4
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
$L36:
	la	$a0,__sF
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,24($fp)
	lbu	$v0,24($fp)
	sll	$v0,$v0,24
	sra	$v1,$v0,24
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L38
	b	$L37
$L38:
	lb	$v1,24($fp)
	li	$v0,120			# 0x78
	bne	$v1,$v0,$L39
	lw	$a0,28($fp)
	la	$t9,atoi
	jal	$ra,$t9
	lw	$v1,56($fp)
	sw	$v0,0($v1)
	lw	$a0,28($fp)
	la	$t9,strlen
	jal	$ra,$t9
	lw	$a0,28($fp)
	move	$a1,$zero
	move	$a2,$v0
	la	$t9,memset
	jal	$ra,$t9
	sw	$zero,32($fp)
	b	$L36
$L39:
	lb	$v1,24($fp)
	li	$v0,32			# 0x20
	bne	$v1,$v0,$L40
	lw	$a0,28($fp)
	la	$t9,atoi
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,60($fp)
	sw	$v1,0($v0)
	b	$L37
$L40:
	lw	$v0,36($fp)
	slt	$v0,$v0,4
	bne	$v0,$zero,$L41
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC6
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L41:
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,24($fp)
	sb	$v0,0($v1)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L36
$L37:
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	lb	$v1,24($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L35
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L35:
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	leerDimension
	.size	leerDimension, .-leerDimension
	.rdata
	.align	2
$LC7:
	.ascii	"Dimension no compatible con datos de matriz.\000"
	.align	2
$LC8:
	.ascii	"Tamano de buffer superado para la matriz.\000"
	.text
	.align	2
	.globl	leerMatriz
	.ent	leerMatriz
leerMatriz:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	sw	$a2,80($fp)
	li	$a0,512			# 0x200
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	sw	$zero,44($fp)
	sw	$zero,48($fp)
$L44:
	la	$a0,__sF
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,24($fp)
	lbu	$v0,24($fp)
	sll	$v0,$v0,24
	sra	$v1,$v0,24
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L46
	b	$L45
$L46:
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	lw	$v1,76($fp)
	lw	$v0,80($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L47
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L47:
	lb	$v1,24($fp)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L49
	lb	$v1,24($fp)
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L49
	b	$L48
$L49:
	lw	$v0,28($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L50
	b	$L44
$L50:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	lw	$a0,28($fp)
	la	$t9,atof
	jal	$ra,$t9
	lw	$v0,44($fp)
	sll	$v1,$v0,2
	lw	$v0,72($fp)
	addu	$a0,$v1,$v0
	lw	$v0,48($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$v0,$v1,$v0
	s.d	$f0,0($v0)
	lw	$a0,28($fp)
	la	$t9,strlen
	jal	$ra,$t9
	lw	$a0,28($fp)
	move	$a1,$zero
	move	$a2,$v0
	la	$t9,memset
	jal	$ra,$t9
	sw	$zero,32($fp)
	lw	$v0,80($fp)
	addu	$v1,$v0,-1
	lw	$v0,48($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L51
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	sw	$v0,44($fp)
	sw	$zero,48($fp)
	b	$L52
$L51:
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
$L52:
	lb	$v1,24($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L44
	b	$L45
$L48:
	lw	$v0,36($fp)
	slt	$v0,$v0,512
	bne	$v0,$zero,$L54
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC8
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L54:
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,24($fp)
	sb	$v0,0($v1)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L44
$L45:
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$v1,76($fp)
	lw	$v0,80($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L55
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L55:
	lb	$v1,24($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L43
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L43:
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	leerMatriz
	.size	leerMatriz, .-leerMatriz
	.rdata
	.align	2
$LC9:
	.ascii	"Memoria insuficiente.\000"
	.text
	.align	2
	.globl	crearMatriz
	.ent	crearMatriz
crearMatriz:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,48($fp)
	sll	$v0,$v0,2
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L58
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC9
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L58:
	sw	$zero,28($fp)
$L59:
	lw	$v0,28($fp)
	lw	$v1,48($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L62
	b	$L60
$L62:
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$s0,$v1,$v0
	lw	$v0,52($fp)
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L59
$L60:
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	addu	$v0,$v0,-4
	lw	$v0,0($v0)
	bne	$v0,$zero,$L63
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC9
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L63:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	crearMatriz
	.size	crearMatriz, .-crearMatriz
	.rdata
	.align	2
$LC10:
	.ascii	"Dimensiones incorrectas de matrices.\000"
	.text
	.align	2
	.globl	multiplicarMatriz
	.ent	multiplicarMatriz
multiplicarMatriz:
	.frame	$fp,80,$ra		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	.set	noreorder
	nop
	.set	reorder
$L65:
	addu	$v0,$fp,28
	addu	$a0,$fp,24
	move	$a1,$v0
	la	$t9,leerDimension
	jal	$ra,$t9
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,crearMatriz
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,32($fp)
	lw	$a1,24($fp)
	lw	$a2,28($fp)
	la	$t9,leerMatriz
	jal	$ra,$t9
	addu	$v0,$fp,36
	addu	$v1,$fp,40
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,leerDimension
	jal	$ra,$t9
	lw	$a0,36($fp)
	lw	$a1,40($fp)
	la	$t9,crearMatriz
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$a0,44($fp)
	lw	$a1,36($fp)
	lw	$a2,40($fp)
	la	$t9,leerMatriz
	jal	$ra,$t9
	lw	$v1,28($fp)
	lw	$v0,36($fp)
	beq	$v1,$v0,$L68
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,free
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L68:
	lw	$a0,24($fp)
	lw	$a1,40($fp)
	la	$t9,crearMatriz
	jal	$ra,$t9
	sw	$v0,48($fp)
	sw	$zero,52($fp)
$L69:
	lw	$v0,52($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L72
	b	$L70
$L72:
	sw	$zero,56($fp)
$L73:
	lw	$v0,56($fp)
	lw	$v1,40($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L76
	b	$L71
$L76:
	lw	$v0,52($fp)
	sll	$v1,$v0,2
	lw	$v0,48($fp)
	addu	$a0,$v1,$v0
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$v0,$v1,$v0
	sw	$zero,0($v0)
	sw	$zero,4($v0)
	sw	$zero,60($fp)
$L77:
	lw	$v0,60($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L80
	b	$L75
$L80:
	lw	$v0,52($fp)
	sll	$v1,$v0,2
	lw	$v0,48($fp)
	addu	$a0,$v1,$v0
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$a2,$v1,$v0
	lw	$v0,52($fp)
	sll	$v1,$v0,2
	lw	$v0,48($fp)
	addu	$a0,$v1,$v0
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$a3,$v1,$v0
	lw	$v0,52($fp)
	sll	$v1,$v0,2
	lw	$v0,32($fp)
	addu	$a0,$v1,$v0
	lw	$v0,60($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$a1,$v1,$v0
	lw	$v0,60($fp)
	sll	$v1,$v0,2
	lw	$v0,44($fp)
	addu	$a0,$v1,$v0
	lw	$v0,56($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,0($a3)
	add.d	$f0,$f0,$f2
	s.d	$f0,0($a2)
	lw	$v0,60($fp)
	addu	$v0,$v0,1
	sw	$v0,60($fp)
	b	$L77
$L75:
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	b	$L73
$L71:
	lw	$v0,52($fp)
	addu	$v0,$v0,1
	sw	$v0,52($fp)
	b	$L69
$L70:
	lw	$a0,48($fp)
	lw	$a1,24($fp)
	lw	$a2,40($fp)
	la	$t9,imprimirMatriz
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,48($fp)
	la	$t9,free
	jal	$ra,$t9
	b	$L65
	.end	multiplicarMatriz
	.size	multiplicarMatriz, .-multiplicarMatriz
	.rdata
	.align	2
$LC11:
	.ascii	"hV\000"
	.text
	.align	2
	.globl	procesarArgumentos
	.ent	procesarArgumentos
procesarArgumentos:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	sw	$zero,24($fp)
$L82:
	lw	$a0,56($fp)
	lw	$a1,60($fp)
	la	$a2,$LC11
	la	$t9,getopt
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v1,28($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L84
	b	$L83
$L84:
	lw	$v0,28($fp)
	sw	$v0,32($fp)
	li	$v0,86			# 0x56
	lw	$v1,32($fp)
	beq	$v1,$v0,$L87
	li	$v0,104			# 0x68
	lw	$v1,32($fp)
	beq	$v1,$v0,$L86
	b	$L88
$L86:
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L82
$L87:
	li	$v0,2			# 0x2
	sw	$v0,24($fp)
	b	$L82
$L88:
	li	$v0,4			# 0x4
	sw	$v0,24($fp)
	b	$L82
$L83:
	lw	$v0,24($fp)
	bne	$v0,$zero,$L90
	li	$v0,3			# 0x3
	sw	$v0,24($fp)
$L90:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	procesarArgumentos
	.size	procesarArgumentos, .-procesarArgumentos
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
