
void multiplicarMatrices(int filasA, double* matrizB, double* resultado, double* matrizA, int columnasB, int columnasA);


int main(int argc, char **argv) {
		double matrixA[12] = {1.0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
		double matrixB[6] = {11, 21, 42, 32, 13, 83};
		double matrixC[8] = {0, 0, 0, 0, 0, 0, 0, 0};
		int filasA = 4;
		int columnasB = 2;
		int columnasA = 3; 
		
		//double* matrixC = malloc(sizeof(double) * columnasB * filasA);
		multiplicarMatrices(filasA, matrixB, matrixC, matrixA, 
		columnasB, columnasA);
		
		int i = 0;
      for (i = 0; i < 8; i++) {
      	printf("%f, ", matrixC[i]);
      }
}
