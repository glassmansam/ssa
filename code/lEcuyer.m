function u = lEcuyer(z1, z2, z3, z4, n)
    % Generates n random numbers U(0,1) using a combined LFSR method.
    % Parameters
    L = 32; % Word length
    s1 = 18; s2 = 2; s3 = 7; s4 = 13; % Step sizes

    % Ensure seeds are 32-bit unsigned integers for the bitwise operations.
    % Not sure if necessary but rather be safe
    z1 = uint32(z1);
    z2 = uint32(z2);
    z3 = uint32(z3);
    z4 = uint32(z4);

    % Alllocate output nx1 vector of U(0,1) random numbers
    u = zeros(n, 1); 

    % Generate random numbers
    for i = 1:n
        % Update each lsfr
        z1 = bitxor(bitsll(z1, s1), bitsrl(z1, L - s1));
        z2 = bitxor(bitsll(z2, s2), bitsrl(z2, L - s2));
        z3 = bitxor(bitsll(z3, s3), bitsrl(z3, L - s3));
        z4 = bitxor(bitsll(z4, s4), bitsrl(z4, L - s4));

        % Combine the LFSR outputs
        z = bitxor(bitxor(z1, z2), bitxor(z3, z4));

        % Normalize to fit in range U(0,1)
        u(i) = double(z) / (2^L); % modulo with word length bits
    end
end
