X = [0, 0.2, 0.4, 0.45, 0.5, 0.6, 0.8, 0.9];
negative_r_a = [1.0, 1.67, 5, 5, 5, 5, 1.25, 0.91];

F_A0 = 300;

Y = F_A0./negative_r_a;
p = polyfit(X, Y, 5);
x1 = 0:0.01:0.9;
y1 = polyval(p, x1);

plot(X, Y, '*', x1, y1);

p1 = polyint(p);
a = 0.4;
V = @(b) diff(polyval(p1,[a b]))-72;

x = fzero(V,0.9);
