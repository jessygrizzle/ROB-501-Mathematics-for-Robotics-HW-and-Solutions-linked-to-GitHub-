clear
clc

load DataHW06_Prob4

tic % Starting Clock

n = 34; % Computed from part (a)

A = [];
Y = [];
for k = 1 : N
    A = [A; C{k}];
    Y = [Y; y{k}];
    
    if (k >= n)
        x_hat{k} = inv(A' * A) * A' * Y; % Using batch method
        E(k) = norm(x_hat{k} - x_actual{k}); % Finding error
    end
end

t = toc; % Recording time

figure
hold on
plot((n:N), E(n:N), 'r');
title(sprintf('Norm error of x using batch (Time = %.4f s)', t));
ylabel('Norm error');
xlabel('Iteration No.');

print Prob4(b) -dpng
