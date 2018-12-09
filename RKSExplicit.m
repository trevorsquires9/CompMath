%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RKSExplicit.m
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
%   b - vector of lower row in butcher table
%   a - s x s matrix in butcher table
%
% OUTPUT
%   y - vector of output
%
% NOTES
%  
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = RKSExplicit(f,y0,h,int,b,a)

s = length(b);
assert(length(a) == s)
t = int(1):h:int(2);
y = zeros(length(t),1);
y(1) = y0;


for i = 1:length(t)-1
    %preliminaries
    Y = zeros(1,s);
    for j = 1:s
        Y(j) = y(i);
        for k = 1:j-1
            Y(j) = Y(j) + h*a(j,k)*f(t(i),Y(j-1));
        end
    end
    for j = 1:s
        tmp = tmp + b(j)*f(t(i),Y(j));
    end
    y(i+1) = y(i) + tmp;
end

