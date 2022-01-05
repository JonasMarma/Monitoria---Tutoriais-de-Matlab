clear all;
clc;

%% Criação do vetor de tempo:

% Quanto maior a duração, mais bem definida da fft

% Frequência de amostragem
fs = 10000;
% Período entre amostras
Ts = 1/fs;
% Criação do vetor de tempo, indo de 0 a 10 segundos, com amostras a cada
% Ts segundos
t = 0:Ts:10;

%% Criação da onda portadora:

% Amplitude da portadora
Ac = 1;
% Frequência da portadora
fc = 1000;
% Criação do sinal da portadora
c = Ac * cos(2*pi*fc*t);

%% Criação do sinal de mensagem

% Amplitude do sinal de mensagem
Am = 1;
% Frequência do sinal de mensagem
fm = 10;
% Criação do sinal de mensagem
m = Am * cos(2*pi*fm*t);

%% Sinal modulado:

k = 0.5;
s = (1 + k*m).*c;
%{
Observe a utilização do .* !!!
O .* está sendo utilizado para fazer a multiplicação "elemento a elento":
[1 2 3] .* [4 5 6] = [1*4 2*5 3*6]

Caso fosse utilizado somente o *, seria feita uma multiplicação de
matrizes, o que nem mesmo é possível para este caso.
%}

figure(1)

%{
Utilizando, por exemplo, t(1:3000) em vez de t, estou plotando apenas os
primeiros 3000 valores do vetor t.

Estou fazendo isso somente para deixar o gráfico mais fácil de visualizar.
(caso o 1:3000 seja removido, todo o vetor é plotado e precisamos dar zoom
para entender o que está acontecendo)
%}

subplot(3,1,1)
plot(t(1:3000), m(1:3000))
title("Sinal de Mensagem")

subplot(3,1,2)
plot(t(1:3000), c(1:3000))
title("Onda Portadora")

subplot(3,1,3)
plot(t(1:3000), s(1:3000))
title("Sinal de Mensagem Modulado")

%% Transformadas de Fourier

% Sinal de mensagem:
[f, M] = fourier(m, fs);

% Onda portadora:
[f, C] = fourier(c, fs);

% Sinal modulado:
[f, S] = fourier(s, fs);

%{
Observe a utilização da função de números complexos "abs", que é utilizada
para obter o módulo dos números complexos retornados pela função que
calcula a transformada de Fourier.
%}

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

%% Demodulação

% Passagem do sinal modulado por um diodo (cortar valores negativos)
s_d = max(s,0);

% Transformada de Fourier
[f, S_D] = fourier(s_d, fs);

%{
observa-se no espectro que aparece novamente em 10Hz o sinal de mensagem
original! Então basta agora projetar um filtro passa-baixas para filtrar
somente as baixas frequências do sinal de mensagem
%}
figure(3)
subplot(2,1,1)
plot(t(1:2000), s_d(1:2000))
title('Sinal após a passagem por um diodo')

subplot(2,1,2)
plot(f, abs(S_D))
title('Espectro do sinal após o diodo')

%% Projeto do Filtro
% Frequência de corte do filtro em 20 Hz
f_c = 20;

% Vetor da função de transferência do filtro (em valores complexos)
H = PassaBaixa(f, f_c);

% Diagrama de Bode
H_amp = abs(H);
H_pha = angle(H);

figure(4)

subplot(2, 1, 1)
%Não foi utilizado loglog() para manter em dB
semilogx(f, 20*log10(H_amp), 'k')
xlabel('Frequência [Hz]')
ylabel('Magnitude [dB]')
xlim([0,100])
title('Diagrama de Bode do Filtro')
grid on

subplot(2, 1, 2)
%Aqui é feita a multiplicação por 180/pi para converter de rad para °
semilogx(f, H_pha*180/pi(), 'k')
xlabel('Frequência [Hz]')
ylabel('Fase [°]')
xlim([0,100])
grid on


%% Obtenção do sinal de saída do filtro
% Aplicação da convolução no tempo por multiplicação na frequência
saida_tf = S_D.*H;

[tSaida, saida] = inv_fourier(saida_tf, fs);

figure(5)

subplot(2,1,1)
plot(f, saida_tf)
xlabel('Frequência [Hz]')
title('Espectro de Amplitude do Sinal de Saída')

subplot(2,1,2)
plot(tSaida(1:3000), saida(1:3000))
xlabel('Tempo [s]')
title('Sinal de Saída')



