clc;
clear;
t=0:0.001:1;
Am=5;
Ac=5;
fm=3; % modulating signal
fc=50; %carrier signal
b=10; % frequency deviation
x=Am*sin(2*pi*fm*t); % modulating signal
y=Ac*cos(2*pi*fc*t); %carrier signal
z=Ac*(cos((2*pi*fc*t)+(b*sin(2*pi*fm*t))));
 
subplot(3, 1, 1);
plot(t, x);
xlabel('time(sec)')
ylabel('Amplitude(V)')
title('MODULATING SIGNAL')
 
subplot(3, 1, 2);
plot(t,y);
xlabel('time(sec)')
ylabel('Amplitude(V)')
title('CARRIER SIGNAL')
 
subplot(3, 1, 3);
plot(t, z);
xlabel('time(sec)')
ylabel('Amplitude(V)')
title('FREQUENCY MODULATED SIGNAL')
