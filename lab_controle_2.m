dados = readtable('dados_motor_2.csv');
v_tacografo =dados.V_tacografo;
v_motor =dados.V_motor;
tempo = 0:0.01:v_motor(end)
%Descobrindo a região linear
%Para descobrir a região linear preciso fazer um fit para ajustar os dados.
%Criando um polyfit do quarto grau até o sexto grau:
gr4 = polyfit(v_motor,v_tacografo,4)
gr5 = polyfit(v_motor,v_tacografo,5)
gr6 = polyfit(v_motor,v_tacografo,6)
%Criando uma figura com os plots
figura1 = figure;
%Criando os subplots
% Subplot 1 (à esquerda)
subplot(1, 3, 1);
hold on
plot(v_motor, v_tacografo,'x','DisplayName','Dados coletados')
plot(tempo,polyval(gr4,tempo),'DisplayName','Polinomio Ajustado')
title('Mínimos quadrados grau 4')
xlabel('Vmotor'); ylabel('Vtacometro')
grid on
% Subplot 2 (no meio)
subplot(1, 3, 2);
hold on
plot(v_motor, v_tacografo,'+','DisplayName','Dados coletados')
plot(tempo,polyval(gr5,tempo),'DisplayName','Polinomio Ajustado')
title('Mínimos quadrados grau 5')
xlabel('Vmotor'); ylabel('Vtacometro')
grid on

% Subplot 3 (à direita)
subplot(1, 3, 3);
hold on
plot(v_motor, v_tacografo,'o','DisplayName','Dados coletados')
plot(tempo,polyval(gr6,tempo),'DisplayName','Polinomio Ajustado')
title('Mínimos quadrados grau 6')
xlabel('Vmotor'); ylabel('Vtacometro')

close(figura1)
%%%Encontrando a derivada para descobrir a região linear
grau_dgr4 = length(gr4)-1;
grau_dgr5 = length(gr5)-1;
grau_dgr6 = length(gr6)-1;
%Coeficientes das derivadas
coef_dgr4 = (grau_dgr4:-1:1).*gr4(1:grau_dgr4);
coef_dgr5 = (grau_dgr5:-1:1).*gr5(1:grau_dgr5);
coef_dgr6 = (grau_dgr6:-1:1).*gr6(1:grau_dgr6);
%---------------------------------------------------------
%---------------------------------------------------------

figura2 = figure;
hold on
% Subplot 1 (à esquerda)
subplot(1, 3, 1);
plot(tempo, polyval(coef_dgr4,tempo));
title('Derivada 1');
xlabel('Vmotor'); ylabel('dvtacometro');

% Subplot 2 (no meio)
subplot(1, 3, 2);
plot(tempo, polyval(coef_dgr5,tempo));
title('Derivada 2');
xlabel('Vmotor'); ylabel('dvtacometro');

% Subplot 3 (à direita)
subplot(1, 3, 3);
plot(tempo, polyval(coef_dgr6,tempo));
title('Derivada 3');
xlabel('Vmotor'); ylabel('dvtacometro');
grid on


