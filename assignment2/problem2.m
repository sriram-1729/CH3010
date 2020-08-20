t = [0, 8, 18];
C_a = [1, 0.2, 0.1];

p1 = polyfit(t, C_a, 1);
x = 0:0.1:20;
y1 = polyval(p1, x);
figure;
plot(t, C_a, '*', x, y1);

ln_C = log(C_a(1)./C_a);
p2 = polyfit(t, ln_C, 1);
y2 = polyval(p2, x);
figure;
plot(t, ln_C, '*', x, y2);

C_a_inv = 1./C_a - 1./C_a(1);
p3 = polyfit(t, C_a_inv, 1);
y3 = polyval(p3, x);
figure;
plot(t, C_a_inv, '*', x, y3);
hold on;
title('1/C_{A} vs t');
xlabel('t (min)');
ylabel('1/C_{A} (l/mol)');
legend('Data points', '1/C_{A}-1/C_{A0} = 0.5t');