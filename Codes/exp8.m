clc; clear;

% === Parameters ===
fc = 2.4e9;           % Carrier frequency in Hz (2.4 GHz)
d0 = 1;               % Reference distance in meters
n = 3;                % Path loss exponent (urban)
Pt = 20;              % Transmit power in dBm

% === Distance range ===
d = 1:0.5:100;        % Distance from 1m to 100m

% === Wavelength ===
lambda = 3e8 / fc;

% === Free-space Path Loss at reference distance
PL_d0 = 20*log10(4*pi*d0/lambda);

% === Path Loss at distance d
PL_d = PL_d0 + 10 * n * log10(d / d0);

% === Received Power
Pr_d = Pt - PL_d;

% === Plot the results ===
figure;
plot(d, Pr_d, 'LineWidth', 2);
xlabel('Distance (m)');
ylabel('Received Power (dBm)');
title('Received Signal vs Distance (Long Distance Path Loss Model)');
grid on;

