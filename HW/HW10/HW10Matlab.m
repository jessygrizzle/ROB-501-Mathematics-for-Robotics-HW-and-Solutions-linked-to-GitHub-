

%% Problem 4
if 1
    syms x1 x2
    x=[x1;x2];
    F= [3;4]+[1 2; 3 4]*x - x*transpose(x)*[1;2]
    %x0=1*[7;8]
    x0=10*[3;5];
    x0=10*[-1;-1];
    
    tic
    [xstar,count]=NewtonRaphson(F,x,x0)
    toc
    
    for k = 1:length(x0)
        Kay=num2str(k);
        eval(['x',Kay,'=xstar(k);']);
    end
    subs(F)
end

%% Problem 5

if 0
    Ain=[1 2 3 4; 5 6 7 8], bin = [9;10]
    Aeq=[1 1 1 1]; beq=2;
    
    X = quadprog(eye(4),[ 0 0 0 0],Ain,bin,Aeq,beq)
    
    latex=mat2LatexArrayMatrix(X,'3.2f')
end

if 0
    Q=diag([2 4 6 8]) + diag([1 1 1],1) +  diag([1 1 1],-1)
    x0=[1 2 3 4]';
    H=2*Q, f=-2*x0'*Q
    Ain = [ 1 2 3 4; 5 6 7 8], bin=[9; 10]
    
    X = quadprog(H,f,Ain,bin)
    
    latex=mat2LatexArrayMatrix(X,'6.4f')
end

%% Problem 6
if 0
    
    A=[1 2; -3 7; 4 5];
    b=[3 2 12]';
    
    % if 0 %% L1 norm
    
    f=[0 0 1 1 1]
    Ain1=[A -eye(3)], bin1=b
    Ain2=[-A,-eye(3)], bin2=-b
    
    [X,Fval]=linprog(f,[Ain1;Ain2],[bin1;bin2])
    
    latex=mat2LatexArrayMatrix(X,'6.4f')
    
    latex=mat2LatexArrayMatrix(Fval,'6.4f')
    
    xhat1=X(1:2)
    
    latex=mat2LatexArrayMatrix(xhat1,'6.4f')
    
    norm(A*xhat1-b,1)
    
    % else %% L infinity norm
    
    f=[0 0 1]
    Ain1=[A -ones(3,1)], bin1=b
    Ain2=[-A,-ones(3,1)], bin2=-b
    
    [X,Fval]=linprog(f,[Ain1;Ain2],[bin1;bin2])
    
    latex=mat2LatexArrayMatrix(X,'6.4f')
    
    latex=mat2LatexArrayMatrix(Fval,'6.4f')
    
    xhatinf=X(1:2)
    
    latex=mat2LatexArrayMatrix(xhatinf,'6.4f')
    
    norm(A*xhatinf-b,inf)
    
    norm(A*xhatinf-b,1)
    
    %end
    
end