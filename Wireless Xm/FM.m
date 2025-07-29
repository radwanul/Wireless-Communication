
clc;clear;close all;
t = 0:0.001:1;
fm = 3;      % Modulating frequency (Hz)
fc = 50;     % Carrier frequency (Hz)
b = 10;      % Modulation index (frequency deviation ratio)

x = sin(2*pi*fm*t);             % Modulating signal
y = cos(2*pi*fc*t);             % Carrier signal
z = cos((2*pi*fc*t) + (b*x));   % Frequency modulated signal

% Plotting Modulating Signal
subplot(4, 1, 1);
plot(t, x);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('MODULATING SIGNAL');

% Plotting Carrier Signal
subplot(4, 1, 2);
plot(t, y);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title ('CARRIER SIGNAL');
% Plotting FM Signal
subplot (4, 1, 3);
plot (t, z);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('FREQUENCY MODULATED SIGNAL');
