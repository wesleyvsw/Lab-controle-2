dados = readtable('RP04.CSV')
x = dados.inS;
dados = readtable('RP03.csv')
y = dados.inS;
%plot(x, y, 'b-', 'LineWidth', 2);  % Linha azul com espessura 2
%xlabel('inS');                    % Rótulo do eixo X
%ylabel('C1InV');                  % Rótulo do eixo Y
%title('Gráfico de C1InV vs inS'); % Título
%grid on; 
