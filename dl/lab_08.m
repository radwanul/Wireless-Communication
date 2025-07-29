clc;
clear;

% Parameters
fc = 2.4e9;             % Carrier frequency in Hz (2.4 GHz)
d0 = 1;                 % Reference distance in meters
n = 3;                  % Path loss exponent (urban area)
Pt = 60;                % Transmit power in dBm

% Distance range (in meters)
d = 1:0.5:100;

% Wavelength (in meters)
lambda = 3e8 / fc;

% Free-space Path Loss at reference distance d0
PL_d0 = 20 * log10((4 * pi * d0) / lambda);

% Path Loss at distance d using Log-Distance model
PL_d = PL_d0 + 10 * n * log10(d / d0);

% Received Power at distance d
Pr_d = Pt - PL_d;

% Display first 5 values in inline format
fprintf('Path Loss (dB):        ');
fprintf('%.4f   ', PL_d(1:5));
fprintf('\n');

fprintf('Received Power (dBm): ');
fprintf('%.4f   ', Pr_d(1:5));
fprintf('\n');