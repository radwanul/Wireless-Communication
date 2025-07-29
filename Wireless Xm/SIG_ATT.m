clc; clear;
% Parameters
fc = 2.4e9;             % Carrier frequency in Hz (2.4 GHz)
d0 = 1;                 % Reference distance in meters
n = 3;                  % Path loss exponent
Pt = 20;                % Transmit power in dBm
% Distance range (in meters)
d = 1:0.5:100;          % From 1m to 100m
% Wavelength (in meters)
lambda = 3e8 / fc;
% Free-space Path Loss at reference distance d0
PL_d0 = 20*log10(4*pi*d0/lambda);
% Path Loss at distance d using log-distance model
PL_d = PL_d0 + 10 * n * log10(d/d0);
% Received Power at distance d
Pr_d = Pt - PL_d;
% Print only PL_d and Pr_d vectors
disp('Path Loss (dB):');
disp(PL_d);
disp('Received Power (dBm):');
disp(Pr_d);
