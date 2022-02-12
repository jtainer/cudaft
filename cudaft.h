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

	void setDimensions(unsigned int n);
	void phasorTransform(float* inputBuffer, Complex* outputBuffer);
	void scalarTransform(float* inputBuffer, Complex* outputBuffer);
private:
	// Dimensions of the matrix
	unsigned int N;

	// DFT matrix in GPU memory
	Complex* devMatrix;

	// Input and output buffers in GPU memory
	float* devInput;
	Complex* devOutput;
};
