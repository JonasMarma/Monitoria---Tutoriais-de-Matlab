% Frequência de amostragem
fs = 2000;

% Frequência da portadora
fc = 500;

t = (0:1/fs:0.2)';

% Sinal de mensagem.
x = sin(2*pi*30*t) + 2*sin(2*pi*60*t);

% Desvio de frequência.
fDev = 50;

% Usar a função do communications toolbox.
y = fmmod(x, fc, fs, fDev);

figure(1)
plot(t, x, 'r')
hold on
plot(t, y, 'b')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend('Original','Modulado')


