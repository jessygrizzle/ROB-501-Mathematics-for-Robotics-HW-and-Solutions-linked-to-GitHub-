function [Q,R]=GramSchmidtClassic(Y)
%[Q R]=GramSchmidtClassic(Y)
%
%Takes the matrix Y whose columns are the bases you wish to orthonormalise.
%
%Columns of Q are an othonormal basis for the span of columns of Y
%
% R = representation of Y in the basis Q
%
%Code is written to show all steps clearly, and not to be compact or
%especially efficient.
%
if nargin < 2
    dt=1;
end
[nr,nc]=size(Y);

%% Orthogonalize and Normalize
for k=1:nc
    V(:,k)=Y(:,k);
    for j=1:k-1
        V(:,k)=V(:,k)-InnerProd(V(:,j),Y(:,k))* V(:,j);
    end
    V(:,k)=V(:,k)/sqrt( InnerProd(V(:,k),V(:,k)) ); %% Set norm to one
end
Q=V;

%% Representation
R=zeros(nc,nc);
for i = 1:nc
    for j = 1:i
        R(j,i)=InnerProd(Q(:,j),Y(:,i));
    end
end


end

function ip = InnerProd(x,y)
% Inner Product of vectors in R^n
%
ip=sum(x.*y);
end