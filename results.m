
x0 = zeros(1,4); %valores iniciais que o fmincon irá começar a chutar
x3 = 20; % velocidade em rad que foi definido por mim

%  -10 limitação física de corrente e -40 tensões máximas
 lb = [ -10 -10 -48 -48];
 ub = [ 10 10 48 48];

%  Teste com limite superior e inferior = 0 para fazer o teste no mundo
%  real
% lb = [ 0 -10 -48 -48];
% ub = [ 0 10 48 48];


% "@" função anonima para ter uma característica de função matemática
result = fmincon(@(x0)finalprogram(x0,x3),x0,[],[],[],[],lb,ub)

% testando os valores dos results
% 
x1 = result(1);
x2 = result(2);
u1 = result(3);
u2 = result(4);

rs = 1.3;
ld = 0.0009;
lq = 0.0009;
b = 0.01;
j = 0.1;
lmbdm = 0.14;
n = 18;

x1dot = (-rs/ld)*x1+(n*(lq/ld))*x2*x3+((1/ld)*u1)
x2dot = (-n*(ld/lq))*x1*x3-(rs/lq)*x2+(1/lq)*u2 
x3dot = (3*n/(2*j))*(ld-lq)*x1*x2+(3*n/(2*j))*lmbdm*x2-(b/j)*x3



%valores a ser adicionados no simulink
MC = eye(3);
MD = zeros(3,2);
U1O = u1;
U2O = u2;