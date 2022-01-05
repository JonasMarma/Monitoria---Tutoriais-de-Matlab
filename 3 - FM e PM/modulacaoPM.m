clear all;
clc;

%% Criação do vetor de tempo:
fs = 1000;
Ts = 1/fs;
% Quanto mais tempo deixa as ondas, mais bem definida da fft
t = 0:Ts:0.5;

%% Criação da onda portadora:
Ac = 1;
fc = 50;
c = Ac * cos(2*pi*fc*t);

%% Criação do sinal de mensagem
fm = 10;
m = cos(2*pi*fm*t);

%% Criação do sinal modulado PM:
kp = 2;

% Criação de um vetor para guardar todos os valores obtidos
% Esse vetor vai começar com todos os valores zerados (só para guardarmos
% um espaço na memória)
s_pm = zeros(1,length(t));

% Agora começamos a realmente preencher esse vetor aplicando a fórmula da
% modulação PM em cada passo no tempo
for i = 1:length(t)
    s_pm(i) = Ac * cos(2*pi*fc*t(i) + kp*m(i));
end


figure(1)

subplot(2,1,1)
plot(t,m)
xlabel('Tempo [s]')
title('Sinal de Mensagem m(t)')

subplot(2,1,2)
plot(t,s_pm)
xlabel('Tempo [s]')
title('Sinal Modulado s(t)')

%% Plot das Transformadas de Fourier

% TF do sinal de mensagem:
[f, M] = fourier_u(m, fs);

% TF da onda portadora
[f, C] = fourier_u(c, fs);

% TF do sinal modulado
[f, S] = fourier_u(s_pm, fs);

figure(2)
subplot(3,1,1)
plot(f, abs(M))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('M(f)')

subplot(3,1,2)
plot(f, abs(C))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('C(f)')

subplot(3,1,3)
plot(f, abs(S))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('S(f)')