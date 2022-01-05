%% COMENTÁRIOS

% comentário de uma linha

%{
Comentário de múltiplas linhas
aaaaaaaaaaa
aaaaaaaaa
aaaaaaa
aaaaaaaa
%}

%% VARIÁVEIS

% Variáveis aparecem na janela do Workspace!!!

% chars
c1 = 'A'

% class() mostra o tipo de variável
class(c1)

% Strings
s1 = 'A string'
class(s1)

% Booleanos
5 > 2
b1 = true

% Pulando linhas e o uso do ;
v1 = 1 + 2 + 3 ...
+ 4;

%% ----- CONVERSÃO DE VALORES -----
% Everything defaults to double
v2 = 8
class(v2)

% Cast to int8
v3 = int8(v2)
class(v3)

% Convert char to double
v4 = double('A')

% Convert to char
v5 = char(64)

%% ----- FORMATANDO SAÍDAS -----

% sprintf é usado para formatar string
%d : Integers
%f : Floats
%e : exponential notation
%c : Characters, %s : Strings

fprintf('5 + 4 = %d\n', 5 + 4)
fprintf('5 - 4 = %d\n', 5 - 4)
fprintf('5 * 4 = %d\n', 5 * 4)

% Define you want only 2 decimals
fprintf('5 / 4 = %0.2f\n', 5 / 4)

disp('Qual a diferença no disp?')

%% ----- FUNÇÕES MATEMÁTICAS -----

% Potenciação
fprintf('5^4 = %d\n', 5^4) 

% Resto da divisão
fprintf('5 %% 4 = %d\n', mod(5,4))

% Número aleatório
randi([10,20])

% Módulo
fprintf('abs(-1) = %d\n', abs(-1))
abs(8j + 3)

% Floor
fprintf('floor(2.45) = %d\n', floor(2.45))

% Ceil
fprintf('ceil(2.45) = %d\n', ceil(2.45))

% Arredondar
fprintf('round(2.45) = %d\n', round(2.45))

% Exponencial e^x
fprintf('exp(1) = %f\n', exp(1))

% Logaritmo natural
fprintf('log(100) = %f\n', log(100))

% Log base 10
fprintf('log10(100) = %f\n', log10(100))

% Log base 2
fprintf('log2(100) = %f\n', log2(100))

% Raiz quadrada
fprintf('sqrt(100) = %f\n', sqrt(100))

% Graus e radianos
fprintf('90° = %f radianos.\n', deg2rad(90))
fprintf('pi radianos = %f° .\n', rad2deg(pi))





PAROU AQUI!!!! LOGO APÓS O VÍDEO DE OPERAÇÕES BÁSICAS
MOSTRAR AGORA OPERAÇÕES BÁSICAS COM NÚMEROS COMPLEXOS!!!
DEPOIS IR PARA AS CONDICIONAIS...





%% ----- CONDICIONAIS -----

%{
Maior               >
Menor               <
Maior ou igual      >=
Menor ou igual      <=
Igual               =
Diferente           ~=
OU                  ||
E                   &&
NÃO                 ~
%}

temperatura = 15

if temperatura < 18
    disp("Hoje está frio")
elseif temperatura >= 18 && temperatura <= 25
    disp("Hoje está agradável")
else
    disp("Hoje está quente")
end


true || false
~true

% Switch is used when you have a limited number of 

switch age
    case 5
        disp("Go to Kindergarten")
    case num2cell(6:13)
        disp("Go to Middle School")
    case {14,15,16,17,18}
        disp("Go to High School")
    otherwise
        disp("Stay Home")
end

%% VETORES

% Vectors are either row or column vectors or 
% 1 dimensional arrays

A = [2 7 1 3 1 4]

% índices no MATLAB começam em 1
A(1)

% Mudando valores
A(3) = 12

% último valor
A_fim = A(end)

% Adicionar valores fora do índice insere zeros
A(11) = 33

% Selecionar uma parte do vetor
A(3:8)

% Selecionar vários índices do vetor
vt4([2 4 6])

% Tamanho de vetores
tam = length(A)

% Ordenar vetores
A_ordenado = sort(A)

% Criando ranges
vet_0a500 = 10:500

% Range "pulando"
B = 0:2:20

% Concatenando
X = [12 58 89]
Y = [1 2 9 7]
Z = [X Y]

% Vetor coluna
VC = [2;3;4]
% Vetor linha
VL = [1 2 3]

% Multiplicação de vetores
VM = VC * VL

% Produto escalar
VP = dot(VC, VL)

% Produto vetorial
vtCross = cross(VC, VL)

% Vetor de 1 a 20 com 100 divisões
vt8 = linspace(1,20,100)

% Logarithmically spaced vector 10^1, 10^2, 10^3
vt9 = logspace(1,3,3)

%% MATRIZES
% Usar o ; para delimitar linhas de uma matriz
M = [2 3 4; 4 6 8]

M = [1 2 3 4;
     5 6 7 8;
     4 8 5 3];

% Obter o número de linhas e colunas.
[nLin, nCol] = size(M)

% Obter valores da matriz
M(2,2)

% Selecionar linha
M(1,:)

% Slecionar coluna
M(:,1)

% Mudar valores
M(2,2) = 2
M(:,1) = 0

% Matriz de zeros
M = zeros([5 6])

m3 = [2 3 4; 4 6 8; 8 12 16; 16 24 32]

% You can added, subtract, etc. matrice
m4 = [1:3; 4:6]
m5 = [2:4; 5:7]

m4 + m5
m4 .* m5

% Functions perform operations on each value
sqrt(m3)
m3 = m3 * 2

% Sum adds all the columns
sum(m3)

% Matrix Multiplication
% Columns of m6 must equal rows in m7
m6 = [1 2 3;
      4 5 6]

m7 = [1 1 1 1;
      2 2 2 2;
      3 3 3 3]

% m8(1,1) = (1*1) + (2*2) + (3*3) = 14
m8 = m6 * m7

% Rotate 90 degrees
rot90(m3)

% Rotate 180 degrees
rot90(m3,2)

% Convert into a 2 x 6 matrix
reshape(m3, 2, 6)

%% ----- LOOPS -----

% For incrementando
for i = 1:10
    disp(i)
end

% For decrementando
for i=10 : -1 : 0
    disp(i)
end

% For em vetor
A = [6 7 8 5 9 4];

for i=1 : length(A)
    disp(A(i))
end

% For em matriz
M = [1 2 3 4;
     5 6 7 8;
     4 8 5 3];

[nLin, nCol] = size(M);
 
for i=1 : nLin
    for j = 1:nCol
        disp(M(i,j))
    end
end

% While loop
i = 1
 
% Print out only evens
while i < 20
    if (mod(i,2)) == 0
        disp(i)
        
        % MatLab doesn't have ++, +=
        i = i + 1;
        
        % Skip back to the top of the loop
        continue 
    end
 
    i = i + 1;
 
    if i >= 10
        
        % Leave the loop
        break 
    end
end


%% GRÁFICOS

% Criar um vetor de tempo de 0s até 1s com 100 divisões
t = linspace(0, 1, 100);

tensao = 5*cos(t)

% Creates window labeled figure 1 with plot
figure(1)

% Colors : blue(b), black(k), cyan(c), green(g), 
% magenta(m), red(r), yellow(y), white(w)
% Plot Symbols : . o x + * s d v ^ < > p h
% Line Types : -, :, -., - -

% Green dotted line with + at points 2 line width
plot(xVals, yVals, 'g+:','LineWidth',2)

% Desenhar sobre o gráfico anterior
hold on

% Draw black stars on points
scatter(xVals, yVals2, 'k*')

% Defines look of each plot
legend('yVals', 'yVals2')

% Ativar a grade
grid on

% Eixos e título
xlabel('Days')
ylabel('Money')
title('Gráfico bem feito')

% Creates window labeled figure 2 with bar chart
figure(2)
bar(xVals, yVals, 'r')


%% FUNÇÕES












%% ARQUIVOS
% Generate a random 8x8 matrix between 10 & 50
randM = randi([10,50], 8)

% Save the file as a text file and overwrite
save sampdata.dat randM -ascii

% Read the data into a matrix with the same name as
% the data file
load sampdata.dat
disp(sampdata)

% Display file data
type sampdata.dat

% Saving variables to a file
% save yourfile (saves every variable)
save myData

% Read file
load myData
who

% Append data
v4 = 123
save -append myData v4


