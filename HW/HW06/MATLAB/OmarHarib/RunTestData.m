function [ x_hat, x_0, err, err_sumofsquares, ex ] = RunTestData( filename, func )

load (filename); % Loading data

x_0 = x_actual; % Setting x_0

K_start = 50; % Starting from this value till K

x_hat = func(A, y, K_start, K); % Calling Least Square method

% Calculating A_stack and y_stack to be able to find the error
A_stack = [];
y_stack = [];

for k = 1:K
    A_stack = [A_stack ; A{k}];
    y_stack = [y_stack ; y{k}];
    
    if (k >= K_start)
        e = y_stack - A_stack * x_hat{k}; % Computing error
        err{k} = e; % Storing error should we need it
        err_sumofsquares (k - K_start + 1) = norm(e); % Finding sum of squares
        ex ( k - K_start + 1 ) = norm(x_actual{k} - x_hat{k});
    end
end

end
