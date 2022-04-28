// 
// Test cases for CUDA Fourier Transform class
//
// 2022, Jonathan Tainer
//


#include "cudaft.h"
#include <iostream>
#include <iomanip>

int main() {
	const int samples = 8;

	CudaFT fourier;
	fourier.setDims(samples);

	float inputBuffer[samples] = { 1, -1, 1, -1, 1, -1, 1, -1 };
	Complex outputBuffer[samples];

	fourier.transform(inputBuffer, outputBuffer);

	for (int i = 0; i < samples; i++) {
		std::cout << std::fixed;
		std::cout << std::showpos;
		std::cout << std::setprecision(3);
		std::cout << outputBuffer[i].real << outputBuffer[i].imag << "i\n";
	}

}
