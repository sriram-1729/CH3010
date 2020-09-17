v_0 = 20;
P_0 = 10;
T_0 = 450;
C_pA = 40;
C_pB = 25;
C_pC = 15;
h_A = -70e3;
h_B = -50e3;
h_C = -40e3;
E = 31.4e3;
W = 50;
C_A0 = P_0/(0.0821*T_0);
delta_h = h_B+h_C-h_A;

p1 = [-C_pA/delta_h C_pA*T_0/delta_h];
p2 = [1/p1(1) -p1(2)/p1(1)];

x = 0:1e-2:1;
% area = zeros(1,100);
% for i=2:101
%     xx = 0:1e-2:x(i);
%     yy = v_0*C_A0.*polyval(p2, xx).*(1+xx)./((0.133.*exp(E*(1/T_0-1./(polyval(p2, xx)))./8.314)).*C_A0.*(1-xx).*T_0);
%     area(i-1) = trapz(xx, yy) - W;
%     if(abs(area(i-1)) < 1)
%         X = x(i);
%         area1 = area;
%     end
% end

syms x_c t x_l
fun(x_c, t) = v_0*(1+x_c)*t/((0.133*exp(E*(1/T_0-1/t)/8.314))*(1-x_c)*T_0);
F = int(fun, x_c, 0, x_l);
xx1 = 0.01:1e-2:0.99;
T1 = zeros(1,99);
for i = 1:99
    fun1 = @(t) -(20*t*exp(15700000/(4157*t) - 314000/37413)*(20*xx1(i) + 40*log(1 - xx1(i))))/1197 - W;
    T1(i) = fzero(fun1, T_0);
end

fun2 = @roots;
x0 = [0.8,450];
x1 = fsolve(fun2, x0);

plot(polyval(p2, x), x, T1, xx1);
hold on;
legend('Curve obtained from energy balance', 'Curve obtained from design equation', 'Location', 'northwest');
title('Conversion vs Temperature')
xlabel('T(K)');
ylabel('X');
hold off;



function F = roots(x)
    F(1) = -(20*x(2)*exp(15700000/(4157*x(2)) - 314000/37413)*(20*x(1) + 40*log(1 - x(1))))/1197 - 50;
    F(2) = x(2)-500*x(1)-450;
end