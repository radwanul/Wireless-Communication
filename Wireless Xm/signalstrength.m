% Received Signal Strength (RSS) Calculation using Free Space Path Loss
clc; clear;
% Parameters
Pt = 30;              % Transmit power in dBm
f = 900;              % Frequency in MHz
d = 500;             % Distance in meters (example: 500 meters)

% Convert distance to km for FSPL
d_km = d / 1000;

% Free Space Path Loss (FSPL) in dB
PSPL_dB = 20*log10(d_km) + 20*log10(f) + 32.44;

% Received Signal Strength (in dBm)
Pr_dBm = Pt - PSPL_dB;

% Display result
fprintf('At %.0f meters, Received Signal Strength = %.2f dBm\n', d, Pr_dBm);
