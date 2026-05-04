function [] = GenerateInitialDataConst()

m = 3;
n = 100;
K = 500;

epsilon = 0.1;
B = rand(n, n);
B = B' * B;
[O, S] = svd(B);

x_actual{1} = 4 * rand(n, 1);
A{1} = rand(m, n);
y{1} = A{1} * x_actual{1};

for k = 2:K
    x_actual{k} = x_actual{k - 1}; % Not changing
    
    A{k} = A{k - 1} * O;
    y{k} = A{k} * x_actual{k} + epsilon * rand(3, 1);
end

save data_const A y x_actual K;

end
