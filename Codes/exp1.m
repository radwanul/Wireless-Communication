clc;
clear;

% === Parameters ===
Pt = 30;         % Transmit Power in dBm
f = 900;         % Frequency in MHz
d = 500;         % Distance in meters

% === Convert distance to kilometers ===
d_km = d / 1000;

% === Calculate Free Space Path Loss (FSPL) in dB ===
PL_dB = 20 * log10(d_km) + 20 * log10(f) + 32.44;

% === Calculate Received Signal Strength ===
Pr_dBm = Pt - PL_dB;

% === Display result ===
fprintf('At %.0f meters, Received Signal Strength = %.2f dBm\n', d, Pr_dBm);

