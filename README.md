# SSA Individual Assignment 2024

## Introduction
This repository contains the individual assignment for the S&SA course, due on 22nd November 2024 at 16:00h. The assignment consists of three main tasks that demonstrate various skills in MATLAB programming, data analysis, and discrete event simulation.

## Assignment Instructions
### General Guidelines
- This is an individual assignment worth 25% of your grade. Cooperation and copying are not allowed.
- Submit a single ZIP file named `assignment.zip` on Canvas, containing all necessary `.m` files without any subdirectories.
- Do not include personal information in the `.m` files.
- Perform your tests manually without relying on MATLAB's built-in tests, unless explicitly allowed.
- Ensure all required functions are implemented in separate `.m` files and thoroughly tested.

### Task 1: Random Number Generation and Runs Test
#### Task 1a: Combined LFSRs Generator
Implement the ME-CF generator as described in Table 1 of L'Ecuyer (1999) with the following parameters:
- L = 32, J = 4, s1 = 18, s2 = 2, s3 = 7, s4 = 13
- Seed values: z1 = 2957, z2 = 646, z3 = 3847, z4 = 947

Create a MATLAB function `lEcuyer.m` with the signature:
```matlab
function u = lEcuyer(z1, z2, z3, z4, n)
```
Generate 10,000 random numbers using this generator.

#### Task 1b: Runs Test
Implement a runs test in `runsTest.m` to assess the quality of the generated random numbers. The function signature should be:
```matlab
function [reject, R] = runsTest(u, a)
```
Use a significance level of α = 0.05.

### Task 2: Data Exploration and Analysis
#### Task 2a: Data Visualization
Load the dataset `dataIndAss2425.mat` and analyze the benzene (C6H6) measurements using at least three different visualization techniques. Handle outliers appropriately.

#### Task 2b: Descriptive Statistics
Compute the seven-number summary, mean, variance, and sample skewness for the cleaned data. Form a hypothesis about the distribution of the processing times.

#### Task 2c: Comparative Analysis
Perform a comparative analysis of the carbon monoxide (CO) and benzene (C6H6) measurements, identifying any outliers and the times they were recorded.

### Task 3: Discrete Event Simulation
Simulate a manufacturing plant modeled as an M|M|1-queue with breakdowns using the provided functions (`arrival.m`, `service.m`, `breakdown.m`, and `repair.m`). The simulation should stop after the end of the busy period in which product #10,000 is constructed.

Implement the simulation in `DES.m` with the function signature:
```matlab
function [avgWaitingTime, avgQueueLength] = DES()
```
Run 20 iterations and report the distributions of the average waiting time and queue length.

## References
- L'Ecuyer, P. (1999). Tables of maximally equidistributed combined LFSR generators. Math. Comput., 68(225), 261–269. [https://doi.org/10.1090/s0025-5718-99-01039-x](https://doi.org/10.1090/s0025-5718-99-01039-x)

## Submission
- Ensure all `.m` files are in the highest-level directory of the ZIP file.
- Submit `assignment.zip` on Canvas before the deadline.
