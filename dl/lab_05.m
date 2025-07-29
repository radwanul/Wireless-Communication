clc;
clear all;

channels = 50;         % Number of available channels
blocking = 0.02;       % Blocking probability (2%)
HT = 120;              % Average holding time in seconds (2 minutes)
BHcall = 1.2;          % Average number of calls per user per hour

% From Erlang B table (for 50 channels and 2% blocking),
% the offered traffic load (A) is 40.26 Erlangs
A = 40.26;

% Carried traffic load = Offered traffic * (1 - blocking)
B = A * (1 - blocking);

% Average traffic per user (in Erlangs):
% = calls per user per hour * average holding time in hours
Avgtraffic_user = BHcall * HT / 3600;

% Number of users supported:
No_users = B / Avgtraffic_user;

% Print the result (rounded)
fprintf('NO of mobile subscribers supported are= %d\n', round(No_users));