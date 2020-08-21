t = [0, 8];
C_a = [0.5, 0.3335];

log_term = log(0.499*0.5./(1.499.*C_a-0.499*0.5));
x = 0:0.1:8;
p = polyfit(t, log_term, 1);
y = polyval(p, x);

plot(t, log_term, '*', x, y);
hold on;
title('ln($\frac{0.499C_{A0}}{1.499C_{A}-0.499C}$) vs t','interpreter','latex');
xlabel('t (min)');
ylabel('ln($\frac{0.499C_{A0}}{1.499C_{A}-0.499C}$)', 'interpreter','latex');
legend('Given data', 'ln($\frac{0.499C_{A0}}{1.499C_{A}-0.499C}$) = 0.086t', 'interpreter','latex');
hold off;