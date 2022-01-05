clear all;
clc;

%% Criação do vetor de tempo:
fs = 10000;
Ts = 1/fs;
% Quanto mais tempo deixa as ondas, mais bem definida da fft
t = 0:Ts:10;

%% Criação da onda portadora:
Ac = 1;
fc = 500;
c = Ac * cos(2*pi*fc*t);

%% Criação do sinal de mensagem
fm = 10;
m = cos(2*pi*fm*t);

%% Criação do sinal modulado FM:
kf = 0.01;

% Integrar m_i
%{
A função cumtrapz calcula uma integral de forma numérica.
Precisamos de um sinal que representa a integral de m(t)

Específicamente, essa integral é calculada utilizando interpolação de
trapézios, mas isso é um assunto de cálculo numérico. Apenas vamos assumir
que esse método de integração dá um resultado "bom o suficiente".
%}
m_i = cumtrapz(m);


% Vamos agora calcular um valor de cada vez para o sinal modulado FM.
% Primeiro calculamos o coeficiente kp
kp = 2*pi*kf;

% Em seguida, vamos criar um vetor para guardar todos os valores obtidos
% Esse vetor vai começar com todos os valores zerados (só para guardarmos
% um espaço na memória)
s_fm = zeros(1,length(t));

% Agora começamos a realmente preencher esse vetor aplicando a fórmula da
% modulação FM em cada passo no tempo
for i = 1:length(t)
    s_fm(i) = Ac * cos(2*pi*fc*t(i) + kp*m_i(i));
end

figure(1)

subplot(2,1,1)
plot(t(1:3000), m(1:3000))
xlabel('Tempo [s]')
title('Sinal de Mensagem m(t)')

subplot(2,1,2)
plot(t(1:3000), s_fm(1:3000))
xlabel('Tempo [s]')
title('Sinal Modulado s(t)')


%% Plot das Transformadas de Fourier

% TF do sinal de mensagem:
[f, M] = fourier_u(m, fs);

% TF da onda portadora
[f, C] = fourier_u(c, fs);

% TF do sinal modulado
[f, S] = fourier_u(s_fm, fs);

figure(2)
subplot(3,1,1)
absM = abs(M);
plot(f(1:10000), absM(1:10000))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('M(f)')

subplot(3,1,2)
absC = abs(C);
plot(f(1:10000), absC(1:10000))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('C(f)')

subplot(3,1,3)
absS = abs(S);
plot(f(1:10000), absS(1:10000))
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('S(f)')
