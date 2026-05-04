

%Prob 1
if 0
    
    N=[1 3]
    A=N'*N
    latex = mat2LatexArrayMatrix(A,'3.0f')
    [O,D]=eig(A)
    N=sqrt(D)*O
    
    
    
    N=[1 3 2; 2 3 4; 1 1 1]
    rank(N)
    A=N'*N
    latex = mat2LatexArrayMatrix(A,'3.0f')
    [O,D]=eig(A)
    N=sqrt(D)*O
    
    A= [ 1 2 3; 4 5 6; 7 8 9]
    A=A+A'
    eig(A)
    
    
    latex = mat2LatexArrayMatrix(A,'3.0f')
end




%Prob 2
if 0
    
    A= [ 1 3; 3 8], eig(A)
    
    latex = mat2LatexArrayMatrix(A,'3.0f')
    
    A= [ 1 0 6; 0 4 7; 6 7 10], eig(A)
    
    
    latex = mat2LatexArrayMatrix(A,'3.0f')
    
    A= [ 1 2 6; 2 5 7; 6 7 99], eig(A)
    
    latex = mat2LatexArrayMatrix(A,'3.0f')
end

% Prob 3

if 0
    A=[ 1 3 2; 3 8 4]
    b=[1;2]
    Q=eye(3)
    xhat=inv(Q)*A'*inv(A*inv(Q)*A')*b
    A*xhat-b
    
    Q=[5 1 9; 1 2 1; 9 1 17]
    xhat=inv(Q)*A'*inv(A*inv(Q)*A')*b
    A*xhat-b
    
end


%Prob 4 and 5
if 0
    
    rng('default')
    mu = [0 ;0];
    Q = [1 .5; .5 2]; Q=[Q .5*Q; .5*Q 2*Q]; R = chol(Q);
    e=randn(1,4)*R
    
    
    x = [-1;1];
    C=[ 1 2; 3 4; 5 0; 0 6]
    
    Y=C*x + e'
    
    R= [2 1; 1 2]
    
    if 0
        
        latex=mat2LatexArrayMatrix(Q,'3.2f')
        
        latex = mat2LatexArrayMatrix(C,'3.0f')
        
        latex = mat2LatexArrayMatrix(Y,'3.4f')
        
        latex = mat2LatexArrayMatrix(R,'3.0f')
    end
    
    Ctemp=C; Ytemp=Y;Qtemp=Q;
    if 0 %Sol Prob 4
        for k = 2:4
            C=Ctemp(1:k,:); Y=Ytemp(1:k); Q=Qtemp(1:k,1:k);
            Khat=inv(C'*inv(Q)*C)*C'*inv(Q)
            xhat=Khat*Y
            Covariance=inv(C'*inv(Q)*C)
            latex = mat2LatexArrayMatrix(Khat,'3.4f')
        end
        
    end
    
    if 0 %Sol Prob 5
        for k = 1:4
            C=Ctemp(1:k,:); Y=Ytemp(1:k); Q=Qtemp(1:k,1:k);
            Khat= R*C'*inv(C*R*C' + Q)
            xhat=Khat*Y
            Covariance= R - R*C'*inv(C*R*C' + Q)*C*R
        end
        
    end
    
    
end

% Prob 6

if 1
    
    mu=[-1;0;1]
    
    N=[ 1 1 0; 0 1 1; 0 1 0];
    Sigma = N'*N+ones(3,1)*ones(1,3)
    
    latex = mat2LatexArrayMatrix(mu,'3.0f')
    
    latex = mat2LatexArrayMatrix(Sigma,'3.0f')
    
    if 1  %solutons
        
        if 1
            Sigma11=Sigma(1:2,1:2), Sigma12=Sigma(1:2,3), Sigma22=Sigma(3,3), Sigma21=Sigma12'
            Sig12invSig22=Sigma12*inv(Sigma22)
            mu1=mu(1:2), mu2=mu(3)
            Sig1give2=Sigma11-Sigma12*inv(Sigma22)*Sigma21
            
        end
        
        if 1
            Sigma11=Sigma(1,1), Sigma12=Sigma(1,2:3), Sigma22=Sigma(2:3,2:3), Sigma21=Sigma12'
            Sig12invSig22=Sigma12*inv(Sigma22)
            mu1=mu(1), mu2=mu(2:3)
            Sig1give2=Sigma11-Sigma12*inv(Sigma22)*Sigma21
            
        end
        
    end
    
end




