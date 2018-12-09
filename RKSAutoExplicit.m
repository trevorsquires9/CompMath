%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RKSAutoExplicit.m
%
% DESCRIPTION
%   Approximates y' using an s-stage runge kutta method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle of RHS
%   y0 - initial solution
%   h - step size
%   int - interval for evaluation
%   a - s x s matrix in butcher table
%   b - vector of lower row in butcher table

%
% OUTPUT
%   y - vector of output
%
% NOTES
%  
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [t,y] = RKSAutoExplicit(f,y0,h,int,a,b)

s = length(b);
assert(length(a) == s)
t = int(1):h:int(2);
y = zeros(length(t),1);
y(1) = y0;


for i = 1:length(t)-1
    %preliminaries
    Y = zeros(1,s);
    Y(1) = y(i);
    for j = 2:s
        Y(j) = y(i);
        for k = 1:j-1
            Y(j) = Y(j) + h*a(j,k)*f(Y(j-1));
        end
    end
    tmp = 0;
    for j = 1:s
        tmp = tmp + b(j)*f(Y(j));
    end
    y(i+1) = y(i) + h*tmp;
end
y = y';
