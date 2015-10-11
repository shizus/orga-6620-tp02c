.text
main:
j mm

mm:
la $a3, array_A # guardo la direccion del primer array en $a3
la $a1, array_B # guardo la direccion del primer array en $a1
la $a2, array_C # guardo la direccion del primer array en $a2

li $t1, 4 # $t1 = 4 (tamaño de las filas) A
li $t7, 4 # $t1 = 4 (tamaño de las col) B

li $s0, 0 # i = 0; inicializacion de i en el primer loop 

loop1: 
li $s1, 0 # j = 0; reinicio j para loop 2
loop2: 
li $s2, 0 # k = 0; reinicio k para loop 3


sll $t2, $s0, 2 # $t2 = i * 4 (size of row of c)
addu $t2, $t2, $s1 # $t2 = i * size(row) + j
sll $t2, $t2, 2 # $t2 = byte offset of [i][j]
addu $t2, $a2, $t2 # $t2 = byte offset of [i][j] 
lw $t4, 0($t2) # $t4 = 2 bytes of c[i][j]

loop3:
sll $t0, $s2, 2 # $t0 = k * 4 (size of row of b)
addu $t0, $t0, $s1 # $t0 = k * size(row) + j
sll $t0, $t0, 2 # $t0 = byte offset of [k][j]
addu $t0, $a1, $t0 # $t0 = byte address of b[k][j]
lw $t5, 0($t0) # $t5 = 2 bytes of b[k][j]

sll $t0, $s0, 2 # $t0 = i * 4 (size of row of a)
addu $t0, $t0, $s2 # $t0 = i * size(row) + k
sll $t0, $t0, 2 # $t0 = byte offset of [i][k]
addu $t0, $a3, $t0 # $t0 = byte address of a[i][k]
lw $t6, 0($t0) # $t6 = 2 bytes of a[i][k]

mul $t5, $t6, $t5 # $t5 = a[i][k] * b[k][j]
add $t4, $t4, $t5 # $t4 = c[i][j] + a[i][k] * b[k][j]

addiu $s2, $s2, 1 # $k = k + 1
bne $s2, $t1, loop3 #if (k != 4) go to loop3
sw $t4, 0($a2) # c[i][j] = $t4 

#----------TEST-------------
li $v0, 1
lw $a0, ($a2)
syscall
li $v0, 4
la $a0, new_row
syscall
#----------TEST-------------

addiu $s1, $s1, 1 # $j = j + 1
#addi $a2, $a2, 4
bne $s1, $t1, loop2 # if (j != 4) go to loop2

addiu $s0, $s0, 1 # $i = i + 1
bne $s0, $t1, loop1 # if (i != 32) go to L1 

Exit: 
li $v0, 10 #exits
syscall

    .data 
    array_A: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    array_B: .word 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
    array_C: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    output_row_string_C: .asciiz "Matrix C Output Row "
    colon_string: .asciiz ": 
    space_string: .asciiz " "
    new_row: .asciiz "\n"
    char_space: .space 2
