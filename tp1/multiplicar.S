#include <mips/regdef.h>


                # a0 cant filas A
                # a1 puntero a matriz B
                # a2 puntero a matriz C
                # a3 puntero a matriz A

                .text
                .globl  multiplicarMatrices
                .ent multiplicarMatrices

multiplicarMatrices:

		  

        move t0, a0 # lw t0, cantf_c_i
        lw t1, 16(sp)# lw t1, cantc_c_j
        lw t2, 20(sp) # lw t2, cantc_a_k

		  
		 
		  
		  addi sp, sp, -4
		  sw   $fp, 0(sp)
		  move $fp, sp
		  addi sp, sp, -12
		   sw   ra, 8(sp)
		  sw   sp,  12(sp)

        #no hago una estiqueta para i porque nunca volveremos a hacer i =0 para
        #Las filas
        li s0, 0 # i = 0; initialize 1st for loop
loop1:
        # Al contrario para las columnas de B se hace una corrida por cada fila
        #Varias veces a este punto
        li s1, 0 # j = 0; restart 2nd for loop
loop2:
        # Por cada valor de C deberemos iterar sobre todos los valores de K
        #
        li s2, 0 # k = 0; restart 3rd for loop

#Operaciones con C
        mul t3, s0, t1  # en t3 la cantidad de columnas de c
        addu t3, t3, s1 # en t3 sumo el valor de j-> la posicion en el array
        sll t3, t3, 3 #  el offset en bytes en el array
        addu t3, a2, t3 # cargo en t3 la direccion de C{i}{j}
        sw zero, 0(t3) # inicializo C{i}{j} con cero
	l.d $f4, 0(t3)
        #add t4, zero, zero # inicializo en t4 en cero que será el valor de C{i}
		

#Operaciones con A
loop3:
        mul t7, s0, t2  # en t7 la cantidad de columnas de A "K"
        addu t7, t7, s2 #  ahora le sumamos K y obtenemos la posicion en el arra
        sll t7, t7, 3 #  multiplcamos por 4 y obtenemos el offset de A[i][k]
        addu t7, a3, t7 # obtenemos la direccion de A[i][k]
        l.d $f8, 0(t7) # guardamos en t8 el valor de A[i][k]
        
# Ahora con B

        mul t5, s2, t1 # t5 = k * 4 (size of row of b)
        addu t5, t5, s1 # t5 = k * size(row) + j
        sll t5, t5, 3 # t5 = byte offset off [k][j]
        addu t5, a1, t5 # t5 = byte address of b[k][j]
        l.d $f6, 0(t5)



mul.d $f6, $f8, $f6 # t6 = a[i][k] * b[k][j]
add.d $f4, $f4, $f6 # t4 = c[i][j] + a[i][k] * b[k][j]


s.d $f4, 0(t3) # c[i][j] = t4  guardo el valor calculado en c[i][j]

addiu s2, s2, 1 # k = k + 1
bne s2, t2, loop3 #if (k != 4) go to loop3

addiu s1, s1, 1 # j = j + 1
bne s1, t1, loop2 # if (j != 4) go to loop2

addiu s0, s0, 1 # i = i + 1
bne s0, t0, loop1 # if (i != 32) go to loop1

#restauro el sp
lw   sp,  12(sp)

jalr ra

.end multiplicarMatrices
