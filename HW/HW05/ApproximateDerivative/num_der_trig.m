function [A,B,C,D]=num_der_trig(W,M,m0,Dt,Q)
%
%	Created: le 14 septembre 1998
%
% Author: Jessy Grizzle
%
%	Modified: 21 septembre 2014, 22 septembre 2014
%	
% Goal: Creates a linear system that performs numerical differentiation, based on
% polynomial interpolation of the data
% 
% Method: Least Squares.
%
%
% Dt	:sampling interval (sec)
% W : list of frequencies
% M	: # of samples
% mo :the node where the derivative is computed
% Q: weighting matrix
%
%
% Create time interval vector corresponidng to window of data; put 
% node where derivative is to be computed at zero
%
time = Dt*[1:1:M]';
time = -flipud(time) + time(end);
%
% Matrix that multiplies the coeff's of the interpolating polynomial
%
N=length(W);
if nargin < 5
    Q=eye(M);
end
Qinv=inv(Q);
S=[ones(length(time),1)]; DIFF=zeros(2*N+1,2*N+1);
for i=1:N;
    S=[S,sin(W(i)*time), cos(W(i)*time)];
    % Set up matrix for computing derivatives of polynomials.  Diff is a matrix
    % representation of the operator d/dt
    DIFF(2*i+1,2*i)=W(i);
    DIFF(2*i,2*i+1)=-W(i);
end
%
% Compute A B C D for system to estimate y and its derivatives; see notes
% for derivation
%
S_psuedo_inv = inv(S'*Qinv*S)*S'*Qinv;
cond(S)
Node=S(end-m0+1,:); 
Coeff_y = Node*S_psuedo_inv;
Coeff_yp = Node*DIFF*S_psuedo_inv;  % first derivative
Coeff_y2p = Node*DIFF^2*S_psuedo_inv; % second derviative
%
% should be clear how to get more derivatives!
%
Coeff=[Coeff_y;Coeff_yp;Coeff_y2p]
a_sup_diag = ones(1,M-2);
A = diag(a_sup_diag,1);
B = [zeros(M-2,1);1];
C=Coeff(:,[1:1:M-1]);
D=Coeff(:,M);

return  
 










