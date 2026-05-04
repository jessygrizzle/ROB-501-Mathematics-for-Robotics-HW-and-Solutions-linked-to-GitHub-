
% HW 8



if 0  %Prob 1
    
    rng('default')
    muEps = [0 ;0];
    Q = [1 .5; .5 2]; Q=[Q .5*Q; .5*Q 2*Q], R = chol(Q);
    e=randn(1,4)*R
    
    
    
    
    x = [-1;1]; muX=0*x;
    C=[ 1 2; 3 4; 5 0; 0 6]
    
    Y=C*x + e'
    
    P= 0.25*[2 1; 1 2]
    %P=0.5*eye(2);
    
    if 0
        
        latex=mat2LatexArrayMatrix(Q,'3.2f')
        
        latex = mat2LatexArrayMatrix(C,'3.0f')
        
        latex = mat2LatexArrayMatrix(Y,'3.4f')
        
        latex = mat2LatexArrayMatrix(P,'3.0f')
    end
    
    Ctemp=C; Ytemp=Y;Qtemp=Q;
    
    if 1 %Sol Prob 1 of HW 8
        for k = 1:4
            k
            C=Ctemp(1:k,:); Y=Ytemp(1:k); Q=Qtemp(1:k,1:k);
            Khat= P*C'*inv(C*P*C' + Q)
            xhat=muX+Khat*(Y-C*muX)
            Covariance= P - P*C'*inv(C*P*C' + Q)*C*P
            
            KhatLatex = mat2LatexArrayMatrix(Khat,'4.4f')
            xhatLatex = mat2LatexArrayMatrix(xhat,'4.4f')
            CovarianceLatex= mat2LatexArrayMatrix(Covariance,'4.5f')
            
            pause
        end
        
        save dataProblem1 C Y Q
        
    end
    
    
    if 0 % Prob 2
        
        %a)
        xhat=inv(C'*C)*C'*Y
        xhatLatex = mat2LatexArrayMatrix(xhat,'4.5f')
        
        %b)
        
        xhat=inv(C'*C)*C'*Y
        xhatLatex = mat2LatexArrayMatrix(xhat,'4.5f')
        
        %c)
        P=100*eye(2)
        xhat=inv(C'*C+inv(P))*C'*Y
        xhatLatex = mat2LatexArrayMatrix(xhat,'4.5f')
        
        P=1e6*eye(2)
        xhat=inv(C'*C+inv(P))*C'*Y
        xhatLatex = mat2LatexArrayMatrix(xhat,'4.5f')
        
        
        
    end
    
    
end

% Prob 3
if 0
    if 0
        rng('default')
        muEps = [0 ;0];
        Q = [1 .5; .5 2]; Q=[Q .5*Q; .5*Q 2*Q], R = chol(Q);
        e=randn(1,4)*R
        
    else
        load dataProblem1
    end
    
    
    
    
    x = [1;-1]; muX=x;
    C=[ 1 2; 3 4; 5 0; 0 6]
    
    Y=C*x + e'
    
    P= 0.25*[2 1; 1 2]
    Khat= P*C'*inv(C*P*C' + Q)
    xhat=muX+Khat*(Y-C*muX)
    Covariance= P - P*C'*inv(C*P*C' + Q)*C*P
    
    KhatLatex = mat2LatexArrayMatrix(Khat,'4.4f')
    xhatLatex = mat2LatexArrayMatrix(xhat,'4.4f')
    CovarianceLatex= mat2LatexArrayMatrix(Covariance,'4.5f')
end




% Prob 6

if 0
    
    mu=[-1;0;1]
    
    N=[ 1 1 0; 0 1 1; 0 1 0];
    Sigma = N'*N+ones(3,1)*ones(1,3)
    
    latex = mat2LatexArrayMatrix(mu,'3.0f')
    
    latex = mat2LatexArrayMatrix(Sigma,'3.0f')
    
    if 1  %solutons
        
        if 0
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




