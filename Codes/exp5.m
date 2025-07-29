clc;
clear;

% === Given Inputs ===
channels = 50;         % Number of channels
blocking = 0.02;       % Blocking probability (2%)
HT = 120;              % Average call holding time (seconds)
BHcall = 1.2;          % Avg. calls per user per hour

% === Step 1: Offered traffic from Erlang B table for 50 channels at 2% blocking
A = 40.26;             % (From Erlang B chart)

% === Step 2: Carried traffic (subtract blocked part)
B = A * (1 - blocking);

% === Step 3: Traffic per user
Avg_traffic_user = BHcall * HT / 3600;

% === Step 4: Number of users supported
No_users = B / Avg_traffic_user;

% === Result
fprintf('Number of mobile subscribers supported = %d\n', round(No_users));

