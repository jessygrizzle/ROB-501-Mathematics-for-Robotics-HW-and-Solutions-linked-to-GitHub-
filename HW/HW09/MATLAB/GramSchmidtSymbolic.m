function [Q,R]=GramSchmidtSymbolic(F,a,b)
%
%Takes the vector of functions F whose entires are the bases you wish to orthonormalise.
%
%Entires of Q are an othonormal basis for the span of F
%
% R = representation of F in the basis Q
%
%Code is written to show all steps clearly, and not to be compact or
%especially efficient.
%
nc=length(F);

%% Orthogonalize and Normalize
for k=1:nc
    V(k)=F(k);
    for j=1:k-1
        V(k)=V(k)-InnerProd(V(j),F(k),a,b)* V(j);
    end
    V(k)=V(k)/sqrt( InnerProd( V(k),V(k),a,b) ); %% Set norm to one
end
Q=V;

%% Representation
R=zeros(nc,nc);
for i = 1:nc
    for j = 1:i
        R(j,i)=InnerProd(Q(j),F(i),a,b);
    end
end


end

function ip = InnerProd(f,g,a,b)
% function inner product
ip=int(f*g,a,b);
end