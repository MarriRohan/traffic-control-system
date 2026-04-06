#include <stdio.h>
#include <cuda.h>

// CUDA Kernel Function
__global__ void processTraffic(int *lanes, int *output, int n) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i < n) {
        if (lanes[i] > 20)
            output[i] = 2;  // High Traffic
        else if (lanes[i] > 10)
            output[i] = 1;  // Medium Traffic
        else
            output[i] = 0;  // Low Traffic
    }
}

int main() {
    int n = 4;
    int h_lanes[] = {10, 25, 15, 5};
    int h_output[4];

    int *d_lanes, *d_output;

    // Allocate memory on GPU
    cudaMalloc((void**)&d_lanes, n * sizeof(int));
    cudaMalloc((void**)&d_output, n * sizeof(int));

    // Copy data from CPU to GPU
    cudaMemcpy(d_lanes, h_lanes, n * sizeof(int), cudaMemcpyHostToDevice);

    // Launch kernel
    processTraffic<<<1, n>>>(d_lanes, d_output, n);

    // Copy result back to CPU
    cudaMemcpy(h_output, d_output, n * sizeof(int), cudaMemcpyDeviceToHost);

    // Print results
    for (int i = 0; i < n; i++) {
        if (h_output[i] == 2)
            printf("Lane %d: High Traffic\n", i);
        else if (h_output[i] == 1)
            printf("Lane %d: Medium Traffic\n", i);
        else
            printf("Lane %d: Low Traffic\n", i);
    }

    // Free GPU memory
    cudaFree(d_lanes);
    cudaFree(d_output);

    return 0;
}
