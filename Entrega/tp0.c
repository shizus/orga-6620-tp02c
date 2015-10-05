#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>

#define MAX_LINE_LENGTH 512
#define MAX_DIMENSION_LENGTH 4
#define EXIT_OK 0
#define EXIT_ERROR 1

enum ACCION {
	EMPTY,
	HELP,
	VERSION,
	MULTIPLICAR,
	ERROR
};

void multiplicarMatriz();
enum ACCION procesarArgumentos(int argc, char** argv);

int main(int argc, char **argv) {
	enum ACCION comando = procesarArgumentos(argc, argv);
	switch (comando) {
		case HELP:
			printf("Usage:\n"
			"\ttp0 -h\n"
			"\ttp0 -V\n"
			"\ttp0 < in_file > out_file\n"
			"Options:\n"
			"\t-V, --version\tPrint version and quit.\n"
			"\t-h, --help\tPrint this information.\n"
			"Examples:\n"
			"\ttp0 < in.txt > out.txt\n"
			"\tcat in.txt | tp0 > out.txt\n");
			break;
		case VERSION:
			printf("tp0 v0.1\n");
			break;
		case MULTIPLICAR:
			multiplicarMatriz();
			break;
		case ERROR:
		default:
			return EXIT_ERROR;
	}
	return EXIT_OK;
}


void imprimirMatriz(double** matriz, int filas, int columnas) {
	printf("%dx%d ", filas, columnas);
	int i, j;
	for (i = 0; i < filas; ++i) {
		for (j = 0; j < columnas; ++j) {
			printf("%g ", matriz[i][j]);
		}
	}
	printf("\n");
}

// Devuelve null sino hay memoria
char* append(char* original, char* toAppend) {
	if (original == NULL) {
		original = malloc(sizeof(toAppend));
	}	
	if (original == NULL) {
		printf("out of memory\n");
		return NULL;
	}
	original = (char *) realloc(original, sizeof(toAppend));
   	strcat(original, toAppend);
	return original;
}


void leerDimension(int* filas, int* columnas) {
	char c;
	char* buffer = (char *) malloc(sizeof(char) * MAX_DIMENSION_LENGTH);
	int i = 0, total = 0;
	while((c = fgetc(stdin)) != EOF) {
		
		if (c == 'x') {
			*filas = atoi(buffer);
			memset(buffer,0,strlen(buffer));
			i = 0;
			continue;
		}

		if(c == ' ') {
			*columnas = atoi(buffer);
			break;
		}

		if(total >= MAX_DIMENSION_LENGTH) {
			char* oldBuffer = buffer;
			buffer = append(buffer,&c);
			if (buffer == NULL) {
				free(oldBuffer);
				fprintf(stderr, "%s\n", "No hay más memoria.");
				exit(EXIT_ERROR);
			}
		} else {
			buffer[i] = c;				
		}
		i++;
		total++;
	}
	free(buffer);

	if (c == EOF)
		exit(EXIT_OK);
}


void leerMatriz(double** matriz, int filas, int columnas) {
	char c;
	char* buffer = (char *) malloc(sizeof(char) * MAX_LINE_LENGTH);
	int i = 0, total = 0, elementos = 0, fila = 0, columna = 0;
	while((c = fgetc(stdin)) != EOF) {
		
		total++;
		
		if (elementos >= filas * columnas) {
			fprintf(stderr, "%s\n", "Dimension no compatible con datos de matriz.");
			free(buffer);
			exit(EXIT_ERROR);
		}

		if (c == ' ' || c == '\n') {
			// elimino espacios consecutivos
			if (strlen(buffer) == 0)
				continue;

			elementos++;
			matriz[fila][columna] = atof(buffer);
			memset(buffer,0,strlen(buffer));
			i = 0;
			if (columna >= columnas - 1) {
				fila++;
				columna = 0;
			} else {
				columna++;
			}

			if(c == '\n')
				break;

			continue;
		}

		if(total >= MAX_LINE_LENGTH) {
			char* oldBuffer = buffer;
			buffer = append(buffer,&c);
			if (buffer == NULL) {
				free(oldBuffer);
				fprintf(stderr, "%s\n", "No hay más memoria para guardar la matriz.");
			}
			exit(EXIT_ERROR);
		}

		buffer[i] = c;
		i++;
	}
	free(buffer);
	
	if (elementos < filas * columnas) {
		fprintf(stderr, "%s\n", "Dimension no compatible con datos de matriz.");
		exit(EXIT_ERROR);
	}
	

	if (c == EOF)
		exit(EXIT_OK);
}


double** crearMatriz(int filas, int columnas) {
	double** matriz = (double**) malloc(sizeof(double*) * filas);
	if (matriz == NULL) {
		fprintf(stderr, "%s\n", "Memoria insuficiente.");
		exit(EXIT_ERROR);
	}
	int i;
	for(i = 0; i < filas; ++i)
		matriz[i] = (double*) malloc(sizeof(double) * columnas);

	if (matriz[i - 1] == NULL) {
		fprintf(stderr, "%s\n", "Memoria insuficiente.");
		exit(EXIT_ERROR);
	}
	return matriz;
}


void multiplicarMatriz() {
	
	while (1) {
		int filasA, columnasA;
		leerDimension(&filasA, &columnasA);
		double** matrizA = crearMatriz(filasA, columnasA);
		leerMatriz(matrizA, filasA, columnasA);

		int filasB, columnasB;
		leerDimension(&filasB, &columnasB);
		double** matrizB = crearMatriz(filasB, columnasB);
		leerMatriz(matrizB, filasB, columnasB);

		if (columnasA != filasB) {
			fprintf(stderr, "%s\n", "Dimensiones incorrectas de matrices.");
			free(matrizA);
			free(matrizB);
			exit(EXIT_ERROR);
		}

		double** matrizC = crearMatriz(filasA, columnasB);
		int i, j, k;
		for (i = 0; i < filasA; ++i){
		  	for (j = 0 ; j < columnasB ; ++j){
		      	matrizC[i][j]=0;
		      	for ( k = 0; k < columnasA; ++k){
		        	matrizC[i][j] = (matrizC[i][j] + (matrizA[i][k] * matrizB[k][j]));
		    	}
			}
		}
		imprimirMatriz(matrizC, filasA, columnasB);

		free(matrizA);
		free(matrizB);
		free(matrizC);
	}
}


enum ACCION procesarArgumentos(int argc, char** argv) {
	// valores por defecto
	enum ACCION comando = EMPTY;
	
	 /* La funcion getopt obtiene el siguiente argumento especificado por argc y argv
	 * mas info: http://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html#Using-Getopt
	 * La cadena "hVbri:o:" indica que h, V no tienen argumentos.
	 */
	int c;
	while ((c = getopt(argc, argv, "hV")) != -1) {
		switch (c) {
			case 'h':
				comando = HELP;
				break;
			case 'V':
				comando = VERSION;
				break;
			default:
				comando = ERROR;
				break;
		}
	}

	if (comando == EMPTY)
		comando = MULTIPLICAR;

	return comando;
}
