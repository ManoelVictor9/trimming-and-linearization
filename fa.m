function [x1dot x2dot x3dot] = fa(x1, x2, x3, u1, u2) %sistema não linear rodando em script

rs = 1.3;
ld = 0.0009;
lq = 0.0009;
b = 0.01;
j = 0.1;
lmbdm = 0.14;
n = 18;


x1dot = (-rs/ld)*x1+(n*(lq/ld))*x2*x3+((1/ld)*u1);
x2dot = (-n*(ld/lq))*x1*x3-(rs/lq)*x2+(1/lq)*u2 ;
x3dot = (3*n/(2*j))*(ld-lq)*x1*x2+(3*n/(2*j))*lmbdm*x2-(b/j)*x3;

end