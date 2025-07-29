% FDMA Implementation in MATLAB

clear; close all; clc;

% System Parameters
Fs = 1000; % Sampling frequency (Hz)
T = 1;     % Simulation time (s)
t = 0:1/Fs:T-1/Fs; % Time vector

% User 1 Parameters
f1 = 50; % Carrier frequency for User 1 (Hz)
msg1_freq = 5; % Message frequency for User 1 (Hz)
amplitude1 = 1; % Amplitude for User 1

% User 2 Parameters
f2 = 150; % Carrier frequency for User 2 (Hz)
msg2_freq = 10; % Message frequency for User 2 (Hz)
amplitude2 = 0.8; % Amplitude for User 2

% Generate Message Signals
msg1 = amplitude1 * sin(2 * pi * msg1_freq * t);
msg2 = amplitude2 * sin(2 * pi * msg2_freq * t);

% Modulate Message Signals onto respective Carrier Frequencies
% For simplicity, we use amplitude modulation (AM) here.
% In real systems, more complex modulations like QPSK or QAM are used.
modulated_signal1 = msg1 .* cos(2 * pi * f1 * t);
modulated_signal2 = msg2 .* cos(2 * pi * f2 * t);

% Combine the modulated signals for FDMA transmission
% This represents the multiplexing of signals in the frequency domain.
combined_signal = modulated_signal1 + modulated_signal2;

% Plotting the signals in Time Domain
figure;
subplot(4,2,1);
plot(t, msg1);
title('User 1 Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,2,2);
plot(t, modulated_signal1);
title('User 1 Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,2,3);
plot(t, msg2);
title('User 2 Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,2,4);
plot(t, modulated_signal2);
title('User 2 Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,2,5);
plot(t, combined_signal);
title('Combined FDMA Signal (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plotting the signals in Frequency Domain (using FFT)
N = length(combined_signal); % Number of samples
f_axis = (-N/2:N/2-1) * (Fs/N); % Frequency axis for plotting

% FFT of individual modulated signals
fft_modulated_signal1 = fftshift(abs(fft(modulated_signal1)));
fft_modulated_signal2 = fftshift(abs(fft(modulated_signal2)));
fft_combined_signal = fftshift(abs(fft(combined_signal)));

subplot(4,2,6);
plot(f_axis, fft_combined_signal);
title('Combined FDMA Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-200 200]);
grid on;

subplot(4,2,7);
plot(f_axis, fft_modulated_signal1);
title('User 1 Modulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-200 200]); % Adjust frequency limits for better visualization
grid on;

subplot(4,2,8);
plot(f_axis, fft_modulated_signal2);
title('User 2 Modulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-200 200]);
grid on;


