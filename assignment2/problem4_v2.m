negative_r_b = [4.9e-4 1.1e-4 2.4e-3 2.2e-2 1.18e-1 1.82e-2];
negative_r_b = negative_r_b';
C_b = [0.2 0.02 0.05 0.08 0.1 0.06];
T = 700:50:950;

X = [C_b; T];
X = X';

model = @(b, X) b(1).*(exp(-b(2)./(8.314.*X(:,2)))).*X(:,1).^b(3);
options = optimoptions('lsqcurvefit', 'MaxIterations', 4e3);
%beta0(1) = A, beta0(2) = Ea, beta0(3) = alpha
beta0 = [1e9; 1e5; 3];
lb = [];
ub = [];

beta = lsqcurvefit(model, beta0, X, negative_r_b, lb, ub, options);