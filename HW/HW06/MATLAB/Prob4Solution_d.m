clear
clc

load DataHW06_Prob4

n = 34;

% Let Qi be Q_inv for prev guess, and C be current value of C
% The following is a lamda function for using Matrix Inverse Lemma for
% Calculating the inverse
MIL_inv = @(Qi, C) Qi - Qi*C'*inv(eye(3, 3) + C*Qi*C')*C*Qi;

tic

A = [];
Y = [];
for k = 1 : N
    if (k <= N) % Needed for batch method
        A = [A; C{k}];
        Y = [Y; y{k}];
    end
    
    if (k == 1)
        Q = C{k}' * C{k};
    elseif (k <= n) % No need for Q when (k > n) because we'd be using MIL
        Q = Q + C{k}' * C{k};
    end
    
    if (k == n) % Using Batch during this method
        x_hat{k} = inv(A' * A) * A' * Y;
        E(k) = norm(x_hat{k} - x_actual{k});
        Q_inv = inv(Q);
    elseif (k > n) % Using RLS
        Q_inv = MIL_inv(Q_inv, C{k});
        x_hat{k} = x_hat{k - 1} + Q_inv * C{k}' * (y{k} - C{k} * x_hat{k - 1});
        E(k) = norm(x_hat{k} - x_actual{k});
    end
end

t = toc;

figure
hold on
plot((n:N), E(n:N), 'r');
title(sprintf('Norm error of x using RLS and Matrix Inversion Lemma (Time = %.4f s)', t));
ylabel('Norm error');
xlabel('Iteration No.');

print Prob4(d) -dpng
