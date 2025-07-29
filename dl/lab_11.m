% TDMA Simulation Parameters
clc;
clear;
% Removed 'close all' to prevent closing figures

numUsers = 4;           % Number of users
numFrames = 5;          % Number of frames to simulate
slotsPerFrame = numUsers; % Number of time slots per frame
dataBitsPerSlot = 10;   % Number of data bits per time slot

userData = randi([0, 1], numUsers, numFrames, dataBitsPerSlot);

% Initialize the TDMA frame structure
tdmaFrame = zeros(slotsPerFrame, numFrames, dataBitsPerSlot);

% TDMA Scheduling
for frame = 1:numFrames
    fprintf('--- Frame %d ---\n', frame);
    for user = 1:numUsers
        tdmaFrame(user, frame, :) = userData(user, frame, :);
        fprintf('  User %d transmits in Slot %d: Data = %s\n', user, user, num2str(squeeze(tdmaFrame(user, frame, :))'));
    end
end

% Visualize the TDMA frame (Figure 1)
figure(1);
imagesc(squeeze(tdmaFrame(:,:,1)));
colormap(gray);
colorbar;
title('TDMA Frame Allocation (First Bit)');
xlabel('Frame Number');
ylabel('Time Slot (User)');
set(gca, 'YTick', 1:numUsers, 'YTickLabel', arrayfun(@(x) sprintf('User %d', x), 1:numUsers, 'UniformOutput', false));
set(gca, 'XTick', 1:numFrames);
grid on;

% Signal generation for TDM
x = 0:0.5:4*pi;
sig1 = 8*sin(x);
l = length(sig1);
sig2 = 8*triang(l);

% Display both signals (Figure 2)
figure(2);
subplot(2,2,1);
plot(sig1);
title('Sinusoidal Signal');
ylabel('Amplitude');
xlabel('Time');

subplot(2,2,2);
plot(sig2);
title('Triangular Signal');
ylabel('Amplitude');
xlabel('Time');

subplot(2,2,3);
stem(sig1);
title('Sampled Sinusoidal Signal');
ylabel('Amplitude');
xlabel('Time');

subplot(2,2,4);
stem(sig2);
title('Sampled Triangular Signal');
ylabel('Amplitude');
xlabel('Time');

% TDM processing
for i = 1:l
    sig(1,i) = sig1(i);
    sig(2,i) = sig2(i);
end

tdmsig = reshape(sig, 1, 2*l);

% Display TDM signal (Figure 3)
figure(3);
stem(tdmsig);
title('TDM Signal');
ylabel('Amplitude');
xlabel('Time');

% Demultiplexing
demux = reshape(tdmsig, 2, l);
for i = 1:l
    sig3(i) = demux(1,i);
    sig4(i) = demux(2,i);
end

% Display demultiplexed signals (Figure 4)
figure(4);
subplot(2,1,1);
plot(sig3);
title('Recovered Sinusoidal Signal');
ylabel('Amplitude');
xlabel('Time');

subplot(2,1,2);
plot(sig4);
title('Recovered Triangular Signal');
ylabel('Amplitude');
xlabel('Time');