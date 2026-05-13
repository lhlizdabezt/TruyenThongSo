clear; close all; clc;

% Project 1 - A-Law and mu-Law Companding
% Lương Hải Long - 22207056

baseDir = fileparts(mfilename('fullpath'));
audioFile = fullfile(baseDir, 'MaleSpeech-16-4-mono-20secs.wav');

% 1) Load speech signal
Fs = 4000;
[mSpeech, Fs] = audioread(audioFile);

% Consider the speech signal in 1.5 s
N = floor(1.5 * Fs) + 1;
x = mSpeech(1:N);
t = (0:N-1) / Fs;

% 2) Uniform quantization with exact equation in the brief
L = 16;
V_p = 0.5625;
q = V_p / (L - 1);

s_q_2 = quan_uni_reference(x, q);

% 3) Plot mSpeech and s_q_2
fig1 = figure('Name', 'Project 1 - Uniform Quantization');
plot(t, x, 'LineWidth', 1.2); hold on;
plot(t, s_q_2, 'LineWidth', 0.8);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Project 1 - Uniform Quantization');
legend('mSpeech', 's_q_2', 'Location', 'best');
saveas(fig1, fullfile(baseDir, 'project1_uniform.png'));

% 4) Quantization noise variance and SNR of s_q_2
e_uni = x - s_q_2;
sigma_sq2 = mean(e_uni .^ 2);
pow_sig = mean(x .^ 2);
SNR_sq2 = pow_sig / sigma_sq2;
SNR_sq2_dB = 10 * log10(SNR_sq2);

fprintf('================ PROJECT 1 ================\n');
fprintf('Fs                = %d Hz\n', Fs);
fprintf('L                 = %d\n', L);
fprintf('V_p               = %.4f\n', V_p);
fprintf('q = V_p/(L-1)     = %.6f\n\n', q);

fprintf('Uniform quantization:\n');
fprintf('sigma_sq2         = %.12f\n', sigma_sq2);
fprintf('(S/N)_sq2         = %.6f\n', SNR_sq2);
fprintf('(S/N)_sq2_dB      = %.6f dB\n\n', SNR_sq2_dB);

% 5) Compress the sample signal with mu-law and A-law
mu = 255;
A = 87.6;

s_c_5_mu = mu_law_compress(x, mu, V_p);
s_c_5_A  = a_law_compress(x, A, V_p);

% 6) Quantize compressed signal
s_q_6_mu = quan_uni_reference(s_c_5_mu, q);
s_q_6_A  = quan_uni_reference(s_c_5_A, q);

% 7) Expand the quantized signal
s_e_7_mu = mu_law_expand(s_q_6_mu, mu, V_p);
s_e_7_A  = a_law_expand(s_q_6_A, A, V_p);

% 8) Plot mSpeech, s_q_2, s_c_5, s_q_6, s_e_7
fig2 = figure('Name', 'Project 1 - mu-Law');
plot(t, x, 'LineWidth', 1.2); hold on;
plot(t, s_q_2, 'LineWidth', 0.8);
plot(t, s_c_5_mu, 'LineWidth', 0.8);
plot(t, s_q_6_mu, 'LineWidth', 0.8);
plot(t, s_e_7_mu, 'LineWidth', 0.8);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Project 1 - mu-Law Companding');
legend('mSpeech', 's_q_2', 's_c_5 (mu-law)', 's_q_6 (mu-law)', ...
       's_e_7 (mu-law)', 'Location', 'best');
saveas(fig2, fullfile(baseDir, 'project1_mu.png'));

fig3 = figure('Name', 'Project 1 - A-Law');
plot(t, x, 'LineWidth', 1.2); hold on;
plot(t, s_q_2, 'LineWidth', 0.8);
plot(t, s_c_5_A, 'LineWidth', 0.8);
plot(t, s_q_6_A, 'LineWidth', 0.8);
plot(t, s_e_7_A, 'LineWidth', 0.8);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Project 1 - A-Law Companding');
legend('mSpeech', 's_q_2', 's_c_5 (A-law)', 's_q_6 (A-law)', ...
       's_e_7 (A-law)', 'Location', 'best');
saveas(fig3, fullfile(baseDir, 'project1_a.png'));

% 9) Noise variance and SNR after companding
e_mu = x - s_e_7_mu;
sigma_se7_mu = mean(e_mu .^ 2);
SNR_se7_mu = pow_sig / sigma_se7_mu;
SNR_se7_mu_dB = 10 * log10(SNR_se7_mu);

e_A = x - s_e_7_A;
sigma_se7_A = mean(e_A .^ 2);
SNR_se7_A = pow_sig / sigma_se7_A;
SNR_se7_A_dB = 10 * log10(SNR_se7_A);

fprintf('mu-law companding:\n');
fprintf('mu                = %d\n', mu);
fprintf('sigma_se7_mu      = %.12f\n', sigma_se7_mu);
fprintf('(S/N)_se7_mu      = %.6f\n', SNR_se7_mu);
fprintf('(S/N)_se7_mu_dB   = %.6f dB\n\n', SNR_se7_mu_dB);

fprintf('A-law companding:\n');
fprintf('A                 = %.1f\n', A);
fprintf('sigma_se7_A       = %.12f\n', sigma_se7_A);
fprintf('(S/N)_se7_A       = %.6f\n', SNR_se7_A);
fprintf('(S/N)_se7_A_dB    = %.6f dB\n\n', SNR_se7_A_dB);

if SNR_se7_A > SNR_se7_mu
    fprintf('Nhan xet: A-law cho SNR tot hon mu-law voi bo tham so nay.\n');
else
    fprintf('Nhan xet: mu-law cho SNR tot hon A-law voi bo tham so nay.\n');
end

% ========================= LOCAL FUNCTIONS =========================

function quan_sig = quan_uni_reference(sig, q)
% Uniform quantization following the same correction style as the reference code
    quan_sig = round(sig / q) * q;
    for i = 1:length(sig)
        d = sig(i) - quan_sig(i);
        if d == 0
            quan_sig(i) = quan_sig(i) + q/2;
        elseif (d > 0) && (abs(d) < q/2)
            quan_sig(i) = quan_sig(i) + q/2;
        elseif (d > 0) && (abs(d) >= q/2)
            quan_sig(i) = quan_sig(i) - q/2;
        elseif (d < 0) && (abs(d) < q/2)
            quan_sig(i) = quan_sig(i) - q/2;
        elseif (d < 0) && (abs(d) >= q/2)
            quan_sig(i) = quan_sig(i) + q/2;
        end
    end
end

function y = mu_law_compress(x, mu, x_max)
    y = zeros(size(x));
    for i = 1:length(x)
        y(i) = sign(x(i)) * x_max * log(1 + mu * abs(x(i) / x_max)) / log(1 + mu);
    end
end

function x_hat = mu_law_expand(y, mu, x_max)
    x_hat = zeros(size(y));
    for i = 1:length(y)
        x_hat(i) = sign(y(i)) * (x_max / mu) * (exp(abs(y(i)) * log(1 + mu) / x_max) - 1);
    end
end

function y = a_law_compress(x, A, x_max)
    y = zeros(size(x));
    for i = 1:length(x)
        ratio = abs(x(i)) / x_max;
        if ratio < (1 / A)
            y(i) = sign(x(i)) * x_max * (A * ratio) / (1 + log(A));
        else
            y(i) = sign(x(i)) * x_max * (1 + log(A * ratio)) / (1 + log(A));
        end
    end
end

function x_hat = a_law_expand(y, A, x_max)
    x_hat = zeros(size(y));
    threshold = 1 / (1 + log(A));
    for i = 1:length(y)
        ratio = abs(y(i)) / x_max;
        if ratio < threshold
            x_hat(i) = sign(y(i)) * x_max * ratio * (1 + log(A)) / A;
        else
            x_hat(i) = sign(y(i)) * x_max * exp(ratio * (1 + log(A)) - 1) / A;
        end
    end
end
