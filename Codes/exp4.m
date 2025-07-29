clc;
clear;
close all;

% === Input values ===
Lfs1 = input('Enter Free Space Path Loss (dB): ');
Amu = input('Enter Median Attenuation (A_mu): ');
Hmg = input('Enter Mobile Station Antenna Height Gain (dB): ');
Hbg = input('Enter Base Station Antenna Height Gain (dB): ');
Kc = input('Enter Area Correction Factor (dB): ');

% === Okumura Median Path Loss Calculation ===
L = Lfs1 + Amu - Hmg - Hbg - Kc;

% === Display the result ===
fprintf('The Median Path Loss = %.2f dB\n', L);

