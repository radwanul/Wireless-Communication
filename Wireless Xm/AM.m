close all;
clc;
% AM Wave
t=0:.0001:.1;
a=2;
fm=50;
fc=1000;
m=0.9;
m1=sin(2*pi*fm*t);
c1=sin(2*pi*fc*t);
am=a*(1+m*m1).*c1;
figure

% Message Signal
subplot(3,1,1)
plot(t,m1);
xlabel('time')
ylabel('m1');
title('Information signal');

% Carrier Signal
subplot(3,1,2)
plot(t,c1);
xlabel('time')
ylabel('c1');
title('Carrier Signal');

% AM Wave
subplot(3,1,3)
plot(t,am);
xlabel('time')
ylabel('AM');
