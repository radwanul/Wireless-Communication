clc;
clear;

% User data (binary)
d1 = 1;   % User 1 sends 1
d2 = 0;   % User 2 sends 0

% TDMA: Each user sends in their own time slot
tx = [d1 d2];  % First slot for User 1, second for User 2

% Receiver just reads the slots
r1 = tx(1);    % User 1's data
r2 = tx(2);    % User 2's data

% Show results
disp(['User 2 received: ', num2str(r2)]);
disp(['User 1 received: ', num2str(r1)]);




% User data
d1 = 1;   % User 1 sends 1
d2 = 0;   % User 2 sends 0

% TDMA transmission: each user sends in a separate time slot
% Create time axis for 2 slots
t = 0:0.01:2;

% Create signal for each time slot
tx = zeros(size(t));
tx(t <= 1) = d1;      % First 1s for User 1
tx(t > 1) = d2;       % Second 1s for User 2

% Plot
figure;
plot(t, tx, 'LineWidth', 2);
ylim([-0.2 1.2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('TDMA Transmission');
grid on;

