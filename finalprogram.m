function final = finalprogram (x0, x3)

x1 = x0(1);
x2 = x0(2);
u1 = x0(3);
u2 = x0(4);

%tirado do modelo real já definido

rs = 1.3;
ld = 0.0009;
lq = 0.0009;
b = 0.01;
j = 0.1;
lmbdm = 0.14;
n = 18;


%derivadas 
x1dot = (-rs/ld)*x1+(n*(lq/ld))*x2*x3+((1/ld)*u1); %derivada da corrente
x2dot = (-n*(ld/lq))*x1*x3-(rs/lq)*x2+(1/lq)*u2 ;  %derivada da 
x3dot = (3*n/(2*j))*(ld-lq)*x1*x2+(3*n/(2*j))*lmbdm*x2-(b/j)*x3;

final = x1dot^2 + x2dot^2 + x3dot^2;

end