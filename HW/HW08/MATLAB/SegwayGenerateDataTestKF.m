

A=[0 0 1 0; 0 0 0 1; 2.568 0 0 0; -5.020  0 0 0];
B=[0;0;-0.7172;1.6744];
%%%Feedback Design
if 0 % Pole placement method covered in EECS 560
    P=[-2.5849, -1.2387 , -0.4108 + 0.2230i,  -0.4108 - 0.2230i]; % desired e-values
    K=-place(A,B,P);
else % A more powerful method from EECS 565
    K=-lqr(A,B,diag([1 1 100 1]),1), eig(A+B*K)
end
%%%Specify output
C=[1 1 0 0]; %%Roughly horizontal position of the base w.r.t. a worldframe
%C=[1 0 0 0; 0 1 0 0];
%%% Assemble model
SegCont=ss(A+B*K,B,C,0);
Ts=0.1;
SegDis=c2d(SegCont,Ts);

[A,B,C,D] = ssdata(SegDis);
%G=[1;1;1;1];
G=diag([1 1 .1 .1]);

%x0=[0;6;0;0];
x0=[-.3;-4;.5;.5];

mean_x=0*x0;
P0=eye(4);
xk=x0;

sigv=0.05; 
sigw=.02;
Q=sigv^2*eye(length(C*C'));
R=sigw^2*eye(4);

rng('default');
N=500;
t=zeros(N,1);
u=zeros(N,1);
y=zeros(N,1);
phi=zeros(N,1);
theta=zeros(N,1);
tic
for k =1:N
    if 0
        uk=0;
        vk=0;
        wk=0;
    else
        uk=4*sin(0.2*k*Ts);
        vk=sigv*randn(length(C*C'),1);
        wk=sigw*randn(4,1);
    end
    y(k)=[0 1 0 0]*xk + vk;
    u(k)=uk;
    xkp1=A*xk+B*uk+0*G*wk;
    t(k)=k*Ts;
    phi(k)=[1 0 0 0]*xkp1;
    theta(k)=[0 1 0 0]*xkp1;
    xk=xkp1;
end
toc

%save SegwayData4KF A B C D G Q R t y u N Ts x0 P0 

save SegwayDataTest N Ts A B C x0 u

%Segway_anim(t,phi,theta,Ts);

