p_A = 8.314e-3.*[-5.561e-6 19.225e-3 1.131];
p_C = 8.314e-3.*[-4.392e-6 14.394e-3 1.424];
p_D = 8.314e-3.*[0 0.422e-3 3.249];
T = [298 500];

q_A = polyint(p_A);
q_C = polyint(p_C);
q_D = polyint(p_D);

meanC_pA = diff(polyval(q_A, T))/(T(2)-T(1));
meanC_pC = diff(polyval(q_C, T))/(T(2)-T(1));
meanC_pD = diff(polyval(q_D, T))/(T(2)-T(1));

h_A = -84.68;
h_C = 52.26;
h_D = 0;
T1 = 298:500;

heat_of_reaction = (h_C-h_A)+(meanC_pC+meanC_pD-meanC_pA).*(T1-T1(1));
heat_variance = var(heat_of_reaction);