p = [160 -160 60];
p1 = polyint(p);

fun = @(a) polyval(p,a)*a - diff(polyval(p1,[a 0.8]));

x = fzero(fun, 0.4);

total_catalyst = 2*polyval(p,x)*x;

CSTR_80_percent_weight = polyval(p,0.8)*0.8;
CSTR_40_percent_weight = polyval(p,0.4)*0.4;
PBR_80_percent_weight = diff(polyval(p1, [0 0.8]));
PBR_40_percent_weight = diff(polyval(p1, [0 0.4]));