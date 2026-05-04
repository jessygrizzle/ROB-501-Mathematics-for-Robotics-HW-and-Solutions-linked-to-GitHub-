


if 0
    
    def_simple_funs
    
    d=1.0e-2;
    t=[0:d:2]';
    f=2*urmp(t)-4*urmp(t-1/2) + 4*urmp(t-1.5);
    
    
    figure(1)
    plot(t,f,'r','linewidth',3)
    grid on
    xlabel('t','FontSize',18)
    ylabel('f','FontSize',18)
    
    print Prob8TriWave -dpng
    
    save HW04_Prob8_Data t f
    
    
%     % 1 t t^2  t^3
%     A=[1+0*t, t, t.^2, t.^3];
%     
%     alpha = inv(A'*A)*A'*f
%     f_hat=A*alpha;
%     
%     figure(2)
%     plot(t,f,'r',t,f_hat,'g','linewidth',3)
%     grid on
%     xlabel('t','FontSize',18)
%     ylabel('f','FontSize',18)
    
    
    % 1 t t^2  t^3 t^4  t^5
    A=[1+0*t, t, t.^2, t.^3, t.^4, t.^5];
    
    alpha = inv(A'*A)*A'*f
    f_hat=A*alpha;
    
    figure(3)
    plot(t,f,'r',t,f_hat,'g','linewidth',3)
    grid on
    xlabel('t','FontSize',18)
    ylabel('f','FontSize',18)
    title('[1 t t^2 t^3 t^4 t^5]', 'FontSize',18)
    
    print Prob8RegressionAgainstPolynomials -dpng
    
    w0=2*pi/2;
    % F.S.
    A=[sin(w0*t), sin(2*w0*t), sin(3*w0*t), sin(4*w0*t), sin(5*w0*t)];
    
    alpha = inv(A'*A)*A'*f
    f_hat=A*alpha;
    
    figure(4)
    plot(t,f,'r',t,f_hat,'g','linewidth',3)
    grid on
    xlabel('t','FontSize',18)
    ylabel('f','FontSize',18)
    
    title('[sin(pi t), ..., sin(5 pi t)]', 'FontSize',18)
    
    print Prob8RegressionAgainstSinusoids -dpng
    
end


if 1
    
    rng('default')
    d=1.0e-2;
    t=[0:d:1]';
    N=length(t);
    f=-2*t.^2+3*t.^3 + 0.07*rand([N,1]);
    
    figure(1)
    plot(t,f,'.k','linewidth',2)
    grid on
    xlabel('t','FontSize',18)
    ylabel('f','FontSize',18)
    
    print Prob9NoisyData -dpng
    
    save HW04_Prob9_Data t f
    
    
%      % 1 t t^2  t^3 t^4  t^5
%     A=[1+0*t, t, t.^2, t.^3, t.^4, t.^5];
%     
%     alpha = inv(A'*A)*A'*f
%     f_hat=A*alpha;
%     
%     figure(2)
%     plot(t,f,'.k',t,f_hat,'g','linewidth',3)
%     grid on
%     xlabel('t','FontSize',18)
%     ylabel('f','FontSize',18)
%     
%     Deriv=[1 2 3 4 5];
%     A_deriv=diag(Deriv,1)    
%     T=0.3;
%     df_hat_dt = (A_deriv*alpha)'*[1 T T^2 T^3 T^4 T^5]'
%     
%     df_dt= (A_deriv*[0;0;-2;3;0;0])'*[1 T T^2 T^3 T^4 T^5]'
    
    
    % 1 t t^2  t^3
    A=[1+0*t, t, t.^2, t.^3];
    
    alpha = inv(A'*A)*A'*f
    f_hat=A*alpha;
    
    figure(2)
    plot(t,f,'.k',t,f_hat,'g','linewidth',3)
    grid on
    xlabel('t','FontSize',18)
    ylabel('f','FontSize',18)
    
    print Prob9RegressionResult -dpng
    
    Deriv=[1 2 3];
    A_deriv=diag(Deriv,1)    
    T=0.3;
    df_hat_dt = (A_deriv*alpha)'*[1 T T^2 T^3]'
    
    df_dt= (A_deriv*[0;0;-2;3])'*[1 T T^2 T^3]'
    
    
end
