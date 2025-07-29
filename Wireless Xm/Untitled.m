clc; clear; close all;

numUsers = 3;            % Number of users
slotsPerFrame = numUsers;
numFrames = 4;           % Total frames to simulate
bitsPerUser = 8;         % Bits per user per frame

% Generate random binary data for each user
userData = randi([0, 1], numUsers, numFrames, bitsPerUser);

% Create TDMA frame (user i → slot i in each frame)
tdmaStream = []; % Combined TDM stream

disp('TDMA Transmission Frame-by-Frame:');
for f = 1:numFrames
    fprintf('Frame %d:\n', f);
    for u = 1:numUsers
        slotData = squeeze(userData(u,f,:))';
        fprintf('  User %d (Slot %d): %s\n', u, u, num2str(slotData));
        tdmaStream = [tdmaStream, slotData]; % Append slot data to stream
    end
end

% Plot TDMA Stream
figure;
stem(tdmaStream, 'filled');
title('TDMA Transmitted Bit Stream');
xlabel('Bit Index');
ylabel('Bit Value (0 or 1)');
grid on;

% Demultiplex the stream
recovered = reshape(tdmaStream, bitsPerUser, numUsers * numFrames)';
recoveredData = reshape(recovered', bitsPerUser, numFrames, numUsers);
recoveredData = permute(recoveredData, [3, 2, 1]); % [user, frame, bits]

% (Optional) Visualize recovered data for User 1
disp('Recovered Data for User 1:');
disp(squeeze(recoveredData(1,:,:)));

