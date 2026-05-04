function plot2dcov(mean, cov, k, color,npoints,legend)
if nargin<5
    npoints=360;
end
if nargin<4
    color='b';
end
if nargin<3
    disp('insufficient arguements')
else
   try
        L=chol(cov, 'lower');
   catch
       [r,s]=chol(cov);
       L=[r 0;s 0]     
   end
   theta=0:2*pi/npoints:2*pi;
   Vec=[k*cos(theta);k*sin(theta)];
   points=L*Vec;
   if nargin==6
       plot(points(1,:)+mean(1),points(2,:)+mean(2),color, 'DisplayName',legend); 
       legend
   else
       plot(points(1,:)+mean(1),points(2,:)+mean(2),color);
   end
   axis equal
end
end