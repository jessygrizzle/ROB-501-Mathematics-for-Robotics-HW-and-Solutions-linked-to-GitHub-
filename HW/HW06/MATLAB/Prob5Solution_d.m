clear
clc

load DataHW06_Prob5

tic

n = 7;
lambda = 0.98;

A = [];
Y = [];
for k = 1 : N
    if (k == 1) % For the batch method when k == n
        R = eye(3);
    elseif (k <= n) % No need anymore when k > n (since we'd be using RLS)
        R = [lambda.*R , zeros(3*(k - 1), 3) ; zeros(3, 3*(k - 1)) , eye(3)];
    end
    
    if (k <= N) % Needed for batch method when k == n
        A = [A; C{k}];
        Y = [Y; y{k}];
    end
    
    if (k == 1)
        Q = C{k}' * C{k};
    else
        Q = lambda.*Q + C{k}' * C{k};
    end
    
    if (k == n)
        % Using Batch method initially
        x_hat{k} = inv(A' * R * A) * A' * R * Y;
        E(k) = norm(x_hat{k} - x_actual{k});
    elseif (k > n)
        % Using RLS
        x_hat{k} = x_hat{k - 1} + inv(Q) * C{k}' * (y{k} - C{k} * x_hat{k - 1});
        E(k) = norm(x_hat{k} - x_actual{k});
    end
end

t = toc;

figure
hold on
plot((n:N), E(n:N), 'r');
title(sprintf('Norm error of x using RLS and forgetting factor (Time = %.4f s)', t));
ylabel('Norm error');
xlabel('Iteration No.');

print Prob5(d) -dpng
