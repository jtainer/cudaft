// 
// Cuda kernel for transforming a vector by a matrix of complex numbers
//
// 2022, Jonathan Tainer
//

#ifndef MATMUL_H
#define MATMUL_H

__global__
void matmul(Complex* matrix, float* input, Complex* output, unsigned int N);

#endif
