clc;
clear;

% === Given values ===
LC = 10;    % Number of Lost Calls
CC = 380;   % Number of Carried Calls

% === Calculate Offered Calls ===
OC = LC + CC;

% === Grade of Service ===
GoS = LC / OC;

% === Display result ===
fprintf('The Grade of Service (GoS) during busy hour is: %.4f\n', GoS);

