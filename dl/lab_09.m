clc;
clear;

Am = 1;    % Message amplitude 
fm = 10;     % Message frequency (Hz)

% Parameters
Ac = 2;      % Carrier amplitude
fc = 100;    % Carrier frequency (Hz)



m = Am / Ac; % Modulation index = 0.5

t = 0:0.0001:1; % Time vector

% Signals
msg = Am * sin(2 * pi * fm * t);     % Message signal
carr = Ac * sin(2 * pi * fc * t);    % Carrier signal
AM = (1 + m * sin(2*pi*fm*t)) .* carr; % AM signal


subplot(3,1,1)
plot(t, msg)
xlabel('Time (s)')
ylabel('Amplitude')
title('Message Signal')


subplot(3,1,2)
plot(t, carr)
xlabel('Time (s)')
ylabel('Amplitude')
title('Carrier Signal')


subplot(3,1,3)
plot(t, AM)
xlabel('Time ')
ylabel('Amplitude')
title('AM Signal ')