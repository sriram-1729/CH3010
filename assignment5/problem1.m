T_0 = 300;
T_R = 298;
K = exp((24.79e3)/(8.314*T_R));
R = 8.314;
deltah = -200.66e3+110.53e3;
T = 300:50:500;
X = zeros(1,5);

for i = 1:5
   fun = @(x) K*exp(deltah*(1/T_R-1/T(i))/R) - x*(1-2*x/3)^2*T(i)^2/((1-x)*(2-2*x)^2*T_0^2);
    X(i) = fzero(fun, 0.2);
end
X(1) = [];
T(1) = [];
TT = 300:1:500;
p = [-(21*R/2)/deltah (21*R/2)*(T_0)/deltah];
XX = polyval(p, TT);

plot(T, X, TT, XX);
hold on;
legend('Curve obtained from equilibrium considerations', 'Curve obtained from energy balance');
title('Conversion vs Temperature(K)');
xlabel('T(K)');
ylabel('X');
hold off;