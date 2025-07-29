clc;
clear;
close all;

% === Parameters ===
f = 900;     % Frequency in MHz
d = 5;       % Distance in km
hb = 50;     % Base station height in meters
hm = 1.5;    % Mobile station height in meters

% === Correction factor for mobile antenna height ===
if f >= 300
    a_hm = 3.2 * (log10(11.75 * hm))^2 - 4.97;
else
    a_hm = 8.29 * (log10(1.54 * hm))^2 - 1.1;
end

% === Urban path loss calculation ===
L_urban = 69.55 + 26.16*log10(f) - 13.82*log10(hb) + (44.9 - 6.55*log10(hb)) * log10(d) - a_hm;

% === Suburban path loss calculation ===
L_suburban = L_urban - 2*(log10(f/28))^2 - 5.4;

% === Display results ===
fprintf('Path Loss (Urban): %.2f dB\n', L_urban);
fprintf('Path Loss (Suburban): %.2f dB\n', L_suburban);

