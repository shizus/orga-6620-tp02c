void multiplicarMatrices(int filasA, int* matrizB, int* resultadoC, int* matrizA, int columnasB, int columnasA);


int main(int argc, char **argv) {
                int valoresA[12] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
                int valoresC[8] = {0, 0, 0, 0, 0, 0, 0, 0};
                int valoresB[6] = {1, 2, 1, 2, 1, 2};
                int filasA = 4;
                int columnasB = 2;
                int columnasA = 3;

                multiplicarMatrices(filasA, valoresB, valoresC, valoresA,
                columnasB, columnasA);

                int i;
      for (i = 0; i < 8; i++) {
        printf("%d ", valoresC[i]);
      }
}
