mu1=[4 0];
sigma1=[0.25 0; 0 2];
mu2=[0 2];
sigma2=[6 2; 2 2];
P1=[4,2];
P2=[2.8, 1];
P3=[2,0];

k=1
txt1='P_1'
txt2='P_2'
txt3='P_3'
plot2dcov(mu1, sigma1, k ,'r' )
hold on 
plot2dcov(mu2, sigma2, k , 'r')
plot(mu1(1),mu1(2), 'or')
plot(mu2(1),mu2(2), 'or')

plot(P1(1),P1(2), '*b')
text(P1(1)+0.1,P1(2)+0.1,txt1,'HorizontalAlignment','left')
plot(P2(1),P2(2), '*b')
text(P2(1)+0.1,P2(2)+0.1,txt2,'HorizontalAlignment','left')
plot(P3(1),P3(2), '*b')
text(P3(1)+0.1,P3(2)+0.1,txt3,'HorizontalAlignment','left')
title('1 \sigma iso-contour plots of covariances')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
hold off