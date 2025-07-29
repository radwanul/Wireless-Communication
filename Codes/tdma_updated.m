clc; clear; close all;

%% Parameters
Fs = 5;                % Sampling frequency (Hz)
T = 1;                 % Bit duration (sec)
num_users = 2;         % User A and User B
bits_per_user = 2;     % 2 bits per user
total_time = num_users * bits_per_user * T; % 4 seconds total

% Time vector
t = 0:1/Fs:total_time-1/Fs;

%% Binary Data to BPSK
bits_A = [1, 0];       % User A bits
bits_B = [0, 1];       % User B bits

% BPSK Modulation
bpsk_A = 2*bits_A - 1;
bpsk_B = 2*bits_B - 1;

%% TDMA Slot Allocation
slot_A1 = (t >= 0)   & (t < 1);
slot_B1 = (t >= 1)   & (t < 2);
slot_A2 = (t >= 2)   & (t < 3);
slot_B2 = (t >= 3)   & (t < 4);

%% Generate TDMA Signals
signal_A1 = bpsk_A(1) * ones(size(t)) .* slot_A1;
signal_B1 = bpsk_B(1) * ones(size(t)) .* slot_B1;
signal_A2 = bpsk_A(2) * ones(size(t)) .* slot_A2;
signal_B2 = bpsk_B(2) * ones(size(t)) .* slot_B2;

% Combine all signals
tdma_signal = signal_A1 + signal_B1 + signal_A2 + signal_B2;

%% Receiver Side (Slot-based integration)
% User A
decoded_A(1) = sum(tdma_signal(slot_A1)) > 0;
decoded_A(2) = sum(tdma_signal(slot_A2)) > 0;

% User B
decoded_B(1) = sum(tdma_signal(slot_B1)) > 0;
decoded_B(2) = sum(tdma_signal(slot_B2)) > 0;

%% Visualization
figure;

% User A Transmitted Signal
subplot(3,2,1);
stem(t, signal_A1 + signal_A2, 'b', 'filled');
title('User A Transmitted Signal');
xlabel('Time (s)'); ylabel('Amplitude');
ylim([-1.5 1.5]); grid on;

% User B Transmitted Signal
subplot(3,2,2);
stem(t, signal_B1 + signal_B2, 'r', 'filled');
title('User B Transmitted Signal');
xlabel('Time (s)'); ylabel('Amplitude');
ylim([-1.5 1.5]); grid on;

% Combined TDMA Signal
subplot(3,2,[3 4]);
stem(t, tdma_signal, 'k', 'filled');
title('TDMA Combined Signal');
xlabel('Time (s)'); ylabel('Amplitude');
ylim([-1.5 1.5]); grid on;

% User A Decoded Bits
subplot(3,2,5);
stem(1:2, decoded_A, 'b', 'filled', 'LineWidth', 1.5);
title('User A Decoded Bits');
xlabel('Bit Number'); ylabel('Value');
ylim([-0.5 1.5]); xlim([0.5 2.5]);
set(gca, 'XTick', [1 2], 'XTickLabel', {'Bit 1','Bit 2'});
grid on;

for i = 1:2
    text(i, decoded_A(i)+0.1, num2str(decoded_A(i)), 'Color', 'b', 'FontSize', 12, 'HorizontalAlignment', 'center');
end

% User B Decoded Bits
subplot(3,2,6);
stem(1:2, decoded_B, 'r', 'filled', 'LineWidth', 1.5);
title('User B Decoded Bits');
xlabel('Bit Number'); ylabel('Value');
ylim([-0.5 1.5]); xlim([0.5 2.5]);
set(gca, 'XTick', [1 2], 'XTickLabel', {'Bit 1','Bit 2'});
grid on;

for i = 1:2
    text(i, decoded_B(i)+0.1, num2str(decoded_B(i)), 'Color', 'r', 'FontSize', 12, 'HorizontalAlignment', 'center');
end

%% Display Results
disp('=== Original Bits ===');
disp('User A:'); disp(bits_A);
disp('User B:'); disp(bits_B);

disp('=== Decoded Bits ===');
disp('User A:'); disp(decoded_A);
disp('User B:'); disp(decoded_B);
