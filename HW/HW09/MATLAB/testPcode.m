function f=testPcode(x)
if length(x)~=5
    'Dimension of x is not equal t0 5'
    return
end
x1=x(1);
x2=x(2);
f=x1^2 - x2^3;
