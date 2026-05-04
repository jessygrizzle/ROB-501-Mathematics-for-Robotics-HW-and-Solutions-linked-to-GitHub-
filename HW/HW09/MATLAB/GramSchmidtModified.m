function [Q R]=GramSchmidtModified(Y)
%[Q R]=mdgs(Y)
%
%Takes the matrix Y whose columns are the bases you wish to orthonormalise.
%
%Q is the orthonormalisation (column vectors are the orthonormal basis)
%and R are the coefficients.
%
% See http://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process
%
%Code is written to show all steps clearly, and not to be compact or
%especially efficient.

[nr,nc]=size(Y);

for k=1:nc
    v(:,k)=Y(:,k)/norm(Y(:,k),2); %copy over to v
end

for i=1:nc
    v(:,i)=v(:,i)/norm(v(:,i),2);
    for j=i+1:nc
        v(:,j)=v(:,j)-proj(v(:,i),v(:,j));
    end
end
Q=v;
%% Representation
R=zeros(nc,nc);
for i = 1:nc
    for j = 1:i
        R(j,i)=InnerProd(Q(:,j),Y(:,i));
    end
end
%%

    function z=proj(x,y)
        %
        %  Assume x^Tx  = 1.
        %
        z=InnerProd(x,y)*x;
        %z=(InnerProd(x,y)/InnerProd(x,x))*x;
    end
    function ip = InnerProd(x,y)
        % Inner Product of vectors in R^n
        %
        ip=sum(x.*y);
    end

end

