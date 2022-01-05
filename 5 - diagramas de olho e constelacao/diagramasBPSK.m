clear all;
clc;

%% Sinal BPSK (Binary Phase-Shift Keying)

% Gerar uma sequência aleatória de 0 e 1
% randi(vetor_de_valores_possíveis, linhas, colunas)
x = randi([0 1],1000,1);

% Fazer a modulação PSK da sequência de símbolos
% pskmod(seq_simbolos, num_simbolos_possiveis)
y = pskmod(x,2);

% Plotar os sinais gerados (vetorialmente) - Diagrama de constelação
scatterplot(y)
% Plotar o diagrama de olho
eyediagram(y,2)

%% Análise do sinal BPSK depois de passar um canal com ruído AWGN

%out = awgn(in,snr)

% Relação sinal-ruído em dB
snr = 15;
% Simulação da passagem pelo canal ruidoso
y = awgn(y,15);

% Diagrama de constelação com ruído
scatterplot(y)
% Diagrama de olho com ruído
eyediagram(y,2)


