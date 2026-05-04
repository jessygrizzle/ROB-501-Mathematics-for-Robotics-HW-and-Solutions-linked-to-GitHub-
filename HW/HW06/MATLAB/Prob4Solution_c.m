clear
clc

load DataHW06_Prob4

tic

n = 34;

A = [];
Y = [];
for k = 1 : N
    if (k <= N) % Needed for batch method
        A = [A; C{k}];
        Y = [Y; y{k}];
    end
    
    if (k == 1)
        Q = C{k}' * C{k};
    else
        Q = Q + C{k}' * C{k};
    end
    
    if (k == n)
        % Using Batch during this iteration (since it is the initial one)
        x_hat{k} = inv(A' * A) * A' * Y;
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
title(sprintf('Norm error of x using RLS (Time = %.4f s)', t));
ylabel('Norm error');
xlabel('Iteration No.');

print Prob4(c) -dpng
