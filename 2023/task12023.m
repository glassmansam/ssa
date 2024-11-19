% Task 1:
clearvars; clc;
% In (L'Ecuyer & Andres, 1997), two approaches for combined LCGs are given. 
% In this task we will restrict ourselves to the approach in equation (1)
% of this paper, i.e., where u_{n} \tilde is generated. 
% 
% Please note that the recursion is defined earlier in section 2.1. 
% 
% We make the following choices for the parameters:
% 𝐽 = 4, 
% 𝑎1 = 34, 𝑎2 = 63, 𝑎3 = 79, 𝑎4 = 19, 
% 𝑚1 = 3491, 𝑚2 = 1949, 𝑚3 = 7919, 𝑚4 = 2939, 
% 𝛿1 = 71, 𝛿2 = 31, 𝛿3 = 117, 𝛿4 = 161. 
% Furthermore, we take as seed 
% 𝑥1,0 = 2957, 𝑥2,0 = 646, 𝑥3,0 = 3847, 𝑥4,0 = 947. 

% Task 1a
% Implement combined LCG as described in the paper.

% Where n is the number of random numbers to be generated, and a, m, 
% and delta are Jx1 vectors of the parameters and x is a Jx1 vector with seeds.
J = 4;
a = [34; 63; 79; 19];
m = [3491; 1949; 7919; 2939];
delta = [71; 31; 117; 161];
x0 = [2957; 646; 3847; 947]; % initial seeds

% The parameters for the lEcuyer() function have to be defined prior to
% passing to the function. I was considering initializing each parameter
% vector to be of size Jx1 to ensure no index out of bounds occur if J >
% the hardcoded parameter vectors, for example, if J > 4, then the
% remaining J-4 elements in the parameter vectors would be initialized to some
% arbitrary or random value. However, I don't really know if this makes
% sense to do, so I haven't.

% Generate 100,000 random numbers ~ U(0,1)
n = 100000;
U = lEcuyer(a, m, delta, x0, n);
disp(U(1:10)) % just checking the first 10 generated entries

% Task 1b: Poker Test 
% Perform a poker test with groups of 5 observations and 7 categories

%%% Null Hypothesis:
% The null hypothesis (H0) for this poker test is that the sequence of
% random numbers generated from the combined LCG numbers are independent.
% We assume that each u_k follows a standard uniform distribution U(0,1)

% calculate occurences of patterns:
patterns = pokerCounts(U);

% We expect the sum of each patterns total occurances to add up to 20,000
% for the 100,000 numbers generated in U
fprintf("Number of occurences: %d\n\n", sum(patterns));
% Display results
disp('Occurrences of each pattern:');
disp('-----------------------------------------');
disp('Pattern              Occurrences');
disp('-----------------------------------------');
pattern_names = {'All Different', 'One Pair', 'Two Pairs', 'Three of a Kind', 'Full House', 'Four of a Kind', 'Five of a Kind'};
for i = 1:7
    fprintf('%-20s %d\n', pattern_names{i}, patterns(i));
end
disp('-----------------------------------------');
disp(patterns);

% Chi-squared Test

alpha = 0.01;
[Chi2, critval, reject] = pokerChi2(patterns, alpha);

if reject
    conclusion = "The Chi2 test statistic is greater than the critical value at the significance level alpha = " + alpha + ", and therefore falls in the rejection region of this test.\n Therefore we reject the null hypothesis H0, indicating statistical significant differences between the observed and expected distribution. Since we used the poker test, this indicates that the numbers generated are not independent.";
else
    conclusion = "The test statistic is less than the critical value at significance level alpha = " + alpha + " and therefore we fail to reject the null hypothesis H0, which in the context of the poker test means that the observed distribution is consistent with truly random expected probabilities of patterns, meaning the CLCG generates values that appear independent.";
end


fprintf("Test-statistic: %.4f\nCritical Value: %.4f\nConclusion: %s\n", Chi2, critval, conclusion);