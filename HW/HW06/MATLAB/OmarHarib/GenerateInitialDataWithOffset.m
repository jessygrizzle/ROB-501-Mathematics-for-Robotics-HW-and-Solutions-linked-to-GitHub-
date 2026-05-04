function [] = GenerateInitialDataWithOffset()

m = 3;
n = 100;
K = 500;

epsilon = 0.1;
B = rand(n, n);
B = B' * B;
[O, S] = svd(B);

% Start and end are random
x_start = 4 * rand(n, 1);
x_end = 4 * rand(n, 1);

x_actual{1} = x_start;
A{1} = rand(m, n);
y{1} = A{1} * x_actual{1};

for k = 2:K
    x_actual{k} = x_start + (x_end - x_start) .* (k / K);
    
    A{k} = A{k - 1} * O;
    y{k} = A{k} * x_actual{k} + epsilon * rand(3, 1);
end

save data_offset A y x_actual K;

end
