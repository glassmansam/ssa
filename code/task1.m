% Add your code for Task 1 in this file

% Task 1
% ---

clearvars; clc

% In (L'Ecuyer, 1999), several approaches for combined LFSRs are given. In this task we will 
% restrict ourselves to the first example of ME-CF generators as indicated in Table 1 of this paper. 
% We make the following choices for the parameters: 

% Furthermore, we take as seed 𝑧 = 2957, 𝑧 = 646, 𝑧 = 3847, 𝑧 = 947. 
%z1 = 2957; z2 = 646; z3 = 3847; z4 = 947;
% z = [z1, z2, z3, z4];

% (1a) Implement this combined generator in MATLAB and generate 10,000 random numbers with this generator.  

% initialize the seeds for the J generators with word length L
z1 = 2957;
z2 = 646;
z3 = 3847;
z4 = 947;
% TODO: move to function body. Do the shift values need to be uint32?
% n = 10000;
n=10;
u = lEcuyer(z1, z2, z3, z4, n);
u
% (1b) Run's Test

% Perform the runs test
alpha = 0.05;
%[reject, R] = runsTest(u, alpha);