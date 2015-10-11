
#include <stdio.h>
#include "strlen.h"

int main(int argc, char * const argv[]) {
	char *msg = "Hola mundo.\n";
	printf("length %d\n", mystrlen(msg));
	return 0;
}
