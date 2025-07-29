clc;
clear;
close all;

% === Time and Parameters ===
t = 0:0.0001:0.1;      % Time range
a = 2;                 % Amplitude
fm = 50;               % Message frequency
fc = 1000;             % Carrier frequency
m = 0.2;               % Modulation index (should be < 1 for no distortion)

% === Signals ===
m1 = sin(2*pi*fm*t);                 % Message signal
c1 = sin(2*pi*fc*t);                 % Carrier signal
am = a * (1 + m * m1) .* c1;         % Amplitude Modulated Signal

% === Plotting ===
subplot(3,1,1);
plot(t, m1);
title('Message Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, c1);
title('Carrier Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, am);
title('AM Wave');
xlabel('Time'); ylabel('Amplitude');

