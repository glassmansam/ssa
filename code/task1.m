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

% Null Hypothesis
% H0 = the numbers U are independent.
% Runs test statistic R = 12.9232
% Critical Value z = 1.9600
% --> Reject H0 because R > z
% --> u(i) are not statistically independent nor random enough.


% CONCLUSION: We reject the null hypothesis since the test statistic R 
% is much larger than the critical value z, indicating that u(i) are 
% not statistically independent or randomly distributed.

% Probably I messed up with my implementation of lEcuyer unless the authors
% of the paper were incorrect about the qualities of their combined LSFR 
% with this choice of z and s.

% Or I made a mistake when calcualting R, it is relatively quite large in comparison,
% so at alpha = 0.05 the test is not even close.

histogram(u)

% Wow okay, yeah that is not uniform at all.