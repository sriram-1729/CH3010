t = [0 2 4 6 8 10 12 14 10000]';
P_a = [760 600 475 390 320 275 240 215 150]';
P_a = P_a./P_a(1);
R = 0.0821;
T = 273.15;

C_a = P_a./(R*T);
C_r = (C_a(1)-C_a).*2.5;
K_c = (C_r(9)^2.5)/C_a(9);

dC_adt = zeros(8,1);
dC_adt(1) = (-3*C_a(1)+4*C_a(2)-C_a(3))/4;
for i=2:7
dC_adt(i) = (C_a(i+1)-C_a(i-1))/4;
end
dC_adt(8) = (C_a(6)-4*C_a(7)+3*C_a(8))/4;
t1 = [0 2 4 6 8 10 12 14];

X = [C_a(1:8,1) C_r(1:8,1)];
model = @(b, X) b(1)*(X(:,2).^2.5./K_c - X(:,1));
beta0 = 0.5;
beta = nlinfit(X, dC_adt, model, beta0);
