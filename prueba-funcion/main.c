#include <stdio.h>
#include <stdlib.h>

int sumar(int a, int b, int c, int d, int e, int* f);

int main (){

		int* f= malloc(sizeof(int));
		sumar(1,2,3,4,5,f);
		printf("Resultado= %d\n", *f );

}
