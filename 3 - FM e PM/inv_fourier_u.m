function [t, x] = inv_fourier_u(X_u, fs)

    % Flip no sinal de entrada unilateral
    X_flip = flip(X_u);
    
    % Complexo conjugado
    % Manter simetria par no módulo e ímpar na fase
    X_flip = conj(X_flip);
    
    % Espelhar o sinal
    X = [X_flip X_u];
    
    figure(10)
    plot(abs(X))
    
    figure(11)
    plot(angle(X))
    
    % Fazer a ifft
    x = ifft(X);
    
    t = 0;
end