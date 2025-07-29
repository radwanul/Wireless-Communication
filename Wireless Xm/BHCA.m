clc;
clear all;
close all;

% Input total number of call attempts in a day
total_call_attempts = input('Enter total number of call attempts in a day: ');

% Input number of busy hours in a day (typically 1 or 2 hours)
busy_hours = input('Enter number of busy hours in a day: ');

% Calculate average BHCA
average_BHCA = total_call_attempts / busy_hours;

% Display the result
fprintf('Average Busy Hour Call Attempts (BHCA) = %.2f calls\n', average_BHCA);
