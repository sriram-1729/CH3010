negative_r_b = [4.9e-4 1.1e-4 2.4e-3 2.2e-2 1.18e-1 1.82e-2]';
C_b = [0.2 0.02 0.05 0.08 0.1 0.06];
T = 700:50:950;
R = 8.314;

X = [C_b; T]';

model = @(b, X) b(1).*(exp(-b(2)./(R.*X(:,2)))).*(X(:,1).^2);
beta0 = [1e10; 1e5];

beta = nlinfit(X, negative_r_b, model, beta0);
