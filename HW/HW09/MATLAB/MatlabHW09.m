
%%%^Prob 1
if 0
    syms t pi
    
    f=t;
    g=sin(pi*t);
    a=0; b=2;
    G11=int(f*f,a,b)
    G12=int(f*g,a,b)
    G21=G12;
    G22=int(g*g,a,b)
    c=[2;pi]
    
    G=[G11 G12; G21 G22];
    beta=inv(G)*c
    
    beta=simplify(beta)
    
    [num,den]=numden(beta)
end

%%%Prob 3

if 0
    A=[1 2 3; 4 5 6]'
    
    latex=mat2LatexArrayMatrix(A,'3.0f')
    
    [Q,R]=GramSchmidtClassic(A)
    latex=mat2LatexArrayMatrix(Q,'3.3f')
    latex=mat2LatexArrayMatrix(R,'3.3f')
    
    [Q,R]=qr(A)
    
    latex=mat2LatexArrayMatrix(Q,'3.3f')
    latex=mat2LatexArrayMatrix(R,'3.3f')
    
    [Q,R]=qr(A,0)
    
    latex=mat2LatexArrayMatrix(Q,'3.3f')
    latex=mat2LatexArrayMatrix(R,'3.3f')
    
    
end

%%%%Prob 4

if 0
    %%load DataHW05_Prob5
    
    a=0; b=3;
    t=[a:0.01:b]';
    A=[1+0*t t t.^2 t.^3 t.^4];
    [Q,R]=qr(A,0);
    R
    
    latex=mat2LatexArrayMatrix(R,'3.3f')
    
    R*3/301
    
    syms t
    F=[1+0*t, t, t^2, t^3, t^4];
    
    %F*inv(R)
    
    
    [Q,R]=GramSchmidtSymbolic(F,a,b);
    R
    latex=mat2LatexArrayMatrix(R,'3.3f')
    for k = 1:length(Q)
        pretty(Q(k))
    end
    %
    %     S=svd(A)
    %     cond(A)
    
    
    
    %     cond(A*inv(R))
    %
    %     [V,D]=eig(A'*A)
    %
    %     R'*Q'*Q*R
    %     A'*A*inv(A'*A)
    
end


%%%%Prob 6

if 0
    
    
    B=[ 1 2; 3 4; 5 6];
    A=B*[2 3 1; 1 2 1]
    rng('default')
    A=A+0.05*rand(3,3)
    
    latex = mat2LatexArrayMatrix(A,'2.3f')
    
    svd(A)
    
    [U,S,V]=svd(A);
    
    S=diag(S); S(3)=0;
    
    Ahat=U*diag(S)*V'
    latex = mat2LatexArrayMatrix(Ahat,'2.3f')
    
    [U,S,V]=svd(Ahat)
    
    latex = mat2LatexArrayMatrix(S,'3.3f')
    
end


%Problem 7
if 0
    
    if 0
        
        B = double(A);
        B(:,:,3) = 3*B(:,:,3);
        B = uint8(B);
        
    end
    
    % http://volunteerlecturerprogram.com/wp-content/uploads/2013/01/vuthythesis.pdf
    
    A = imread('zebra.jpg');
    A=A(:,:,1);
    figure(1)
    imshow(A)
    
    B=double(A);
    size(B)
    
    [U,S,V]=svd(B);
    figure(3)
    % plot(diag(S))
    % loglog(diag(S))
    figure(1)
    plot(diag(S),'r','linewidth',3), grid on
    print -dpng SingularValues
    
    k=length(diag(S));
    C=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
    C1=uint8(C);
    
    CuSumSigValues=cumsum(diag(S));
    K=CuSumSigValues(end);
    k2=find(CuSumSigValues>.9*K); k2=min(k2);
    C2=U(:,1:k2)*S(1:k2,1:k2)*V(:,1:k2)';
    C2=uint8(C2);
    
    k3=find(CuSumSigValues>.75*K); k3=min(k3);
    C3=U(:,1:k3)*S(1:k3,1:k3)*V(:,1:k3)';
    C3=uint8(C3);
    
    k4=find(CuSumSigValues>.5*K); k4=min(k4);
    C4=U(:,1:k4)*S(1:k4,1:k4)*V(:,1:k4)';
    C4=uint8(C4);
    figure(2)
    subplot(2,2,1)
    imshow(C1)
    title(['All ',num2str(k),' singular values'])
    subplot(2,2,2)
    imshow(C2)
    title(['First ',num2str(k2),' singular values'])
    subplot(2,2,3)
    imshow(C3)
    title(['First ',num2str(k3),' singular values'])
    subplot(2,2,4)
    imshow(C4)
    title(['First ',num2str(k4),' singular values'])
    
    print -dpng FourZebraImages
end

if 0
    A = imread('zebra.jpg');
    %throw away color information for this example
    A=A(:,:,1);
    % show the image
    figure(1)
    imshow(A)
    %convert to double precision
    B=double(A);
    [nr,nc]=size(B);
    %Let's do a matrix operation
    C=fliplr(B);
    %convert back to binary
    C=uint8(C);
    %show the image
    figure(2)
    imshow(C)
end


%%%Looking for an idea on a problem
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
end
