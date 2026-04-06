 #PARALLEL AI - BASED TRAFFIC OPTIMIZARTION SYSTEM USING CPU AND GPU(CUDA)
The development of the system follows a structured approach involving sequential processing, CPU-based parallel processing, and GPU-based parallel processing.

Step 1: Input Collection

The program begins by collecting input from the user. The user enters the number of traffic lanes and the number of vehicles in each lane. The input data is stored in a list.

Step 2: Definition of Traffic Rules

The system defines rules to classify traffic based on vehicle count:
Vehicles > 20 → High Traffic
Vehicles > 10 → Medium Traffic
Vehicles ≤ 10 → Low Traffic
These rules are used to determine priority and signal timing.

Step 3: Traffic Processing Function

A function is created to evaluate each lane and assign a traffic category. This function is used in both sequential and parallel processing.

Step 4: Sequential Processing

Traffic data is processed one lane at a time using a loop. This serves as a baseline for performance comparison.

Step 5: CPU Parallel Processing

Python multiprocessing is used to process multiple lanes simultaneously. A pool of processes is created, and each process handles one lane.

Step 6: GPU Parallel Processing (CUDA)

CUDA is used to accelerate computation by executing thousands of threads on the GPU. Each thread processes one lane, enabling massive parallelism.

Step 7: Performance Measurement

Execution time for all three methods is measured:
Sequential
CPU Parallel
GPU Parallel
Time differences are analyzed to evaluate performance improvement.

Step 8: Result Display

The system displays:
Traffic classification for each lane
Execution times for all methods
Performance comparison

Step 9: Performance Analysis

Results show that:
Parallel CPU processing is faster than sequential
GPU processing is significantly faster than CPU
HPC techniques improve scalability and efficiency

