clear; close all; clc;

% Project 4 - LDPC coding and bit-flipping decoding
% Luong Hai Long - 22207056

baseDir = fileparts(mfilename('fullpath'));

% Question 1: draw the Tanner graph
H = [1 1 0 1 0 0;
     0 1 1 0 1 0;
     1 0 0 0 1 1;
     0 0 1 1 0 1];

fig = figure('Name','Tanner graph for parity-check matrix H');
hold on; grid on; axis off;
title('Tanner graph for parity-check matrix H');

x_var = 1:6;
y_var = 2.0 * ones(1,6);
x_chk = [1.2 2.8 4.4 6.0];
y_chk = 0.5 * ones(1,4);

for j = 1:size(H,1)
    for i = 1:size(H,2)
        if H(j,i) == 1
            plot([x_var(i), x_chk(j)], [y_var(i), y_chk(j)], 'k-', 'LineWidth', 1.5);
        end
    end
end

for i = 1:6
    rectangle('Position',[x_var(i)-0.12, y_var(i)-0.12, 0.24, 0.24], ...
              'Curvature',[1 1], 'EdgeColor','k', 'LineWidth', 1.5);
    text(x_var(i), y_var(i)+0.22, sprintf('c_%d', i), ...
         'HorizontalAlignment','center', 'FontSize', 11, 'Interpreter','tex');
end

for j = 1:4
    rectangle('Position',[x_chk(j)-0.12, y_chk(j)-0.12, 0.24, 0.24], ...
              'EdgeColor','k', 'LineWidth', 1.5);
    text(x_chk(j), y_chk(j), sprintf('e_%d', j), ...
         'HorizontalAlignment','center', 'VerticalAlignment','middle', ...
         'FontSize', 11, 'Interpreter','tex');
end

xlim([0.5 6.5]);
ylim([0 2.5]);
hold off;
saveas(fig, fullfile(baseDir, 'tanner_ldpc.png'));

% Questions 2 and 3: decode with the bit-flipping algorithm
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
