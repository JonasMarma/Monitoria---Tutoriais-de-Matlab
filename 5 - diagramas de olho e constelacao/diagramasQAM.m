clear all;
clc;

sps = 1;

M = 16;
%x = (0:M-1)';
x = randi([0 M-1],1000,1);

y = qammod(x,16);
scatterplot(y)
eyediagram(y,2*sps)

%out = awgn(in,snr)
y = awgn(y,15);

scatterplot(y)
eyediagram(y,2*sps)

