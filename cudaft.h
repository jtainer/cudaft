// 
// Discrete fourier transform class
//
// 2022, Jonathan Tainer
//

#include "complex.h"

class CudaFT {
public:
	CudaFT();
	~CudaFT();

	void setDims(unsigned int n);
	void transform(float* inputBuffer, Complex* outputBuffer);
private:
	// Dimensions of the matrix
	unsigned int N;

	// DFT matrix in GPU memory
	Complex* devMatrix;

	// Input and output buffers in GPU memory
	float* devInput;
	Complex* devOutput;
};
