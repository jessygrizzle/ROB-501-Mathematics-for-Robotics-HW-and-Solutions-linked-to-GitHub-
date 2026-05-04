function fip = InnerProd(f1,f2,dt)
% Function Inner Product
%
if nargin <3
    dt=1;
end
%
fip=sum(f1.*f2)*dt;
return