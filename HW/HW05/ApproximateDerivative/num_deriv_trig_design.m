%num_deriv_trig_design


%numerical derivative design for rabbit's joints

M=20,m0=10, Dt=.0005, W=[1:1:3]*pi/(M*Dt),Q=diag([1:1:M]); %Q=eye(M); %Q(M,M)=.5; %Q(M-1,M-1)=0.5;
[A,B,C,D]=num_der_trig(W,M,m0,Dt,Q);

A_dirty_deriv=A;
B_dirty_deriv=B;
C_dirty_deriv=C(2,:);
D_dirty_deriv=D(2,:);

if 1  %% set to zero to turn off the simulation


    ON=1;  %This runs a test for the filter

    %close all

    sim('dirt_deriv_test')


    P=0;
    figure(1+P),plot(t,dy,'g',t,dy_est,'r'),legend('dy','dy_{est}'),
    e_dy=norm(dy-dy_est)/length(t);
    title(['With noise   error  ',num2str(e_dy)])
    figure(2+P),plot(t,y,'g',t,y_noisy,'.r'),legend('y','y_{noisy}')
    e_y=norm(y-y_est)/length(t);
    title(['With noise   error  ',num2str(e_y)])
    
    figure(3+P),plot(t,dy,'g',t,dy_est_naive,'r'),legend('dy','dy_{est naive}'),
    e_dy=norm(dy-dy_est_naive)/length(t);
    title(['With noise   error naive  ',num2str(e_dy)])

    ON=0;

    sim('dirt_deriv_test')
    figure(4+P),plot(t,dy,'g',t,dy_est,'.r'),legend('dy','dy_{est}')
    e_dy=norm(dy-dy_est)/length(t);
    title(['Without noise   error  ',num2str(e_dy)])
    figure(5+P),plot(t,y,'g',t,y_est,'.r'),legend('y','y_{est}')
    e_y=norm(y-y_est)/length(t);
    title(['Without noise   error  ',num2str(e_y)])


end