corrente =[ 1 1 1 1];
corrente_2 =[2 2 2 2];
v_tacometro = [3 3 3 3]
h = 1
mat_exemplo = [corrente.' corrente_2.']
%-------Dados com k_barra--------%
k_barra = 1.3174;
kt = 0.0154/0.10467;
kg = kt/k_barra;

%% Parametros do motor R, La, J,f
%% Matriz eletrica e mecânica
ia_sem_primento = corrente(2:end)' %vetor corrente sem o primeiro elemento
me = [corrente(1:end-1).' (-kg/kt)*v_tacometro(1:end-1).'] %matriz
xe = (me'*me)^-1*me'*corrente
%mecanica --- semelhante ao eletrico
vt1 = v_tacometro(2:end)';
mm = [vt1(1:end-1).' (ka*kt)*corrente(1:end-1)'];
xm = (mm'*mm)^-1*mm'*v_tacometro;
%% Ra, La,f,J
ra = (1-xe(1))/xe(2)
la = - (ra*h)/log(xe(1))
f = (1-xm(1))/xm(2)
inercia = -f*h/(log(xm(2)))
