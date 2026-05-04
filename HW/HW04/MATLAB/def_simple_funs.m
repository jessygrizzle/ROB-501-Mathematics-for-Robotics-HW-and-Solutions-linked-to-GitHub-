% file: def_simple_funs.m
%
% Simple method to create unit step, unit ramp and unit quadratic functions
% in Matlab. To use, simply save in the directory in which you are running 
% Matlab, and type the file name.
%
ustp=vectorize(inline('sign((1+sign(t))/2)','t')); 			% assigns 1 at 0
urmp=vectorize(inline('(t+abs(t))/2','t'));   					% t*ustp(t)
uqdr=vectorize(inline('t*(t+abs(t))/2','t')); 					% t^2 * ustp(t) = t*urmp(t)
