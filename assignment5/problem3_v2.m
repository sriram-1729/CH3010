tspan = 0:0.1:50;
y0 = 0;
[t, y] = ode45(@odefun, tspan, y0);

plot(t, y);
hold on;
title('Conversion vs weight of catalyst used');
xlabel('W(kg)');
ylabel('X');
hold off;


function dydt = odefun(t, y)
    v_0 = 20;
    P_0 = 10;
    T_0 = 450;
    E = 31.4e3;
    C_A0 = P_0/(0.0821*T_0);
    p = [500 450]; %Obtained from problem3.m
    
    dydt = ((0.133*exp(E*(1/450-1/(p(1)*y+p(2)))/8.314))*(C_A0*(1-y)*T_0/((1+y)*(p(1)*y+p(2)))))/(v_0*C_A0);
end