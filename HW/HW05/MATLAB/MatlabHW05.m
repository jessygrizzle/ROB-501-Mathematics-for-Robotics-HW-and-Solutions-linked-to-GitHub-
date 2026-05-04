

% GS Prob 
if 0
    
    y1=[1 -2 1]'
    y2=[4 0 -1]'
    y3=[-2 2 3]'
    
    v1=y1
    a21=StandInnerProdRn(y2,v1)/StandInnerProdRn(v1,v1)
    v2=y2-a21*v1
    a31=StandInnerProdRn(y3,v1)/StandInnerProdRn(v1,v1)
    a32=StandInnerProdRn(y3,v2)/StandInnerProdRn(v2,v2)
    v3=y3-a31*v1-a32*v2
    
end

if 0
    rng('default')
    A=rand(10,10); A=A'*A;
    C=rand(2,10);
    [U,S,V]=svd(A);
    O=U;
    U=[C];
    for k = 1:10
        U=[U;C*O^k];
    end
    
    svd(U)
end

if 0
    rng('default')
    A=rand(100,100); A=A'*A;
    x0=rand(100,1);
    C=rand(3,100);
    [O,S]=svd(A);
    Astack=[C];
    K=size(Astack); K=K(1);
    Opower_k=eye(100,100);
    for k = 1:33
        Opower_k=Opower_k*O;
        Ck=C*Opower_k;
        Astack=[Astack;Ck];
        cond(Astack)
    end
    
    rank(Astack)
    cond(Astack)
    
    Astack=[C];
    y=C*x0;
    Y=y;
    for k = 1:200
        Opower_k=Opower_k*O;
        Ck=C*Opower_k;
        yk=Ck*x0+0.01*rand(3,1);
        Astack=[Astack;Ck];
        Y=[Y;yk];
    end
    
    rank(Astack)
    cond(Astack)
    
    xhat = inv(Astack'*Astack)*Astack'*Y;
    
    error = norm(xhat-x0)
    
end

if 1
    
    A=diag([1 .5 .5 1 .5])
    
    B=[1 0 2  0 3]'
    C=0.2
    D=B'
    
    temp =inv(A)-inv(A)*B*inv(inv(C) + D*inv(A)*B)*D*inv(A)
    
    32*temp
    
    
    
    
    
end





