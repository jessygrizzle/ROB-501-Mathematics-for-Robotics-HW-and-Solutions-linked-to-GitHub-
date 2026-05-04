



if 1
    rng('default')
    epsilon=0.1;
    A=rand(100,100); A=A'*A;
    x0=4*rand(100,1);
    C=rand(3,100);
    [O,S]=svd(A);
    Astack=[C];
     y=C*x0;
    Y=y;
    K=size(C); 
    Opower_k=eye(100,100);
    for k = 1:ceil(K(2)/K(1))
        Opower_k=Opower_k*O;
        Ck=C*Opower_k;
        yk=Ck*x0+epsilon*rand(3,1);
        Astack=[Astack;Ck];
        Y=[Y;yk];
        cond(Astack)
    end
    
    xhat = inv(Astack'*Astack)*Astack'*Y;
    
    error = norm(xhat-x0)
    
    rank(Astack)
    cond(Astack)
    
    Astack=[C];
    y=C*x0;
    Y=y;
    for k = 1:500
        Opower_k=Opower_k*O;
        Ck=C*Opower_k;
        yk=Ck*x0+epsilon*rand(3,1);
        Astack=[Astack;Ck];
        Y=[Y;yk];
    end
    
    rank(Astack)
    cond(Astack)
    
    xhat = inv(Astack'*Astack)*Astack'*Y;
    
    error = norm(xhat-x0)
    
end





