function [] = GenerateProb5Data()

m = 3; % Length of y_i
n = 20; % Length of x
N = 500; % Number of datapoints
epsilon = 0.1; % error constant

B = rand(n, n);
B = B' * B;
[O, S] = svd(B);

x_start = 4 * rand(n, 1);
x_offset = 2 * rand(n, 1) - ones(n, 1); % offset elements in range (-1, 1)
x_end = x_start + x_offset;

x_actual{1} = x_start;
C{1} = rand(m, n);
y{1} = C{1} * x_actual{1};

for i = 2:N
    x_actual{i} = x_start + (x_end - x_start) .* (i / N);
    
    C{i} = C{i - 1} * O;
    e = rand(3, 1) - 0.5 * ones(3, 1); % elements in e in the range (-0.5, 0.5)
    y{i} = C{i} * x_actual{i} + epsilon .* e;
end

save DataHW06_Prob5 y C N x_actual;

end
