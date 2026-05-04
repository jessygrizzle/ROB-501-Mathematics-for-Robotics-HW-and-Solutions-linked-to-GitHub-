function [A1, A2] = Gen(n,k)

if nargin <2
    k=3;
end
if nargin <1
    n=4
end
% n = 4; % size of matrix
% k = 3; % maximal values of entries of A1
manual = 0; % set to 1 if entering values manually
A = zeros(n); % change this to enter A manually
g = 0;
iter = 0;
while (g ~= 1)
    iter = iter + 1;
    if manual == 0
        A = randi(k, n);
    end
    b = zeros(1, 3);
    for i = 1:n
        b(i) = round(cofactor(A, n, i));
    end
    [g, A(n,1), A(n,2)] = gcd(b(1), b(2));
    for i = 3:n
        if (g == 1)
            A(n,i:n) = zeros(size(A(n,i:n)));
            break;
        end
        [g, c, d] = gcd(g, b(i));
        A(n,1:i-1) = c*A(n,1:i-1);
        A(n,i) = d;
    end
    for i = 1:n
        if mod(i + n, 2) == 1
            A(n,i) = -A(n,i);
        end
    end
    if (manual == 1) && (g ~= 1)
        disp('Error: No Solution');
        break;
    end
end
iter % print out number of iterations
A1 = A;
if g == 1
    A2 = round(A^(-1));
else
    A2 = zeros(n);
end

function cf = cofactor(A, n, i)
Ap = zeros(n-1);
if (i > 1)
    Ap(:,1:i-1) = A(1:n-1,1:i-1);
end
if (i < n)
    Ap(:,i:n-1) = A(1:n-1,i+1:n);
end
cf = det(Ap);