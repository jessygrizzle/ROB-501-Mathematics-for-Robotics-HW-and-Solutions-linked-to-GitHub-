


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

if 1
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





