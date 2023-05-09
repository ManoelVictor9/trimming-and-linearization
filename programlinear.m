function [MA, MB]= progrmalinear (result, x3)


P = 10^-6;

x1 = result(1);
x2 = result(2);
u1 = result(3);
u2 = result(4);
x1p = x1+P;
x2p = x2+P;
x3p = x3+P;
u1p = u1+P;
u2p = u2+P;

[x1dot x2dot x3dot] = fa (x1, x2, x3, u1, u2)
[x1dotx1, x2dotx1, x3dotx1] = fa(x1p, x2, x3, u1, u2)
[x1dotx2, x2dotx2, x3dotx2] = fa(x1, x2p, x3, u1, u2)
[x1dotx3, x2dotx3, x3dotx3] = fa(x1, x2, x3p, u1, u2)
[x1dotu1, x2dotu1, x3dotu1] = fa(x1, x2, x3, u1p, u2)
[x1dotu2, x2dotu2, x3dotu2] = fa(x1, x2, x3, u1, u2p)

v1 = [x1 x2 x3];
v2 = [x1dot x2dot x3dot];
v3 = [x1p x2p x3p];
v4 = [x1dotx1 x2dotx1 x3dotx1;
     x1dotx2 x2dotx2 x3dotx2;
     x1dotx3 x2dotx3 x3dotx3] 
v5 = [x1dotu1 x2dotu1 x3dotu1;
     x1dotu2 x2dotu2 x3dotu2];
v6 = [u1p u2p];
v7 = [u1 u2];

MA = zeros(3,3);

for i = 1:3
    for j = 1:3
        MA(i,j) = (v4(j,i) - v2(i))/(v3(j) - v1(j));
    end
end

MB = zeros(3,2);
%Linha quantidade de estado, coluna quantidade de controle

for i = 1:3
    for j = 1:2
        MB(i,j) = (v5(j,i) - v2(i))/(v6(j) - v7(j));
    end
end


end