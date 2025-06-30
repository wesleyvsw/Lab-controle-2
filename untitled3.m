% Ler os quatro arquivos
d1 = readtable('RP03.csv');
d2 = readtable('RP04.csv');
d3 = readtable('RP05.csv');
d4 = readtable('RP06.csv');

% Iniciar o gráfico
figure;
plot(d1.inS, d1.C1InV, 'r-', 'LineWidth', 1.5); hold on;
plot(d2.inS, d2.C2InV, 'b--', 'LineWidth', 1.5);
plot(d3.inS, d3.C3InV, 'g-.', 'LineWidth', 1.5);
plot(d4.inS, d4.C4InV, 'k:', 'LineWidth', 1.5);

%Rótulos e legendas
xlabel('Tempo (s)');
ylabel('Tensão (V)');
title('Comparação de 4 sinais');
legend('Sinal 1', 'Sinal 2', 'Sinal 3', 'Sinal 4');
grid on;


% Ler os quatro arquivos
d1 = readtable('RP07.csv');
d2 = readtable('RP08.csv');
d3 = readtable('RP09.csv');
d4 = readtable('RP10.csv');

% Iniciar o gráfico
figure;
%plot(d1.inS, d1.C1InV, 'r-', 'LineWidth', 1.5); hold on;
%plot(d2.inS, d2.C2InV, 'b--', 'LineWidth', 1.5);
plot(d3.inS, d3.C3InV, 'g-.', 'LineWidth', 1.5); hold on
plot(d4.inS, d4.C4InV, 'k:', 'LineWidth', 1.5);

%Rótulos e legendas
xlabel('Tempo (s)');
ylabel('Tensão (V)');
title('Comparação de 4 sinais');
legend('Sinal 1', 'Sinal 2', 'Sinal 3', 'Sinal 4');
grid on;

tempo_armadura = d3.inS;
tensao_armadura = d3.C3InV;
% Vetores de entrada
% Definir os limites do intervalo de tempo
limite_inferior = 0.1144;
limite_superior = 1.3298;

% Encontrar os índices mais próximos aos limites
[~, idx_inicio] = min(abs(tempo_armadura - limite_inferior));
[~, idx_fim] = min(abs(tempo_armadura - limite_superior));

% Garantir que o índice inicial venha antes do final
if idx_inicio > idx_fim
    temp = idx_inicio;
    idx_inicio = idx_fim;
    idx_fim = temp;
end

% Cortar os vetores no intervalo desejado
tempo_cortado = tempo_armadura(idx_inicio:idx_fim);
tensao_cortada = tensao_armadura(idx_inicio:idx_fim);

% Calcular a média da tensão nesse intervalo
media_tensao_min = mean(tensao_cortada);


% Novos limites do intervalo de tempo
limite_inferior = -0.46;
limite_superior = 0.06;

% Encontrar os índices mais próximos aos limites
[~, idx_inicio] = min(abs(tempo_armadura - limite_inferior));
[~, idx_fim] = min(abs(tempo_armadura - limite_superior));

% Garantir que idx_inicio venha antes de idx_fim
if idx_inicio > idx_fim
    temp = idx_inicio;
    idx_inicio = idx_fim;
    idx_fim = temp;
end

% Cortar os vetores no intervalo desejado
tempo_cortado = tempo_armadura(idx_inicio:idx_fim);
tensao_cortada = tensao_armadura(idx_inicio:idx_fim);

% Calcular a média da tensão nesse intervalo
media_tensao_max = mean(tensao_cortada);

%--------------------------Agora, dados tacometro-----------------------------%
%refazando a mesma coisa e declarando as variaveis do tacometro
tempo_tacometro = d4.inS;
tensao_tacometro = d4.C4InV;


% Limites do intervalo
limite_inferior = 0.748;
limite_superior = 1.3432;

% Encontrar os índices mais próximos aos limites
[~, idx_inicio] = min(abs(tempo_tacometro - limite_inferior));
[~, idx_fim] = min(abs(tempo_tacometro - limite_superior));

% Garantir que idx_inicio < idx_fim
if idx_inicio > idx_fim
    temp = idx_inicio;
    idx_inicio = idx_fim;
    idx_fim = temp;
end

% Cortar os vetores
tempo_cortado = tempo_tacometro(idx_inicio:idx_fim);
tensao_cortada = tensao_tacometro(idx_inicio:idx_fim);

% Calcular a média da tensão
tacometro_inf = mean(tensao_cortada);


% Limites do intervalo
limite_inferior = 2.04;
limite_superior = 2.59;

% Encontrar os índices mais próximos aos limites
[~, idx_inicio] = min(abs(tempo_tacometro - limite_inferior));
[~, idx_fim] = min(abs(tempo_tacometro - limite_superior));

% Garantir que idx_inicio < idx_fim
if idx_inicio > idx_fim
    temp = idx_inicio;
    idx_inicio = idx_fim;
    idx_fim = temp;
end

% Cortar os vetores
tempo_cortado = tempo_tacometro(idx_inicio:idx_fim);
tensao_cortada = tensao_tacometro(idx_inicio:idx_fim);

% Calcular a média da tensão
tacometro_sup = mean(tensao_cortada);

%Encontrei os offsets. Agora vou Reescrever meu grafico
tensao_armadura = tensao_armadura - 3.1957;
tensao_tacometro = tensao_tacometro - 1.7883

figure;
%plot(d1.inS, d1.C1InV, 'r-', 'LineWidth', 1.5); hold on;
%plot(d2.inS, d2.C2InV, 'b--', 'LineWidth', 1.5);
plot(tempo_armadura, tensao_armadura, 'g-.', 'LineWidth', 1.5); hold on
plot(tempo_tacometro, tensao_tacometro, 'k:', 'LineWidth', 1.5);

%Rótulos e legendas
xlabel('Tempo (s)');
ylabel('Tensão (V)');
title('Comparação de 4 sinais');
legend('Sinal 1', 'Sinal 2', 'Sinal 3', 'Sinal 4');
grid on;


%%%%Encontrando k_barra = yss/A
amplitude = media_tensao_max - media_tensao_min;
yss = tacometro_sup - tacometro_inf;
k_barra =yss/amplitude
