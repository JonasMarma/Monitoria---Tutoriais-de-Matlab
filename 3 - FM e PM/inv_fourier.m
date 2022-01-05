function [t, x] = inv_fourier(X, fs)

    % A amplitude fica multiplicada por (tamanho do X)/2
    % Multiplicar por (tamanho do X)
    X = X*length(X);
    
    % Vetor de tempo
    %n = length(x);
    %f = (-n/2:n/2-1)*(fs/n);
    
    % Desfazer o shift da fft:
    X = fftshift(X);

    % Calcular a fft:
    x = ifft(X);
    
    % Construir o vetor de tempo
    T = 1/fs;
    t_final = T * length(X);
    
    t = 0:T:t_final;
    t = t(1:end-1);
    
end