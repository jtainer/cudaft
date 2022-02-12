// 
// Cuda kernel for transforming a vector by a matrix of complex numbers
//
// 2022, Jonathan Tainer
//

#include "matmul.h"
#include "complex.h"

__global__
void matmul(Complex* matrix, float* input, Complex* output, unsigned int N) {
	
	// Determine the thread ID
	int y = threadIdx.x + (blockIdx.x * blockDim.x);

	// Ensure excess threads do nothing
	if (y < N) {
		
		Complex sum = { 0, 0 };

		for (unsigned int x = 0; x < N; x++) {
			sum.real += matrix[(y * N) + x].real * input[x];
			sum.imag += matrix[(y * N) + x].imag * input[x];
		}

		output[y] = sum;
	}
}
