clear; close all; clc;

% Cau 1 - Ve gian do Tanner cho ma tran H
% Lương Hải Long - 22207056

baseDir = fileparts(mfilename('fullpath'));

H = [1 1 0 1 0 0;
     0 1 1 0 1 0;
     1 0 0 0 1 1;
     0 0 1 1 0 1];

fig = figure('Name','Gian do Tanner cua ma tran H');
hold on; grid on; axis off;
title('Gian do Tanner cua ma tran kiem tra parity H');

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
