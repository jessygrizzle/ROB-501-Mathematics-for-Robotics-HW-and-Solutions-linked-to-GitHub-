function [ x_batch ] = BatchMethod( A, y, K_start, K_end )

A_stack = [];
y_stack = [];

for k = 1:K_end
    A_stack = [A_stack ; A{k}];
    y_stack = [y_stack ; y{k}];
    
    if (k >= K_start)
        x_batch{k} = inv(A_stack' * A_stack) * (A_stack' * y_stack);
    end
end

end
