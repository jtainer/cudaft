// 
// DFT class implementation
// 
// 2022, Jonathan Tainer
// 

#include "cudaft.h"
#include "complex.h"

#include <cuda.h>
#include <stdlib.h>
#include <math.h>

CudaFT::CudaFT() {
	N = 0;
	devMatrix = NULL;
	devInput = NULL;
	devOutput = NULL;
}

CudaFT::~CudaFT() {
	cudaFree(devMatrix);
	cudaFree(devInput);
	cudaFree(devOutput);
}

void CudaFT::setDimensions(unsigned int n) {
	
	// Allocate or reallocate an appropriate amount of GPU memory
	cudaFree(devMatrix);
	cudaFree(devInput);
	cudaFree(devOutput);

	N = n;

	cudaMalloc((void**)&devMatrix, sizeof(Complex) * N * N);
	cudaMalloc((void**)&devInput, sizeof(float) * N);
	cudaMalloc((void**)&devOutput, sizeof(Complex) * N);

	// Compute the DFT matrix in system memory
	Complex* sysMatrix = (Complex*)malloc(sizeof(Complex) * N * N);
	
	Complex omega;
	omega.real = cosf(-2 * M_PI / N);
	omega.imag = sinf(-2 * M_PI / N);

	for (unsigned int y = 0; y < N; y++) {
		for (unsigned int x = 0; x < N; x++) {
			sysMatrix[(y * N) + x] = omega.exp(x * y);
		}
	}

	// Copy DFT matrix to GPU memory
	cudaMemcpy(devMatrix, sysMatrix, sizeof(Complex) * N * N, cudaMemcpyHostToDevice);

	free(sysMatrix);
}

void CudaFT::phasorTransform(float* inputBuffer, Complex* outputBuffer) {
	
}
