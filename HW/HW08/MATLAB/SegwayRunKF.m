
clear all

load SegwayData4KF


phi_hat=zeros(N,1);
theta_hat=zeros(N,1);
dphi_hat=zeros(N,1);
dtheta_hat=zeros(N,1);
x_hat=x0;
P=P0;
tic
for k =1:N
    uk=u(k);
    %Kalman Filter Equations
    K = (P*C')/(C*P*C' + Q);
    x_hat_next = A *x_hat + B*u(k) + A*K*(y(k)- C*x_hat);
    P_next= A*(P - K*C*P)*A' + G*R*G';
    %
    % Store Calculations for plotting
    %
    phi_hat(k)=[1 0 0 0]*x_hat;
    theta_hat(k)=[0 1 0 0]*x_hat;
    dphi_hat(k)=[0 0 1 0]*x_hat;
    dtheta_hat(k)=[0 0 0 1]*x_hat;
    KalGain(k,:)=K;
    %
    % Update variables in Kalman Filter
    x_hat=x_hat_next;
    P=P_next;    
end
toc
cond(P)
[U,Sig]=svd(P)

[Kss,Pss] = dlqe(A,G,C,R,Q);


Segway_anim(t,phi_hat,theta_hat,Ts);

figure(1)
plot(t,KalGain,'linewidth',3)
grid on
xlabel('t','FontSize',18)
ylabel('Kalman Gains','FontSize',18)
legend({'$K_{\theta}$', '$K_{\varphi}$', '$K_{\dot{\theta}}$', '$K_{\dot{\varphi}}$' },'interpreter','latex','FontSize',18)

print -dpng KalmanGains

figure(3)
plot(t,theta_hat,'r',t,phi_hat,'g','linewidth',3)
grid on
xlabel('t','FontSize',18)
ylabel('Angles (rad)','FontSize',18)
legend({'$\widehat{\theta}$', '$\widehat{\varphi}$'},'interpreter','latex')
print -dpng AnglesThetaPhi

figure(4)
plot(t,dtheta_hat,'r',t,dphi_hat,'g','linewidth',3)
grid on
xlabel('t','FontSize',18)
ylabel('Angular rates (rad/s)','FontSize',18)
legend({'$\widehat{\dot{\theta}}$', '$\widehat{\dot{\varphi}}$'},'interpreter','latex')

print -dpng AnglularVelocitiesThetaPhi


KLatex = mat2LatexArrayMatrix(K,'4.5f')

KssLatex = mat2LatexArrayMatrix(Kss,'4.5f') 
figure(5)
plot(t,y,'k','linewidth',3)
grid on
xlabel('t','FontSize',18)
ylabel('y = Measurement','FontSize',18)

% for k =1:N
%     uk=u(k);
%     if 0
%         K = (A*P*C')/(C*P*C' + Q);
%         x_hat_next = A *x_hat + B*u(k) + K*(y(k)- C*x_hat);
%         P_next= (A - K*C)*P*(A - K*C)' + G*R*G' + K*Q*K';
%     else
%         K = (P*C')/(C*P*C' + Q);
%         x_hat_next = A *x_hat + B*u(k) + A*K*(y(k)- C*x_hat);
%         P_next= A*(P - K*C*P)*A' + G*R*G';
%     end
%     phi_hat(k)=[1 0 0 0]*x_hat;
%     theta_hat(k)=[0 1 0 0]*x_hat;
%     dphi_hat(k)=[0 0 1 0]*x_hat;
%     dtheta_hat(k)=[0 0 0 1]*x_hat;
%     x_hat=x_hat_next;
%     P=P_next;
%     KalGain(k,:)=K;
% end
