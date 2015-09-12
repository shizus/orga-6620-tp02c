#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "parser.h"

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

int isNumeric (const char * s)
{
    if (s == NULL || *s == '\0' || isspace(*s))
      return 0;
    char * p;
    strtod (s, &p);
    return *p == '\0';
}

int parse(FILE* entrada) {

	char* ch;
	char* numero;
	while(fgets(ch, 1, entrada)) {
		if (isNumeric(ch)) {
			//Lo sumo al numero
			numero = append(numero, ch);
			printf("%s" , numero);
		} else {
			if (ch == ".") {
				//Lo sumo al numero porque es un float
				numero = append(numero, ch);			
			} else {
				if (ch == "x") {
					//paso a buscar columnas. OJO si ya estaba buscando columnas tiro error			
				} else {
					// devuelvo error, caracter inválido
					//return 1;
				}
			}
			
		}
		//consigo numero de filas
		//consigo numero de columnas
		//leo las filas
		//leo las columnas
		
	}

	/*char* saludo = stdin;

	saludo = append(saludo, "hola");
	printf("%s size=%zu\n", saludo, sizeof(stdin));
	saludo = append(saludo, " mundo");
	printf("%s size=%zu\n", saludo, sizeof(stdin));
	saludo = append(saludo, "!\n");
	printf("%s size=%zu\n", saludo, sizeof(stdin));*/
	return 0;
}


