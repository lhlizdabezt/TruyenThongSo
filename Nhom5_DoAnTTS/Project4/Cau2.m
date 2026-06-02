clear; close all; clc;

% Question 2 - LDPC decoding with the bit-flipping algorithm
% Luong Hai Long - 22207056

H = [1 1 0 1 0 0;
     0 1 1 0 1 0;
     1 0 0 0 1 1;
     0 0 1 1 0 1];

c = [0 0 1 0 1 1];
r = [1 0 1 0 1 1];
y = r;

maxiter = 20;
iter = 0;
success = 0;

fprintf('--- LDPC DECODING WITH THE BIT-FLIPPING ALGORITHM ---\n');
fprintf('Transmitted codeword c = [%s]\n', num2str(c));
fprintf('Received word       r = [%s]\n\n', num2str(r));

syndrome_r = mod(H * transpose(r), 2);
fprintf('Initial syndrome s = [%s]\n\n', num2str(transpose(syndrome_r)));

while (success == 0 && iter < maxiter)
    fprintf('Iteration %d\n', iter + 1);

    E = zeros(4, 6);

    for j = 1:4
        for i = 1:6
            if H(j, i) == 1
                E(j, i) = mod(sum(y .* H(j, :)), 2);
            end
        end
    end

    M = zeros(1, 6);
    for i = 1:6
        M(i) = sum(E(:, i));
    end
    [Mmax, index] = max(M);

    fprintf('Current y = [%s]\n', num2str(y));
    fprintf('Error-vote matrix E =\n');
    disp(E);
    fprintf('Error-vote count M = [%s]\n', num2str(M));

    if Mmax ~= 0
        y(index) = mod(y(index) + 1, 2);
        fprintf('Flip bit at position %d\n', index);
    end

    areErrorsPresent = check_errors(H, y);
    if areErrorsPresent == 0
        success = 1;
        disp('No error');
    else
        disp('Still errors');
    end

    fprintf('Updated y = [%s]\n\n', num2str(y));
    iter = iter + 1;
end

fprintf('Final decoded y = [%s]\n', num2str(y));

if isequal(y, c)
    disp('Decoding successful: recovered the transmitted codeword.');
else
    disp('Warning: the decoded codeword differs from the transmitted codeword.');
end

function res = check_errors(H, current_frame)
    syndrome = H * transpose(current_frame);
    areErrors = any(mod(syndrome, 2));
    res = areErrors;
end
