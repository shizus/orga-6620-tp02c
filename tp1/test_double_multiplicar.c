void muliplicarMatrices(int filasA, double* matrizB, double* resultado, double* matrizA, int columnasB, int columnasA) {
	int i, j, k;
			for (i = 0; i < filasA; ++i){
			  	for (j = 0 ; j < columnasB ; ++j){
			  		resultado[i+j]=0;
			      	for ( k = 0; k < columnasA; ++k){
			      		resultado[i+j] = (resultado[i+j] + (matrizA[i+k] * matrizB[k+j]));
			    	}
				}
			}
}
