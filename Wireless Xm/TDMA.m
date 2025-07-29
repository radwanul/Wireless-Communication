
% TDMA Simulation Parameters
clc;
clear;
close all;

numUsers = 4;           % Number of users
numFrames = 5;          % Number of frames to simulate
slotsPerFrame = numUsers; % Number of time slots per frame (equal to number of users for simplicity)
dataBitsPerSlot = 10;   % Number of data bits per time slot

userData = randi([0, 1], numUsers, numFrames, dataBitsPerSlot);

% Initialize the TDMA frame structure
% This matrix will store which user's data occupies which slot in each frame.
% For simplicity, we assume a fixed allocation (User 1 in Slot 1, User 2 in Slot 2, etc.)
tdmaFrame = zeros(slotsPerFrame, numFrames, dataBitsPerSlot);

% TDMA Scheduling: Allocate data to time slots within each frame
for frame = 1:numFrames
    fprintf('--- Frame %d ---\n', frame);
    for user = 1:numUsers
        % Assign data from the current user to their designated time slot
        % In this simple example, user 'u' gets slot 'u'.
        tdmaFrame(user, frame, :) = userData(user, frame, :);
        fprintf('  User %d transmits in Slot %d: Data = %s\n', user, user, num2str(squeeze(tdmaFrame(user, frame, :))'));
    end
end

% Optional: Visualize the TDMA frame (simplified representation)
figure;
imagesc(squeeze(tdmaFrame(:,:,1))); % Visualize the first bit of each slot for simplicity
colormap(gray);
colorbar;
title('TDMA Frame Allocation (First Bit)');
xlabel('Frame Number');
ylabel('Time Slot (User)');
set(gca, 'YTick', 1:numUsers, 'YTickLabel', arrayfun(@(x) sprintf('User %d', x), 1:numUsers, 'UniformOutput', false));
set(gca, 'XTick', 1:numFrames);
grid on;