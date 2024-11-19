function u = lEcuyer2023(a, m, delta, x, n)
    % Check if the input vectors have the correct dimensions J for each of
    % the LCGs
    assert(numel(a) == numel(m) ...
        && numel(m) == numel(delta) ...
        && numel(delta) == numel(x), ...
        'Input vectors must have the same dimensions.');
    
    % Initialize variables s.t. this function accepts arbitrary J
    J = numel(a);   % Determine J from size of arbitrary LCG parameter vector
    % all LCGs parameter vectors should be equally sized as verified above

    u = zeros(n, 1); % output vector initialization
    
    % Generate random numbers
    % TODO: verify order of operations is correct
    for i = 1:n
        %z = mod(sum(delta .* x), m(1));
        %u(i) = z / m(1);
        % Update each of the J LCGs, get next seeds
        for j = 1:J
            x(j) = mod(a(j) * x(j), m(j));
        end
        
        % Calculate combined LCG formula
        z = mod(sum(delta .* x), m(1)); % first part of Eq. (1)
        % Using Matlabs element-wise multiplication .* operator 

        % Store U(0,1) random number
        u(i) = z / m(1);    % second part of Eq. (1)
    end
end


