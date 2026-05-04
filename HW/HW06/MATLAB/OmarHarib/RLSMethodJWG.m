function [ x_rls ] = RLSMethodJWG( A, y, K_start, K_end )

% Just need size n
sz = size(A);
n = sz(2);
lambda=0.98;

% Calculating all Q
Q{1} = zeros(n, n);
for k = 1:K_end
    if (k == 1)
        Q{k} = A{k}' * A{k};
    else
        Q{k} = lambda*Q{k - 1} + A{k}' * A{k};
    end
end

% Using batch algorithm to find at step K_start
x_batch = BatchMethod(A, y, K_start, K_start);

x_rls{K_start} = x_batch{K_start}; % First iteration is the batch value

for k = (K_start + 1):K_end
    x_rls{k} = x_rls{k - 1} + inv(Q{k}) * A{k}' * (y{k} - A{k} * x_rls{k - 1});
end

end
