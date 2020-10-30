x = 400:400:1600;
y = [15 20 21 21; 31 59 62 61; 75 102 105 106; 152 205 208 207];

plot(x, y(1, :), x, y(2, :), x, y(3, :), x, y(4, :));
hold on;
legend('1.2 atm', '1.6 atm', '2 atm', '3 atm');
title('Rate of uptake of O_{2} vs Stirrer speed');
xlabel('Stirrer speed (rpm)');
ylabel('Rate of uptake of O_{2} (mL/hr)');
hold off;

ln_v0 = log(y(:, 4))';
P_O2 = [1.2 1.6 2 3];
ln_P_O2 = log(P_O2);

p = polyfit(ln_P_O2, ln_v0, 1);
xx = ln_P_O2(1):0.1:ln_P_O2(4);
yy = polyval(p, xx);

figure;
plot(ln_P_O2, ln_v0, '*', xx, yy);
hold on;
legend('Given data', 'Fitted curve', 'Location', 'northwest');
title('ln(v0) vs ln(P_{O_{2}})');
xlabel('ln(P_{O_{2}})');
ylabel('ln(v0)');
hold off;

n = p(1);