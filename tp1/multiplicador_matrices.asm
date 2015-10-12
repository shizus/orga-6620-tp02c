.data

#A es una matriz de ixk posiciones es decir 4x3
#B es una matriz de kxj posiciones es decir 3x2


matriz1: .word  1,2,3,4,5,6,7,8,9,10,11,12
matriz2: .word  11,21,42,32,13,83
matriz3: .word  0,0,0,0,0,0,0,0
cantf_c_i: .word 4
cantc_c_j: .word 2
cantc_a_k: .word 3

#Print variables
    output_row_string_C: .asciiz "Matrix C Output Row "
    colon_string: .asciiz ": 
    space_string: .asciiz " "
    new_row: .asciiz "\n"
    char_space: .space 2
    
    .text

# $s0 ---> i
# $s1 ---> j
# $s2 ---> k
main: 
	lw $t0, cantf_c_i
	lw $t1, cantc_c_j
	lw $t2, cantc_a_k
	
	la $a3, matriz1 # direccion de matriz A
	la $a1, matriz2 # direccion de matriz B
	la $a2, matriz3 # direccion de matriz C

	#no hago una estiqueta para i porque nunca volveremos a hacer i =0 para la matriz A, se hace una sola corrida de 
	#Las filas	
	li $s0, 0 # i = 0; initialize 1st for loop
loop1: 
	# Al contrario para las columnas de B se hace una corrida por cada fila de A por lo cual tendre que volver
	#Varias veces a este punto
	li $s1, 0 # j = 0; restart 2nd for loop
loop2: 
	# Por cada valor de C deberemos iterar sobre todos los valores de K
	# 
	li $s2, 0 # k = 0; restart 3rd for loop

#Operaciones con C
	mul $t3, $s0, $t1  # en t3 la cantidad de columnas de c
	addu $t3, $t3, $s1 # en t3 sumo el valor de j-> la posicion en el array 
	sll $t3, $t3, 2 # $ el offset en bytes en el array
	addu $t3, $a2, $t3 # cargo en t3 la direccion de C{i}{j} 
	lw $t4, 0($t3) # cargo en t4 el valor de C{i}{j}	

#Operaciones con A
loop3:
	mul $t7, $s0, $t2  # en t7 la cantidad de columnas de A "K"
	addu $t7, $t7, $s2 #  ahora le sumamos K y obtenemos la posicion en el array
	sll $t7, $t7, 2 # $ multiplcamos por 4 y obtenemos el offset de A[i][k]
	addu $t7, $a3, $t7 # obtenemos la direccion de A[i][k]
	lw $t8, 0($t7) # guaramos en t8 el valor de A[i][k]	

# Ahora con B

	mul $t5, $s2, $t1 # $t5 = k * 4 (size of row of b)
	addu $t5, $t5, $s1 # $t5 = k * size(row) + j
	sll $t5, $t5, 2 # $t5 = byte offset off [k][j]
	addu $t5, $a1, $t5 # $t5 = byte address of b[k][j]
	lw $t6, 0($t5)
	


mul $t6, $t8, $t6 # $t6 = a[i][k] * b[k][j]
add $t4, $t4, $t6 # $t4 = c[i][j] + a[i][k] * b[k][j]


sw $t4, 0($t3) # c[i][j] = $t4 

addiu $s2, $s2, 1 # $k = k + 1
bne $s2, $t2, loop3 #if (k != 4) go to loop3

#----------TEST-------------
li $v0, 1
lw $a0, ($t3)
syscall
li $v0, 4
la $a0, new_row
syscall
#----------TEST-------------

addiu $s1, $s1, 1 # $j = j + 1
bne $s1, $t1, loop2 # if (j != 4) go to loop2

addiu $s0, $s0, 1 # $i = i + 1
bne $s0, $t0, loop1 # if (i != 32) go to L1 

Exit: 
li $v0, 10 #exits
syscall

jalr $ra