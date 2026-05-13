clear; close all; clc;

% Cau 2 - Giai ma LDPC bang thuat toan lat bit
% Lương Hải Long - 22207056

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

fprintf('--- GIAI MA LDPC BANG THUAT TOAN LAT BIT ---\n');
fprintf('Tu ma truyen c = [%s]\n', num2str(c));
fprintf('Tu ma nhan  r = [%s]\n\n', num2str(r));

syndrome_r = mod(H * transpose(r), 2);
fprintf('Hoi chung ban dau s = [%s]\n\n', num2str(transpose(syndrome_r)));

while (success == 0 && iter < maxiter)
    fprintf('Lan lap %d\n', iter + 1);

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

    fprintf('y hien tai = [%s]\n', num2str(y));
    fprintf('Ma tran E =\n');
    disp(E);
    fprintf('So phieu loi M = [%s]\n', num2str(M));

    if Mmax ~= 0
        y(index) = mod(y(index) + 1, 2);
        fprintf('Dao bit tai vi tri %d\n', index);
    end

    areErrorsPresent = check_errors(H, y);
    if areErrorsPresent == 0
        success = 1;
        disp('No error');
    else
        disp('Still errors');
    end

    fprintf('y sau khi cap nhat = [%s]\n\n', num2str(y));
    iter = iter + 1;
end

fprintf('Ket qua giai ma cuoi cung y = [%s]\n', num2str(y));

if isequal(y, c)
    disp('Giai ma thanh cong: khoi phuc dung tu ma truyen.');
else
    disp('Canh bao: tu ma giai duoc khac voi tu ma truyen.');
end

function res = check_errors(H, current_frame)
    syndrome = H * transpose(current_frame);
    areErrors = any(mod(syndrome, 2));
    res = areErrors;
end
