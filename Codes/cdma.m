%CDMA implementation
clc;clear;close all;

% Generate Binary Data

% Parameters
num_users = 2;
data_length = 2;         % Keep small for display
chip_length = 4;          % Must be a power of 2: 2, 4, 8, 16, etc.
EbNo_dB = 10;

data = randi([0 1], num_users, data_length);
disp('Original Data(d) for sender_1 and sender_2 :');
disp(data);

% BPSK Modulation (0 ? -1, 1 ? +1)
modulated_data =( 2 .* data) - 1;
disp('modulated_data (m = 2*d-1) for sender_1 and sender_2 :');
disp(modulated_data);

% Generate Walsh Codes (Hadamard Matrix)
% Ensure chip_length is a power of 2
if mod(log2(chip_length), 1) ~= 0
    error('chip_length must be a power of 2.');
end
walsh_codes = hadamard(chip_length);

% Use orthogonal codes, skip the all-ones row (optional)
spreading_codes = walsh_codes(2:num_users+1, :);
disp('Spreading codes (c) for sender_1 and sender_2 :');
disp(spreading_codes);

% Spreading
tx_signal = zeros(num_users, data_length * chip_length);
for u = 1:num_users
    for i = 1:data_length
        idx_start = (i-1)*chip_length + 1;
        idx_end = idx_start + chip_length - 1;
        tx_signal(u, idx_start:idx_end) = ...
            modulated_data(u, i) * spreading_codes(u,:);
    end
end

disp('tx_signal (m*c) for sender_1 and sender_2:');
disp(tx_signal);

% Combine User Signals
composite_signal = sum(tx_signal, 1);
disp('Composite Signal {sum(tx_signal)} :');
disp(composite_signal);

% Add AWGN Noise
EbNo_linear = 10^(EbNo_dB/10);
noise_power = 1 / (2 * EbNo_linear * chip_length);
noise = sqrt(noise_power) * randn(size(composite_signal));
received_signal = composite_signal + noise;
disp('received_signal (composite_signal + noise) :');
disp(received_signal);

% Despreading and Demodulation
recovered_data = zeros(num_users, data_length);
for u = 1:num_users
    for i = 1:data_length
        idx_start = (i-1)*chip_length + 1;
        idx_end = idx_start + chip_length - 1;
        chips = received_signal(idx_start:idx_end);
        correlation = dot(chips, spreading_codes(u, :));
        recovered_data(u, i) = correlation > 0;
    end
end

disp('Recovered Data for receiver_1 and receiver_2 :');
disp(recovered_data);

% Bit Error Rate (BER)
for u = 1:num_users
    errors = sum(data(u,:) ~= recovered_data(u,:));
    ber = errors / data_length;
    fprintf('Users_%d BER (Bit Error Rate): %.4f\n', u, ber);
end

figure;
for u = 1:num_users
    subplot(num_users, 1, u);
    stem(data(u,:), 'filled');
    title(['Data bit for Sender',num2str(u)]);
    xlabel('Chip Index');
    ylabel('Amplitude');
    grid on;
end

figure;
for u = 1:num_users
    subplot(num_users, 1, u);
    stem(modulated_data(u,:), 'filled');
    title(['Modulated data for Sender',num2str(u)]);
    xlabel('Chip Index');
    ylabel('Amplitude');
    grid on;
end

figure;
for u = 1:num_users
    subplot(num_users, 1, u);
    stem(tx_signal(u,:), 'filled');
    title(['Transmitted data for Sender',num2str(u)]);
    xlabel('Chip Index');
    ylabel('Amplitude');
    grid on;
end

figure;
stem(composite_signal,'filled');
title('Transmitted Composite Signal');
xlabel('Chip Index');
ylabel('Amplitude');
grid on;


figure;
for u = 1:num_users
    subplot(num_users, 1, u);
    stem(recovered_data(u,:), 'filled');
    title(['Received Signal for receiver',num2str(u)]);
    xlabel('Chip Index');
    ylabel('Amplitude');
    grid on;
end

%https://youtu.be/8llE5-O2XpM?si=sDga1h5q9DxfZegc
