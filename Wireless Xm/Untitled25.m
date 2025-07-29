clc; 
clear; 
% Number of users 
N = 4; 
% Time per slot (in ms) 
T_slot = 10; 
% Total time 
T_total = N * T_slot; 
t = 0:0.1:T_total;  % time axis 
signal = zeros(size(t)); 
% Assign signal values for each user's time slot 
for i = 1:N 
start_time = (i - 1) * T_slot; 
end_time = i * T_slot; 
idx = find(t >= start_time & t < end_time); 
signal(idx) = i;  % user i transmits 
end 
% Plotting 
figure; 
plot(t, signal, 'LineWidth', 2); 
xlabel('Time (ms)'); 
ylabel('User ID'); 
title('TDMA Time Slot Allocation'); 
grid on;