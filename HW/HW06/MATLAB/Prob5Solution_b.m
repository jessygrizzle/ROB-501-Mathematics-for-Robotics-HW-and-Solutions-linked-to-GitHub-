clear
clc

load DataHW06_Prob5

tic

n = 7;

A = [];
Y = [];
for k = 1 : N
    A = [A; C{k}];
    Y = [Y; y{k}];
    
    if (k >= n)
        x_hat{k} = inv(A' * A) * A' * Y;
        E(k) = norm(x_hat{k} - x_actual{k});
    end
end

t = toc;

figure
hold on
plot((n:N), E(n:N), 'r');
title(sprintf('Norm error of x using batch (Time = %.4f s)', t));
ylabel('Norm error');
xlabel('Iteration No.');

print Prob5(b) -dpng
