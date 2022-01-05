function [f, X] = fourier_u(x, fs)

%{
Calcula a fft de um sinal, normaliza e retorna somente
a parte positiva da frequência
%}

    % Calcular a fft:
    X = fft(x);

    % Fazer um shift da fft:
    n = length(x);
    f = (-n/2:n/2-1)*(fs/n);
    X = fftshift(X);

    % Remover ruido
    tol=1e-6;
    X(abs(X) < tol) = 0;
    
    % A amplitude fica multiplicada por (tamanho do X)/2
    % Dividir por (tamanho do X)
    X = X/length(X);
    
    % Separar apenas as partes positivas:
    f = f(ceil(length(f)/2)+1:end);
    X = X(ceil(length(X)/2)+1:end);
    
end