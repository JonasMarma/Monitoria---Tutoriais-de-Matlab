clear all
clc

% Frequência de amostragem
fs = 2000;

% Vetor de tempo
t = (0:1/fs:1);

% Máximo e mínimo
smax =  2;
smin = -2;

% Ruído inicial
m = smin + (smax-smin)*rand(1,length(t));

figure(1)
plot(t, m)
title('Ruido inicial')

% Suavizando o sinal de ruído
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);
m = smoothdata(m);

figure(2)
plot(t, m)
title('Ruido suavizado')

save('sinal.mat', 'm', 'fs', 't');
