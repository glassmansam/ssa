function u = lEcuyer(z1, z2, z3, z4, n)
    % Where n is the number of random numbers to be generated, and z1,  z2,  z3, and z4 the seeds. The output u is a nx1 vector of U(0,1) random numbers.  
    % Toolboxes: For task 1 a) you are permitted to use the 
    % - bitsll
    % - bitsrl
    % - bitand
    % - bitxor
    % functions from the Fixed-Point Designer Toolbox. 
   
    % We make the following choices for the parameters: 
    L = 32;     % Word length
    J = 4;      % Number of generators
    s1 = 18;    % Values for s taken from Table I for this choice of L and J
    s2 = 2; 
    s3 = 7;
    s4 = 13;

    % allocate space for the n generated variates
    u = zeros(n, 1); % n x 1 vector to contain the U(0,1) generated numbers

    for i = 1:n
        % update each lsfr and combine
        z1 = bitxor(bitsll(z1, s1), bitsrl(z1, L - s1));
        z2 = bitxor(bitsll(z2, s2), bitsrl(z2, L - s2));
        z3 = bitxor(bitsll(z3, s3), bitsrl(z3, L - s3));
        z4 = bitxor(bitsll(z4, s4), bitsrl(z4, L - s4));
        % TODO: Use vector/array to avoid duplicate code
        

    end

end