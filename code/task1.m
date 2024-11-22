% Add your code for Task 1 in this file

% Task 1
% ---

clearvars; clc

% (1a) Implement this combined generator in MATLAB and generate 10,000 random numbers with this generator.  

% initialize the seeds for the J generators with word length L
z1 = 2957;
z2 = 646;
z3 = 3847;
z4 = 947;

n = 10000;
u = lEcuyer(z1, z2, z3, z4, n);

disp(u(1:10)); % Display first 10 random numbers

% (1b) Run's Test

% Perform the runs test
alpha = 0.05; % signifiance level

[reject, R] = runsTest(u, alpha)

% Null Hypothesizs
% H0 = the numbers U are independent.
% Runs test statistic R
% Critical Value

% CONCLUSION: We fail to reject the null hypothesus since our critical 
% value is greater than the test statistic R, and therefore u(i) are
% independent and randomly distributed enough for statistical use.