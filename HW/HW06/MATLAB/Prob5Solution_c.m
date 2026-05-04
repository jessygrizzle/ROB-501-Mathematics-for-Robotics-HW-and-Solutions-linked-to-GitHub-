clear
clc

load DataHW06_Prob5

tic

n = 7;
lambda = 0.98;

A = [];
Y = [];
for k = 1 : N
    if (k == 1)
        R = eye(3); % Initial R
    else
        R = [lambda.*R , zeros(3*(k - 1), 3) ; zeros(3, 3*(k - 1)) , eye(3)];
    end
    
    A = [A; C{k}];
    Y = [Y; y{k}];
    
    if (k >= n)
        x_hat{k} = inv(A' * R * A) * A' * R * Y; % NOTE that R is no longer the identity
        E(k) = norm(x_hat{k} - x_actual{k});
    end
end

t = toc;

figure
hold on
plot((n:N), E(n:N), 'r');
title(sprintf('Norm error of x using batch and the forgetting factor (Time = %.4f s)', t));
ylabel('Norm error');
xlabel('Iteration No.');

print Prob5(c) -dpng
