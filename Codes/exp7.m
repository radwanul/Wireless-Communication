clc;
clear;
close all;

% === Input from user ===
total_call_attempts = input('Enter total number of call attempts in a day: ');
busy_hours = input('Enter number of busy hours in a day: ');

% === Calculate BHCA ===
average_BHCA = total_call_attempts / busy_hours;

% === Display result ===
fprintf('Average Busy Hour Call Attempts (BHCA) = %.2f calls\n', average_BHCA);

