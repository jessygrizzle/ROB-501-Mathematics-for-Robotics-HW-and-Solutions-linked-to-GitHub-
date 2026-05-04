%num_deriv_design


%numerical derivative design for rabbit's joints



if 1  %% set to zero to turn off the simulation

    N=7,M=80,m0=floor(M/2), Dt=.0005,  Q=eye(M); %Q(M,M)=.5; %Q(M-1,M-1)=0.5;
%N=1,M=10,m0=1, Dt=.002,  Q=eye(M); %
%[A,B,C,D]=num_der(N,M,m0,Dt,Q);
[A,B,C,D]=num_der_poly(N,M,m0,Dt,Q);

A_dirty_deriv=A;
B_dirty_deriv=B;
C_dirty_deriv=C(2,:);
D_dirty_deriv=D(2,:);

    ON=1;  %This runs a test for the filter

    %close all

    sim('dirt_deriv_test')

[dy_est]=shift(t,dy_est,m0*Dt);
    P=0;
    figure(1+P),plot(t,dy,'g',t,dy_est,'r'),legend('dy','dy_{est}'), grid on
    figure(2+P),plot(t,ddy_est,'k'),legend('ddy_{est}'),
    
%     e_dy=norm(dy-dy_est)/length(t);
%     title(['With noise   error  ',num2str(e_dy)])
%     print -dpng Prob06regresPoly
%     figure(2+P),plot(t,y,'g',t,y_noisy,'.r'),legend('y','y_{noisy}'), grid on
%     e_y=norm(y-y_est)/length(t);
%     title(['With noise   error  ',num2str(e_y)])
%     
%     %print -dpng Prob06regresPoly
%     
%     figure(3+P),plot(t,dy,'g',t,dy_est_naive,'r'),legend('dy','dy_{est naive}'),grid on
%     e_dy=norm(dy-dy_est_naive)/length(t);
%     title(['With noise   error naive  ',num2str(e_dy)])
%     
%      print -dpng Prob06naive
%     
%     y=y_noisy;
%     
%     % save DataHW05_Prob6 t y dy
% 
%     ON=0;
%     
%     N=2,M=4,m0=1, Dt=.002,  Q=eye(M); %Q(M,M)=.5; %Q(M-1,M-1)=0.5;
% %N=1,M=10,m0=1, Dt=.002,  Q=eye(M); %
% %[A,B,C,D]=num_der(N,M,m0,Dt,Q);
% [A,B,C,D]=num_der_poly(N,M,m0,Dt,Q);
% 
% A_dirty_deriv=A;
% B_dirty_deriv=B;
% C_dirty_deriv=C(2,:);
% D_dirty_deriv=D(2,:);
% 
%     sim('dirt_deriv_test')
%     figure(4+P),plot(t,dy,'g',t,dy_est,'.r'),legend('dy','dy_{est}'), grid on
%     e_dy=norm(dy-dy_est)/length(t);
%     title(['Without noise   error  ',num2str(e_dy)])
%     
%     print -dpng Prob05regresPoly
%     
%     
%     figure(6+P),plot(t,dy,'g',t,dy_est_naive,'r'),legend('dy','dy_{est naive}'),grid on
%     e_dy=norm(dy-dy_est_naive)/length(t);
%     title(['No noise   error naive  ',num2str(e_dy)])
%     
%      print -dpng Prob05naive
%     
%     figure(5+P),plot(t,y,'g',t,y_est,'.r'),legend('y','y_{est}'), grid on
%     e_y=norm(y-y_est)/length(t);
%     title(['Without noise   error  ',num2str(e_y)])
%     
%     
%     
%     %save DataHW05_Prob5 t y dy


end