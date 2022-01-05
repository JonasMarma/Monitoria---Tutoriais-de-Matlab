clear all
clc

% carregar as variáveis s, t e fs
% s é o sinal de mensagem
% t é o vetor de tempo
% fs é a frequência de amostragem em que ele foi simulado
load sinal.mat

%% Ver o sinal de mensagem importado e su espectro

[f, M] = fourier(m, fs);

figure(1)
subplot(2,1,1)
plot(t, m)
xlabel('tempo (s)')
ylabel('Amplitude')
title('m(t)')

subplot(2,1,2)
plot(f, abs(M))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('M(f)')

%% Criando o trem de impulsos para samplear o sinal

% Frequência de amostragem do amostrador
FS = 100;

% Criação do trem de impulsos
d = 0 : 1/FS : 1;           
y = pulstran(t,d,@rectpuls,1e-5);

figure(2)
plot(t,y);
title('Trem de pulsos (onde são feitas as amostras)')

%% Amostrando o sinal de mensagem

% Para obter o sinal amostrado, basta fazer uma multiplicação.
% O trem de impulsos é uma sequência de 0 e 1
% Ao multiplicar os sinais elemento a elemento, temos como resultado um
% trem de impulsos em que cada impulso tem um valor proporcional
% ao sinal amostrado naquele momento

% Estamos fazendo algo como:
% [5 7 2 3 1 5 7 7 5 6]
% X
% [0 0 1 0 0 1 0 0 1 0]
% =
% [0 0 2 0 0 5 0 0 5 0]

m_s = m.*y;

%% Espectro do sinal amostrado

[f, M_s] = fourier(m_s, fs);

figure(3)
subplot(2,1,1)
plot(t, m_s)
xlabel('tempo (s)')
ylabel('Amplitude')
title('m(t)')

subplot(2,1,2)
plot(f, abs(M_s))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('M(f)')











