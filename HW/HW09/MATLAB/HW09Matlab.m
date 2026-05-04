cd

%%%Prob 3

if 0
    A=[1 2 3; 4 5 6]'
    
    latex=mat2LatexArrayMatrix(A,'3.0f')
    
    [q,r]=qr(A)
    
    [Q,R]=GramSchmidtClassic(A)
end

%%%%Prob 4

if 0
    load DataHW05_Prob5
    
    A=[1+0*t t t.^2 t.^3 t.^4 t.^5 t.^6 t.^7];
    
    
    
    S=svd(A)
    cond(A)
    
    [Q,R]=qr(A,0); R
    
    cond(A*inv(R))
    
    [V,D]=eig(A'*A)
    
    R'*Q'*Q*R
    A'*A*inv(A'*A)
    
end

if 0
    R=eye(5)
    
    
    
    for k= 1:5
        t0=k;
        t=t0 + [0:1e-2:1]';
        A=[1+0*t t t.^2 t.^3 t.^4];
        cond(A*inv(R))
        [Q,R]=qr(A,0); R
        cond(A*inv(R))
    end
    %
    % [Q,R]=qr(A,0);
    %
    %
    % Abar=A*inv(R);
    %
    % cond(Abar)
    
    if 0
        
        B = double(A);
        B(:,:,3) = 3*B(:,:,3);
        B = uint8(B);
        
    end
    
    % http://volunteerlecturerprogram.com/wp-content/uploads/2013/01/vuthythesis.pdf
    
    A = imread('zebra.jpg');
    
    B=A(:,:,1);
    
    imshow(B)
    
    C=double(B)
    
    size(B)
    
    [U,S,V]=svd(C);
    
    Stemp=S;
    
    plot(diag(S))
    
    D=diag(S);
    
    I=find(D<2000);
    Stemp(I,I)=0*Stemp(I,I);
    
    E=U*Stemp*V';
    
    k=min(I);
    
    E=U(:,1:k)*Stemp(1:k,1:k)*V(:,1:k)';
    
    E=uint8(E);
    min(I)
    
    imshow(E)
end

if 1
    
    if 0 % part a
    syms x1 x2 x3
    x=[x1 x2 x3];    
    f=3*x1*(2*x2-x3^3) + (x2^4)/3;    
    dfdx=jacobian(f,x);    
    dfdx=simple(dfdx)
    latex(dfdx)
    
    x1=1; x2=3; x3=-1;
    subs(dfdx)   
    
    end
    
    if 0 % partb
        
        x0=[1 3 -1]
        e1=[1 0 0]
        e2=[0 1 0]
        e3=[0 0 1]     
        d1=0.01;
        dfdx1=(funPartb(x0+d1*e1)-funPartb(x0-d1*e1))/2/d1
         d2=0.01;
        dfdx2=(funPartb(x0+d2*e2)-funPartb(x0-d2*e2))/2/d2
         d3=0.01;
        dfdx3=(funPartb(x0+d3*e3)-funPartb(x0-d3*e3))/2/d3
        
        d1=0.05
        dfdx1=(funPartb(x0+d1*e1)-funPartb(x0-d1*e1))/2/d1
         d2=0.05
        dfdx2=(funPartb(x0+d2*e2)-funPartb(x0-d2*e2))/2/d2
         d3=0.05
        dfdx3=(funPartb(x0+d3*e3)-funPartb(x0-d3*e3))/2/d3
        
    end
    
    if 1
        x0=[1 2 3 4 5];
        f=funcPartC(x0)
    end
    
    if 0  % partc
        
        err_max=1;
        E=eye(5);
        dfdx=zeros(1,5);
        x0=[1 1 1 1 1];
        delta=1*[1 1 1 1 1];
        while err_max>1e-4
            delta=delta/2;
            dfdx_prev=dfdx;
            for k=1:5
                dfdx(k)=( funcPartC(x0+delta(k)*E(k,:)) - funcPartC(x0-delta(k)*E(k,:)) )/2/delta(k);
            end
            error = dfdx-dfdx_prev
            err_max=max(abs(error));
        end        
        
        delta
        dfdx
    end
    
    
end
