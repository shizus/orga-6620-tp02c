#include <mips/regdef.h>

# void muliplicarMatrices(double** matrizA, int filasA, int columnasA,
#		double** matrizB, int columnasB, double** resultado) {
		
		# a0 puntero a matriz A
		# a1 cant filas A
		# a2 cant col A
		# a3 puntero a matriz B
		
		.text
		.globl	multiplicarMatrices
		.ent multiplicarMatrices
		
multiplicarMatrices:
		
		lw t0, 16(sp) # t0 cant col B
		lw t1, 20(sp) # t1 puntero a matriz resultado
		
		li t2, 0 # inicializo t2 = i = 0
loop_1:
		li t3, 0 # inicializo t3 = j = 0
loop_2:
		# inicializo resultado[i][j] = 0
		mul t7, t2, 4 # [i]
		mul t9, t3, 4 # [j]
		add t7, t7, t9 # [i][j]
		add t7, t1, t7 # dirección de resultado[i][j]
		
		sw zero, 0(t7) # resultado[i][j] = 0;		
		
		li t4, 0 # inicializo t4 = k = 0
		
loop_3:	
		mul t6, t2, 4 # [i]
		mul t7, t4, 4 # [k]
		add t6, t6, t7 # [i][k]
		add t6, a0, t6 # dirección de matrizA[i][k]
		lw t6, 0(t6) # valor de matrizA[i][k]
		
						# ya no uso t7
						
		mul t8, t4, 4 # [k]
		mul t9, t3, 4 # [j]
		add t8, t8, t9 # [k][j]
		add t8, a3, t6 # dirección de matrizB[k][j]
		lw t8, 0(t8) # valor de matrizB[k][j]
		
						# ya no uso t9
						
		mul t5, t6, t8 # (matrizA[i][k] * matrizB[k][j])
		
		mul t7, t2, 4 # [i]
		mul t9, t3, 4 # [j]
		add t7, t7, t9 # [i][j]
		add t7, t1, t7 # dirección de resultado[i][j]
		
		lw t9, 0(t9) # valor de resultado[i][j]
		add t9, t9, t5 # (resultado[i][j] + (matrizA[i][k] * matrizB[k][j]));
		sw t9, 0(t7) # resultado[i][j] = (resultado[i][j] + (matrizA[i][k] * matrizB[k][j]));
		
		add t4, t4, 1 # k++
		beq t4, a2, fin_loop_3 # k < columnasA
		bal loop_3
fin_loop_3 :
		add t3, t3, 1 # j++
		beq t3, t0, fin_loop_2 # j < columnasB
		bal loop_2
fin_loop_2:
		add t2, t2, 1 # i++		
		beq t2, a1, fin_loop_1 # i < filasA
		bal loop_1
fin_loop_1:
		jr  ra
				
#	int i, j, k;
#			for (i = 0; i < filasA; ++i){
#			  	for (j = 0 ; j < columnasB ; ++j){
#			  		resultado[i][j]=0;
#			      	for ( k = 0; k < columnasA; ++k){
#			      		resultado[i][j] = (resultado[i][j] + (matrizA[i][k] * matrizB[k][j]));
#			    	}
#				}
#			}

.end multiplicarMatrices
