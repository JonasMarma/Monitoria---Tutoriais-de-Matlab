function H = PassaBaixa(f, f_c)

    %{
    Retorna a função de transferência de um filtro passa-baixas passivo
    f_c é a frequência de corte do filtro
    f é o vetor de frequências, em Hertz
    %}

    % Constante de tempo do circuito
    RC = 1/(2*pi*f_c);

    % Eixo de frequência em radianos
    w = 2*pi*f;

    % Vetor da função de transferência do filtro (em valores complexos)
    H = w;

    % Aplicar a fórmula da função de transferência para cada valor de H
    for i = 1 : length(H)
        % Obter os valores complexos do filtro
        H(i) = 1/(1 + 1i*w(i)*RC);
    end
    
end