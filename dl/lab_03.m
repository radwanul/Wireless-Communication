% Example 2.1: To get GoS during Busy Hour

clc;
clear all;

% Given values
LC = 10;     % Lost calls
CC = 380;    % Carried calls

% Total offered calls
OC = LC + CC;

% Grade of Service (GoS) = (Number of Lost Calls) / (Total Number of Offered Calls)
GoS = LC / OC;

% Display result
fprintf('The GoS during busy hour is %.4f\n', GoS);