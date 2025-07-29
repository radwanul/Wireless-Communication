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
figure(1); 
plot(t, signal, 'LineWidth', 2); 
xlabel('Time (ms)'); 
ylabel('User ID'); 
title('TDMA Time Slot Allocation'); 
grid on; 

%signal generation
x=0:0.5:4*pi; % signal taken upto 4pi
sig1=8*sin(x); % generate ist sinusoidal signal
l=length(sig1);
sig2=8*triang(l); % generate 2nd traiangular signal

%display both signal
figure(2);
subplot(2,2,1);
plot(sig1);
title('Sinusoidal Signal');
ylabel('Amplitude--->');
xlabel('Time---->');

subplot(2,2,2);
plot(sig2);
title('Triangular Signal');
ylabel('Amplitude--->');
xlabel('Time---->');


%display both sampled signal
subplot(2,2,3);
stem(sig1);
title('Sampled Sinusoidal Signal');
ylabel('Amplitude--->');
xlabel('Time---->');
subplot(2,2,4);
stem(sig2);
title('Sampled Triangular Signal');
ylabel('Amplitude--->');
xlabel('Time---->');
l1=length(sig1);
l2=length(sig2);

for i=1:l1
  sig(1,i)=sig1(i);   % making both row vector to a matriz
  sig(2,i)=sig2(i);
end;


%TDM of both quantize signal
tdmsig=reshape(sig,1,2*l1);

% display tdm signal
figure(3);
stem(tdmsig);
title('TDM Signal');
ylabel('Amplitude--->');
xlabel('Time---->');

%demultiplexing of tdm signal
demux=reshape(tdmsig,2,l1);
for i=1:l1
  sig3(i)=demux(1,i);   % converting the matriz into row vectores
  sig4(i)=demux(2,i);
end

% display demultiplexed signal

figure(4);
subplot(2,1,1)
plot(sig3);
title('Recovered Sinusoidal Signal');
ylabel('Amplitude--->');
xlabel('Time---->');

subplot(2,1,2)
plot(sig4);
title('Recovered Triangular Signal');
ylabel('Amplitude--->');
xlabel('Time---->');