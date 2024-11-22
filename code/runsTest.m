function [reject, R] = runsTest(u, alpha)
    % Inputs:
    %   u - Sequence of random numbers
    %   a - Significance level (e.g., 0.05)

    n = length(u);             % Total number of observations
    b = sum(u < mean(u));      % Number of observations below the mean
    a = n - b;                 % Number of observations above the mean
    
    % Calculate the number of runs
    r = 1;                     % Initialize run counter
    for i = 2:n
        if (u(i) < mean(u)) ~= (u(i-1) < mean(u))
            r = r + 1;
        end
    end

    % Null hypothesis: H0 - The sequence is independent and random
    
    % Expected value and standard deviation of runs
    mu_r = (2 * a * b) / n + 1; 
    sigma_r = sqrt((2 * a * b * (2 * a * b - n)) / (n^2 * (n - 1)));
    
    % Compute test statistic R
    %R = (r - mu_r) / sigma_r;
    R = (r - (2*a*b/n + 1))/sqrt((2*a*b*(2*a*b - n))/(n^2*(n - 1)));
    % Critical value for two-tailed test
    z = norminv(1 - alpha / 2);
    
    % Determine rejection criterion
    reject = abs(R) > z;
    
    % Display results
    fprintf('Test statistic R = %.4f\n', R);
    fprintf('Critical value z = %.4f\n', z);
    if reject
        fprintf('Conclusion: Reject H0. \n');
    else
        fprintf('Conclusion: Fail to reject H0. \n');
    end
end