function [A,B,C,D]=num_der(N,M,m0,Dt,Q)
%
%	Created: le 14 septembre 1998
%
% Author: Jessy Grizzle
%
%	Modified: 21 septembre 2014
%	
% Goal: Creates a linear system that performs numerical differentiation, based on
% polynomial interpolation of the data
% 
% Method: Least Squares.
%
%
% Dt	:sampling interval (sec)
% N	:order of the polynomial
% M	: # of samples
% mo	:the node where the derivative is computed
% Q: weighting matrix
%
%
% Create time interval vector corresponidng to window of data; put 
% node where derivative is to be computed at zero
%
time = Dt*[1:1:M]';
time = time - time(m0);
%
% Matrix that multiplies the coeff's of the interpolating polynomial
%
if nargin < 5
    Q=eye(M);
end
Qinv=inv(Q);
for i=1:M
   for j=1:N+1
      S(i,j)=time(i)^(j-1); 
   end
end
%
% Set up matrix for computing derivatives of polynomials.  Diff is a matrix 
% representation of the operator d/dt for the subspace span{1, t, ..., t^N}.
V = [1:1:N];
% 1 puts V on the super-diagonal.
DIFF = diag(V,1);
%
% Compute A B C D for system to estimate y and its derivatives; see notes
% for derivation
%
S_psuedo_inv = inv(S'*Qinv*S)*S'*Qinv;
Z = zeros(1,N);
Coeff_y = [1,Z]*S_psuedo_inv;
Coeff_yp = [1,Z]*DIFF*S_psuedo_inv;  % first derivative
Coeff_y2p = [1,Z]*DIFF^2*S_psuedo_inv; % second derviative
%
% should be clear how to get more derivatives!
%
Coeff=[Coeff_y;Coeff_yp;Coeff_y2p];
a_sup_diag = ones(1,M-2);
A = diag(a_sup_diag,1);
B = [zeros(M-2,1);1];
C=Coeff(:,[1:1:M-1]);
D=Coeff(:,M);
return  
 










