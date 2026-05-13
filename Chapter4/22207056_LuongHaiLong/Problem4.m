clc; clear; close all;
EbN0_dB = 0:2:8;
P_error_simul_BASK = [0.1578 0.0973 0.0578 0.0198 0.0045];
P_error_theo_BASK = [0.1587 0.1040 0.0565 0.0230 0.0060];
P_error_simul_BPSK = [0.0784 0.0408 0.0119 0.0028 0.0002];
P_error_theo_BPSK = [0.0786 0.0375 0.0125 0.0024 0.0002];
P_error_simul_BFSK = [0.1655 0.1110 0.0518 0.0223 0.0070];
P_error_theo_BFSK = [0.1587 0.1040 0.0565 0.0230 0.0060];
figure(1)
semilogy(EbN0_dB, P_error_theo_BASK, 'r-', 'linewidth', 1.8); 
hold on;
semilogy(EbN0_dB, P_error_theo_BPSK, 'g--', 'linewidth', 1.8);
semilogy(EbN0_dB, P_error_theo_BFSK, 'b:', 'linewidth', 2);
semilogy(EbN0_dB, P_error_simul_BASK, 'ko');
semilogy(EbN0_dB, P_error_simul_BPSK, 'ko');
semilogy(EbN0_dB, P_error_simul_BFSK, 'ko');
xlabel('Eb/N0 (dB)'); ylabel('The error probability');
legend('Theory BASK', 'Theory BPSK', 'Theory BFSK', 'Simulation')
