clc;
clear;

t = 0:0.001:1;      % Time vector
fm = 3;             % Frequency of message signal (Hz)
fc = 50;            % Frequency of carrier signal (Hz)
b = 10;             % Modulation index (frequency deviation)

x = sin(2*pi*fm*t);                       % Message signal
y = cos(2*pi*fc*t);                       % Carrier signal
z = cos((2*pi*fc*t) + b * sin(2*pi*fm*t));% FM signal

% Plot message signal
subplot(3,1,1);
plot(t, x);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot carrier signal
subplot(3,1,2);
plot(t, y);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot FM signal
subplot(3,1,3);
plot(t, z);
title('Frequency Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

