nvcc -c cudaft.cu matmul.cu
g++ -c test.cpp complex.cpp
g++ -L/usr/local/cuda/lib64 test.o complex.o cudaft.o matmul.o -lcudart
